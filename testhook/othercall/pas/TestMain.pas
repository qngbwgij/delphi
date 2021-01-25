{
此窗体用来执行挂钩，为了方便起见，我们把系统的按键返回到该窗体的Memo组件中进行
显示，所以在dll中，做了获取主窗体的句柄的工作，以便发消息给主窗体，告诉它是哪个
按键被按下
}
unit TestMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TlHelp32, Vcl.StdCtrls;

type
  TfrmTestMain = class(TForm)
    Memo1: TMemo;
    btn_SetHook: TButton;
    btn_StopHook: TButton;
    installKeyProcbutton: TButton;
    procedure btn_SetHookClick(Sender: TObject);
    procedure btn_StopHookClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure installKeyProcbuttonClick(Sender: TObject);
  private
    { Private declarations }
    procedure WndProc(var Message: TMessage);override;
  public
    { Public declarations }
  end;

var
  frmTestMain: TfrmTestMain;

implementation

{$R *.dfm}

procedure SetHook;stdcall;external 'KeyBoardHook';
procedure StopHook;stdcall;external 'KeyBoardHook';

procedure installKeyProc;stdcall;external 'KeyBoardHook';

procedure TfrmTestMain.btn_SetHookClick(Sender: TObject);
begin
SetHook;
end;

procedure TfrmTestMain.btn_StopHookClick(Sender: TObject);
begin
StopHook;
end;

procedure TfrmTestMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopHook;
end;

procedure TfrmTestMain.installKeyProcbuttonClick(Sender: TObject);
begin
  installKeyProc;
end;

procedure TfrmTestMain.WndProc(var Message: TMessage);
var
  hSnapShot:THandle;
  pEntry:TProcessEntry32;
  find:Boolean;
  proName:string;
begin
  if Message.Msg = WM_USER+101 then
  begin
    //创建进程快照
    hSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    pEntry.dwSize := SizeOf(pEntry);
    find := Process32First(hSnapShot,pEntry);
    while find do
    begin
      //取进程名字
      proName := pEntry.szExeFile;
      if pEntry.th32ProcessID = Message.LParam then Break;
      find := Process32Next(hSnapShot,pEntry);
    end;
    Memo1.Lines.Add('进程：' + proName + ',ID：' +IntToStr(Message.LParam)+'按下按键：'+Chr(Message.WParam));
    CloseHandle(hSnapShot);
  end;
  inherited;
end;

end.
