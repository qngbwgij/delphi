{
�˴�������ִ�йҹ���Ϊ�˷�����������ǰ�ϵͳ�İ������ص��ô����Memo����н���
��ʾ��������dll�У����˻�ȡ������ľ���Ĺ������Ա㷢��Ϣ�������壬���������ĸ�
����������
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
    //�������̿���
    hSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    pEntry.dwSize := SizeOf(pEntry);
    find := Process32First(hSnapShot,pEntry);
    while find do
    begin
      //ȡ��������
      proName := pEntry.szExeFile;
      if pEntry.th32ProcessID = Message.LParam then Break;
      find := Process32Next(hSnapShot,pEntry);
    end;
    Memo1.Lines.Add('���̣�' + proName + ',ID��' +IntToStr(Message.LParam)+'���°�����'+Chr(Message.WParam));
    CloseHandle(hSnapShot);
  end;
  inherited;
end;

end.