unit UnitChooseBaname;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RzButton, MemDS, DBAccess, Uni,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.ExtCtrls, RzPanel, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, UPublicEX, RzRadChk, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzLabel, UGlobalPublic_Function, cxImage, uThrdPoolClass,
  UinstanceHua, cxImageComboBox, System.ImageList, Vcl.ImgList,
  IdHTTP, IdSSLOpenSSL, System.RegularExpressions, SQLiteTable3, MSHTML,
  Winapi.ActiveX, Vcl.Samples.Spin, Vcl.Buttons, System.DateUtils, System.Math,
  RzCmboBx;

type
  TFormChooseBaname = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    UniDataSource1: TUniDataSource;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    RzButton1: TRzButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Timer1: TTimer;
    RzPanelLoading: TRzPanel;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    RzLabel1: TRzLabel;
    RzEditName: TRzEdit;
    RzLabel2: TRzLabel;
    RzEditFollowStart: TRzEdit;
    RzEditFollowEnd: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzEditPostcStart: TRzEdit;
    RzLabel5: TRzLabel;
    RzEditPostcEnd: TRzEdit;
    RzCheckBoxHighVague: TRzCheckBox;
    RzButtonSearch: TRzButton;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    RzCheckBoxFocusedOrNot: TRzCheckBox;
    RzButtonUpdate: TRzButton;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    ImageList1: TImageList;
    RzLabel6: TRzLabel;
    SpinEditHowmanyDays: TSpinEdit;
    RzLabel7: TRzLabel;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    Button_first_page: TSpeedButton;
    Button_prior_page: TSpeedButton;
    Button_next_page: TSpeedButton;
    Button_last_page: TSpeedButton;
    SpinEditPriorDays: TSpinEdit;
    RzLabel8: TRzLabel;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    RzButton2: TRzButton;
    RzCheckBoxUpdateAll: TRzCheckBox;
    RzButtonQuit: TRzButton;
    RzComboBox1: TRzComboBox;
    RzLabel9: TRzLabel;
    procedure RzButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RzButtonSearchClick(Sender: TObject);
    procedure cxGrid1DBTableView1Column5GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure RzButtonUpdateClick(Sender: TObject);
//    procedure cxGrid1DBTableView1Column7GetDisplayText(
//      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
//      var AText: string);
    procedure Button_first_pageClick(Sender: TObject);
    procedure Button_prior_pageClick(Sender: TObject);
    procedure Button_next_pageClick(Sender: TObject);
    procedure Button_last_pageClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButtonQuitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure ShowProgressInmemo(var Msg: TMessage); message WM_USER + 110;
    procedure FinalShowProgressInmemo(var Msg: TMessage); message WM_USER + 111;
  public
    { Public declarations }
    applicationha: THandle;
    TiebaList: string;


        Public_SQL_showgirls: string;
        total_page: Integer;
        current_page: Integer;
        total_recordcount: Integer;
        countperpage: Integer;
        each_time_SQL: string;
        add_SQL: string;
        procedure showfilipinogirl_public;
        procedure setSQL_Currentpage(factor: Integer);
  end;

type
  TMaintainTiebaBasicInfo = class(TBusiaction)
  public
    SplitDirectory: string;
    SourceDBaseDire: string;
    mainhan: THandle;
    LinshiFormChooseBaname: TFormChooseBaname;
//    cxGrid1DBTableView: TcxGridDBTableView;
//    UniConnection: TUniConnection;
    procedure Operate; override;
  end;

var
  FormChooseBaname: TFormChooseBaname;
  publicsql: string;
  QuitUpdate: Boolean = False;
  isrunningornot: Boolean = False;
  isrunningornot1: Boolean = False;
  ORDERBYFollowerCount: string = ' ORDER BY TieBaMing ';
const
  limitC: string = '200';



procedure DelayEXEX(dwMilliseconds: DWORD);//Longint

implementation

{$R *.dfm}
uses UnitModifyTiebaData;


procedure DelayEXEX(dwMilliseconds: DWORD);//Longint
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Application.ProcessMessages;
    if QuitUpdate then
    begin
      QuitUpdate := False;
      Abort;
    end;

  until (iStop - iStart) >= dwMilliseconds;
end;

procedure TFormChooseBaname.Button_first_pageClick(Sender: TObject);
begin
    if total_recordcount <> 0 then
    begin
        setSQL_Currentpage(0);
        showfilipinogirl_public;
    end;
end;

procedure TFormChooseBaname.Button_last_pageClick(Sender: TObject);
begin
    if total_recordcount <> 0 then
    begin
        setSQL_Currentpage(3);
        showfilipinogirl_public;
    end;
end;

procedure TFormChooseBaname.Button_next_pageClick(Sender: TObject);
begin
    if total_recordcount <> 0 then
    begin
        setSQL_Currentpage(2);
        showfilipinogirl_public;
    end;
end;

procedure TFormChooseBaname.Button_prior_pageClick(Sender: TObject);
begin
    if total_recordcount <> 0 then
    begin
        setSQL_Currentpage(1);
        showfilipinogirl_public;
    end;
end;

