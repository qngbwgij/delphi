unit UImportMac;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton, UPublic, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, System.Hash, UEncrpt, Uni,
  UniProvider, SQLiteUniProvider, RzLabel, UPublicEX, RzCmboBx, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxWheelPicker, dxNumericWheelPicker,
  dxDateTimeWheelPicker, Vcl.ComCtrls, RzDTP, Vcl.ExtCtrls, RzPanel,
  RzPopups, UGlobalPublic_Function, UinstanceHua, SQLiteTable3, UGlobalPublic_VersionControl;

type
  TForm1 = class(TForm)
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    RzButton5: TRzButton;
    RzEditFirstCode: TRzEdit;
    RzEditExpiredate: TRzEdit;
    RzButtonnext: TRzButton;
    RzButtonSave: TRzButton;
    SQLiteUniProvider1: TSQLiteUniProvider;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzEditUsername: TRzEdit;
    RzEditRemark: TRzEdit;
    RzEdit1: TRzComboBox;
    RzEditSalesManagePath: TRzComboBox;
    RzDateTimePicker1: TRzDateTimePicker;
    RzTimePicker1: TRzDateTimePicker;
    RzEditMacaddr: TRzComboBox;
    procedure RzButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzButton4Click(Sender: TObject);
    procedure RzButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzButtonSaveClick(Sender: TObject);
    procedure RzButtonnextClick(Sender: TObject);
    procedure RzTimePicker1Change(Sender: TObject);
    procedure RzDateTimePicker1Change(Sender: TObject);
    procedure RzEditExpiredateDblClick(Sender: TObject);
    //procedure RzEditSalesManagePath1Change(Sender: TObject);
  private
    { Private declarations }
  UniConnection_Manage: TUniConnection;
  UniQuery_Manage: TUniQuery;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  slDBpath: string;
begin
  InitializeCriticalSection(CS);

  slDBpath := ExtractFilepath(application.exename) + DbName1;
  sldb := TSQLiteDatabase.Create(slDBpath);


  //QueryStringEX('select ContactWay, FirstTimeRegisterInfo from SystemInfo', GetContactWay, FirstTimeRegisterInfo);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  sldb.Free;

  DeleteCriticalSection(CS);

  UniQuery_Manage.Connection := nil;
  UniQuery_Manage.Free;

  UniConnection_Manage.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Linshia, Linshib: string;


    hashMd5str: string;
    FixMacAddressLinshi: string;
    DeCrptMacAddress: string;
    DeCrptMacAddressAnsi: AnsiString;
    DeCrptMacAddressPAnsi: PAnsiChar;
    strfileName1: string;

  F: TextFile;
  i: integer;
  fileStr: string;


  Linshi_String: string;
  sSQL: string;
  slDBpath: string;
begin
  QueryStringEX('select ContactWay, FirstTimeRegisterInfo from SystemInfo', Linshia, Linshib);
  RzEdit1.Text := Linshia;
  RzEditFirstCode.Text := Linshib;


  //strfileName1 := ExtractFilepath(application.exename) + 'ContactWaylist.text';
  strfileName1 := '..\SalesManage\ContactWaylist.txt';
  if FileExists(strfileName1) then
  begin
    AssignFile(F, strfileName1); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        ReadLn(F, fileStr); //从文本文件中读取信息
        if Trim(fileStr) <> '' then
          RzEdit1.Items.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;   //strfileName_displayWindowList

  RzEdit1.ItemIndex := RzEdit1.Items.Count - 1;


  //strfileName1 := ExtractFilepath(application.exename) + '..\..\SalesManage\SaleManageDBPathlist.text';
  strfileName1 := '..\SalesManage\SaleManageDBPathlist.txt';
  if FileExists(strfileName1) then
  begin
    AssignFile(F, strfileName1); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        ReadLn(F, fileStr); //从文本文件中读取信息
        if Trim(fileStr) <> '' then
          RzEditSalesManagePath.Items.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;   //strfileName_displayWindowList

  RzEditSalesManagePath.ItemIndex := RzEditSalesManagePath.Items.Count - 1;



  strfileName1 := '..\SalesManage\MacAddresslist.txt';
  if FileExists(strfileName1) then
  begin
    AssignFile(F, strfileName1); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        ReadLn(F, fileStr); //从文本文件中读取信息
        if Trim(fileStr) <> '' then
          RzEditMacaddr.Items.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;   //strfileName_displayWindowList

  RzEditMacaddr.ItemIndex := RzEditMacaddr.Items.Count - 1;


  slDBpath := //ExtractFilepath(application.exename) + 'SalesManage.db3';
  //Trim(RzEditSalesManagePath.Text);

  '..\SalesManage\SalesManage_internalTest.db3';
        //slDBpath := 'C:\Users\DELL\Desktop\bin\SaveDugInfo.db3';
        //abc
        //slDBpath := ExtractFilepath(application.exename) + 'abc.db';
  UniConnection_Manage := TUniConnection.Create(nil);

  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  UniConnection_Manage.ConnectString := Linshi_String;

  UniConnection_Manage.Password := 'SYNCHRONOUSNORMAL';

        //sldb.SpecificOptions.Values['ASCIIDataBase'] := 'True';


  UniConnection_Manage.Connected := True;
  UniConnection_Manage.Connected := False;

  UniQuery_Manage := TUniQuery.Create(nil);
  UniQuery_Manage.Connection := UniConnection_Manage;


