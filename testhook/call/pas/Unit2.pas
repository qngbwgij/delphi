unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Unit4;

type
  TFormoniterwindow = class(TForm)
    Memo1: TMemo;
    bSetHook: TButton;
    bCancelHook: TButton;
    bReadKeys: TButton;
    bClearKeys: TButton;
    Panel2: TPanel;
    Button1: TButton;
    Memo2: TMemo;
    procedure bSetHookClick(Sender: TObject);
    procedure bCancelHookClick(Sender: TObject);
    procedure bReadKeysClick(Sender: TObject);
    procedure bClearKeysClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formoniterwindow: TFormoniterwindow;

implementation

{$R *.dfm}

function EnableKeyHook: BOOL; external 'KEYHOOK.DLL';
function DisableKeyHook: BOOL; external 'KEYHOOK.DLL';
function GetKeyCount: Integer; external 'KEYHOOK.DLL';
function GetKey(idx: Integer): Char; external 'KEYHOOK.DLL';
procedure ClearKeyString; external 'KEYHOOK.DLL';


procedure TFormoniterwindow.bSetHookClick(Sender: TObject);
begin
  EnableKeyHook;
  bSetHook.Enabled := False;
  bCancelHook.Enabled := True;
  bReadKeys.Enabled := True;
  bClearKeys.Enabled := True;
  Panel2.Caption := ' 键盘钩子已经设置';
end;

procedure TFormoniterwindow.Button1Click(Sender: TObject);
var
 h:HWND;
 GameTid:THandle;

 wincaption: PWideChar;
begin
   Form4 := TForm4.Create(nil);
   Form4.Show;



    //Result:=false;
    //h:=FindWindow(nil,'Element Client');   //FormTestRegisterClass
    wincaption := 'FormTestRegisterClass';
    h:=FindWindow(nil,wincaption);   //FormTestRegisterClass


    if h=0 then GameTid := 0;
    GameTid:=GetWindowThreadProcessId(h);


    Memo2.Lines.Add(wincaption + '   ' + IntToStr(GameTid));


    wincaption := 'frmTestMain';
    h:=FindWindow(nil,wincaption);   //FormTestRegisterClass


    if h=0 then GameTid := 0;
    GameTid:=GetWindowThreadProcessId(h);


    Memo2.Lines.Add(wincaption + '   ' + IntToStr(GameTid));



    wincaption := 'Form1';
    h:=FindWindow(nil,wincaption);   //FormTestRegisterClass


    if h=0 then GameTid := 0;
    GameTid:=GetWindowThreadProcessId(h);


    Memo2.Lines.Add(wincaption + '   ' + IntToStr(GameTid));


    wincaption := 'Formoniterwindow';
    h:=FindWindow(nil,wincaption);   //FormTestRegisterClass


    if h=0 then GameTid := 0;
    GameTid:=GetWindowThreadProcessId(h);


    Memo2.Lines.Add(wincaption + '   ' + IntToStr(GameTid));



        wincaption := 'Form4';
    h:=FindWindow(nil,wincaption);   //FormTestRegisterClass


    if h=0 then GameTid := 0;
    GameTid:=GetWindowThreadProcessId(h);


    Memo2.Lines.Add(wincaption + '   ' + IntToStr(GameTid));



end;

procedure TFormoniterwindow.bCancelHookClick(Sender: TObject);
begin
  DisableKeyHook;
  bSetHook.Enabled := True;
  bCancelHook.Enabled := False;
  bReadKeys.Enabled := False;
  bClearKeys.Enabled := False;
  Panel2.Caption := ' 键盘钩子没有设置';
end;


procedure TFormoniterwindow.bReadKeysClick(Sender: TObject);
var
   i: Integer;
begin
  Memo1.Lines.Clear;{在Memo1中显示击键历史记录}
  for i := 0 to GetKeyCount - 1 do
    Memo1.Text := Memo1.Text + GetKey(i);

end;

procedure TFormoniterwindow.bClearKeysClick(Sender: TObject);
begin
  Memo1.Clear;
  ClearKeyString;
end;

end.