procedure TFormChooseBaname.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if AButton=mbLeft then
  begin
    if (ACellViewInfo.Item.Index=6) or (ACellViewInfo.Item.Index=1) then
    begin
      if (ACellViewInfo.GridRecord.Values[6]<>'') or
      (Pos('.', ACellViewInfo.GridRecord.Values[1]) > 0)
      then
      begin
          with TFormModifyTiebaData.Create(nil) do
          try
            Position := poMainFormCenter;
            applicationsha := applicationha;
            Caption := '手动修改相关信息';
            RzEdit1.Text := ACellViewInfo.GridRecord.Values[1];
            RzEdit2.Text := ACellViewInfo.GridRecord.Values[2];
            RzEdit3.Text := ACellViewInfo.GridRecord.Values[3];
            RzMemo1.Text := ACellViewInfo.GridRecord.Values[6];
            UniConnectionS := UniConnection1;
            if ShowModal = mrOk then
            begin
              SendMessage(Self.Handle, WM_USER + 110, 0, 0);
              //LinshiList.CommaText := TiebaList;
              //RzEdit_BarName.Text := TiebaList;
            end;
          finally
            Free;
          end;
      end;
    end;
  end;
end;

procedure TFormChooseBaname.cxGrid1DBTableView1Column5GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := IntToStr(ARecord.Index + 1);
end;

//procedure TFormChooseBaname.cxGrid1DBTableView1Column7GetDisplayText(
//  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
//  var AText: string);
//var
//  //linshi_string: string;   //2019-12-09 01:29:18
//  y, mon, d: string;   //2019-12-09 18:56
//begin
//  y := Copy(AText, 1, 4);
//  mon := Copy(AText, 6, 2);
//  d := Copy(AText, 9, 2);
////  h := StrToInt(Copy(sorString, 12, 2));
////  min := StrToInt(Copy(sorString, 15, 2));
//  //s := StrToInt(Copy(sorString, 18, 2));
//  AText := y + '-' + Mon + '-' + d;
//end;


procedure TFormChooseBaname.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var ATextToDraw:String;
    ARec: TRect;
begin
  ATextToDraw := AViewInfo.GridRecord.DisplayTexts[cxGrid1DBTableView1Column1.Index];
  if Pos('.', ATextToDraw) > 0 then

//  ARec := AViewInfo.Bounds;
//  if AViewInfo.GridRecord.Values[6]<1000 then
//    ACanvas.Canvas.Font.Color := clRed;
  ACanvas.Canvas.brush.color:=clred;
end;

