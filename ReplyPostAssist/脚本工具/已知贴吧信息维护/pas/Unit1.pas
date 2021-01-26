unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPublicEX, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzLabel, RzButton, uThrdPoolClass, UGlobalPublic_Function, Uni, UinstanceHua,
  RzStatus, UniProvider, SQLiteUniProvider;

type
  TForm1 = class(TForm)
    rbStart: TRzButton;
    RzLabel1: TRzLabel;
    RzEditSourceDir: TRzEdit;
    RzLabel2: TRzLabel;
    RzEditObjectPath: TRzEdit;
    RzStatusPane1: TRzStatusPane;
    RzMemo1: TRzMemo;
    SQLiteUniProvider1: TSQLiteUniProvider;
    procedure rbStartClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowProgressInmemo(var Msg: TMessage); message WM_USER + 109;
  public
    { Public declarations }
  end;


type
  TMaintainTiebaBasicInfo = class(TBusiaction)
  public
    SplitDirectory: string;
    SourceDBaseDire: string;
    mainhan: THandle;
    procedure Operate; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.rbStartClick(Sender: TObject);
var
  VarHint: string;

  AATProxyEX: TInstActionProxy;


  MaintainTiebaBasicInfo: TMaintainTiebaBasicInfo;
begin
  AATProxyEX := TInstActionProxy.create;
  AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
  AATProxyEX.StartWork; //开始工作

  VarHint := rbStart.Caption;
  rbStart.Caption := '';
  with THandleWaitings.create(100) do
  try
      iniWaiting(rbstart, 7, 7);


      MaintainTiebaBasicInfo := TMaintainTiebaBasicInfo.create;
      MaintainTiebaBasicInfo.mainhan := Self.Handle;
      MaintainTiebaBasicInfo.SplitDirectory := Trim(RzEditObjectPath.Text);
      MaintainTiebaBasicInfo.SourceDBaseDire := Trim(RzEditSourceDir.Text);
      AATProxyEX.AddAction(MaintainTiebaBasicInfo);
      AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

  finally
    finalWaiting;
    rbStart.Caption := VarHint;

    AATProxyEX.free;
  end;
end;

{ TMaintainTiebaBasicInfo }

procedure TMaintainTiebaBasicInfo.Operate;
var
  suDBNameList: TStringList;

 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

 SourceFileDir: string;
 LinshiTableUniConnection: TUniConnection;
 Linshi_String: string;
begin
  suDBNameList := TStringList.Create;


  LinshiTableUniConnection := TUniConnection.Create(nil);
  try
      Linshi_String := 'Provider Name=SQLite;';
      //Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
      Linshi_String := Linshi_String + 'Database=' + SplitDirectory + ';';
      Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
      Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
      Linshi_String := Linshi_String + 'Use Unicode=false;';
      Linshi_String := Linshi_String + 'Login Prompt=False';

      LinshiTableUniConnection.ConnectString := Linshi_String;

      LinshiTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

      LinshiTableUniConnection.Connected := True;
      LinshiTableUniConnection.Connected := False;





     SourceFileDir := SourceDBaseDire+'\';

     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

     while found=0 do
     begin
       delay(10);
       if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
       and (SearchRec.Attr<>faDirectory) and
       (
       //(Pos('temp', Trim(SearchRec.Name)) > 0) or
       (Pos('db3', Trim(SearchRec.Name)) > 0)
       )
       then
       begin
         suDBName := SearchRec.Name;
         suDBNameList.Add(suDBName);
       end;
       found:=FindNext(SearchRec);
     end;
     FindClose(SearchRec);


     suDBNameListCount := suDBNameList.Count;

     if suDBNameListCount > 0 then
     begin
       for J := 0 to suDBNameListCount - 1 do
       begin
         try
            delay(10);

            LinshiTableUniConnection.ExecSQL('ATTACH DATABASE "' + SourceFileDir + Trim(suDBNameList.Strings[J])
             + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
            LinshiTableUniConnection.ExecSQL('replace into TieBa_BasicInfo select TieBaName,FollowCountForOneTieBa,TotalPostForOneTieBa,LastUpdateTime from [hr].SeeLiangTieziList where TieBaName<>''''');
            LinshiTableUniConnection.ExecSQL('DETACH DATABASE "hr"');

//            SplitDBFromSource := TSplitDBFromSource.create;
//            SplitDBFromSource.SplitDirectory := APPCommonPath + relativePasth;
//            SplitDBFromSource.SourceDBaseDire := SourceFileDir + Trim(suDBNameList.Strings[J]);
//            AATProxyEX.AddAction(SplitDBFromSource);
//            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
            SendMessage(mainhan, WM_USER + 109, WPARAM(PChar(Trim(suDBNameList.Strings[J]))), 0);
         finally

         end;
       end;
     end;
  finally
    LinshiTableUniConnection.Free;
    suDBNameList.Free;
  end;

end;


procedure TForm1.ShowProgressInmemo(var Msg: TMessage);
var
  Linshistr: string;
  Linkw: string;
  Linwp: string;
  Linerr: string;
  Linshistrlist: TStringList;
begin
  Linshistrlist := TStringList.Create;
  try
    Linshistr := PChar(Msg.WParam);

//    Linshistrlist.Delimiter := '|';
//    Linshistrlist.DelimitedText := Linshistr;
//
//    Linkw := Linshistrlist.Strings[0];
//    Linwp := Linshistrlist.Strings[1];
//
//    Linerr := PChar(Msg.LParam);


    RzStatusPane1.Caption := '成功完成文件' + Linshistr + '的整理';
    RzMemo1.Lines.Add(FormatDateTime('hh:mm:ss',Now) +': ' + RzStatusPane1.Caption);
//    Inc(SuccCo);
//    RzMemoLogLinesAdd('成功' + IntToStr(SuccCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  Linerr + ')');
  finally
    Linshistrlist.Free;
  end;

end;

end.
