unit USetHttpConfi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzEdit, RzButton,
  Vcl.ExtCtrls, RzPanel, System.RegularExpressions, UPublic, RzCmboBx;

type
  TFormSetHttpConfi = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzPanelBot: TRzPanel;
    RzPanel4: TRzPanel;
    RzButtonSave: TRzButton;
    RzMemoCookieForReplyinMain: TRzMemo;
    RzComboBoxCookieSource: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure RzButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzComboBoxCookieSourceChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CookieForReplyinMainFile: string;
    procedure GetAllConfigInfo;
  end;

var
  FormSetHttpConfi: TFormSetHttpConfi;

implementation

{$R *.dfm}

procedure TFormSetHttpConfi.FormCreate(Sender: TObject);
var
  F: TextFile;
  i: integer;
  fileStr: string;
begin
  CookieForReplyinMainFile := APPCommonPath + 'COOKIEINMAIN.text';
  if FileExists(CookieForReplyinMainFile) then
  begin
    RzMemoCookieForReplyinMain.Clear;
    AssignFile(F, CookieForReplyinMainFile); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        ReadLn(F, fileStr); //从文本文件中读取信息
        RzMemoCookieForReplyinMain.Lines.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;   //strfileName_displayWindowList

  CookieForReplyinMainFieldList.Clear;
  if Trim(RzMemoCookieForReplyinMain.Text) = '' then
    Exit;
  GetAllConfigInfo;
end;

procedure TFormSetHttpConfi.FormShow(Sender: TObject);
begin
  RzButtonSave.Left := RzPanelBot.Left + RzPanelBot.Width div 2 -  RzButtonSave.Width div 2 + 110;
end;

procedure TFormSetHttpConfi.GetAllConfigInfo;
var
  i: Integer;
  OneValues: string;
  OneFieldValuesegment: string;
  OneFieldValuesegmentField: string;
  maohaoPos: Integer;
begin
  CookieForReplyinMainFieldList.Clear;
  OneFieldValuesegmentField := '';
  OneFieldValuesegment := '';
  for I := 0 to RzMemoCookieForReplyinMain.Lines.Count - 1 do
  begin

          OneValues := Trim(RzMemoCookieForReplyinMain.Lines[i]);

          if OneValues = '' then
            Continue;

          maohaoPos := Pos(':', OneValues);

          if maohaoPos < 1 then
          begin
            OneFieldValuesegment := OneFieldValuesegment + OneValues;
          end
          else
          begin
            if (OneFieldValuesegmentField <> '') and (OneFieldValuesegment <> '') then
            begin
              CookieForReplyinMainFieldList.Add(OneFieldValuesegmentField + '=' + OneFieldValuesegment);
              OneFieldValuesegmentField := '';
              OneFieldValuesegment := '';
            end;

            OneFieldValuesegmentField := Trim(Copy(OneValues, 1, maohaoPos - 1));
            OneFieldValuesegment := Trim(Copy(OneValues, maohaoPos + 1, Length(OneValues) - maohaoPos));
          end;
  end;
  if (OneFieldValuesegmentField <> '') and (OneFieldValuesegment <> '') then
    CookieForReplyinMainFieldList.Add(OneFieldValuesegmentField + '=' + OneFieldValuesegment);
end;

procedure TFormSetHttpConfi.RzButtonSaveClick(Sender: TObject);
var
  sysDir: string;
  logfile: string;
  mylog: TextFile;
  inputtext: WideString;
  i: Integer;
begin
  CookieForReplyinMainFieldList.Clear;

  if Trim(RzMemoCookieForReplyinMain.Text) = '' then
    Exit;

  if fileexists(CookieForReplyinMainFile) then
    DeleteFile(CookieForReplyinMainFile);

  for i := 0 to RzMemoCookieForReplyinMain.Lines.Count - 1 do
  begin
    AssignFile(mylog, CookieForReplyinMainFile);
    try
      if fileexists(CookieForReplyinMainFile) then
        append(mylog)
      else
        rewrite(mylog);

      inputtext := RzMemoCookieForReplyinMain.Lines.Strings[i];
      Writeln(mylog, inputtext);                 //写日志里
    finally
      CloseFile(mylog);                        //关闭文件流
    end;
  end;

  GetAllConfigInfo;
end;

procedure TFormSetHttpConfi.RzComboBoxCookieSourceChange(Sender: TObject);
begin
  RzComboBoxCookieSourceIntem := RzComboBoxCookieSource.ItemIndex;
end;

end.
