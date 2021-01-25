library KeyBoardHook;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Unit3 in '..\pas\Unit3.pas' {Form1};

var
  fHook, keyhhk:HHOOK;
  //执行挂钩程序的窗体句柄
  CallHandle:HWND;

{$R *.res}
Function keyproc(icode,wp,lp:integer):DWORD;stdcall;   //键盘HOOK回调函数
begin
  if (icode=HC_ACTION) then
  begin
    if (wp=VK_HOME)and ((1 shl 31)and lp=0) then
    begin
      // MessageBox(0,'显示外挂','显示外挂',0);
      if form1=nil then  Form1:=Tform1.Create(nil);

      //form1.Visible:=not form1.Visible;

      form1.Visible:= True;
    end;
  end;
 keyProc:=CallNextHookEx(keyhhk,icode,wp,lp);
end;

Function installKeyProc():boolean;stdcall;
var
 h:HWND;
 GameTid:THandle;
begin
    Result:=false;
    //h:=FindWindow(nil,'Element Client');   //FormTestRegisterClass
    h:=FindWindow(nil,'FormTestRegisterClass');   //FormTestRegisterClass


    if h=0 then begin Messagebox(0,'未找到游戏','error',0);exit; end;//如果游戏未打开则退出
    GameTid:=GetWindowThreadProcessId(h);

    //keyhhk:=SetWindowsHookEx(WH_KEYBOARD,@Keyproc,GetModuleHandle('dllGame.dll'),GameTid);
    keyhhk:=SetWindowsHookEx(WH_KEYBOARD,@Keyproc,GetModuleHandle('KeyBoardHook.dll'),GameTid);


    if keyhhk>0 then Result:=true;
end;

procedure DllEnterProc(reason:integer);
begin
   case reason of
    DLL_PROCESS_ATTACH:
      begin
      end;
    DLL_PROCESS_DETACH:
      begin
        Form1.Free;
        form1:=nil;
      end;
   end;
end;


{
--------------------------------------------------------------------------------------------------------------------------
}

//回调过程
function HookProc(code:Integer;wParam:WPARAM;lParam:LPARAM):LRESULT;stdcall;
var
  processid:Cardinal;
begin
  //如果有键盘动作
  if code = HC_Action then
  begin
    //获取注入进程的进程id
    processid := GetCurrentProcessId;
    //如果CallHandle，则查找TestMain窗体句柄
    if CallHandle = 0 then
      CallHandle := FindWindow(nil,'TestMain');
    //获取按键状态 小于0表示按下，如果不做判断，按键按下或抬起都会执行SendMessage
    //下面发送WM_USER+101消息，此消息可以用自定义的消息标识发送
    if GetKeyState(wParam) < 0 then
      SendMessage(CallHandle,WM_USER+101,wParam,processid);
  end
  else
    //下一个钩子
    Result := CallNextHookEx(fHook,code,wParam,lParam);
end;

procedure SetHook;stdcall;
begin
  //挂钩，这里没有做挂钩失败的提示
  fHook := SetWindowsHookEx(WH_KEYBOARD,@HookProc,HInstance,0);
end;

procedure StopHook;stdcall;
begin
  //摘钩
  if fHook <> 0 then
    UnhookWindowsHookEx(fHook);
end;

exports
  SetHook name 'SetHook',
  StopHook name 'StopHook',

  //add,
  installKeyProc;

begin
  //Messagebox(0,'Loading','error',0);
  dllProc:=@DllEnterProc;

  //初始CallHandle为0
  CallHandle := 0;
end.