//  if  (trim(FirstTimeRegisterInfo) <> '') and
//  (UniQueryString(UniQuery_Manage, 'select count(1) from SaleInfo where FirstTimeRegisterInfo=' + QuotedStr(trim(FirstTimeRegisterInfo))) = '1')
//  then
//  begin
//    RzButtonSave.Font.Color := clWindowText;
//  end
//  else
//  begin
//    RzButtonSave.Font.Color := clRed;
//  end;

   RzDateTimePicker1.Date := getnow;
   RzTimePicker1.Time := EncodeTime(23,59,59,59);
//   RzDateTimePicker1Change(nil);



      hashMd5str := THashMD5.GetHashString(FirstTimeRegisterInfo_ForOfficial);
      FixMacAddressLinshi := Trim(QueryString('SELECT FixMacAddress from SystemInfo'));
      if FixMacAddressLinshi = '' then
      begin
        RzEditMacaddr.Text := '';
        RzEditExpiredate.Text := '';
        Exit;
      end;

      if Pos(hashMd5str, FixMacAddressLinshi) < 1 then
      begin
        ShowMessageEX('FixMacAddress字段值不正确');
        Halt;
      end;

      try
        FixMacAddressLinshi := Copy(FixMacAddressLinshi, Length(hashMd5str) + 1, Length(FixMacAddressLinshi) - Length(hashMd5str));

//
//        DeCrptMacAddressAnsi := DecryptString(AnsiString(FixMacAddressLinshi), AnsiString(FirstTimeRegisterInfo_ForOfficial_AsAKey));
//        DeCrptMacAddressPAnsi := PAnsiChar(DeCrptMacAddressAnsi);
//        DeCrptMacAddress :=  DeCrptMacAddressPAnsi;

        DeCrptMacAddress := (TFrmRegister.Create).UnEncryptString(FixMacAddressLinshi, FirstTimeRegisterInfo_ForOfficial_AsAKey);

        if DeCrptMacAddress = '' then
        begin
          ShowMessageEX('FixMacAddress字段值不正确');
          Halt;
        end;

        RzEditMacaddr.Text := Copy(DeCrptMacAddress, 1, 2) + '-' + Copy(DeCrptMacAddress, 3, 2) + '-' + Copy(DeCrptMacAddress, 5, 2) + '-' + Copy(DeCrptMacAddress, 7, 2) + '-' + Copy(DeCrptMacAddress, 9, 2) + '-' + Copy(DeCrptMacAddress, 11, 2);
        RzEditExpiredate.Text := Copy(DeCrptMacAddress, 13, Length(DeCrptMacAddress) - 12);
      finally

      end;

end;

procedure TForm1.RzButton1Click(Sender: TObject);
begin
//  if UpdateSQLs('UPDATE SystemInfo set ContactWay=' + QuotedStr(Trim(RzEdit1.Text))) then
//    ShowMessageEX('成功！');

 if UpdateSQLs('UPDATE SystemInfo set ContactWay=' + QuotedStr(Trim(RzEdit1.Text)) + ', FirstTimeRegisterInfo=' + QuotedStr(Trim(RzEditFirstCode.Text))) then
 begin
    FirstTimeRegisterInfo := Trim(RzEditFirstCode.Text);
    ShowMessageEX('成功！');
 end;
end;