procedure TFormChooseBaname.FinalShowProgressInmemo(var Msg: TMessage);
begin
  ShowMessageEX('更新完毕' + #13#10 + '成功条数：' + IntToStr(Msg.WParam));
end;

procedure TFormChooseBaname.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QuitUpdate := True;
end;

procedure TFormChooseBaname.FormCreate(Sender: TObject);
var
  Linshi_String: string;
  sSQL: string;
begin
  Linshi_String := 'Provider Name=SQLite;';
  //Linshi_String := Linshi_String + 'Database=' + ExtractFilepath(application.exename) + DbName1 + ';';
  Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  UniConnection1.ConnectString := Linshi_String;

  UniConnection1.Password := 'SYNCHRONOUSNORMAL';

  UniConnection1.Connected := True;
  UniConnection1.Connected := False;



    sSQL :=
    //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
    'CREATE TABLE IF NOT EXISTS TieBa_BasicInfoEX (' +
    //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
    '[TieBaMing] TEXT NOT NULL,' +
    '[FollowerCount] INTEGER NOT NULL,' +
    '[AllPostCount] INTEGER NOT NULL,' +
    '[LastUpdateTime] TEXT,' +
    '[UpdateOrNot] INTEGER NOT NULL,' +
    '[Remark] TEXT,' +
    'PRIMARY KEY ([TieBaMing]));';



    UniConnection1.ExecSQL(sSQL);

  Application.Handle := applicationha;
  SetWindowPos(Self.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE);
  SetWindowPos(Self.Handle,HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
  //Self.FormStyle := fsStayOnTop;

  Timer1.Enabled := True;

end;

procedure TFormChooseBaname.RzButton1Click(Sender: TObject);
var
  SelectC, i, j: Integer;
  LinshiValue, Linshistr, Linshistr1: string;
begin
  Linshistr := '';
  SelectC := cxGrid1DBTableView1.DataController.RowCount;
  if SelectC < 1 then Exit;
  SelectC := cxGrid1DBTableView1.DataController.GetSelectedCount;
  if SelectC < 1 then Exit;

  //cxGrid1DBTableView1.DataController.Select;
//  for I := 0 to SelectC - 1 do
//  begin
//    Linshistr1 := cxGrid1DBTableView1.DataController.focus
//
//    Linshistr := Linshistr + ',' + RzDBGrid1.SelectedRows.
//  end;

   for I := 0 to SelectC - 1 do
   begin
     J := cxGrid1DBTableView1.DataController.GetSelectedRowIndex(I);
     LinshiValue :=
     cxGrid1DBTableView1.DataController.GetValue(J, cxGrid1DBTableView1.FindItemByName('cxGrid1DBTableView1Column1').Index);
     LinshiValue := Trim(LinshiValue);
     if LinshiValue <> '' then
       Linshistr := Linshistr + '|' + LinshiValue;
   end;
   if Linshistr <> '' then Linshistr := Copy(Linshistr, 2, Length(Linshistr) - 1);


     //LinshiValue := Trim(GetRowValue(GetRowInfo(J),FieldByName('TieBaMing').Index));
     //ShowMessage(VarToStr(cxGrid1DBTableView1.DataController.GetValue(J, 0)));  //排序过滤后取值异常

     //ShowMessage();  //排序过滤后取值正常



  TiebaList := Linshistr;
  Self.ModalResult := mrOk;
end;

procedure TFormChooseBaname.RzButton2Click(Sender: TObject);
var
  i: Integer;
begin
  isrunningornot := True;
  RzCheckBoxUpdateAll.Checked := True;
  try
    RzButtonSearch.Click;
    DelayEXEX(1000);
    if total_recordcount = 0 then Exit;


    RzButtonUpdate.Click;
    DelayEXEX(1000);
    if total_page = 1 then Exit;


    for I := 2 to total_page do
    begin
      Button_next_page.Click;
      DelayEXEX(1000);
      RzButtonUpdate.Click;
      DelayEXEX(1000);
    end;

  finally
    RzCheckBoxUpdateAll.Checked := False;
    isrunningornot := False;
  end;
end;

procedure TFormChooseBaname.RzButtonQuitClick(Sender: TObject);
begin
  if isrunningornot or isrunningornot1 then
  begin
    QuitUpdate := True;
  end;
end;

procedure TFormChooseBaname.RzButtonSearchClick(Sender: TObject);
var
  WhereSqlstri: string;
  legh, I: Integer;
  Linshtr, Trimstr: string;
  sSQL: string;
  LinshiRiQi: TDateTime;
  LinshiRiQi_String: string;
begin
  RzPanelLoading.Visible := True;
  delay(1000);
  UniQuery1.DisableControls;

  cxGrid1DBTableView1.DataController.BeginUpdate;
  EnterCriticalSection(CS);
  try
    //QuerySqlInuni(UniQuery1, 'select * from TieBa_BasicInfo ORDER BY FollowerCount asc;');
    //UniQuery1.Filtered := False;

    WhereSqlstri := '1=1 ';
    Trimstr := Trim(RzEditName.Text);
    if Trimstr <> '' then
    begin
      legh := Length(Trimstr);
      if RzCheckBoxHighVague.Checked and (legh > 1) then
      begin
        Linshtr := '';
        for I := 1 to legh do
        begin
          Linshtr := Linshtr + '%' + Trimstr[I];
        end;
        Linshtr := Linshtr + '%';
        WhereSqlstri := WhereSqlstri + ' and TieBaMing like ''' + Linshtr + '''';
      end
      else
      begin
        WhereSqlstri := WhereSqlstri + ' and TieBaMing like ''%' + Trimstr + '%''';
      end;
    end;
    if StrToInt64Def(Trim(RzEditFollowStart.Text), 0) > 0 then
      WhereSqlstri := WhereSqlstri + ' and FollowerCount>=' + Trim(RzEditFollowStart.Text);
    if StrToInt64Def(Trim(RzEditFollowEnd.Text), 0) > 0 then
      WhereSqlstri := WhereSqlstri + ' and FollowerCount<=' + Trim(RzEditFollowEnd.Text);
    if StrToInt64Def(Trim(RzEditPostcStart.Text), 0) > 0 then
      WhereSqlstri := WhereSqlstri + ' and AllPostCount>=' + Trim(RzEditPostcStart.Text);
    if StrToInt64Def(Trim(RzEditPostcEnd.Text), 0) > 0 then
      WhereSqlstri := WhereSqlstri + ' and AllPostCount<=' + Trim(RzEditPostcEnd.Text);
    if StrToInt64Def(SpinEditHowmanyDays.Text, 0) > 0 then    //SpinEditPriorDays
    begin
      LinshiRiQi := incDay(TheRealTimeTime_Datetime, (0 - StrToInt64Def(SpinEditHowmanyDays.Text, 0)));
      LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
      WhereSqlstri := WhereSqlstri + ' and LastUpdateTime>=' + QuotedStr(LinshiRiQi_String);
    end;
    if StrToInt64Def(SpinEditPriorDays.Text, 0) > 0 then    //SpinEditPriorDays
    begin
      LinshiRiQi := incDay(TheRealTimeTime_Datetime, (0 - StrToInt64Def(SpinEditPriorDays.Text, 0)));
      LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
      WhereSqlstri := WhereSqlstri + ' and LastUpdateTime<=' + QuotedStr(LinshiRiQi_String);
    end;



    UniConnection1.ExecSQL('delete from TieBa_BasicInfoEX');
    //UniConnection1.ExecSQL('update sqlite_sequence SET seq = 0 where name =''TieBa_BasicInfoEX''');


//    publicsql := 'select * from TieBa_BasicInfo where ' + WhereSqlstri +
//    ' ORDER BY FollowerCount asc limit ' + limitC;
//
//
//delete from TableName;  //清空数据
//update sqlite_sequence SET seq = 0 where name ='TableName';//自增长ID为0


    publicsql := 'select *, 0, '''' from [hr].TieBa_BasicInfo where ' + WhereSqlstri +  ORDERBYFollowerCount +
    ' asc limit ' + limitC;

    UniConnection1.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
    sSQL := 'insert into TieBa_BasicInfoEX ' + publicsql;//'select *, 0 from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
    UniConnection1.ExecSQL(sSQL);
    total_recordcount := StrToInt(UniQueryString(UniQuery1, 'select count(1) from [hr].TieBa_BasicInfo where ' + WhereSqlstri));
    UniConnection1.ExecSQL('DETACH DATABASE "hr"');
    //UniQuery1.Filtered := False;


    Public_SQL_showgirls := 'select *, 0, '''' from [hr].TieBa_BasicInfo where ';// asc limit ' + limitC;
    add_SQL := WhereSqlstri + ORDERBYFollowerCount;
    countperpage := StrToInt(limitC);

    total_page := Ceil(total_recordcount / countperpage);
    current_page := 1;

            //共搜索到100条记录，共2页，当前是第1页
            if total_recordcount = 0 then
            begin

    publicsql := 'select * from TieBa_BasicInfoEX where 0=1';
    //publicsql := 'select *, 0 as UpdateOrNot from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
    QuerySqlInuni(UniQuery1, publicsql);
//                ADOQuery_showgirls.DisableControls;
//                try
//                    ADOQuery_showgirls.Close;
//                    ADOQuery_showgirls.SQL.Clear;
//                    ADOQuery_showgirls.SQL.Text := 'select * from girl_basic_inf join girl_picture on girl_basic_inf.ID=girl_picture.ID where 0=1';
//                    ADOQuery_showgirls.Open;
//                finally
//                    ADOQuery_showgirls.EnableControls;
//                end;
                cxGrid1DBTableView1.Navigator.Visible := False;
                Exit;
            end;

    publicsql := 'select * from TieBa_BasicInfoEX ' + ORDERBYFollowerCount + ' asc limit ' + limitC;
    //publicsql := 'select *, 0 as UpdateOrNot from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
    QuerySqlInuni(UniQuery1, publicsql);


    //QuerySqlInuni(UniQuery1, publicsql);
    //UniQuery1.Filter := WhereSqlstri;
    //UniQuery1.Filtered := False;
  finally
    LeaveCriticalSection(CS);
    cxGrid1DBTableView1.DataController.EndUpdate;
    UniQuery1.EnableControls;
    RzPanelLoading.Visible := False;
  end;


  cxGrid1DBTableView1.Navigator.Visible := true;
  cxGrid1DBTableView1.Navigator.InfoPanel.DisplayMask := '共' + IntToStr(total_recordcount) + '条记录, 共' + IntToStr(total_page) + '页, 当前页数：' + IntToStr(current_page);


end;

procedure TFormChooseBaname.RzButtonUpdateClick(Sender: TObject);
var
  VarHint: string;

  AATProxyEX: TInstActionProxy;


  MaintainTiebaBasicInfo: TMaintainTiebaBasicInfo;
begin
  isrunningornot1 := True;
  try
  cxGrid1DBTableView1Column6.Visible := True;


  AATProxyEX := TInstActionProxy.create;
  AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
  AATProxyEX.StartWork; //开始工作

  VarHint := RzButtonUpdate.Caption;
  RzButtonUpdate.Caption := '';
  with THandleWaitings.create(100) do
  try
      iniWaiting(RzButtonUpdate, 7, 7);


      MaintainTiebaBasicInfo := TMaintainTiebaBasicInfo.create;
      MaintainTiebaBasicInfo.mainhan := Self.Handle;

      MaintainTiebaBasicInfo.LinshiFormChooseBaname := Self;
//      MaintainTiebaBasicInfo.cxGrid1DBTableView := cxGrid1DBTableView1;
//      MaintainTiebaBasicInfo.UniConnection :=  UniConnection1;

//      MaintainTiebaBasicInfo.SplitDirectory := Trim(RzEditObjectPath.Text);
//      MaintainTiebaBasicInfo.SourceDBaseDire := Trim(RzEditSourceDir.Text);
      AATProxyEX.AddAction(MaintainTiebaBasicInfo);
      AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

  finally
    finalWaiting;
    RzButtonUpdate.Caption := VarHint;

    AATProxyEX.free;
//Grid1DBTableView1Column6.Visible := False;
  end;
  finally
    isrunningornot1 := False;
  end;
end;

procedure TFormChooseBaname.RzComboBox1Change(Sender: TObject);
begin
  case RzComboBox1.ItemIndex of
  0:
  begin
    ORDERBYFollowerCount := ' ORDER BY TieBaMing ';
  end;
  1:
  begin
    ORDERBYFollowerCount := ' ORDER BY FollowerCount ';
  end;
  2:
  begin
    ORDERBYFollowerCount := ' ORDER BY AllPostCount ';
  end;
  3:
  begin
    ORDERBYFollowerCount := ' ORDER BY LastUpdateTime ';
  end;
  end;
end;

procedure TFormChooseBaname.setSQL_Currentpage(factor: Integer);
begin
//0: 第一页；1： 上一页； 2： 下一页； 3： 最后一页
    case factor of
        0:
            begin
                current_page := 1;
                if total_page = 1 then
                    each_time_SQL := Public_SQL_showgirls + add_SQL

                else

                    each_time_SQL := Public_SQL_showgirls + add_SQL + ' limit ' + IntToStr(countperpage);

            end;
        1:
            begin

                current_page := current_page - 1;
                if current_page < 1 then
                begin
                    current_page := 1;
                    Abort;
                end;

                each_time_SQL := Public_SQL_showgirls + add_SQL + ' limit ' + IntToStr((current_page - 1) * countperpage) + ',  ' + IntToStr(countperpage);

            end;
        2:
            begin
                current_page := current_page + 1;
                if current_page > total_page then
                begin
                    current_page := total_page;
                    Abort;
                end;

                if current_page = total_page then
                    each_time_SQL := Public_SQL_showgirls + add_SQL + ' limit ' + IntToStr((current_page - 1) * countperpage) + ',  ' + IntToStr(total_recordcount - (current_page - 1) * countperpage)
                else
                    each_time_SQL := Public_SQL_showgirls + add_SQL + ' limit ' + IntToStr((current_page - 1) * countperpage) + ',  ' + IntToStr(countperpage);

            end;
        3:
            begin

                current_page := total_page;

                each_time_SQL := Public_SQL_showgirls + add_SQL + ' limit ' + IntToStr((current_page - 1) * countperpage) + ',  ' + IntToStr(total_recordcount - (current_page - 1) * countperpage);

            end;

    end;

end;

procedure TFormChooseBaname.showfilipinogirl_public;
var
  WhereSqlstri: string;
  legh, I: Integer;
  Linshtr, Trimstr: string;
  sSQL: string;
begin
  RzPanelLoading.Visible := True;
  delay(1000);
  UniQuery1.DisableControls;

  cxGrid1DBTableView1.DataController.BeginUpdate;
  EnterCriticalSection(CS);
  try
    //QuerySqlInuni(UniQuery1, 'select * from TieBa_BasicInfo ORDER BY FollowerCount asc;');
    //UniQuery1.Filtered := False;

//    WhereSqlstri := '1=1 ';
//    Trimstr := Trim(RzEditName.Text);
//    if Trimstr <> '' then
//    begin
//      legh := Length(Trimstr);
//      if RzCheckBoxHighVague.Checked and (legh > 1) then
//      begin
//        Linshtr := '';
//        for I := 1 to legh do
//        begin
//          Linshtr := Linshtr + '%' + Trimstr[I];
//        end;
//        Linshtr := Linshtr + '%';
//        WhereSqlstri := WhereSqlstri + ' and TieBaMing like ''' + Linshtr + '''';
//      end
//      else
//      begin
//        WhereSqlstri := WhereSqlstri + ' and TieBaMing like ''%' + Trimstr + '%''';
//      end;
//    end;
//    if StrToInt64Def(Trim(RzEditFollowStart.Text), 0) > 0 then
//      WhereSqlstri := WhereSqlstri + ' and FollowerCount>=' + Trim(RzEditFollowStart.Text);
//    if StrToInt64Def(Trim(RzEditFollowEnd.Text), 0) > 0 then
//      WhereSqlstri := WhereSqlstri + ' and FollowerCount<=' + Trim(RzEditFollowEnd.Text);
//    if StrToInt64Def(Trim(RzEditPostcStart.Text), 0) > 0 then
//      WhereSqlstri := WhereSqlstri + ' and AllPostCount>=' + Trim(RzEditPostcStart.Text);
//    if StrToInt64Def(Trim(RzEditPostcEnd.Text), 0) > 0 then
//      WhereSqlstri := WhereSqlstri + ' and AllPostCount<=' + Trim(RzEditPostcEnd.Text);


    UniConnection1.ExecSQL('delete from TieBa_BasicInfoEX');
    //UniConnection1.ExecSQL('update sqlite_sequence SET seq = 0 where name =''TieBa_BasicInfoEX''');


//    publicsql := 'select * from TieBa_BasicInfo where ' + WhereSqlstri +
//    ' ORDER BY FollowerCount asc limit ' + limitC;
//
//
//delete from TableName;  //清空数据
//update sqlite_sequence SET seq = 0 where name ='TableName';//自增长ID为0


//    publicsql := 'select *, 0 from [hr].TieBa_BasicInfo where ' + WhereSqlstri +
//    ' ORDER BY FollowerCount asc limit ' + limitC;

    publicsql := each_time_SQL;

    UniConnection1.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
    sSQL := 'insert into TieBa_BasicInfoEX ' + publicsql;//'select *, 0 from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
    UniConnection1.ExecSQL(sSQL);
    UniConnection1.ExecSQL('DETACH DATABASE "hr"');
    //UniQuery1.Filtered := False;
    publicsql := 'select * from TieBa_BasicInfoEX ' + ORDERBYFollowerCount + ' asc limit ' + limitC;
    //publicsql := 'select *, 0 as UpdateOrNot from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
    QuerySqlInuni(UniQuery1, publicsql);


    //QuerySqlInuni(UniQuery1, publicsql);
    //UniQuery1.Filter := WhereSqlstri;
    //UniQuery1.Filtered := False;
  finally
    LeaveCriticalSection(CS);
    cxGrid1DBTableView1.DataController.EndUpdate;
    UniQuery1.EnableControls;
    RzPanelLoading.Visible := False;
  end;


    //cxGrid1DBTableView1.Navigator.Visible := true;
    //cxGrid1DBTableView1.Navigator.InfoPanel.DisplayMask := 'in all search out ' + IntToStr(total_recordcount) + ' records, totally ' + IntToStr(total_page) + ' page, current page number is ' + IntToStr(current_page);

    cxGrid1DBTableView1.Navigator.Visible := true;
    cxGrid1DBTableView1.Navigator.InfoPanel.DisplayMask := '共' + IntToStr(total_recordcount) + '条记录, 共' + IntToStr(total_page) + '页, 当前页数：' + IntToStr(current_page);

end;

procedure TFormChooseBaname.ShowProgressInmemo(var Msg: TMessage);
begin
  UniQuery1.DisableControls;
  cxGrid1DBTableView1.DataController.BeginUpdate;
  try
    UniQuery1.SQLRefresh.Clear;
    UniQuery1.SQLRefresh.Add('select * from TieBa_BasicInfoEX ' + ORDERBYFollowerCount + ' asc limit ' + limitC);
    UniQuery1.Refresh;
  finally
    cxGrid1DBTableView1.DataController.EndUpdate;
    UniQuery1.EnableControls;
  end;

end;

procedure TFormChooseBaname.Timer1Timer(Sender: TObject);
var
  sSQL: string;
begin
  Timer1.Enabled := False;
  RzPanelLoading.Visible := True;
  UniQuery1.DisableControls;
  cxGrid1DBTableView1.DataController.BeginUpdate;
  EnterCriticalSection(CS);
  try
    UniConnection1.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
    total_recordcount := StrToInt(UniQueryString(UniQuery1, 'select count(1) from [hr].TieBa_BasicInfo'));
    sSQL := 'insert into TieBa_BasicInfoEX ' + 'select *, 0, '''' from [hr].TieBa_BasicInfo ' + ORDERBYFollowerCount + ' asc limit ' + limitC;
    UniConnection1.ExecSQL(sSQL);
    UniConnection1.ExecSQL('DETACH DATABASE "hr"');
    //UniQuery1.Filtered := False;
    publicsql := 'select * from TieBa_BasicInfoEX ' + ORDERBYFollowerCount + ' asc limit ' + limitC;
    //Public_SQL_showgirls :=
    //publicsql := 'select *, 0 as UpdateOrNot from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;


    Public_SQL_showgirls := 'select *, 0, '''' from [hr].TieBa_BasicInfo';// asc limit ' + limitC;
    add_SQL := ORDERBYFollowerCount;
    countperpage := StrToInt(limitC);;

    total_page := Ceil(total_recordcount / countperpage);
    current_page := 1;

    QuerySqlInuni(UniQuery1, publicsql);
    //UniConnection1.ExecSQL('DETACH DATABASE "hr"');
    //UniQuery1.Filtered := False;
  finally
    LeaveCriticalSection(CS);
    cxGrid1DBTableView1.DataController.EndUpdate;
    UniQuery1.EnableControls;
    RzPanelLoading.Visible := False;
  end;

    cxGrid1DBTableView1.Navigator.Visible := true;
    cxGrid1DBTableView1.Navigator.InfoPanel.DisplayMask := '共' + IntToStr(total_recordcount) + '条记录, 共' + IntToStr(total_page) + '页, 当前页数：' + IntToStr(current_page);
end;

{ TMaintainTiebaBasicInfo }

procedure TMaintainTiebaBasicInfo.Operate;
var
  succou: Integer;
  cou, I, J, SelectC, Iindex: Integer;
  url_s: string;
  Linshst: string;
  Foollowc, Postcc: string;



  HTTPCon: TIdHTTP;
//   AntiFreeze : TIdAntiFreeze;
  SSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;

  respnsestr: string;
  linshitest: string;
  //ResponseStream1: TStringStream;
  linshiURL: string;

  linshiStr: string;
  match: TMatch;
  matchs: TMatchCollection;
  LinshiPattern, LinshiPlanScheme_TopicContent: string;

  slDataBase: TSQLiteDatabase;

  sSQL: string;

  Parent_PostID, Linshi_PostID: string;
  Linshi_Title, Linshi_Content: string;
  Linshi_BaName, Linshi_CreateTime: string;
  Lerror: string;
  Linshi_BaNameORI: string;


  V: OleVariant;
  Doc: IHTMLDocument2;
  Doc1, Doc2: IHTMLDocument7;

  Doc3: IHTMLDocument3;
  Doc6: IHTMLDocument6;
  ElementCollection1, ElementCollection2: IHTMLElementCollection;
  ElementCollection3, ElementCollection4: IHTMLElementCollection;

  HTMLElement1, HTMLElement2: IHTMLElement;
  innerHTMLStr: string;

  //table: IHTMLTABLE;


  slDBpath, Linshi_String: string;
  NOwtime: TDateTime;

  responseori: string;

  LinshiList: TStringList;
begin
  LinshiList := TStringList.Create;
  succou := 0;
  try




  if LinshiFormChooseBaname.RzCheckBoxFocusedOrNot.Checked then
  begin
    SelectC := LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.GetSelectedCount;
    if SelectC < 1 then Exit;
  end
  else
  begin
    SelectC := LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.RowCount;
    if SelectC < 1 then Exit;
  end;


  for I := 0 to SelectC - 1 do
  begin
    if LinshiFormChooseBaname.RzCheckBoxUpdateAll.Checked then
    begin
      if QuitUpdate then Exit;
    end
    else
    begin
      if QuitUpdate then
      begin
        QuitUpdate := False;
        Exit;
      end;
    end;


    Delay(10);
    if LinshiFormChooseBaname.RzCheckBoxFocusedOrNot.Checked then
    begin
      Iindex :=  LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.GetSelectedRowIndex(I);
    end
    else
    begin
      Iindex := I;
    end;
    Linshi_BaNameORI :=
    LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.GetValue(Iindex, LinshiFormChooseBaname.cxGrid1DBTableView1.FindItemByName('cxGrid1DBTableView1Column1').Index);

    LinshiList.Add(Linshi_BaNameORI);
  end;

  for I := 0 to LinshiList.Count - 1 do
  begin
    if LinshiFormChooseBaname.RzCheckBoxUpdateAll.Checked then
    begin
      if QuitUpdate then Exit;
    end
    else
    begin
      if QuitUpdate then
      begin
        QuitUpdate := False;
        Exit;
      end;
    end;


    Delay(10);
//    if LinshiFormChooseBaname.RzCheckBoxFocusedOrNot.Checked then
//    begin
//      Iindex :=  LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.GetSelectedRowIndex(I);
//    end
//    else
//    begin
//      Iindex := I;
//    end;
    Linshi_BaNameORI := LinshiList.Strings[I];
    //LinshiFormChooseBaname.cxGrid1DBTableView1.DataController.GetValue(Iindex, LinshiFormChooseBaname.cxGrid1DBTableView1.FindItemByName('cxGrid1DBTableView1Column1').Index);
    Linshi_baname := Trim(Linshi_BaNameORI);
    if Linshi_baname = '' then Continue;
    //Linshi_baname := '越南';
    if Pos('.', Linshi_baname) > 0 then Continue;
    if Copy(Linshi_baname, Length(Linshi_baname), 1) = '吧' then
      Linshi_baname := Copy(Linshi_baname, 1, Length(Linshi_baname) - 1);

    url_s := 'https://tieba.baidu.com/f?ie=utf-8&kw=' + Linshi_baname;// ' %E8%B6%8A%E5%8D%97';
    url_s := urlencode(url_s);
//    url_s := 'https://tieba.baidu.com/f?ie=utf-8&kw=' + Linshi_baname + '&fr=search';
//    url_s := urlencode(url_s);

      try
                 { AntiFreeze }
      //           AntiFreeze := TIdAntiFreeze.Create(NIL);
      //           AntiFreeze.Active := true;
                 { Create & Set IdHTTP properties }

          HTTPCon := TIdHTTP.Create(NIL);


          SSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

          try
            HTTPCon.IOHandler := SSLIOHandlerSocketOpenSSL;


            HTTPCon.Request.ContentType := 'application/x-www-form-urlencoded';
                //  SourceIdHttp.Request.CharSet := 'utf-8';
                //  SourceIdHttp.Request.ContentEncoding := 'utf-8'; //可以省略，目前感觉没用
            HTTPCon.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36';

            HTTPCon.HTTPOptions := HTTPCon.HTTPOptions + [hoKeepOrigProtocol]; //必须有这行才使设置协议版本生效
                //HTTPCon.ProtocolVersion := pv1_1;

                 //Pri_IP, Pri_Port, Pri_username, Pri_Password: string;

      //           HTTPCon.ProxyParams.ProxyUsername := Pri_username;
      //           HTTPCon.ProxyParams.ProxyPassword := Pri_Password;

            HTTPCon.HandleRedirects := true;
            //HTTPCon.ConnectTimeout := 1000;
            //HTTPCon.ReadTimeout := 1000;
            HTTPCon.ConnectTimeout := 5000;
            HTTPCon.ReadTimeout := 6000;


            HTTPCon.ProxyParams.ProxyServer := '';
            HTTPCon.ProxyParams.ProxyPort := 0;
            HTTPCon.ProxyParams.BasicAuthentication := False;


            HTTPCon.Request.Connection := 'close';
//
//            linshiURL :=
//            'https://tieba.baidu.com/f/search/res?isnew=1&kw=' +
//            Trim(BaName) +
//            '&qw=' +
//            //%D5%D2%C0%CF%C6%C5
//            Trim(KeyWord) +
//            '&rn=20&un=&only_thread=1&sm=1&sd=&ed=&pn=' + IntToStr(WhichPage);

//            linshiURL := urlencode(linshiURL);

            //ResponseStream1 := TStringStream.Create('', TEncoding.UTF8);
            //ResponseStream1 := TStringStream.Create('', TEncoding.BigEndianUnicode);
            //try

              //Lerror := '1';
      //        HTTPCon.Get(linshiURL, ResponseStream1);
      //
      //        Lerror := '2';
      //        respnsestr := ResponseStream1.DataString;

              respnsestr := HTTPCon.Get(url_s);
              responseori := respnsestr;
            //finally
               //ResponseStream1.free;
            //end;
            //HTTPCon.Head(sURL);
            //HandleOnePost();
            // card_title_fname
            linshitest := Copy(respnsestr, Pos('card_title_fname', respnsestr) - 20, 300); //card_numLabel
            //respnsestr := Copy(respnsestr, Pos('thread_top_list_folder', respnsestr), Pos('thread_list_bottom clearfix', respnsestr)); //card_numLabel

            respnsestr := Copy(respnsestr, Pos('card_numLabel', respnsestr) - 20, 200); //card_numLabel


            Doc := coHTMLDocument.Create as IHTMLDocument2; // create IHTMLDocument2 instance
            V := VarArrayCreate([0,0],varVariant);
            V[0] := respnsestr;
            Doc.Write(PSafeArray(TVarData(v).VArray)); // write data from IdHTTP



            Doc1 := Doc as IHTMLDocument7;
//            Doc3 := Doc as IHTMLDocument3;
//            Doc6 := Doc as IHTMLDocument6;


//            ShowMessageEX(Doc3.getElementById('thread_list').innerText);
//            ShowMessageEX(((Doc6.getElementById('thread_list')) as IHTMLElement).innerText);

            //ShowMessageEX(IntToStr(Doc1.all.length));
//            ElementCollection1 := Doc1.all;
//            for J := 0 to ElementCollection1.length - 1 do
//            begin
////              linshiStr := (ElementCollection1.item(J, 0) as IHTMLElement).innerHTML;
////              ElementCollection2 := (ElementCollection1.item(J, 0) as IHTMLElement6).getElementsByClassName('card_menNum');
////              if ElementCollection2.length > 0 then
////                 ShowMessage(Copy(linshiStr, Pos('card_menNum', linshiStr) - 10, Pos('card_menNum', linshiStr) + 10));
//
//              linshiStr := (ElementCollection1.item(J, 0) as IHTMLElement).innerText;
//              if Pos('card_menNum', linshiStr) > 0 then
//              begin
//                 ShowMessageEX(Copy(linshiStr, Pos('card_menNum', linshiStr) - 10, Pos('card_menNum', linshiStr) + 10));
//              end;
//
//              linshiStr := (ElementCollection1.item(J, 0) as IHTMLElement).innerHTML;
//              if Pos('card_menNum', linshiStr) > 0 then
//              begin
//                 ShowMessageEX(Copy(linshiStr, Pos('card_menNum', linshiStr) - 10, Pos('card_menNum', linshiStr) + 10));
//              end;
//              linshiStr := (ElementCollection1.item(J, 0) as IHTMLElement).outerHTML;
//              if Pos('card_menNum', linshiStr) > 0 then
//              begin
//                 ShowMessageEX(Copy(linshiStr, Pos('card_menNum', linshiStr) - 10, Pos('card_menNum', linshiStr) + 10));
//              end;
//            end;

            // j_thread_list clearfix
//            ElementCollection1 := Doc1.getElementsByClassName('j_thread_list clearfix');
//            ShowMessageEX(IntToStr(ElementCollection1.length));



            ElementCollection1 := Doc1.getElementsByClassName('card_menNum');
            Foollowc := '';
            if ElementCollection1.length > 0 then
            begin
              Linshst := (ElementCollection1.item(0, 0) as IHTMLElement).innerText;
              //Foollowc, Postcc
              Foollowc := StringReplace(Trim(Linshst), ',', '', [rfReplaceAll]);
            end;

            Postcc := '';
            ElementCollection1 := Doc1.getElementsByClassName('card_infoNum');
            if ElementCollection1.length > 0 then
            begin
              Linshst := (ElementCollection1.item(0, 0) as IHTMLElement).innerText;
              //Foollowc, Postcc
              Postcc := StringReplace(Trim(Linshst), ',', '', [rfReplaceAll]);
              //TheRealTimeTime_Datetime
            end;
            NOwtime := TheRealTimeTime_Datetime;
            if (Foollowc <> '') and (Postcc <> '') then
            begin
              EnterCriticalSection(CS);

              LinshiFormChooseBaname.UniConnection1.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
              sSQL := 'update [hr].TieBa_BasicInfo set FollowerCount=' + Foollowc +
              ', AllPostCount=' + Postcc +
              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
              ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
              LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);

//              sSQL := 'insert into TieBa_BasicInfoEX ' + publicsql;//'select *, 0 from [hr].TieBa_BasicInfo ORDER BY FollowerCount asc limit ' + limitC;
//              UniConnection1.ExecSQL(sSQL);
              LinshiFormChooseBaname.UniConnection1.ExecSQL('DETACH DATABASE "hr"');
              LeaveCriticalSection(CS);


              sSQL := 'update TieBa_BasicInfoEX set FollowerCount=' + Foollowc +
              ', AllPostCount=' + Postcc +
              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
              ', UpdateOrNot=1' +
              ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
              LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);

