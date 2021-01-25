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
  //ִ�йҹ�����Ĵ�����
  CallHandle:HWND;

{$R *.res}
Function keyproc(icode,wp,lp:integer):DWORD;stdcall;   //����HOOK�ص�����
begin
  if (icode=HC_ACTION) then
  begin
    if (wp=VK_HOME)and ((1 shl 31)and lp=0) then
    begin
      // MessageBox(0,'��ʾ���','��ʾ���',0);
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


    if h=0 then begin Messagebox(0,'δ�ҵ���Ϸ','error',0);exit; end;//�����Ϸδ�����˳�
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

//�ص�����
function HookProc(code:Integer;wParam:WPARAM;lParam:LPARAM):LRESULT;stdcall;
var
  processid:Cardinal;
begin
  //����м��̶���
  if code = HC_Action then
  begin
    //��ȡע����̵Ľ���id
    processid := GetCurrentProcessId;
    //���CallHandle�������TestMain������
    if CallHandle = 0 then
      CallHandle := FindWindow(nil,'TestMain');
    //��ȡ����״̬ С��0��ʾ���£���������жϣ��������»�̧�𶼻�ִ��SendMessage
    //���淢��WM_USER+101��Ϣ������Ϣ�������Զ������Ϣ��ʶ����
    if GetKeyState(wParam) < 0 then
      SendMessage(CallHandle,WM_USER+101,wParam,processid);
  end
  else
    //��һ������
    Result := CallNextHookEx(fHook,code,wParam,lParam);
end;

procedure SetHook;stdcall;
begin
  //�ҹ�������û�����ҹ�ʧ�ܵ���ʾ
  fHook := SetWindowsHookEx(WH_KEYBOARD,@HookProc,HInstance,0);
end;

procedure StopHook;stdcall;
begin
  //ժ��
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

  //��ʼCallHandleΪ0
  CallHandle := 0;
end.