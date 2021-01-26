unit UContactWay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, UPublic, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, System.Hash, URegisterOfficialInfo, Vcl.ExtCtrls,
  RzPanel;

type
  TForm1 = class(TForm)
    RzButton1: TRzButton;
    RzEdit1: TRzEdit;
    RzButton2: TRzButton;
    RzPanel1: TRzPanel;
    RzEditFirstCode: TRzEdit;
    procedure RzButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzPanel1Paint(Sender: TObject);
    procedure RzPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
initializeSqlite;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  finalizeSqlite;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Linshia, Linshib: string;
begin
  //RzEdit1.Text := QueryString('select ContactWay from SystemInfo');
  QueryStringEX('select ContactWay, FirstTimeRegisterInfo from SystemInfo', Linshia, Linshib);
  RzEdit1.Text := Linshia;
  RzEditFirstCode.Text := Linshib;
end;

  //RzEditFirstCode.ReadOnly := True;


procedure TForm1.RzButton1Click(Sender: TObject);
begin
  if UpdateSQLs('UPDATE SystemInfo set ContactWay=' + QuotedStr(Trim(RzEdit1.Text)) + ', FirstTimeRegisterInfo=' + QuotedStr(Trim(RzEditFirstCode.Text))) then
    ShowMessageEX('成功！');
end;

procedure TForm1.RzButton2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.RzPanel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F017, 0);
end;

procedure TForm1.RzPanel1Paint(Sender: TObject);
begin
    RzPanel1.Canvas.brush.Color := $C0C0C0;
    RzPanel1.Canvas.FillRect(Bounds(2, 0, 630, 25));

    RzPanel1.Canvas.Font.Color := clWindowText;
    RzPanel1.Canvas.Font.Style := [fsBold];
    RzPanel1.Canvas.TextOut(5, 5, '小工具');
end;

end.