//              sSQL := 'update TieBa_BasicInfo set FollowerCount=' + Foollowc +
//              ', AllPostCount=' + Postcc +
//              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime)) +
//              ' where TieBaMing=' + QuotedStr(Linshi_baname);
//
//
//              LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);

              SendMessage(mainhan, WM_USER + 110, 0, 0);
              Inc(succou);
            end
            else
            begin
              if Pos('根据相关法律法规和政策', responseori) > 0 then
              begin
                EnterCriticalSection(CS);
                LinshiFormChooseBaname.UniConnection1.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + DbName1 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                sSQL := 'delete from [hr].TieBa_BasicInfo where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
                LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);
                LinshiFormChooseBaname.UniConnection1.ExecSQL('DETACH DATABASE "hr"');
                LeaveCriticalSection(CS);

                sSQL := 'update TieBa_BasicInfoEX set Remark=' + QuotedStr('该贴吧最近被关闭使用:' + url_s + #13#10 + responseori) +
//                ', AllPostCount=' + Postcc +
//                ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
                ', UpdateOrNot=1' +
                ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
                LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);
              end
              else
              begin
                sSQL := 'update TieBa_BasicInfoEX set Remark=' + QuotedStr('无关注数总贴数:' + url_s + #13#10 + responseori) +
  //              'FollowerCount=' + Foollowc +
  //              ', AllPostCount=' + Postcc +
  //              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
  //              ', UpdateOrNot=1' +
                ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
                LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);
              end;
              SendMessage(mainhan, WM_USER + 110, 0, 0);
            end;


          finally

            if HTTPCon.Connected then
              HTTPCon.Disconnect;

            HTTPCon.IOHandler := nil;

            FreeAndNil(HTTPCon);

            FreeAndNil(SSLIOHandlerSocketOpenSSL);


                 //if Assigned(AntiFreeze) then FreeAndNil(AntiFreeze);
          end;
      except on E: Exception do
        begin
              Lerror := E.Message;

              sSQL := 'update TieBa_BasicInfoEX set Remark=' + QuotedStr(e.Message) +