procedure TForm1.RzButton2Click(Sender: TObject);
var
  SetMacAddress: string;
  SetMacAddressAnsi: AnsiString;
  SetMacAddressAnsiPwidechar: PChar;
  SetMacAddressAnsiPansichar: PAnsiChar;
  maxstrExpiredTime: string;
begin
  //if (Trim(RzEditMacaddr.Text) = '') or (Trim(RzEditExpiredate.Text)='') then
  if Trim(RzEditMacaddr.Text) = '' then
  begin
    ShowMessage('物理地址不能为空！');
    Exit;
  end;

  try
    maxstrExpiredTime := UniQueryString(UniQuery_Manage, 'select max(str_ExpiredTime) from SaleInfo where FixMacAdress=' + QuotedStr(Trim(RzEditMacaddr.Text)));
  except
    maxstrExpiredTime := '';
  end;

  if Trim(RzEditExpiredate.Text) <> '' then
  if maxstrExpiredTime <> '' then
  begin
    if Trim(RzEditExpiredate.Text) <= maxstrExpiredTime then
    begin
      ShowMessage('过期日期设置得有问题！');
      Exit;
    end;
  end;




  try
    SetMacAddress := Trim(RzEditMacaddr.Text);
    SetMacAddress := Copy(SetMacAddress, 1, 2) + Copy(SetMacAddress, 4, 2) + Copy(SetMacAddress, 7, 2) + Copy(SetMacAddress, 10, 2) + Copy(SetMacAddress, 13, 2) + Copy(SetMacAddress, 16, 2);
    SetMacAddress := SetMacAddress + Trim(RzEditExpiredate.Text);
    SetMacAddress := (TFrmRegister.Create).EncryptString(SetMacAddress, FirstTimeRegisterInfo_ForOfficial_AsAKey);
//    SetMacAddressAnsi := EncryptString(AnsiString(SetMacAddress), AnsiString(FirstTimeRegisterInfo_ForOfficial_AsAKey));//, kb256);
//    SetMacAddressAnsiPansichar := PAnsiChar(SetMacAddressAnsi);
//    SetMacAddress :=  SetMacAddressAnsiPansichar;



    SetMacAddress := THashMD5.GetHashString(FirstTimeRegisterInfo_ForOfficial) + SetMacAddress;
    if UpdateSQLs('UPDATE SystemInfo set FixMacAddress=''' + SetMacAddress + '''') then
      ShowMessageEX('成功添加！');
  except
     ShowMessageEX('失败！');
  end;
end;

procedure TForm1.RzButton3Click(Sender: TObject);
var
  MaxRegisterCode: string;
begin
//  MaxRegisterCode := UniQueryString(UniQuery_Manage, 'select max(ID) from SaleInfo');
//
//
//  if Trim(MaxRegisterCode) = '' then
//  begin
//    MaxRegisterCode := '0';
//  end;
//
//    MaxRegisterCode := Format('%.10d', [(strtoint(MaxRegisterCode) + 1)]);
//
//    if Trim(FirstTimeRegisterInfo) <>  MaxRegisterCode then
//    begin
//      ShowMessage('第一次注册码不正确！');
//      Exit;
//    end;


  if UpdateSQLs('UPDATE SystemInfo set LoginTimes=''' + THashMD5.GetHashString(FirstTimeRegisterInfo) + ''', MacAddress=''''') then

    ShowMessageEX('成功！');


//  if UpdateSQLs('UPDATE SystemInfo set ContactWay=' + QuotedStr(Trim(RzEdit1.Text)) + ', FirstTimeRegisterInfo=' + QuotedStr(Trim(RzEditFirstCode.Text))) then
//    ShowMessageEX('成功！');
end;

procedure TForm1.RzButton4Click(Sender: TObject);
var
  slDBpath: string;
  sSQL: string;
  Notes: string;
  i: Integer;
begin
  sldb.BeginTransaction;
  try
    for i := 0 to TieZi_MaxCount - 1 do
    begin
      sSQL := 'insert INTO DingTie_Config (tiezi_index) VALUES (' + IntToStr(i) + ')';
      sldb.ExecSQL(sSQL);
    end;
  finally
    sldb.Commit;
  end;
  ShowMessageEX('成功！');
end;


procedure TForm1.RzButton5Click(Sender: TObject);
var
  slDBpath: string;
  sSQL: string;
  Notes: string;
  i: Integer;
