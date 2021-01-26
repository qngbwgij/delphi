unit UnitModifyTiebaData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzLabel, UPublic, UPublicEX, UGlobalPublic_Function, Uni, UinstanceHua;

type
  TFormModifyTiebaData = class(TForm)
    RzLabel1: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzButton1: TRzButton;
    RzMemo1: TRzMemo;
    RzLabel4: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzEdit1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    applicationsha: THandle;
    UniConnectionS: TUniConnection;
  end;

var
  FormModifyTiebaData: TFormModifyTiebaData;




implementation

{$R *.dfm}


procedure TFormModifyTiebaData.FormCreate(Sender: TObject);
begin
  Application.Handle := applicationsha;
  SetWindowPos(Self.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE);
  SetWindowPos(Self.Handle,HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
end;

procedure TFormModifyTiebaData.RzButton1Click(Sender: TObject);
var
  sSQL: string;
  Foollowc, Postcc: string;
  NOwtime: TDateTime;
  Linshi_baname: string;
  Linshi_BaNameORI: string;
  url_s: string;
begin
    Linshi_BaNameORI := RzEdit1.Text;
//    Linshi_baname := Trim(Linshi_BaNameORI);
//    if Linshi_baname = '' then Exit;
//    //Linshi_baname := '越南';
//    if Copy(Linshi_baname, Length(Linshi_baname), 1) = '吧' then
//      Linshi_baname := Copy(Linshi_baname, 1, Length(Linshi_baname) - 1);
//
//    url_s := 'https://tieba.baidu.com/f?ie=utf-8&kw=' + Linshi_baname;// ' %E8%B6%8A%E5%8D%97';
//    url_s := urlencode(url_s);

  if (StrToInt64Def(Trim(RzEdit2.Text), -1) >= 0)
  and (StrToInt64Def(Trim(RzEdit3.Text), -1) >= 0)
  then
  begin
    NOwtime := TheRealTimeTime_Datetime;
    Foollowc := Trim(RzEdit2.Text);
    Postcc := Trim(RzEdit3.Text);


              EnterCriticalSection(CS);

              UniConnectionS.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
              sSQL := 'update [hr].TieBa_BasicInfo set FollowerCount=' + Foollowc +
              ', AllPostCount=' + Postcc +
              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
              ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
              UniConnectionS.ExecSQL(sSQL);

//              sSQL := 'insert into TieBa_BasicInfoEX ' + publicsql;//'select *, 0 from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
//              UniConnection1.ExecSQL(sSQL);
              UniConnectionS.ExecSQL('DETACH DATABASE "hr"');


              sSQL := 'update TieBa_BasicInfoEX set FollowerCount=' + Foollowc +
              ', AllPostCount=' + Postcc +
              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
              ', UpdateOrNot=1' +
              ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
              UniConnectionS.ExecSQL(sSQL);

//              sSQL := 'update TieBa_BasicInfo set FollowerCount=' + Foollowc +
//              ', AllPostCount=' + Postcc +
//              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime)) +
//              ' where TieBaMing=' + QuotedStr(Linshi_baname);
//
//
//              LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);
              LeaveCriticalSection(CS);
              Self.ModalResult := mrOk;

  end;
end;

procedure TFormModifyTiebaData.RzEdit1DblClick(Sender: TObject);
var
  RzURLLabe: TRzURLLabel;
  TieziIDs: string;

  sSQL: string;
  Foollowc, Postcc: string;
  NOwtime: TDateTime;
  Linshi_baname: string;
  Linshi_BaNameORI: string;
  url_s: string;
begin
    Linshi_BaNameORI := RzEdit1.Text;
    Linshi_baname := Trim(Linshi_BaNameORI);
    if Linshi_baname = '' then Exit;
    //Linshi_baname := '越南';
    if Copy(Linshi_baname, Length(Linshi_baname), 1) = '吧' then
      Linshi_baname := Copy(Linshi_baname, 1, Length(Linshi_baname) - 1);

    url_s := 'https://tieba.baidu.com/f?ie=utf-8&kw=' + Linshi_baname;// ' %E8%B6%8A%E5%8D%97';
    url_s := urlencode(url_s);

    RzURLLabe := TRzURLLabel.Create(nil);
    try

        RzURLLabe.URL := url_s;
        RzURLLabe.Click;

    finally
      RzURLLabe.Free;
    end;


end;

end.