//              'FollowerCount=' + Foollowc +
//              ', AllPostCount=' + Postcc +
//              ', LastUpdateTime=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', NOwtime)) +
//              ', UpdateOrNot=1' +
              ' where TieBaMing=' + QuotedStr(Linshi_BaNameORI);
              LinshiFormChooseBaname.UniConnection1.ExecSQL(sSQL);
              SendMessage(mainhan, WM_USER + 110, 0, 0);

//
//              EnterCriticalSection(SaveOnlinesearchedDB);
//              try
//
//
//                        sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
//                        'values (' + IntToStr(ii)
//                         + ', ' +  QuotedStr(BaName)
//                         + ', ' +  QuotedStr(Lerror)
//                         + ', ' +  QuotedStr(KeyWord)
//                         + ', ' +  QuotedStr(IntToStr(WhichPage))
//                         + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now))
//                         + ', 1, 100)';
//                        LinshiMemoryTableUniConnection.ExecSQL(sSQL);
//
//              finally
//                LeaveCriticalSection(SaveOnlinesearchedDB);
//              end;
//              SendMessage(AppMainHangle, WM_USER + 102, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage) + '|' + Lerror)), LPARAM(PChar(BaName)));
        end;
      end;
  end;
  finally
    LinshiList.Free;
    if not LinshiFormChooseBaname.RzCheckBoxUpdateAll.Checked then
      SendMessage(mainhan, WM_USER + 111, succou, 0);
  end;
end;

end.