begin
  sldb.BeginTransaction;
  try
    for i := 0 to PlanScheme_MaxCount - 1 do
    begin
      sSQL := 'insert INTO PlanScheme_Config (PlanScheme_index) VALUES (' + IntToStr(i) + ')';
      sldb.ExecSQL(sSQL);
    end;

  finally
    sldb.Commit;
  end;
  ShowMessageEX('成功！');
end;

procedure TForm1.RzButtonnextClick(Sender: TObject);
var
  MaxRegisterCode: string;
begin
  MaxRegisterCode := UniQueryString(UniQuery_Manage, 'select max(ID) from SaleInfo');
  MaxRegisterCode := Format('%.10d', [(strtoint(MaxRegisterCode) + 1)]);
  RzEditFirstCode.Text := MaxRegisterCode;
end;

procedure TForm1.RzButtonSaveClick(Sender: TObject);
begin
   UniConnection_Manage.ExecSQL('insert into SaleInfo ' +
   '(FirstTimeRegisterInfo, FixMacAdress, SaveDatetime, Username, Remarks, str_ExpiredTime)' +
   'values ' +
   '(' + QuotedStr(Trim(RzEditFirstCode.Text)) + ', ' +
   QuotedStr(Trim(RzEditMacaddr.Text)) + ', ' +

   QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', getnow)) + ', ' +
   QuotedStr(Trim(RzEditUsername.Text)) + ', ' +
   QuotedStr(Trim(RzEditRemark.Text)) + ', ' +



   QuotedStr(Trim(RzEditExpiredate.Text)) + ')');



//  if  (trim(FirstTimeRegisterInfo) <> '') and
//  (UniQueryString(UniQuery_Manage, 'select count(1) from SaleInfo where FirstTimeRegisterInfo=' + QuotedStr(trim(FirstTimeRegisterInfo))) = '1')
//  then
//  begin
//    RzButtonSave.Font.Color := clWindowText;
//  end
//  else
//  begin
//    RzButtonSave.Font.Color := clRed;
//  end;

   ShowMessageEX('保存成功！');
end;

procedure TForm1.RzDateTimePicker1Change(Sender: TObject);
var
  LinshiDate: TDate;
  LinshiTime: TTime;
begin
  LinshiDate := RzDateTimePicker1.Date;
  LinshiTime := RzTimePicker1.Time;
  RzEditExpiredate.Text := FormatDateTime('YYYYMMDD', LinshiDate) + FormatDateTime('hhmmss', LinshiTime)
end;

procedure TForm1.RzEditExpiredateDblClick(Sender: TObject);
begin
  //RzDateTimePicker1Change(nil);
  RzEditExpiredate.Text := FormatDateTime('YYYYMMDD', RzDateTimePicker1.Date) +'235959';
end;

procedure TForm1.RzTimePicker1Change(Sender: TObject);
begin
  RzDateTimePicker1Change(nil);
end;

//procedure TForm1.RzEditSalesManagePath1Change(Sender: TObject);
//var
//  slDBpath, Linshi_String: string;
//begin
//  UniQuery_Manage.Connection := nil;
//  UniQuery_Manage.Free;
//
//  UniConnection_Manage.Free;
//
//
//  slDBpath := //ExtractFilepath(application.exename) + 'SalesManage.db3';
//  Trim(RzEditSalesManagePath.Text);
//        //slDBpath := 'C:\Users\DELL\Desktop\bin\SaveDugInfo.db3';
//        //abc
//        //slDBpath := ExtractFilepath(application.exename) + 'abc.db';
//  UniConnection_Manage := TUniConnection.Create(nil);
//
//  Linshi_String := 'Provider Name=SQLite;';
//  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
//  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//  Linshi_String := Linshi_String + 'Client Library=sqlite3.dll;';
//  Linshi_String := Linshi_String + 'Use Unicode=false;';
//  Linshi_String := Linshi_String + 'Login Prompt=False';
//
//  UniConnection_Manage.ConnectString := Linshi_String;
//
//  UniConnection_Manage.Password := 'SYNCHRONOUSNORMAL';
//
//        //sldb.SpecificOptions.Values['ASCIIDataBase'] := 'True';
//
//
//  UniConnection_Manage.Connected := True;
//  UniConnection_Manage.Connected := False;
//
//  UniQuery_Manage := TUniQuery.Create(nil);
//  UniQuery_Manage.Connection := UniConnection_Manage;
//end;

end.
