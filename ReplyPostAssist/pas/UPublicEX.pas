unit UPublicEX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  system.Hash, System.NetEncoding, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.OleCtrls, SHDocVw, Vcl.Samples.Spin, System.Actions,
  Vcl.ActnList, RzEdit, MSHTML, Winapi.ActiveX, Vcl.Clipbrd, Data.DB, Data.Win.ADODB,
  IdFTP, System.Win.ComObj, PsAPI, StrUtils, ScktComp, WinInet, Nb30, UrlMon,
  ShellApi, Registry, System.RegularExpressions, System.DateUtils, Winapi.WinSock,
  Winapi.msxml, IdHTTP, ExeStr, UGetMacAddress,
  UEncrpt, uThrdPoolClass, IdSSLOpenSSL, Uni, UinstanceHua;

var
//  abnormal_count: Integer = 0;
//  abnormal_count_open: Boolean = True;
//  ChooseCustominiPostID: Boolean = False;     //д��ǰ������׷�����½���ֻȡ�Զ��������ID
////2019-12-09 19:05</span>
//  LinshiPatternForGetCreateTime: string = '20\d\d\-\d\d-\d\d\s\d\d\:\d\d(\&quot|\<\/spa)';
//  ModeStatus: Integer = 0;
//
//  //max_tieziID: string;
//  //max_tieziID_int64: Int64;
//
   TheRealTimeTime_Datetime: TDateTime = 0;
//  //TheRealTimeTime: string;
//  Automatic_Mode: Integer = 0;    //0Ϊ��ͨģʽ1Ϊ�����������2Ϊ������������Ŀ
//  WindowState_Tag: Integer = 0;
//  Action1_Tag: Integer = 1;
//  xx, yy: FixedInt;
//  GG: Integer = 0;
//  SetFinish: Boolean = False;
//  GlobalClose: Boolean = False;
//  OldCI: HICON;
//  OldCIEX: TCursor;
//  b_Debug: Boolean;
//  Submit_Type: string;
//  strfileName: string = '������ַ�б�.txt';
//  strfileName_displayWindowList: string = '���ش����б�.txt';
//  strfileName_PlanList: string = '�����ƻ��б�.txt';
//  SubmitPlace: TPoint;
//  InputPlaceEx: TPOINT;
//  SubmitPlaceEx: TPoint;
//  test_scroll_start: TPOINT;
//  test_scroll_end: TPoint;
//  Resume_Suspend: Integer = 0;
//  isOfflineOrDelete_CheckRecordCount: string = '50';
//  killWindowsCount, RestrictUseCount, ManageThreadCount: Integer;
//  G_Status: string;
//  CollectAllPostsStep: Integer = 0;
//
//
////  ListForRandomize: TStringList;
////  ListForQuence: TStringList;
////  ListForFixTime: TStringList;
//  FixOne: string;
//  i_tiezi_index: Integer;
//  i_PlanScheme_index: Integer;
//  TieZi_MaxCount: Integer = 400;
//  PlanScheme_MaxCount: Integer = 400;
//  Re_Start: Boolean;
//  str_MacAdd: string; //= '98-3B-8F-E9-19-3D';
//
//  Thelogintime: string; //�ڼ���ʹ��
//
//  ReadExe_Boolean: Boolean;
//  ReadExe_ReadOut: string;
//  GetContactWay: string;
//
//  //str_ExpiredTime: string = '';//'20201116235959'; //���ð��ʱ�򣬻��������
//
//  RzStatusPane1Caption: string;
//  AppMainHangle: HWND;
//  SavedNewestCreateTimeInMemory: TDateTime = 0;
//  AlreadyKeepSyn: Boolean = False;
//  AATProxyEX: TInstActionProxy;

  sldb_InUniConnection: TUniConnection;
  sltb_InUniConnection: TUniQuery;
  //sltb_InUniConnection1: TUniQuery;

  MemorySqlite_InUniConnection: TUniConnection;
  MemorySqliteTable_InUniConnection: TUniQuery;


  //G_Memory_Sqlite1: TUniConnection;
  //G_Memory_Sqlitetb1: TUniQuery;



//  CS: TRTLCriticalSection;
//  //AddActionCriti: TRTLCriticalSection;
//  //RestrictHttp: TRTLCriticalSection;
//
//  initializationcount: Integer = 0;
//  finalizationcount: Integer = 0;
//  showcountn: Integer = 0;
//  AATProxy: TInstActionProxy;
//  CollectAllPostsThread: TCollectAllPosts;
////  CollectAllPostsThread_BackAdd: TCollectAllPosts_BackAdd;
////  CollectAllPostsThread_BackModify: TCollectAllPosts_BackModify;
//
//  RestricUse: TUseRestrict;
//  //CollectAllPostsFlag: Boolean = True;
//
//  MemoryTcount: string = '0';
//  old_MemoryTcount: string;
//  HardhareCount: string;
//  finishFinalSave: Boolean = False;
//
//
//{
//
// ID
//
// }
//  TotalThreadCount: string;
//  CofigName: string;
//  ForwardInterval: string;
//  BackwardAddInterval: string;
//  BackwardModifyInterval: string;
//  GetPostTimeOut: string;
//  CloseThreadTimeOut: string;
//  MaxConsecutiveDeleteCount: string;
//  GetNowInterval: string;
//  AlterHintInterval: string;
//  ForwardFullActionInterval: string;
//  BackwardAddFullActionInterval: string;
//  BackwardModifyFullActionInterval: string;
//  ManMadeNewestTieZiID: string;
//  UpdateOldTieZiInfoMinTimeLag: string;
//  AvailableMixCatchUpSpeed: string;
//  MaxSavedRecordCountInMemory: string;
//  ManMadeOldestTieZiID: string;
//  SavedUpdateProgressTieZiID: string;
//
//
//
//
//  //G_Transit_CreateTime: string = '';   //�����ط�����Ҫ�����������
//  ini_PostID: Int64;
//  GetornotGet: Integer = 0;
//  MaxTieZiID_Mode4: string;
//{
//}
//
//const
//  ConfirmRemoteCloseService_MyInfo1: string = '����ϵ����΢�ź�wujiannotliar';     //�����ϵ��ʽ����
//
////  str_Version: string = '1'; //0���ð棬1��ʽ��
////
////  str_debug: string = '0';
////
////  FirstTimeRegisterInfo: string = '0000000001'; //���ð����0000000001����ʽ���0000000002��ʼһһ��Ӧ������¼
////  FixMacAdress: string = '98-3B-8F-E9-19-39';
////  //FixMacAdress: string = '';
//
//
//
////  str_Version: string = '0'; //0���ð�
////  str_debug: string = '0';
////  FirstTimeRegisterInfo: string = '0000000001';
//  //FixMacAdress: string = '98-3B-8F-E9-19-39';
//  //FixMacAdress: string = '4C-34-88-C4-2F-CA';
//  //FixMacAdress: string = '56-A6-03-19-2D-44';
//  //FixMacAdress: string = '00-0C-29-25-AE-0F';
//  //FixMacAdress: string = '00-0C-29-9A-EF-BF';
//  //FixMacAdress: string = '00-0C-29-D4-95-BF';
////  FixMacAdress: string = '';
//
//
//
//
////  Url_CloseService_Active: string    //��ʽ���ʱ���ã�һ��ʵ���Ӧһ��
////  //= 'https://pan.baidu.com/s/1LVhrDSjlerIUjCMWaopVYg';
////  = '';
////
////  subString_For_closeservice: string
////  = '�������ļ��Ѿ���ȡ����';
////
////  Url_CloseService_Active_ControlAllTrialVersion: string
////  = 'https://pan.baidu.com/s/1LVhrDSjlerIUjCMWaopVYg';
////  //= '';
//
//  Basic_PostLink: string = 'http://tieba.baidu.com/p/';
//  Min_AbnormalIncrease: Integer = 9;
//  CustlogfileName: string = 'HandleDugTaskLog.log'; // ���ַ���ǰ�������� 'HandleDugTask��־.log'

//procedure FinalSaveStep;
//
function MyStringtoDateTime(sorString: string): TDateTime;
//
//procedure HandleOnePost(SourPostId: string; var VarTableIniActionOperate: Integer);
//
//procedure HandleOnePostForUpdate(SourPostId: string; var VarTableIniActionOperate: Integer);
//
//procedure HandleOnePostEX(SourPostId: string; var arTableIniActionOperate: string);
//
//function GetNewestCreateTime(str_ManMadeNewestTieZiID: string): string;
//
//procedure Delay(dwMilliseconds: DWORD);//Longint

procedure initializeSqliteEX;

procedure finalizeSqliteEX;


procedure initializeSqliteHardwareTable(dbFileNmae: string = '');

procedure finalizeSqliteHardwareTable;

procedure initializeSqliteMemoryTableEXEX(LAttachFilename: string);
procedure initializeSqliteMemoryTable;
procedure initializeSqliteMemoryTableEX;

procedure finalizeSqliteMemoryTable;
//
//procedure SaveMemoryTable;
//
//function ReadEXE(var Readout: string): Boolean;
//
//procedure WriteEXE(Writeinto: string);

function UniQueryString(UseUniQuery: TUniQuery; sSQL: string): string;

function UniQueryStringEX(UseUniQuery: TUniQuery; sSQL: string; var A: string; var B: string): Boolean;

function UniQueryStringEXEXEX(UseUniQuery: TUniQuery; sSQL: string; var A: string; var B: string; var C: string; var D: string): Boolean;

//function ShowMessageEX(ShowStr: string): Integer;

//procedure ExectSqlInuni(UseUniQuery: TUniQuery; strSQL: string);

procedure QuerySqlInuni(UseUniQuery: TUniQuery; strSQL: string);

procedure FinalQuerySqlInuni(UseUniQuery: TUniQuery);

//function MacAddressEX: string;
//
//function getnow(aUrl: WideString = 'http://www.sohu.com'): TDateTime;
//
//function ConfirmRemoteCloseService(iKind: Integer = 0): Boolean;
//
//procedure showme(a: string);
type
THandleWaitings = class
private
 var
 LinshiNewBuilt: TLabel;
 LinshiTimer: TTimer;
 procedure Eventeverytime(sender: tObject);
public
 constructor Create(TimeInverval: Cardinal);
 destructor Destroy; override;
 procedure iniWaiting(sender: TObject; setTop: Integer = 0; setLeft: Integer = 0);
 procedure finalWaiting;
end;
//
//var
//  _THandleWaitings: THandleWaitings;
//
//
//function HandleWaitings: THandleWaitings;

implementation
//function HandleWaitings: THandleWaitings;
//begin
//  if not Assigned(_THandleWaitings) then
//    _THandleWaitings := THandleWaitings.Create;
//  Result := _THandleWaitings;
//end;



{ TMyThread }

//procedure showme(a: string);
//var
//  Linshi_Display: string;
//  b: PChar;
//  sysDir: string;
//  logfile: string;
//  mylog: TextFile;
//  inputtext: WideString;
//  GapCou: Int64;
//  StatuModeString: string;
//begin
//  if ModeStatus = 0 then
//  begin
//    StatuModeString := '��ʼ��';
//  end
//  else if ModeStatus = 1 then
//  begin
//    StatuModeString := 'ǰ������׷�����½���';
//  end
//  else if ModeStatus = 2 then
//  begin
//    StatuModeString := 'ȷ���ڴ���������ٱ仯';
//  end
//  else if ModeStatus = 3 then
//  begin
//    StatuModeString := '�����ڴ����Ϣ��Ӳ�̺�ɾ��';
//  end
//  else if ModeStatus = 4 then
//  begin
//    StatuModeString := 'ǰ����������Ѵ��ڵ�����';
//  end;
//
//  Linshi_Display := a + #13#10;
//
//  old_MemoryTcount := MemoryTcount;
//
//  EnterCriticalSection(CS);
//  MemoryTcount := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList');
//  HardhareCount := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from [hr].SeeLiangTieziList');
//  LeaveCriticalSection(CS);
//
//  GapCou := StrToInt64(MemoryTcount) - StrToInt64(old_MemoryTcount);
//  if GapCou >= 0 then
//    Linshi_Display := Linshi_Display + '�ڴ���� ' + MemoryTcount + '��(' + '����' + IntToStr(GapCou) + '��)�� ���̱��� ' + HardhareCount + '����'
//  else
//    Linshi_Display := Linshi_Display + '�ڴ���� ' + MemoryTcount + '��(' + '����' + IntToStr(Abs(GapCou)) + '��)�� ���̱��� ' + HardhareCount + '����';
//  //Linshi_Display := Linshi_Display + '  ���̱�TieziList�� ' + HardhareCount + '�� ';
//
////  sltb1.Free;
////  sltb2.Free;
//
////  b := PChar(Linshi_Display);
////  SendMessage(AppMainHangle, WM_USER + 101, WPARAM(Integer(b)), 0);
//  Linshi_Display := Linshi_Display + '##########GET�������ۻ�������' + IntToStr(GetornotGet) + '##########';
//
//  Linshi_Display := FormatDateTime('MM-DD hh:mm:ss', TheRealTimeTime_Datetime) + '��������IDΪ�� ' + IntToStr(ini_PostID) + '  ��ʹ�õ�����Ϊ��' + CofigName + '���ڴ������ʱ��Ϊ��' + FormatDateTime('YYYYMMDD hhmmss', SavedNewestCreateTimeInMemory) + '������ģʽΪ��' + StatuModeString + #13#10 + Linshi_Display + #13#10;
////  showme(G_Memory_Sqlite);
////  showme(sldb_InUniConnection);
//
//
//  sysDir := extractfilepath(application.ExeName);
//  logfile := formatdatetime('yyyyy-mm-dd', TheRealTimeTime_Datetime) + CustlogfileName; // ���ַ���ǰ�������� 'HandleDugTask��־.log'
//  //    if not directoryexists(sysdir) then
//  //      createdir(sysdir);
//  AssignFile(mylog, logfile);
//
//  if fileexists(sysDir + logfile) then
//    append(mylog)
//  else
//    rewrite(mylog);
//  //    inputtext := DateTimeToStr(now) + #13#10 + WindowText;
//  Writeln(mylog, Linshi_Display);                 //д��־��
//  CloseFile(mylog);                        //�ر��ļ���
//
//      //SendMessage(hwnd, WM_CLOSE, 0, 0);
//
//// ExectSqlInuni(UniQuery_Manage, 'insert into MemoryRecordCountChange' +
//// '(HappenTime, AbsoluteCount) values ("' + FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime) +
////  '", "' + MemoryTcount + '")');
////
//// old_MemoryTcount := IntToStr(StrToInt(MemoryTcount) -  StrToInt(old_MemoryTcount));
//// ExectSqlInuni(UniQuery_Manage, 'insert into MemoryRecordCountSpeedChange' +
//// '(HappenTime, ChangedMemoryRecordCount) values ("' + FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime) +
////  '", "' + MemoryTcount + '")');
//
//  if Abs(GapCou) < 50 then
//  begin
//    abnormal_count := abnormal_count + 1;
//
//    if abnormal_count_open then
//    begin
//      if abnormal_count > Min_AbnormalIncrease then
//      begin
//        abnormal_count_open := False;
//        abnormal_count := 0;
//        SendMessage(AppMainHangle, WM_USER + 103, 0, 0);
//      end;
//    end
//    else
//    begin
//      abnormal_count := 0;
//    end;
//  end;
//end;

//procedure FinalSaveStep;
//var
//  slDBpath, Linshi_String: string;
//  sSQL: string;
//  Linshi_UniConnection_Manage: TUniConnection;
//  //Linshi_UniQuery_Manage: TUniQuery;
//begin
//
//  slDBpath := ExtractFilepath(application.exename) + 'Manage.db3';
//  Linshi_UniConnection_Manage := TUniConnection.Create(nil);
//
//  Linshi_String := 'Provider Name=SQLite;';
//  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
//  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//  Linshi_String := Linshi_String + 'Client Library=sqlite3.dll;';
//  Linshi_String := Linshi_String + 'Use Unicode=false;';
//  Linshi_String := Linshi_String + 'Login Prompt=False';
//
//  Linshi_UniConnection_Manage.ConnectString := Linshi_String;
//
//  Linshi_UniConnection_Manage.Password := 'SYNCHRONOUSNORMAL';
//
//        //sldb_InUniConnection.SpecificOptions.Values['ASCIIDataBase'] := 'True';
//
//
//  Linshi_UniConnection_Manage.Connected := True;
//  Linshi_UniConnection_Manage.Connected := False;
//
////
////      Linshi_UniQuery_Manage := TUniQuery.Create(nil);
////      Linshi_UniQuery_Manage.Connection := Linshi_UniConnection_Manage;
//
//
//  try
//
//    Linshi_UniConnection_Manage.ExecSQL('update DigPostDetail_ConfigList set SavedUpdateProgressTieZiID=' + QuotedStr(MaxTieZiID_Mode4));
//    Linshi_UniConnection_Manage.ExecSQL('update DigPostAppSystemInfo set SavedUpdateProgressTieZiID=' + QuotedStr(MaxTieZiID_Mode4));
//
//  finally
////         Linshi_UniQuery_Manage.Connection := nil;
////         Linshi_UniQuery_Manage.Free;
//    Linshi_UniConnection_Manage.Free;
//  end;
//
//end;

function MyStringtoDateTime(sorString: string): TDateTime;
var
  linshi_string: string;   //2019-12-09 01:29:18
  y, mon, d, h, min, s: Word;   //2019-12-09 18:56
begin
  y := StrToInt(Copy(sorString, 1, 4));
  mon := StrToInt(Copy(sorString, 6, 2));
  d := StrToInt(Copy(sorString, 9, 2));
  h := StrToInt(Copy(sorString, 12, 2));
  min := StrToInt(Copy(sorString, 15, 2));
  //s := StrToInt(Copy(sorString, 18, 2));
  Result := EncodeDateTime(y, mon, d, h, min, 0, 0);
end;

//procedure HandleOnePost(SourPostId: string; var VarTableIniActionOperate: Integer);
//var
//  IdHttp: TIdHTTP;
//  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
//  ResponseStream: TStringStream; //������Ϣ
//  ResponseStr: string;
//  LinshiBoolean1, LinshiBoolean2: Boolean;
//  i: Integer;
//  PerTieziURL: string;
//  match: TMatch;
//  matchs: TMatchCollection;
//  LinshiPattern, LinshiPlanScheme_TopicContent: string;
//  Linshi_Strinlgist: TStringList;
//  Pls_BarName, Pls_Topic, Pls_Content: string;
//  Pls_FloorInfo, Pls_FloorNo, Pls_FloorReplyC: string;
//  Pls_FloorInfo1, Pls_FloorInfo2: string;
//  Pls_Createtime, Pls_TotalReturn: string;
//  Pls_FollowCountForOneTieBa, Pls_TotalPostForOneTieBa: string;
//  Pls_DeleteOrNot, Pls_CanReplyOrNot: string;
//  Insertsqll, Updatesqll: string;
//  s_Pattern1, s_Pattern2, s_Pattern3, s_Pattern4, s_Pattern5: string;
//  InsertOrUpdate: Integer;
//  //sltb_InUniConnection: TSQLIteTable;
//  i_floor: Integer;
//  Pls_FloorInfoList: TStringList;
//begin
//
//  //��ʼ��
//  VarTableIniActionOperate := 1;
//  Pls_BarName := '';
//  Pls_Topic := '';
//  Pls_Content := '';
//  Pls_DeleteOrNot := '-1';
//  Pls_CanReplyOrNot := '-1';
//
//  Pls_FloorInfo2 := '';
//  Pls_Createtime := '';
//  Pls_TotalReturn := '';
//
//  Pls_FollowCountForOneTieBa := '';
//  Pls_TotalPostForOneTieBa := '';
//
//
//
//  //��ʼ��������
////  VarTableIniActionOperate := 2;
////  s_Pattern1 := '<div id="errorText">';
////  s_Pattern2 := '�ܱ�Ǹ�������ѱ�ɾ��';
//
//    //s_Pattern3 := 'title="��������ҳ" href="/" class="search_logo" style="">';
//  //s_Pattern3 := '�ٶ�����';
//
////  s_Pattern4 := '<div class="tb_poster_info poster_warning">';
////  s_Pattern5 := '������ط��ɷ��������';
//
//    //Pub_TieziID := '6185607585';
//  PerTieziURL := Basic_PostLink + SourPostId;
//
//    //����IDHTTP�ؼ�
//  IdHttp := TIdHTTP.Create(nil);
//  IdHttp.HandleRedirects := True;
//  IdHttp.ReadTimeout := StrToInt(GetPostTimeOut);
//  IdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
//  IdHttp.Request.CharSet := 'utf-8';
//  IdHttp.Request.ContentEncoding := 'utf-8'; //����ʡ�ԣ�Ŀǰ�о�û��
//
//  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
//  IdHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//    //ResponseStream := TStringStream.Create('');
//    //ResponseStream := TStringStream.Create('', TEncoding.GetEncoding(936));
//  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
//  try
//    try
//      VarTableIniActionOperate := 5;
//      IdHttp.Get(PerTieziURL, ResponseStream);
//    except
//      Inc(GetornotGet);
//      Exit;
//    end;
//
//    VarTableIniActionOperate := 8;
//        //��ȡ��ҳ���ص���Ϣ
//    ResponseStr := ResponseStream.DataString;
//        //��ҳ�еĴ�������ʱ����Ҫ����UTF8����
//      //ResponseStr := UTF8Decode(ResponseStr);
//
//  finally
//    VarTableIniActionOperate := 9;
//
//    IdHttp.IOHandler := nil;
//    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
//    FreeAndNil(IdHttp);
//
//    VarTableIniActionOperate := 6;
//    ResponseStream.Free;
//  end;
//
//   // end;
//  //Pls_BarName, Pls_Topic, Pls_Content: string;
//
//     //http://tieba.baidu.com/p/6184821072������
//     //http://tieba.baidu.com/p/6361513183��Ȩ����
//     //https://tieba.baidu.com/p/6184821068 ��ɾ��
//     //http://tieba.baidu.com/p/6184826106  ��ɾ������������ҳ�ٿ������������Ӱ�~
//     //https://tieba.baidu.com/p/6372975943 ��Ǹ����������ʱ�޷����ʣ����Ժ�����
////    if (Pos(s_Pattern1, ResponseStr) > 0) and (Pos(s_Pattern2, ResponseStr) > 0) then
////    begin
////      Pls_DeleteOrNot := '1';
////      Exit;
////    end;
////    Pls_DeleteOrNot := '0';
//
// // 2019-12-09 19:08&quot
//
////����
//  VarTableIniActionOperate := 16;
//  LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>.+?\<\/div\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if not match.Success then
//  begin
//    Pls_DeleteOrNot := '1';
//    Exit;
//  end;
//
//
//////û��1¥�����ǰ���ר�����Ͳ�Ҫ������
////  LinshiPattern := '1¥';
////  match := TRegEx.Match(ResponseStr, LinshiPattern);
////  if not match.Success then
////  begin
////    Exit;
////  end;
//
//
//  Pls_DeleteOrNot := '0';
//  VarTableIniActionOperate := 17;
//  Pls_Content := match.Value;
//  LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>';
//  Pls_Content := TRegEx.Replace(Pls_Content, LinshiPattern, '');
//  LinshiPattern := '\<\/div\>';
//  Pls_Content := Trim(TRegEx.Replace(Pls_Content, LinshiPattern, ''));
//
//
////
////  VarTableIniActionOperate := 10;
////  if (Pos(s_Pattern3, ResponseStr) < 1) then
////  begin
////    Pls_DeleteOrNot := '1';
////    VarTableIniActionOperate := 11;
////    Exit;
////  end;
////  Pls_DeleteOrNot := '0';
//
//
//
////������
//  //LinshiPattern := '\<a.+?class\=\""(plat\_title\_h3|card\_title\_fname)\"".+?\>[\u4E00-\u9FA5\w\s]+\<\/a\>';
//  //LinshiPattern := '\<a.+?class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>.+?\<\/a\>';
//  VarTableIniActionOperate := 12;
//  LinshiPattern := 'class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>.+?\<\/a\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    VarTableIniActionOperate := 13;
//    Pls_BarName := match.Value;
//    //LinshiPattern := '\<a.+?class\=\""(plat\_title\_h3|card\_title\_fname)\"".+?\>';
//    LinshiPattern := 'class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>';
//    Pls_BarName := TRegEx.Replace(Pls_BarName, LinshiPattern, '');
//    LinshiPattern := '\<\/a\>';
//    Pls_BarName := Trim(TRegEx.Replace(Pls_BarName, LinshiPattern, ''));
//  end;
//
//
////����
//  VarTableIniActionOperate := 14;
//  LinshiPattern := '\<h\d\sclass\=\"core_title_txt.+?\"\stitle\=\".+?\"\sstyle\=\"width\:\s\d{1,}px\"\>.+?\<\/h\d\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    VarTableIniActionOperate := 15;
//    Pls_Topic := match.Value;
//    LinshiPattern := '\<h\d\sclass\=\"core_title_txt.+?\"\stitle\=\".+?\"\sstyle\=\"width\:\s\d{1,}px\"\>';
//    Pls_Topic := TRegEx.Replace(Pls_Topic, LinshiPattern, '');
//    LinshiPattern := '<\/h\d\>';
//    Pls_Topic := Trim(TRegEx.Replace(Pls_Topic, LinshiPattern, ''));
//  end;
//
////  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
////    Pri_Topic := match.Value;
//
//
//  Pls_FloorInfoList := TStringList.Create;
//  try
//        //�Ҷ�¥��¥��¥��¥��¥
//        //TableIniActionOperate := 16;
//        //LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>.+?\<\/div\>';
//        //LinshiPattern := 'class\=\"core\_reply\_tail\s\"\>\<div\sclass\=\"j\_lzl\_r\sp\_reply\"\sdata\-field.+?\<ul\sclass\=\"p\_mtail\"\>\<li\sclass\=\"j\_jb\_ele\scomplaint';
//    LinshiPattern := '\>�ظ�(\(\d+\))*\<\/a\>.+?class\=\"tail\-info\"\>\d+¥';
//    matchs := TRegEx.Matches(ResponseStr, LinshiPattern);
//
//    for match in matchs do
//    begin
//      Pls_FloorInfo := match.Value;
//      LinshiPattern := '\>�ظ�(\(\d+\))*';
//      if TRegEx.Match(Pls_FloorInfo, LinshiPattern).Success then
//      begin
//        Pls_FloorInfo1 := TRegEx.Match(Pls_FloorInfo, '\d+¥').Value;
//        Pls_FloorInfo := TRegEx.Match(Pls_FloorInfo, LinshiPattern).Value;
//            //Pls_FloorNo, Pls_FloorReplyC
//        if Pls_FloorInfo = '>�ظ�' then
//          Pls_FloorReplyC := '0'
//        else
//          Pls_FloorReplyC := TRegEx.Match(Pls_FloorInfo, '\d+').Value;
//
//        Pls_FloorNo := TRegEx.Match(Pls_FloorInfo1, '\d+').Value;
//
//        Pls_FloorInfo1 := Pls_FloorNo + '=' + Pls_FloorReplyC;
//        Pls_FloorInfoList.Add(Pls_FloorInfo1);
//      end;
//    end;
//  finally
//    if Pls_FloorInfoList.Count > 0 then
//    begin
//      Pls_FloorInfoList.Delimiter := '|';
//      Pls_FloorInfo2 := Pls_FloorInfoList.DelimitedText;
//    end;
//    Pls_FloorInfoList.Free;
//  end;
//  // 2019-12-09 19:08&quot
//      //Pls_Createtime
//  match := TRegEx.Match(ResponseStr, LinshiPatternForGetCreateTime);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//    Pls_Createtime := Copy(match.Value, 1, length(match.Value) - 5);
//    //G_Transit_CreateTime := Pls_Createtime;
//
//  if SavedNewestCreateTimeInMemory <> 0 then
//    if Abs(MyStringtoDateTime(Pls_Createtime) - SavedNewestCreateTimeInMemory) > 0.004 then
//      Exit;
//
//
//
//      //Pls_TotalReturn
//  LinshiPattern := '\d+\<\/span\>�ظ���';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    Pls_TotalReturn := match.Value;
//    LinshiPattern := '\d+';
//    Pls_TotalReturn := TRegEx.Match(Pls_TotalReturn, LinshiPattern).Value;
//  end;
//
//
////Pls_FollowCountForOneTieBa, Pls_TotalPostForOneTieBa
//  LinshiPattern := '��ע\��\<\/span\>\D+?[0-9\,]+\<\/span\>\D+?����\��\<\/span\>\D+?[0-9\,]+\<\/span\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    Pls_FloorInfo := match.Value;
//    LinshiPattern := '[0-9\,]+';
//    matchs := TRegEx.Matches(Pls_FloorInfo, LinshiPattern);
//    Pls_FollowCountForOneTieBa := StringReplace(matchs[0].Value, ',', '', [rfReplaceAll]);
//    Pls_TotalPostForOneTieBa := StringReplace(matchs[1].Value, ',', '', [rfReplaceAll]);
//  end;
//
//
////  VarTableIniActionOperate := 18;
////  if (Pos(s_Pattern4, ResponseStr) > 0) and (Pos(s_Pattern5, ResponseStr) > 0) then
////  begin
////    Pls_CanReplyOrNot := '0';
////    VarTableIniActionOperate := 19;
////    Exit;
////  end;
////  Pls_CanReplyOrNot := '1';
//
//
//  VarTableIniActionOperate := 22;
//  EnterCriticalSection(CS);
//  Insertsqll := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent' + ', DeleteOrNot, CanReplyOrNot, FloorDetails, FloorCount, Createtime, FollowCountForOneTieBa, TotalPostForOneTieBa, LastUpdateTime)' + ' values (' + QuotedStr(SourPostId) + ', ' + QuotedStr(Pls_BarName) + ', ' + QuotedStr(Pls_Topic) + ', ' + QuotedStr(Pls_Content) + ', ' + QuotedStr(Pls_DeleteOrNot) + ', ' + QuotedStr(Pls_CanReplyOrNot) + ', ' + QuotedStr(Pls_FloorInfo2) + ', ' + QuotedStr(Pls_TotalReturn) + ', ' + QuotedStr(Pls_Createtime) + ', ' + QuotedStr(Pls_FollowCountForOneTieBa) + ', ' + QuotedStr(Pls_TotalPostForOneTieBa) + ', ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ')';
//  MemorySqlite_InUniConnection.ExecSQL(Insertsqll);
//  LeaveCriticalSection(CS);
//
//end;
//
//procedure HandleOnePostForUpdate(SourPostId: string; var VarTableIniActionOperate: Integer);
//var
//  IdHttp: TIdHTTP;
//  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
//  ResponseStream: TStringStream; //������Ϣ
//  ResponseStr: string;
//  LinshiBoolean1, LinshiBoolean2: Boolean;
//  i: Integer;
//  PerTieziURL: string;
//  match: TMatch;
//  matchs: TMatchCollection;
//  LinshiPattern, LinshiPlanScheme_TopicContent: string;
//  Linshi_Strinlgist: TStringList;
//  Pls_BarName, Pls_Topic, Pls_Content: string;
//  Pls_FloorInfo, Pls_FloorNo, Pls_FloorReplyC: string;
//  Pls_FloorInfo1, Pls_FloorInfo2: string;
//  Pls_Createtime, Pls_TotalReturn: string;
//  Pls_FollowCountForOneTieBa, Pls_TotalPostForOneTieBa: string;
//  Pls_DeleteOrNot, Pls_CanReplyOrNot: string;
//  Insertsqll, Updatesqll: string;
//  s_Pattern1, s_Pattern2, s_Pattern3, s_Pattern4, s_Pattern5: string;
//  InsertOrUpdate: Integer;
//  //sltb_InUniConnection: TSQLIteTable;
//  i_floor: Integer;
//  Pls_FloorInfoList: TStringList;
//begin
//
//  //��ʼ��
//  VarTableIniActionOperate := 1;
//  Pls_BarName := '';
//  Pls_Topic := '';
//  Pls_Content := '';
//  Pls_DeleteOrNot := '-1';
//  Pls_CanReplyOrNot := '-1';
//
//  Pls_FloorInfo2 := '';
//  Pls_Createtime := '';
//  Pls_TotalReturn := '';
//
//  Pls_FollowCountForOneTieBa := '';
//  Pls_TotalPostForOneTieBa := '';
//
//  PerTieziURL := Basic_PostLink + SourPostId;
//
//    //����IDHTTP�ؼ�
//  IdHttp := TIdHTTP.Create(nil);
//  IdHttp.HandleRedirects := True;
//  IdHttp.ReadTimeout := StrToInt(GetPostTimeOut);
//  IdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
//  IdHttp.Request.CharSet := 'utf-8';
//  IdHttp.Request.ContentEncoding := 'utf-8'; //����ʡ�ԣ�Ŀǰ�о�û��
//
//  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
//  IdHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//    //ResponseStream := TStringStream.Create('');
//    //ResponseStream := TStringStream.Create('', TEncoding.GetEncoding(936));
//  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
//  try
//    VarTableIniActionOperate := 5;
//    try
//      IdHttp.Get(PerTieziURL, ResponseStream);
//    except
//      Inc(GetornotGet);
//      Exit;
//    end;
//
//    VarTableIniActionOperate := 8;
//        //��ȡ��ҳ���ص���Ϣ
//    ResponseStr := ResponseStream.DataString;
//        //��ҳ�еĴ�������ʱ����Ҫ����UTF8����
//      //ResponseStr := UTF8Decode(ResponseStr);
//
//  finally
//    VarTableIniActionOperate := 9;
//
//    IdHttp.IOHandler := nil;
//    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
//    FreeAndNil(IdHttp);
//
//    VarTableIniActionOperate := 6;
//    ResponseStream.Free;
//  end;
//
//   // end;
//  //Pls_BarName, Pls_Topic, Pls_Content: string;
//
//     //http://tieba.baidu.com/p/6184821072������
//     //http://tieba.baidu.com/p/6361513183��Ȩ����
//     //https://tieba.baidu.com/p/6184821068 ��ɾ��
//     //http://tieba.baidu.com/p/6184826106  ��ɾ������������ҳ�ٿ������������Ӱ�~
//     //https://tieba.baidu.com/p/6372975943 ��Ǹ����������ʱ�޷����ʣ����Ժ�����
////    if (Pos(s_Pattern1, ResponseStr) > 0) and (Pos(s_Pattern2, ResponseStr) > 0) then
////    begin
////      Pls_DeleteOrNot := '1';
////      Exit;
////    end;
////    Pls_DeleteOrNot := '0';
//
////����
//  VarTableIniActionOperate := 16;
//  LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>.+?\<\/div\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if not match.Success then
//  begin
//    Pls_DeleteOrNot := '1';
//    Exit;
//  end;
//
//  Pls_DeleteOrNot := '0';
//  VarTableIniActionOperate := 17;
//  Pls_Content := match.Value;
//  LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>';
//  Pls_Content := TRegEx.Replace(Pls_Content, LinshiPattern, '');
//  LinshiPattern := '\<\/div\>';
//  Pls_Content := Trim(TRegEx.Replace(Pls_Content, LinshiPattern, ''));
//
//
////
////  VarTableIniActionOperate := 10;
////  if (Pos(s_Pattern3, ResponseStr) < 1) then
////  begin
////    Pls_DeleteOrNot := '1';
////    VarTableIniActionOperate := 11;
////    Exit;
////  end;
////  Pls_DeleteOrNot := '0';
//
//
//
////������
//  //LinshiPattern := '\<a.+?class\=\""(plat\_title\_h3|card\_title\_fname)\"".+?\>[\u4E00-\u9FA5\w\s]+\<\/a\>';
//  //LinshiPattern := '\<a.+?class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>.+?\<\/a\>';
//  VarTableIniActionOperate := 12;
//  LinshiPattern := 'class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>.+?\<\/a\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    VarTableIniActionOperate := 13;
//    Pls_BarName := match.Value;
//    //LinshiPattern := '\<a.+?class\=\""(plat\_title\_h3|card\_title\_fname)\"".+?\>';
//    LinshiPattern := 'class\=\"(plat\_title\_h3|card\_title\_fname)\".+?\>';
//    Pls_BarName := TRegEx.Replace(Pls_BarName, LinshiPattern, '');
//    LinshiPattern := '\<\/a\>';
//    Pls_BarName := Trim(TRegEx.Replace(Pls_BarName, LinshiPattern, ''));
//  end;
//
//
////����
//  VarTableIniActionOperate := 14;
//  LinshiPattern := '\<h\d\sclass\=\"core_title_txt.+?\"\stitle\=\".+?\"\sstyle\=\"width\:\s\d{1,}px\"\>.+?\<\/h\d\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    VarTableIniActionOperate := 15;
//    Pls_Topic := match.Value;
//    LinshiPattern := '\<h\d\sclass\=\"core_title_txt.+?\"\stitle\=\".+?\"\sstyle\=\"width\:\s\d{1,}px\"\>';
//    Pls_Topic := TRegEx.Replace(Pls_Topic, LinshiPattern, '');
//    LinshiPattern := '<\/h\d\>';
//    Pls_Topic := Trim(TRegEx.Replace(Pls_Topic, LinshiPattern, ''));
//  end;
//
////  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
////    Pri_Topic := match.Value;
//
//
//  Pls_FloorInfoList := TStringList.Create;
//  try
//        //�Ҷ�¥��¥��¥��¥��¥
//        //TableIniActionOperate := 16;
//        //LinshiPattern := '\<div\sid\=\"post\_content\_\d{11,}\"\sclass\=\"d\_post\_content\sj\_d\_post\_content\s+(clearfix)?\"\sstyle\=\"display\:\;\"\>.+?\<\/div\>';
//        //LinshiPattern := 'class\=\"core\_reply\_tail\s\"\>\<div\sclass\=\"j\_lzl\_r\sp\_reply\"\sdata\-field.+?\<ul\sclass\=\"p\_mtail\"\>\<li\sclass\=\"j\_jb\_ele\scomplaint';
//    LinshiPattern := '\>�ظ�(\(\d+\))*\<\/a\>.+?class\=\"tail\-info\"\>\d+¥';
//    matchs := TRegEx.Matches(ResponseStr, LinshiPattern);
//
//    for match in matchs do
//    begin
//      Pls_FloorInfo := match.Value;
//      LinshiPattern := '\>�ظ�(\(\d+\))*';
//      if TRegEx.Match(Pls_FloorInfo, LinshiPattern).Success then
//      begin
//        Pls_FloorInfo1 := TRegEx.Match(Pls_FloorInfo, '\d+¥').Value;
//        Pls_FloorInfo := TRegEx.Match(Pls_FloorInfo, LinshiPattern).Value;
//            //Pls_FloorNo, Pls_FloorReplyC
//        if Pls_FloorInfo = '>�ظ�' then
//          Pls_FloorReplyC := '0'
//        else
//          Pls_FloorReplyC := TRegEx.Match(Pls_FloorInfo, '\d+').Value;
//
//        Pls_FloorNo := TRegEx.Match(Pls_FloorInfo1, '\d+').Value;
//
//        Pls_FloorInfo1 := Pls_FloorNo + '=' + Pls_FloorReplyC;
//        Pls_FloorInfoList.Add(Pls_FloorInfo1);
//      end;
//    end;
//  finally
//    if Pls_FloorInfoList.Count > 0 then
//    begin
//      Pls_FloorInfoList.Delimiter := '|';
//      Pls_FloorInfo2 := Pls_FloorInfoList.DelimitedText;
//    end;
//    Pls_FloorInfoList.Free;
//  end;
//
//      //Pls_Createtime
//    //LinshiPattern := '20\d\d\-\d\d-\d\d\s\d\d\:\d\d';
//  match := TRegEx.Match(ResponseStr, LinshiPatternForGetCreateTime);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//    Pls_Createtime := Copy(match.Value, 1, length(match.Value) - 5);
//
//  if SavedNewestCreateTimeInMemory <> 0 then
//    if Abs(MyStringtoDateTime(Pls_Createtime) - SavedNewestCreateTimeInMemory) > 0.004 then
//      Exit;
//
//
//      //Pls_TotalReturn
//  LinshiPattern := '\d+\<\/span\>�ظ���';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    Pls_TotalReturn := match.Value;
//    LinshiPattern := '\d+';
//    Pls_TotalReturn := TRegEx.Match(Pls_TotalReturn, LinshiPattern).Value;
//  end;
//
//
////Pls_FollowCountForOneTieBa, Pls_TotalPostForOneTieBa
//  LinshiPattern := '��ע\��\<\/span\>\D+?[0-9\,]+\<\/span\>\D+?����\��\<\/span\>\D+?[0-9\,]+\<\/span\>';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//  begin
//    Pls_FloorInfo := match.Value;
//    LinshiPattern := '[0-9\,]+';
//    matchs := TRegEx.Matches(Pls_FloorInfo, LinshiPattern);
//    Pls_FollowCountForOneTieBa := StringReplace(matchs[0].Value, ',', '', [rfReplaceAll]);
//    Pls_TotalPostForOneTieBa := StringReplace(matchs[1].Value, ',', '', [rfReplaceAll]);
//  end;
//
//  VarTableIniActionOperate := 22;
//  EnterCriticalSection(CS);
//  Insertsqll := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent' + ', DeleteOrNot, CanReplyOrNot, FloorDetails, FloorCount, Createtime, FollowCountForOneTieBa, TotalPostForOneTieBa, LastUpdateTime)' + ' values (' + QuotedStr(SourPostId) + ', ' + QuotedStr(Pls_BarName) + ', ' + QuotedStr(Pls_Topic) + ', ' + QuotedStr(Pls_Content) + ', ' + QuotedStr(Pls_DeleteOrNot) + ', ' + QuotedStr(Pls_CanReplyOrNot) + ', ' + QuotedStr(Pls_FloorInfo2) + ', ' + QuotedStr(Pls_TotalReturn) + ', ' + QuotedStr(Pls_Createtime) + ', ' + QuotedStr(Pls_FollowCountForOneTieBa) + ', ' + QuotedStr(Pls_TotalPostForOneTieBa) + ', ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ')';
//  MemorySqlite_InUniConnection.ExecSQL(Insertsqll);
//  LeaveCriticalSection(CS);
//
//end;
//
//procedure HandleOnePostEX(SourPostId: string; var arTableIniActionOperate: string);
//var
//  IdHttp: TIdHTTP;
//  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
//  ResponseStream: TStringStream; //������Ϣ
//  ResponseStr: string;
//  LinshiBoolean1, LinshiBoolean2: Boolean;
//  i: Integer;
//  PerTieziURL: string;
//  match: TMatch;
//  LinshiPattern: string;
//  s_Pattern1, s_Pattern2, s_Pattern3, s_Pattern4, s_Pattern5: string;
//begin
//  arTableIniActionOperate := '';
//  PerTieziURL := Basic_PostLink + SourPostId;
//  //����IDHTTP�ؼ�
//  IdHttp := TIdHTTP.Create(nil);
//  IdHttp.HandleRedirects := True;
//  IdHttp.ReadTimeout := StrToInt(GetPostTimeOut);
//  IdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
//  IdHttp.Request.CharSet := 'utf-8';
//  IdHttp.Request.ContentEncoding := 'utf-8';
//
//  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
//  IdHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//  ResponseStream := TStringStream.Create('', TEncoding.UTF8);
//  try
//    try
//      IdHttp.Get(PerTieziURL, ResponseStream);
//    except
//      Exit;
//    end;
//
//    ResponseStr := ResponseStream.DataString;
//
//  finally
//    IdHttp.IOHandler := nil;
//    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
//    FreeAndNil(IdHttp);
//    ResponseStream.Free;
//  end;
//
//
////û��1¥�����ǰ���ר�����Ͳ�Ҫ������
//  LinshiPattern := '1¥';
//  match := TRegEx.Match(ResponseStr, LinshiPattern);
//  if not match.Success then
//  begin
//    Exit;
//  end;
//
//   // end;
//  //Pls_BarName, Pls_Topic, Pls_Content: string;
//
//     //http://tieba.baidu.com/p/6184821072������
//     //http://tieba.baidu.com/p/6361513183��Ȩ����
//     //https://tieba.baidu.com/p/6184821068 ��ɾ��
//     //http://tieba.baidu.com/p/6184826106  ��ɾ������������ҳ�ٿ������������Ӱ�~
//     //https://tieba.baidu.com/p/6372975943 ��Ǹ����������ʱ�޷����ʣ����Ժ�����
//
//    //LinshiPattern := '20\d\d\-\d\d-\d\d\s\d\d\:\d\d';
//  match := TRegEx.Match(ResponseStr, LinshiPatternForGetCreateTime);
//  if match.Success then //����һ�仰 if TRegEx.Match(txt, pattern).Success then
//    arTableIniActionOperate := Copy(match.Value, 1, length(match.Value) - 5);
//
//end;
//
//function GetNewestCreateTime(str_ManMadeNewestTieZiID: string): string;
//var
//  Linsh_int64: Int64;
//  i: Int64;
//  Linshi_int: Integer;
//  Linshi_Transit_CreateTime: string;
//  x: Cardinal;
//begin
//  try
//    x := GetTickCount;
//    Linsh_int64 := StrToInt64(str_ManMadeNewestTieZiID);
//
//    Linshi_Transit_CreateTime := '';
//
//    while Linshi_Transit_CreateTime = '' do
//    begin
//      HandleOnePostEX(IntToStr(Linsh_int64), Linshi_Transit_CreateTime);
//
//      Linsh_int64 := Linsh_int64 - 1;
//
//      if Abs(x - GetTickCount) > 100000 then
//        raise Exception.Create('Error Message');
//    end;
//    Result := Linshi_Transit_CreateTime;
//  except
//    on E: Exception do
//    begin
//      ShowMessageEX('����GetNewestCreateTimeʱ���������˳���' + #13#10 + e.Message);
//      Halt;
//    end;
//  end;
//
//end;
//
//procedure Delay(dwMilliseconds: DWORD);//Longint
//var
//  iStart, iStop: DWORD;
//begin
//  iStart := GetTickCount;
//  repeat
//    iStop := GetTickCount;
//    Application.ProcessMessages;
//  until (iStop - iStart) >= dwMilliseconds;
//end;

procedure initializeSqliteEX;
var
  slDBpath: string;
  sSQL: string;
  Linshi_String: string;
  GetNewestCreateTimeForOneTieZiID: string;
  GetNewestCreateTimeInTable: string;
begin
//Provider Name=SQLite;Database=C:\Users\DELL\Desktop\����fdconnection\SaveDugInfo.db3;Encryption Key=SYNCHRONOUSNORMAL;Client Library=C:\Users\DELL\Desktop\����fdconnection\�����̸߳�Ϊ���߳�ǰ����\bin\sqlite3.dll;Login Prompt=False

  //try
//    slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
//    //ExtractFilepath(application.exename) + 'SaveDugInfo.db3"
//    // ExtractFilepath(application.exename) + 'KS.db3';
//    sldb_InUniConnection := TUniConnection.Create(nil);
//
//    Linshi_String := 'Provider Name=SQLite;';
//    Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
//    Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//    Linshi_String := Linshi_String + 'Client Library=sqlite3.dll;';
//    Linshi_String := Linshi_String + 'Use Unicode=false;';
//    Linshi_String := Linshi_String + 'Login Prompt=False';
//
//    sldb_InUniConnection.ConnectString := Linshi_String;
//
//    sldb_InUniConnection.Password := 'SYNCHRONOUSNORMAL';
//
//        //sldb_InUniConnection.SpecificOptions.Values['ASCIIDataBase'] := 'True';
//
//
//    sldb_InUniConnection.Connected := True;
//    sldb_InUniConnection.Connected := False;




//         sldb_InUniConnection.Params.Add('DriverID=SQLite');
//         sldb_InUniConnection.Params.Add('Database=' + slDBpath);
//         sldb_InUniConnection.Params.Add('Password=SYNCHRONOUSNORMAL');
         //sldb_InUniConnection.Params.Add('Password=');
         //sldb_InUniConnection.Params.Add('NewPassword=SYNCHRONOUSNORMAL');

//         FDConnection1.Params.Add('Password=mm123');
//         sldb_InUniConnection.Params.Add('NewPassword=mm12345'); //������, ����Ϊ�ձ�ʾȡ������
//         Password=aes-256:mm123
         //sldb_InUniConnection.Params.Add('Password=aes-128:SYNCHRONOUSNORMAL');

//        if not sldb_InUniConnection.TableExists('SavedPoint') then
//          raise Exception.Create('Error Message');
//
//        if not sldb_InUniConnection.TableExists('SystemInfo') then
//          raise Exception.Create('Error Message');
//
//        if not sldb_InUniConnection.TableExists('DingTie_Config') then
//          raise Exception.Create('Error Message');
//
//        if not sldb_InUniConnection.TableExists('PlanScheme_Config') then
//          raise Exception.Create('Error Message');
//  except
//    ShowMessageEX('���ݿ��ļ����Ƴ�������ԭ��');
//    Halt;
//  end;


      //sSQL := 'select ContactWay from SystemInfo';
      //sSQL := 'select dingtie_content from DingTie_Config limit 1';

//  sltb_InUniConnection := TUniQuery.Create(nil);
//  sltb_InUniConnection.Connection := sldb_InUniConnection;


//  sltb_InUniConnection1 := TUniQuery.Create(nil);
//  sltb_InUniConnection1.Connection := sldb_InUniConnection;

//  sSQL := 'select ContactWay from SystemInfo';
//  GetContactWay := QueryString(sltb_InUniConnection, sSQL);
//
//  ShowMessageMyTaobao_MyInfo1 := ShowMessageMyTaobao_MyInfo1 + GetContactWay;
//  PemanantShow := PemanantShow + GetContactWay; //'΢�ź�wujiannotliar';

          //
      //InitializeCriticalSection(RestrictHttp);

    {
       G_Memory_Sqlite: TSQLiteDatabase;
      G_Memory_Sqlite_Table: TSQLIteTable;
    }

      //G_Memory_Sqlite := TSQLiteDatabase.Create(':memory:');

  //InitializeCriticalSection(CS);
  //InitializeCriticalSection(AddActionCriti);

      //slDBpath := ExtractFilepath(application.exename) + 'KS.db3';
      //slDBpath := ':memory:';

      {
      slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
        //abc
        //slDBpath := ExtractFilepath(application.exename) + 'abc.db';
      G_Memory_Sqlite1 := TUniConnection.Create(nil);


        Linshi_String := 'Provider Name=SQLite;';
        Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
        Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
        Linshi_String := Linshi_String + 'Client Library=sqlite3.dll;';
        Linshi_String := Linshi_String + 'Use Unicode=false;';
        Linshi_String := Linshi_String + 'Login Prompt=False';


        G_Memory_Sqlite1.ConnectString := Linshi_String;

        G_Memory_Sqlite1.Password := 'SYNCHRONOUSNORMAL';

        G_Memory_Sqlite1.SpecificOptions.Values['ASCIIDataBase'] := 'True';


        G_Memory_Sqlite1.Connected := True;
        G_Memory_Sqlite1.Connected := False;
      }

      //slDBpath := ExtractFilepath(application.exename) + 'KS.db3';
//   slDBpath := ':memory:';
////      //slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
////        //abc
////        //slDBpath := ExtractFilepath(application.exename) + 'abc.db';
//  MemorySqlite_InUniConnection := TUniConnection.Create(nil);
////
//  Linshi_String := 'Provider Name=SQLite;';
//  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
//  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//  Linshi_String := Linshi_String + 'Client Library=sqlite3.dll;';
//  Linshi_String := Linshi_String + 'Use Unicode=false;';
//  Linshi_String := Linshi_String + 'Login Prompt=False';
////
//  MemorySqlite_InUniConnection.ConnectString := Linshi_String;
////
//  MemorySqlite_InUniConnection.Password := 'SYNCHRONOUSNORMAL';
////
////        //MemorySqlite_InUniConnection.SpecificOptions.Values['ASCIIDataBase'] := 'True';
////
////
//  MemorySqlite_InUniConnection.Connected := True;
//  MemorySqlite_InUniConnection.Connected := False;
////
//
//
////      G_Memory_Sqlite.Params.Add('DriverID=SQLite');
////      G_Memory_Sqlite.Params.Add('Database=' + ':memory:');
////      G_Memory_Sqlite.Params.Add('Password=SYNCHRONOUSNORMAL');
//
////
////  G_Memory_Sqlitetb1 := TUniQuery.Create(nil);
////  G_Memory_Sqlitetb1.Connection := MemorySqlite_InUniConnection;
//
//  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
//  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;
////
////      //ExectSqlInuni(MemorySqliteTable_InUniConnection, 'ATTACH DATABASE "' + 'C:\Users\DELL\Desktop\bin\' + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
////      //ExectSqlInuni(MemorySqliteTable_InUniConnection, 'ATTACH DATABASE "' + ':memory:' + '" AS hr');
//   MemorySqlite_InUniConnection.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
////
//   sSQL := 'CREATE TABLE SeeLiangTieziList (' + '[FloorDetails] TEXT,' + '[TieziID] INTEGER NOT NULL,' + '[TieBaName] TEXT,' + '[TitleName] TEXT,' + '[TieZiContent] TEXT,' + '[DeleteOrNot] integer NOT NULL,' + '[CanReplyOrNot] integer,' + '[FloorCount] integer,' + '[Createtime] TEXT,' + '[FollowCountForOneTieBa] integer,' + '[TotalPostForOneTieBa] integer,' + '[LastUpdateTime] TEXT,' + 'PRIMARY KEY ([TieziID]));';
////
//   MemorySqlite_InUniConnection.ExecSQL(sSQL);
//
//  if ChooseCustominiPostID then
//    ini_PostID := StrToInt64(ManMadeNewestTieZiID)
//  else
//  begin
//
//
//    GetNewestCreateTimeInTable := QueryString(MemorySqliteTable_InUniConnection, 'select max(Createtime) from [hr].SeeLiangTieziList');
//      //if Abs(MystrtoDateTime(GetNewestCreateTimeInTable) - TheRealTimeTime_Datetime) <= 1 then
//
//    if (Trim(ManMadeNewestTieZiID) = '') or (Trim(ManMadeNewestTieZiID) = '0')  then
//    begin
//      ini_PostID := StrToInt64(QueryString(MemorySqliteTable_InUniConnection, 'select max(TieziID) from [hr].SeeLiangTieziList where Createtime=' + QuotedStr(GetNewestCreateTimeInTable))) + 1;
//    end
//    else
//    begin
//      GetNewestCreateTimeForOneTieZiID := GetNewestCreateTime(ManMadeNewestTieZiID);
//
//      if CompareStr(GetNewestCreateTimeInTable, GetNewestCreateTimeForOneTieZiID) >= 0 then
//      begin
//        ini_PostID := StrToInt64(QueryString(MemorySqliteTable_InUniConnection, 'select max(TieziID) from [hr].SeeLiangTieziList where Createtime=' + QuotedStr(GetNewestCreateTimeInTable))) + 1;
//      end
//      else
//      begin
//        ini_PostID := StrToInt64(ManMadeNewestTieZiID);
//      end;
//    end;
//  end;




      //ExectSqlInuni(G_Memory_Sqlitetb1, 'ATTACH DATABASE "' + ':memory:' + '" AS hr');

//
//  try
//        //ExectSqlInuni(G_Memory_Sqlitetb1, 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr');
//
//    //showme('��ʼ�����ӱ�ǰ');
//
//        //G_Memory_Sqlite.BeginTransaction;
//    //ExectSqlInuni(G_Memory_Sqlitetb1, 'insert into SeeLiangTieziList select * from [hr].SeeLiangTieziList order by TieziID desc limit ' + isOfflineOrDelete_CheckRecordCount);
////     if QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList where TieziID=' + QuotedStr(IntToStr(ini_PostID))) <> '1'  then
////      MemorySqlite_InUniConnection.ExecSQL('replace into SeeLiangTieziList (TieziID, DeleteOrNot) values (' + QuotedStr(IntToStr(ini_PostID)) + ', "-1")');
//
//    showme('��ʼ����ϣ�');
//  except
//    on E: Exception do
//    begin
//      ShowMessageEX(e.Message);
//      Halt;
//    end;
//
//  end;



    //    showme(G_Memory_Sqlite);
    //    showme(sldb_InUniConnection);
    //  finally
    //    G_Memory_Sqlite.ExecSQL('DETACH DATABASE "hr"');
    //  end;

      //Delay(1000);




//  max_tieziID := QueryString(MemorySqliteTable_InUniConnection, 'select max(TieziID) from SeeLiangTieziList');
//  max_tieziID_int64 := strtoint64(max_tieziID);
  //max_tieziID_int64 := ini_PostID - 1;
end;

procedure finalizeSqliteEX;
begin

//  finalizeSqlitestep := 14;
//  RestricUse.Terminate;
//  CollectAllPostsThread.Terminate;
////      CollectAllPostsThread_BackAdd.Terminate;
////      CollectAllPostsThread_BackModify.Terminate;
//
//  finalizeSqlitestep := 15;
//
//  finalizeSqlitestep := 16;
//  if not finishFinalSave then
//  begin
//    finalizeSqlitestep := 17;
//    showme('���ջ����ӱ�ǰ');
//
//    finalizeSqlitestep := 18;
//    EnterCriticalSection(CS);
//    MemorySqlite_InUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
//    if ModeStatus = 4 then
//      MaxTieZiID_Mode4 := QueryString(MemorySqliteTable_InUniConnection, 'select max(TieziID) from SeeLiangTieziList');
//    LeaveCriticalSection(CS);
//
//    finalizeSqlitestep := 23;
//    showme('���ջ����ӱ���');
//
//    if ModeStatus = 4 then
//      FinalSaveStep;
//  end;
////      if not RestricUse.Terminated then
////        RestricUse.Terminate;
//  finalizeSqlitestep := 24;
//      //G_Memory_Sqlite.ExecSQL('DETACH DATABASE "hr"');
//  MemorySqlite_InUniConnection.ExecSQL('DETACH DATABASE "hr"');
//
//  finalizeSqlitestep := 26;
//
//      //G_Memory_Sqlite.Free;     �ͷ����б�������
//
//
//  finalizeSqlitestep := 27;
//  sltb_InUniConnection.Connection := nil;
//  sltb_InUniConnection.Free;
//
//  sltb_InUniConnection1.Connection := nil;
//  sltb_InUniConnection1.Free;
//
//
//
//  sldb_InUniConnection.Free;

//  finalizeSqlitestep := 28;
//  DeleteCriticalSection(CS);
      //DeleteCriticalSection(AddActionCriti);

end;

procedure initializeSqliteHardwareTable(dbFileNmae: string = '');
var
  slDBpath: string;
  Linshi_String: string;
begin
    if dbFileNmae = '' then
        slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3'
    else
        slDBpath :=  dbFileNmae;
    //(dbFileNmae: string = '');
    sldb_InUniConnection := TUniConnection.Create(nil);

    Linshi_String := 'Provider Name=SQLite;';
    Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
    Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
    Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
    Linshi_String := Linshi_String + 'Use Unicode=false;';
    Linshi_String := Linshi_String + 'Login Prompt=False';

    sldb_InUniConnection.ConnectString := Linshi_String;

    sldb_InUniConnection.Password := 'SYNCHRONOUSNORMAL';

    sldb_InUniConnection.Connected := True;
    sldb_InUniConnection.Connected := False;

    sltb_InUniConnection := TUniQuery.Create(nil);
    sltb_InUniConnection.Connection := sldb_InUniConnection;


//    sltb_InUniConnection1 := TUniQuery.Create(nil);
//    sltb_InUniConnection1.Connection := sldb_InUniConnection;
end;

procedure finalizeSqliteHardwareTable;
begin
  sltb_InUniConnection.Connection := nil;
  sltb_InUniConnection.Free;

//  sltb_InUniConnection1.Connection := nil;
//  sltb_InUniConnection1.Free;

  sldb_InUniConnection.Free;
end;

procedure initializeSqliteMemoryTableEXEX(LAttachFilename: string);
var
  slDBpath, Linshi_String: string;
  sSQL: string;
begin
  slDBpath := ':memory:';
  MemorySqlite_InUniConnection := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  MemorySqlite_InUniConnection.ConnectString := Linshi_String;

  MemorySqlite_InUniConnection.Password := 'SYNCHRONOUSNORMAL';

  MemorySqlite_InUniConnection.Connected := True;
  MemorySqlite_InUniConnection.Connected := False;



  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;



  sSQL := 'ATTACH DATABASE "' + LAttachFilename + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');

  MemorySqlite_InUniConnection.ExecSQL(sSQL);

  //sSQL := 'CREATE TABLE SeeLiangTieziList (' +
  //'[FloorDetails] TEXT,' + '[TieziID] INTEGER NOT NULL,' + '[TieBaName] TEXT,' + '[TitleName] TEXT,' + '[TieZiContent] TEXT,' + '[DeleteOrNot] integer NOT NULL,' + '[CanReplyOrNot] integer,' + '[FloorCount] integer,' + '[Createtime] TEXT,' + '[FollowCountForOneTieBa] integer,' + '[TotalPostForOneTieBa] integer,' + '[LastUpdateTime] TEXT,'
  //+ 'PRIMARY KEY ([TieziID]));';   FloorDetails

  sSQL := 'CREATE TABLE SaveSomeTieziID (' +
  '[TieziID] integer NOT NULL,' +
  '[FileMing] TEXT NOT NULL,' +
  'PRIMARY KEY ([TieziID]));';
  MemorySqlite_InUniConnection.ExecSQL(sSQL);
//
//
//  sSQL := 'CREATE TABLE SaveSomeTieziIDEX (' +
//  '[TieziID] integer NOT NULL,' +
//  '[FloorDetails] TEXT,' +
//  'PRIMARY KEY ([TieziID]));';
//  MemorySqlite_InUniConnection.ExecSQL(sSQL);
end;


procedure initializeSqliteMemoryTable;
var
  slDBpath, Linshi_String: string;
  sSQL: string;
begin
  slDBpath := ':memory:';
  MemorySqlite_InUniConnection := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  MemorySqlite_InUniConnection.ConnectString := Linshi_String;

  MemorySqlite_InUniConnection.Password := 'SYNCHRONOUSNORMAL';

  MemorySqlite_InUniConnection.Connected := True;
  MemorySqlite_InUniConnection.Connected := False;



  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;



  //sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');

  //MemorySqlite_InUniConnection.ExecSQL(sSQL);

  //sSQL := 'CREATE TABLE SeeLiangTieziList (' +
  //'[FloorDetails] TEXT,' + '[TieziID] INTEGER NOT NULL,' + '[TieBaName] TEXT,' + '[TitleName] TEXT,' + '[TieZiContent] TEXT,' + '[DeleteOrNot] integer NOT NULL,' + '[CanReplyOrNot] integer,' + '[FloorCount] integer,' + '[Createtime] TEXT,' + '[FollowCountForOneTieBa] integer,' + '[TotalPostForOneTieBa] integer,' + '[LastUpdateTime] TEXT,'
  //+ 'PRIMARY KEY ([TieziID]));';   FloorDetails

  sSQL := 'CREATE TABLE SaveSomeTieziID (' +
  '[TieziID] integer NOT NULL,' +
  '[FileMing] TEXT NOT NULL,' +
  'PRIMARY KEY ([TieziID]));';
  MemorySqlite_InUniConnection.ExecSQL(sSQL);
//
//
//  sSQL := 'CREATE TABLE SaveSomeTieziIDEX (' +
//  '[TieziID] integer NOT NULL,' +
//  '[FloorDetails] TEXT,' +
//  'PRIMARY KEY ([TieziID]));';
//  MemorySqlite_InUniConnection.ExecSQL(sSQL);
end;

procedure initializeSqliteMemoryTableEX;
var
  slDBpath, Linshi_String: string;
  sSQL: string;
begin
  slDBpath := ':memory:';
  MemorySqlite_InUniConnection := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  MemorySqlite_InUniConnection.ConnectString := Linshi_String;

  MemorySqlite_InUniConnection.Password := 'SYNCHRONOUSNORMAL';

  MemorySqlite_InUniConnection.Connected := True;
  MemorySqlite_InUniConnection.Connected := False;



  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;



  sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');

  MemorySqlite_InUniConnection.ExecSQL(sSQL);

  //sSQL := 'CREATE TABLE SeeLiangTieziList (' +
  //'[FloorDetails] TEXT,' + '[TieziID] INTEGER NOT NULL,' + '[TieBaName] TEXT,' + '[TitleName] TEXT,' + '[TieZiContent] TEXT,' + '[DeleteOrNot] integer NOT NULL,' + '[CanReplyOrNot] integer,' + '[FloorCount] integer,' + '[Createtime] TEXT,' + '[FollowCountForOneTieBa] integer,' + '[TotalPostForOneTieBa] integer,' + '[LastUpdateTime] TEXT,'
  //+ 'PRIMARY KEY ([TieziID]));';   FloorDetails

//  sSQL := 'CREATE TABLE SaveSomeTieziID (' +
//  '[TieziID] integer NOT NULL,' +
//  'PRIMARY KEY ([TieziID]));';
//  MemorySqlite_InUniConnection.ExecSQL(sSQL);


  sSQL := 'CREATE TABLE SaveSomeTieziIDEX (' +
  '[TieziID] integer NOT NULL,' +
  '[FloorDetails] TEXT,' +
  'PRIMARY KEY ([TieziID]));';
  MemorySqlite_InUniConnection.ExecSQL(sSQL);
end;

procedure finalizeSqliteMemoryTable;    //MemorySqlite_InUniConnection
begin
  MemorySqlite_InUniConnection.ExecSQL('DETACH DATABASE "hr"');

  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;
  MemorySqliteTable_InUniConnection.Free;

  MemorySqlite_InUniConnection.Free;
end;

//procedure SaveMemoryTable;
//begin
//  showme('�̹߳ز������ã����ջ����ӱ�ǰ');
//
//  EnterCriticalSection(CS);
//  MemorySqlite_InUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
//  if ModeStatus = 4 then
//    MaxTieZiID_Mode4 := QueryString(MemorySqliteTable_InUniConnection, 'select max(TieziID) from SeeLiangTieziList');
//  LeaveCriticalSection(CS);
//
//  showme('�̹߳ز������ã����ջ����ӱ���');
//
//  if ModeStatus = 4 then
//    FinalSaveStep;
//
//  finishFinalSave := True;
//
//  SendMessage(AppMainHangle, WM_USER + 102, 0, 0)
//end;

//function ReadEXE(var Readout: string): Boolean;
//var
//  s: TExeStream;
//  a: Char;
//  k: Byte;
//begin
//  Result := False;
//  try
//    Readout := '';
//    //s := TExeStream.Create(Application.ExeName, True);    wow_helper.exe
//    //s := TExeStream.Create(ExtractFilePath(Application.ExeName) + 'copyDingTie.exe', True);
//    s := TExeStream.Create(ExtractFilePath(Application.ExeName) + 'wow_helper.exe', True);
//    repeat
//      k := s.Read(a, 1);
//      if k <> 0 then
//        Readout := Readout + a;
//    until k = 0;
//    s.Free;
//    Result := true;
//  except
//
//  end;
//  //ShowMessage(Readout+'Ϊ��ȡ������');
//end;
{
procedure WriteEXE(Writeinto: string);
var
  s: TExeStream;
  a: Char;
  j: Integer;
  SaveDFileName: string;
begin
  //wow_helper.exe
  //SaveDFileName := ExtractFilePath(Application.ExeName) + 'copyDingTie.exe';
  SaveDFileName := ExtractFilePath(Application.ExeName) + 'wow_helper.exe';
  //CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'DingTie.exe'), PChar(SaveDFileName), False);

  s := TExeStream.Create(SaveDFileName, False);
  j := 1;
  while j <= Length(Writeinto) do
  begin
    a := Writeinto[j];
    s.Write(a, 1);
    Inc(j);
  end;
  //ShowMessage(IntToStr(s.Size) + ' bytes saved.');
  s.Free;
end;
}
function UniQueryString(UseUniQuery: TUniQuery; sSQL: string): string;
begin
  QuerySqlInuni(UseUniQuery, sSQL);
  try
    if UseUniQuery.RecordCount <= 0 then
      raise Exception.Create('��ѯSQL���δ��������' + #13#10 + sSQL);

    Result := UseUniQuery.Fields[0].AsString;

  finally
    FinalQuerySqlInuni(UseUniQuery);
  end;
end;

function UniQueryStringEX(UseUniQuery: TUniQuery; sSQL: string; var A: string; var B: string): Boolean;
begin
  Result := False;

  QuerySqlInuni(UseUniQuery, sSQL);
  try
    if UseUniQuery.RecordCount <= 0 then
      raise Exception.Create('��ѯSQL���δ��������' + #13#10 + sSQL);

    A := UseUniQuery.Fields[0].AsString;
    B := UseUniQuery.Fields[1].AsString;

  finally
    FinalQuerySqlInuni(UseUniQuery);
  end;

  Result := true;
end;

function UniQueryStringEXEXEX(UseUniQuery: TUniQuery; sSQL: string; var A: string; var B: string; var C: string; var D: string): Boolean;
begin
  Result := False;
  QuerySqlInuni(UseUniQuery, sSQL);
  try
    if UseUniQuery.RecordCount <= 0 then
      raise Exception.Create('��ѯSQL���δ��������' + #13#10 + sSQL);

    A := UseUniQuery.Fields[0].AsString;
    B := UseUniQuery.Fields[1].AsString;
    C := UseUniQuery.Fields[2].AsString;
    D := UseUniQuery.Fields[3].AsString;
  finally
    FinalQuerySqlInuni(UseUniQuery);
  end;
  Result := true;
end;

//function ShowMessageEX(ShowStr: string): Integer;
//begin
//  MessageBox(Application.Handle, PWideChar(ShowStr), '��ʾ', MB_OK + MB_SYSTEMMODAL); // + MB_USERICON + );
//end;


//procedure ExectSqlInuni(UseUniQuery: TUniQuery; strSQL: string);
//begin
//  UseUniQuery.SQL.Clear;
//  UseUniQuery.SQL.Text := strSQL;
//  if not UseUniQuery.Prepared then
//    UseUniQuery.Prepare;
//
//  try
//    UseUniQuery.ExecSQL;
//  finally
//    UseUniQuery.UnPrepare;
//    UseUniQuery.Close;
//  end;
//end;

procedure QuerySqlInuni(UseUniQuery: TUniQuery; strSQL: string);
begin
  UseUniQuery.Close;
  UseUniQuery.SQL.Clear;
  UseUniQuery.SQL.Text := strSQL;
  if not UseUniQuery.Prepared then
    UseUniQuery.Prepare;
  UseUniQuery.Open;
end;

procedure FinalQuerySqlInuni(UseUniQuery: TUniQuery);
begin
  UseUniQuery.UnPrepare;
  UseUniQuery.Close;
end;


procedure THandleWaitings.iniWaiting(sender: TObject; setTop: Integer = 0; setLeft: Integer = 0);
var
  GuoDuContr: TWinControl;
begin
  GuoDuContr := sender as TWinControl;
  LinshiNewBuilt.Parent := GuoDuContr;
  LinshiNewBuilt.Left := setLeft;
  LinshiNewBuilt.Top := setTop;
  LinshiNewBuilt.Width := GuoDuContr.Width;
  LinshiNewBuilt.Height := GuoDuContr.Height;
  LinshiNewBuilt.Caption := 'Waiting...';
  LinshiNewBuilt.Show;

  LinshiTimer.Enabled := True;
end;

constructor THandleWaitings.Create(TimeInverval: Cardinal);
begin
  //if not Assigned(LinshiNewBuilt) then
  LinshiNewBuilt :=  TLabel.Create(nil);
  LinshiTimer := TTimer.Create(nil);

  LinshiTimer.OnTimer := Eventeverytime;
  LinshiTimer.Enabled := False;
  LinshiTimer.Interval := TimeInverval;

  //if not Assigned(LinshiTimer) then

end;

destructor THandleWaitings.Destroy;
begin

  inherited;

  LinshiTimer.Enabled := False;
  LinshiTimer.Free;

  LinshiNewBuilt.Free;
end;

procedure THandleWaitings.Eventeverytime(sender: tObject);
begin
    if LinshiNewBuilt.Caption = 'Waiting...' then
      LinshiNewBuilt.Caption := 'Waiting'
    else
    if LinshiNewBuilt.Caption = 'Waiting' then
      LinshiNewBuilt.Caption := 'Waiting.'
    else
    if LinshiNewBuilt.Caption = 'Waiting.' then
      LinshiNewBuilt.Caption := 'Waiting..'
    else
    if LinshiNewBuilt.Caption = 'Waiting..' then
      LinshiNewBuilt.Caption := 'Waiting...';
end;

procedure THandleWaitings.finalWaiting;
begin
  if Assigned(LinshiTimer) then
  begin
    LinshiTimer.Enabled := False;
    LinshiTimer.Free;
  end;
  if Assigned(LinshiNewBuilt) then
    LinshiNewBuilt.Free;
  //self.Free;
end;

//{ TUseRestrict }
//procedure TUseRestrict.Execute;
//var
//  RealBeiJT, SavedBeiJT: TDateTime;
//  str_SavedBeiJT: string;
//  Saved_Version, Saved_MacAdd, Save_Debug, Save_ExpiredTime: string;
//  Self_MacAdd: string;
//  self_Datetime: Int64;
//  Linshi_str: string;
//  Linshi_Display: string;
//  b: PChar;
//  Linshi_now: TDateTime;
//  Linshi_now_str: string;
//  linshiStri: string;
//  GapEx: Extended;
//begin
////killWindowsCount, RestrictUseCount, ManageThreadCount: Integer;
//  RestrictUseCount := 1;
//  try
//    inherited;
//
//    while True do
//    begin
//      if Terminated then
//        Exit;
//
//
//      Linshi_now := getnow;
//      Linshi_now_str := FormatDateTime('YYYYMMDDHHMMSS', Linshi_now);
//
//
//      if Linshi_now_str = '29991212121212' then
//      begin
//        ShowMessageEX('���绷���쳣�������˳���');
//        SendMessage(AppMainHangle, WM_USER + 104, 0, 0);
//        Exit;
////        ExitProcess(0);
//      end;
//
//      TheRealTimeTime_Datetime := Linshi_now;
//        //TheRealTimeTime := FormatDateTime('YYYYMMDDHHMMSS', Linshi_now);
//        //Copy(self_Datetime, 1, 4) + '��' + Copy(self_Datetime, 5, 2) + '��' + Copy(self_Datetime, 7, 2) + '��' + Copy(self_Datetime, 9, 2) + 'ʱ' + Copy(self_Datetime, 11, 2) + '��' + Copy(self_Datetime, 13, 2) + '��';
//
//
//      if Terminated then
//        Exit;
//
//      EnterCriticalSection(CS);
//      linshiStri := QueryString(MemorySqliteTable_InUniConnection, 'select max(Createtime) from SeeLiangTieziList;');
//      LeaveCriticalSection(CS);
//      if linshiStri = '' then
//        SavedNewestCreateTimeInMemory := 0
//      else
//        SavedNewestCreateTimeInMemory := MyStringtoDateTime(linshiStri);
//
//      GapEx := (TheRealTimeTime_Datetime - SavedNewestCreateTimeInMemory);
//      if Abs(GapEx) < 0.003 then
//        if not AlreadyKeepSyn then
//          AlreadyKeepSyn := True;
//
//        //Linshi_str := 'ControlUse��' + IntToStr(RestrictUseCount) + '   ManageThread��' + IntToStr(ManageThreadCount) + '   ThreadPool��' + IntToStr(AATProxy.PBldThrdCount) + '   BusyThrdCount:  ' + IntToStr(AATProxy.PBusyThrdCount) + '   ActionCount:  ' + IntToStr(AATProxy.PActionCount) + '   Status:  ' + G_Status + '   CollectAllPostsStep:  ' + IntToStr(CollectAllPostsStep) + '   ThreadActionOperate:  ' + AATProxy.PThreadListActionStepEX + '   finalizeSqlitestep:  ' + IntToStr(finalizeSqlitestep);
//      Linshi_str := 'ControlUse��' + IntToStr(RestrictUseCount) + '   ManageThread��' + IntToStr(ManageThreadCount) + '   ThreadPool��' + IntToStr(AATProxy.PBldThrdCount) + '   BusyThrdCount:  ' + IntToStr(AATProxy.PBusyThrdCount) + '   ActionCount:  ' + IntToStr(AATProxy.PActionCount) + '   Status:  ' + G_Status + '   CollectAllPostsStep:  ' + IntToStr(CollectAllPostsStep) + '   finalizeSqlitestep:  ' + IntToStr(finalizeSqlitestep);
//      showme(Linshi_str);
//
//      Sleep(strtoint(GetNowInterval));
//
//    end;
//  finally
//    RestrictUseCount := 0;
//  end;
//end;
//
//procedure TUseRestrict.Init;
//var
//  Get_MacAddress, Get_errMSG: string;
//  Obeject: string;
//  base64: TBase64Encoding;
//  L_logintimeList, L_logintimeList_encrypt: TStringList;
//  self_Datetime: Int64;
//  Linshi_datetime: TDateTime;
//begin
//{
//   str_Version: string = '0'; //0���ð�
//  str_MacAdd: string = '';
//  str_debug: string = '0';
//  str_ExpiredTime: string = '';
//
//        base64 := TBase64Encoding.Create;
//      L_logintimeList := TStringList.Create;
//
//        base64: TBase64Encoding;
//  L_logintimeList: TStringList;
//
//
//    ReadExe_Boolean: Boolean;
//  ReadExe_ReadOut: string;
//}
//
//  if isFirstTime(Get_MacAddress, Get_errMSG) then
//  begin
//    base64 := TBase64Encoding.Create;
//    L_logintimeList := TStringList.Create;
//    try
//      L_logintimeList.Add('1');
//      L_logintimeList.Add(Get_MacAddress);
//      Obeject := L_logintimeList.Text;
//      Obeject := base64.Encode(Obeject);
//    finally
//      base64.Free;
//      L_logintimeList.Free;
//    end;
//
//    str_MacAdd := Get_MacAddress;
//
//    if str_Version = '0' then
//    begin
//      Linshi_datetime := getnow;
//      self_Datetime := StrToInt64(FormatDateTime('YYYYMMDDHHMMSS', Linshi_datetime));
//      if self_Datetime = 29991212121212 then
//      begin
//        ShowMessageEX('���绷���쳣�������˳���');
//        Halt;
//      end;
//
//      str_ExpiredTime := FormatDateTime('YYYYMMDDHHMMSS', IncDay(Linshi_datetime, 1));
//    end;
//
//    sldb_InUniConnection.ExecSQL('update SystemInfo set b_Debug=' + str_debug + ', LoginTimes=''' + Obeject + ''', Version=' + str_Version + ', MacAddress=''' + Get_MacAddress + ''', ExpiredTime=''' + str_ExpiredTime + '''');
//    WriteEXE(Get_MacAddress);     //LoginTimes
//  end
//  else
//  begin
//    if Get_MacAddress = '' then
//    begin
//      ShowMessageEX(Get_errMSG);
//      Halt;
//    end;
//    str_MacAdd := Get_MacAddress;
//
//    base64 := TBase64Encoding.Create;
//    L_logintimeList := TStringList.Create;
//    try
//      L_logintimeList.Add(IntToStr(strtoint64(Thelogintime) + 1));
//      L_logintimeList.Add(Get_MacAddress);
//      Obeject := base64.Encode(L_logintimeList.Text);
//    finally
//      base64.Free;
//      L_logintimeList.Free;
//    end;
//    if str_Version = '0' then
//      str_ExpiredTime := QueryString(sltb_InUniConnection, 'select ExpiredTime from SystemInfo');
//    sldb_InUniConnection.ExecSQL('update SystemInfo set LoginTimes=''' + Obeject + '''');
//  end;
//end;
//
//function TUseRestrict.isFirstTime(var str_MacAddress: string; var errMasg: string): Boolean;
//
//  function FixMacAdressFunction: string;
//  var
//    hashMd5str: string;
//    FixMacAddressLinshi: string;
//    DeCrptMacAddress: string;
//    DeCrptMacAddressAnsi: AnsiString;
//    DeCrptMacAddressPAnsi: PAnsiChar;
//  begin
//    Result := '';
//    if str_Version = '0' then
//    begin
//      Result := FixMacAdress;
//    end
//    else if str_Version = '1' then
//    begin
//      hashMd5str := THashMD5.GetHashString(FirstTimeRegisterInfo_ForOfficial);
//      FixMacAddressLinshi := Trim(QueryString(sltb_InUniConnection, 'SELECT FixMacAddress from SystemInfo'));
//      if FixMacAddressLinshi = '' then
//      begin
//        ShowMessageEX('FixMacAddress�ֶ�Ϊ��');
//        Halt;
//      end;
//
//      if Pos(hashMd5str, FixMacAddressLinshi) < 1 then
//      begin
//        ShowMessageEX('FixMacAddress�ֶ�ֵ����ȷ');
//        Halt;
//      end;
//
//      try
//        FixMacAddressLinshi := Copy(FixMacAddressLinshi, Length(hashMd5str) + 1, Length(FixMacAddressLinshi) - Length(hashMd5str));
//
////
////        DeCrptMacAddressAnsi := DecryptString(AnsiString(FixMacAddressLinshi), AnsiString(FirstTimeRegisterInfo_ForOfficial_AsAKey));
////        DeCrptMacAddressPAnsi := PAnsiChar(DeCrptMacAddressAnsi);
////        DeCrptMacAddress :=  DeCrptMacAddressPAnsi;
//
//        DeCrptMacAddress := (TFrmRegister.Create).UnEncryptString(FixMacAddressLinshi, FirstTimeRegisterInfo_ForOfficial_AsAKey);
//
//        if DeCrptMacAddress = '' then
//        begin
//          ShowMessageEX('FixMacAddress�ֶ�ֵ����ȷ');
//          Halt;
//        end;
//        DeCrptMacAddress := Copy(DeCrptMacAddress, 1, 2) + '-' + Copy(DeCrptMacAddress, 3, 2) + '-' + Copy(DeCrptMacAddress, 5, 2) + '-' + Copy(DeCrptMacAddress, 7, 2) + '-' + Copy(DeCrptMacAddress, 9, 2) + '-' + Copy(DeCrptMacAddress, 11, 2);
//        result := DeCrptMacAddress;
//      except
//        ShowMessageEX('FixMacAddress�ֶ�ֵ����ȷ');
//        Halt;
//      end;
//
//    end
//    else
//    begin
//      ShowMessageEX('�汾����');
//      Halt;
//    end;
//
//  end;
//
//var
//  str_EXEstring: string;
//  L_logintime, L_macaddr: string;
//  subMacA1, subMacA2, subMacA3: string;
//  base64: TBase64Encoding;
//  L_logintimeList: TStringList;
//begin
//{
//   ReadExe_Boolean: Boolean;
//  ReadExe_ReadOut: string;
//
//}
//  str_MacAddress := '';
//  Result := False;
//  errMasg := '';
//
//  try
//    QueryStringEX(sltb_InUniConnection, 'SELECT LoginTimes, MacAddress from SystemInfo', L_logintime, L_macaddr);
//    if L_logintime = THashMD5.GetHashString(FirstTimeRegisterInfo) then
//    begin
//      if not ReadExe_Boolean then
//      begin
//        if L_macaddr = '' then
//        begin
//          str_MacAddress := MacAddressEX;
//          if str_MacAddress = '' then
//            Halt;
//
//          FixMacAdress := FixMacAdressFunction;
//          if FixMacAdress <> '' then
//          begin
//            if str_MacAddress <> FixMacAdress then
//            begin
//              ShowMessageEX('����MAC��ַ' + str_MacAddress + '��' + FixMacAdress + '��ƥ��');
//              Halt;
//            end;
//          end;
//
//          Result := true;
//          Exit;
//        end
//        else
//        begin
//          errMasg := '��һ�ε�¼��ʱ��Ȼ�����˱����MacAddress�ֶ�����';
//          Exit;
//        end;
//      end
//      else
//      begin
//        errMasg := '��һ�ε�¼��ʱ��Ȼ������EXE��������';
//        Exit;
//      end;
//    end
//    else
//    begin
//      base64 := TBase64Encoding.Create;
//      L_logintimeList := TStringList.Create;
//      try
//        if Trim(L_logintime) = '' then
//        begin
//          errMasg := 'LoginTimes�ֶ���ֵ��';
//          Exit;
//        end;
//
//        L_logintimeList.Text := base64.Decode(L_logintime);
//        Thelogintime := L_logintimeList.Strings[0];
//        if StrToInt64Def(Thelogintime, 0) = 0 then
//        begin
//          errMasg := '�Ҳ����ڼ��ε�¼�������ˣ�';
//          Exit;
//        end;
//        subMacA1 := Trim(L_logintimeList.Strings[1]);
//
//        if not ReadExe_Boolean then
//        begin
//          errMasg := '��' + Thelogintime + '�ε�¼��ʱ��û�ж���EXE�������ݣ�';
//          Exit;
//        end
//        else
//        begin
//          subMacA2 := Trim(ReadExe_ReadOut);
//          if subMacA2 <> subMacA1 then
//          begin
//            errMasg := '��' + Thelogintime + '�ε�¼��ʱ��EXE�������ݺ����ݿ���ܱ����������ַ�Բ��ϣ�';
//            Exit;
//          end;
//        end;
//
//        if Trim(L_macaddr) <> subMacA2 then
//        begin
//          errMasg := '��' + Thelogintime + '�ε�¼��ʱ��EXE�������ݺ����ݿ�����������ַ�Բ��ϣ�';
//          Exit;
//        end;
//
//        str_MacAddress := subMacA2;
//      finally
//        L_logintimeList.Free;
//        base64.Free;
//      end;
//    end;
//
//    //THashMD5.GetHashString(FirstTimeRegisterInfo)
//  except
//    on E: Exception do
//    begin
//      str_MacAddress := '';
//      Result := False;
//      errMasg := E.Message;
//    end;
//  end;
//end;
//
//function MacAddressEX: string;
//
//  function MacAddress: string;
//  var
//    Lib: Cardinal;
//    Func: function(GUID: PGUID): Longint; stdcall;
//    GUID1, GUID2: TGUID;
//  begin
//    Result := '';
//
//    try
//      Lib := LoadLibrary('rpcrt4.dll');
//
//      if Lib <> 0 then
//      begin
//        if Win32Platform <> VER_PLATFORM_WIN32_NT then
//        begin
//          @Func := GetProcAddress(Lib, 'UuidCreate');
//        end
//        else
//        begin
//          @Func := GetProcAddress(Lib, 'UuidCreateSequential');
//        end;
//
//        if Assigned(Func) then
//        begin
//          if (Func(@GUID1) = 0) and (Func(@GUID2) = 0) and (GUID1.D4[2] = GUID2.D4[2]) and (GUID1.D4[3] = GUID2.D4[3]) and (GUID1.D4[4] = GUID2.D4[4]) and (GUID1.D4[5] = GUID2.D4[5]) and (GUID1.D4[6] = GUID2.D4[6]) and (GUID1.D4[7] = GUID2.D4[7]) then
//          begin
//            Result := IntToHex(GUID1.D4[2], 2) + '-' + IntToHex(GUID1.D4[3], 2) + '-' + IntToHex(GUID1.D4[4], 2) + '-' + IntToHex(GUID1.D4[5], 2) + '-' + IntToHex(GUID1.D4[6], 2) + '-' + IntToHex(GUID1.D4[7], 2);
//          end;
//        end;
//
//        FreeLibrary(Lib);
//      end;
//    except
//      Result := '';
//    end;
//  end;
//
//begin
//  result := GetMacAddress2('');
//  if result = '' then
//    result := MacAddress;
//end;
//
//function getnow(aUrl: WideString = 'http://www.sohu.com'): TDateTime;
//
//  function GetInternetTime: TDateTime;
//  var
//    XmlHttp: OleVariant;
//    datetxt: string;
//    DateLst: TStringList;
//    mon: string;
//    timeGMT, GetNetTime: TDateTime;
//    s: string;
//  begin
//    Result := EncodeDateTime(2999, 12, 12, 12, 12, 12, 12);
//    try
//      XmlHttp := CreateOleObject('Microsoft.XMLHTTP');
//      //XmlHttp.Open('GET', 'http://open.baidu.com/special/time/', False);
//      //http://time.tianqi.com/
//      XmlHttp.Open('GET', 'http://time.tianqi.com/', False);
//      XmlHttp.Send;
//
//      datetxt := XmlHttp.GetResponseHeader('Date');
//      datetxt := Copy(datetxt, Pos(',', datetxt) + 1, 100);
//      datetxt := StringReplace(datetxt, 'GMT', '', []);
//      datetxt := Trim(datetxt);
//      if datetxt = '' then
//        Exit;
//      DateLst := TStringList.Create;
//      while Pos(' ', datetxt) > 0 do
//      begin
//        DateLst.Add(Copy(datetxt, 1, Pos(' ', datetxt) - 1));
//        datetxt := Copy(datetxt, Pos(' ', datetxt) + 1, 100);
//      end;
//      DateLst.Add(datetxt);
//      if DateLst[1] = 'Jan' then
//        mon := '01'
//      else if DateLst[1] = 'Feb' then
//        mon := '02'
//      else if DateLst[1] = 'Mar' then
//        mon := '03'
//      else if DateLst[1] = 'Apr' then
//        mon := '04'
//      else if DateLst[1] = 'Mar' then
//        mon := '05'
//      else if DateLst[1] = 'Jun' then
//        mon := '06'
//      else if DateLst[1] = 'Jul' then
//        mon := '07'
//      else if DateLst[1] = 'Aug' then
//        mon := '08'
//      else if DateLst[1] = 'Sep' then
//        mon := '09'
//      else if DateLst[1] = 'Oct' then
//        mon := '10'
//      else if DateLst[1] = 'Nov' then
//        mon := '11'
//      else if DateLst[1] = 'Dec' then
//        mon := '12';
//      //s := DateLst[2] + '-' + mon + '-' + DateLst[0] + ' ' + DateLst[3];
//    //��׼ʱ��
//    //  ShowMessage(s);
//    // '/' or '-'
//      try
//        timeGMT := StrToDateTime(DateLst[2] + '-' + mon + '-' + DateLst[0] + ' ' + DateLst[3]);
//      except
//        timeGMT := StrToDateTime(DateLst[2] + '/' + mon + '/' + DateLst[0] + ' ' + DateLst[3]);
//      end;
//      //ת��ʱ��
//      GetNetTime := IncHour(timeGMT, 8);
//    //  ShowMessage(FormatDateTime('yyyy��mm��dd�� HH:NN:SS', GetNetTime));
//      FreeAndNil(DateLst);
//      Result := GetNetTime;
//      //Result:= FormatDateTime('yyyy��mm��dd�� HH:NN:SS', GetNetTime);
//    except
//      Result := EncodeDateTime(2999, 12, 12, 12, 12, 12, 12);
//    end;
//  end;
//
//var
//  A: TArray<string>;
//  GMT: string;
//begin
//  CoInitialize(nil);
//  try
//    Result := EncodeDateTime(2999, 12, 12, 12, 12, 12, 12);
//    try
//      with CoXMLHTTP.Create do
//      begin
//        open('Post', aUrl, False, EmptyParam, EmptyParam);
//        send(EmptyParam);
//        GMT := getResponseHeader('Date');
//      end;
//
//
//  //��������ʱ��(�ַ���)ת��������ʱ��
//  //function GMT2BjDateTime(const GMT: string): TDateTime;
//
//
//      A := GMT.Split([',', ' '], ExcludeEmpty); //XE4 ֧��
//
//      with TStringList.Create do
//      begin
//        CommaText := 'Jan=1,Feb=2,Mar=3,Apr=4,May=5,Jun=6,Jul=7,Aug=8,Sep=9,Oct=10,Nov=11,Dec=12';
//        A[2] := Values[A[2]];
//        Free;
//      end;
//
//      Result := StrToDateTime(Format('%s/%s/%s %s', [A[3], A[2], A[1], A[4]]), FormatSettings.Create(2052));
//      Result := Result + 8 / 24; //����ɱ���ʱ��
//    except
//    //Result := EncodeDateTime(2999, 12, 12, 12, 12, 12, 12);
//      Result := GetInternetTime;
//
//      if Result <> EncodeDateTime(2999, 12, 12, 12, 12, 12, 12) then
//        Exit;
//
//
////
////
////      Result := EncodeDateTime(2999, 12, 12, 12, 12, 12, 12);
//      try
//        with CoXMLHTTP.Create do
//        begin
//          open('Post', aUrl, False, EmptyParam, EmptyParam);
//          send(EmptyParam);
//          GMT := getResponseHeader('Date');
//        end;
//
//
//        A := GMT.Split([',', ' '], ExcludeEmpty); //XE4 ֧��
//
//        with TStringList.Create do
//        begin
//          CommaText := 'Jan=1,Feb=2,Mar=3,Apr=4,May=5,Jun=6,Jul=7,Aug=8,Sep=9,Oct=10,Nov=11,Dec=12';
//          A[2] := Values[A[2]];
//          Free;
//        end;
//
//        Result := StrToDateTime(Format('%s/%s/%s %s', [A[3], A[2], A[1], A[4]]), FormatSettings.Create(2052));
//        Result := Result + 8 / 24; //����ɱ���ʱ��
//      except
//        Result := GetInternetTime;
//      end;
//
//    end;
//  finally
//    CoUninitialize;
//  end;
//end;


//
//{ TCollectAllPosts }
//
//procedure TCollectAllPosts.Execute;
//var
//  i: Int64;
//  iniTableAct: TTableIniAction;
//  Linshi_Display: string;
//  b: PChar;
//  linshi_count, linshi_count1: string;
//  GetNewestCreateTimeInTable, GetNewestCreateTimeForOneTieZiID: string;
//begin
//  ManageThreadCount := 1;
//
//  try
//    inherited;
//    i := ini_PostID;
//
//    ModeStatus := 1;
//
//    CollectAllPostsStep := 0;
//    iniTableAct := TTableIniAction.create;
//    iniTableAct.Pub_TieziID := IntToStr(i);
//    iniTableAct.iKind := 0;
//
//    CollectAllPostsStep := 1;
//    AATProxy.AddAction(iniTableAct);
//
//    CollectAllPostsStep := 2;
//    while not SatisCondition(i) do
//    begin
//
//      if Terminated then
//        Break;
//
//      CollectAllPostsStep := 3;
//      while AATProxy.PActionCount > 0 do
//      begin
//        CollectAllPostsStep := -1;
//        Delay(StrToInt(ForwardFullActionInterval));                 //500
//        Application.ProcessMessages;
//      end;
//
//      CollectAllPostsStep := 4;
//      iniTableAct := TTableIniAction.create;
//      iniTableAct.Pub_TieziID := IntToStr(i);
//      iniTableAct.iKind := 0;
//
//      CollectAllPostsStep := 5;
//      AATProxy.AddAction(iniTableAct);
//
//      if Terminated then
//        Break;
//
//      CollectAllPostsStep := 6;
//      sleep(StrToInt(ForwardInterval));
//
//      if Terminated then
//        Break;                //��Ϣʱ��1000ms    30ms      20ms       10
//    end;
//
//    if not AlreadyKeepSyn then
//      Exit;
//
//    ModeStatus := 2;
//    CollectAllPostsStep := 7;
//    EnterCriticalSection(CS);
//    linshi_count := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList;');
//    LeaveCriticalSection(CS);
//
//    while true do
//    begin
//      if Terminated then
//        Break;
//      Sleep(5000);
//      if Terminated then
//        Break;
//
//      EnterCriticalSection(CS);
//      linshi_count1 := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList;');
//      LeaveCriticalSection(CS);
//
//      if linshi_count1 = linshi_count then
//        Break;
//
//      linshi_count := linshi_count1;
//    end;
//
//    ModeStatus := 3;
//    CollectAllPostsStep := 8;
//    EnterCriticalSection(CS);
//    MemorySqlite_InUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
//    MemorySqlite_InUniConnection.ExecSQL('delete from SeeLiangTieziList;');
//    LeaveCriticalSection(CS);
//
//    SavedNewestCreateTimeInMemory := 0;
//
//    CollectAllPostsStep := 9;
//    if Trim(SavedUpdateProgressTieZiID) = '0' then
//      i := StrToInt64(ManMadeOldestTieZiID)
//    else
//      i := StrToInt64(SavedUpdateProgressTieZiID) + 1;
//
//    ini_PostID := i;
//
//    ModeStatus := 4;
//    GetornotGet := 0;
//    CollectAllPostsStep := 10;
//    iniTableAct := TTableIniAction.create;
//    iniTableAct.Pub_TieziID := IntToStr(i);
//    iniTableAct.iKind := 1;
//    AATProxy.AddAction(iniTableAct);
//
//    CollectAllPostsStep := 11;
//    while True do
//    begin
//      i := i + 1;
//
//      if Terminated then
//        Break;
//
//      CollectAllPostsStep := 12;
//      while AATProxy.PActionCount > 0 do
//      begin
//        CollectAllPostsStep := -2;
//        Delay(StrToInt(ForwardFullActionInterval));                 //500
//        Application.ProcessMessages;
//      end;
//
//      CollectAllPostsStep := 13;
//      iniTableAct := TTableIniAction.create;
//      iniTableAct.Pub_TieziID := IntToStr(i);
//      iniTableAct.iKind := 1;
//
//      CollectAllPostsStep := 14;
//      AATProxy.AddAction(iniTableAct);
//
//      if Terminated then
//        Break;
//
//      CollectAllPostsStep := 15;
//      sleep(StrToInt(ForwardInterval));
//
//      if Terminated then
//        Break;                //��Ϣʱ��1000ms    30ms      20ms       10
//    end;
//
//  finally
//    ManageThreadCount := 0;
//  end;
//end;

//initialization
  //;

{\\
  G_Memory_Sqlite: TSQLiteDatabase;
  G_Memory_Sqlite_Table: TSQLIteTable;

}

//finalization
  //;

//function TCollectAllPosts.SatisCondition(var StartINd: Int64): Boolean;
//var
//  sSQL: string;
//  linshi_b_sixno: Boolean;
//  sSQL1: string;
//  sSQL2: string;
//  Linshi_64: Int64;
//  TatalC: Int64;
//
//  //Linshi_Memory_Sqlitetb: TUniQuery;
//
//  linshiteststring: string;
//  linshitestinteger: Integer;
//begin
//
//  if AlreadyKeepSyn then
//  begin
//    Result := True;
//    Exit;
//  end;
//
//  StartINd := StartINd + 1;
//  Result := False;

//  CollectAllPostsStep := 12;
//
//  try
//  //CollectAllPostsStep := 11;
//
//    {
//    sSQL1 := 'select count(1) from SeeLiangTieziList';
//
//    sSQL2 := 'select max(TieziID) from SeeLiangTieziList';
//
//    TatalC := StrToInt64Def(QueryString(MemorySqliteTable_InUniConnection, sSQL1), 0);
//    if TatalC > 70000 then
//    begin
//      Linshi_64 := StrToInt64(QueryString(MemorySqliteTable_InUniConnection, sSQL2)) - 2 * StrToInt64(isOfflineOrDelete_CheckRecordCount); // - 50;
//
//      ExectSqlInuni(MemorySqliteTable_InUniConnection, 'replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
//      ExectSqlInuni(MemorySqliteTable_InUniConnection, 'delete from SeeLiangTieziList where TieziID <=' + IntToStr(Linshi_64));
//
//    end;
//
//    }
//    //try
//    if StartINd <= ini_PostID then
//    begin
//      StartINd := StartINd + 1;
//      Exit;
//    end;
////
////
////    Linshi_Memory_Sqlitetb := TUniQuery.Create(nil);
////    Linshi_Memory_Sqlitetb.Connection := MemorySqlite_InUniConnection;
//
//    try
//      sSQL := 'select TieZiContent, TieziID from SeeLiangTieziList where ' //TieziID<=' + quotedstr(inttostr(StartINd))
//      + ' TieziID>=' + QuotedStr(IntToStr(ini_PostID));
//       //+ ' order by TieziID desc';// limit ' + isOfflineOrDelete_CheckRecordCount;
//
//      EnterCriticalSection(CS);
//      QuerySqlInuni(MemorySqliteTable_InUniConnection, sSQL);
//      //QuerySqlInuni(MemorySqliteTable_InUniConnection, sSQL);
//
//
//       linshitestinteger := MemorySqliteTable_InUniConnection.RecordCount ;
////      if MemorySqliteTable_InUniConnection.RecordCount < strtoint(isOfflineOrDelete_CheckRecordCount) then
////      begin
////        CollectAllPostsStep := 99;
////
//////               EnterCriticalSection(CS);
//////      linshiteststring := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList where ' //TieziID<=' + quotedstr(inttostr(StartINd))
//////      + ' TieziID>=' + QuotedStr(IntToStr(ini_PostID)));
//////
//////       LeaveCriticalSection(CS);
////      end;
////      LeaveCriticalSection(CS);
////
////      EnterCriticalSection(CS);
//      linshiteststring := QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SeeLiangTieziList where ' //TieziID<=' + quotedstr(inttostr(StartINd))
//      + ' TieziID>=' + QuotedStr(IntToStr(ini_PostID)));
//
//       LeaveCriticalSection(CS);
//
//
//      CollectAllPostsStep := 16;
//      if MemorySqliteTable_InUniConnection.RecordCount < strtoint(isOfflineOrDelete_CheckRecordCount) then
//      begin
//        CollectAllPostsStep := 17;
//        StartINd := StartINd + 1;
//        Exit;
//      end;
//       {
//      CollectAllPostsStep := 18;
//      Linshi_Memory_Sqlitetb.First;
//
//      CollectAllPostsStep := 19;
//      while not Linshi_Memory_Sqlitetb.EOF do
//      begin
//
//        CollectAllPostsStep := 20;
//        if Linshi_Memory_Sqlitetb.Fields[0].AsString <> '' then
//        begin
//          CollectAllPostsStep := 21;
//          StartINd := StartINd + 1;
//          Exit;
//        end;
//        CollectAllPostsStep := 22;
//        Linshi_Memory_Sqlitetb.Next;
//      end;
//
////    CollectAllPostsStep := 23;
////    linshi_b_sixno := True;
//
//      CollectAllPostsStep := 24;
//      Linshi_Memory_Sqlitetb.Last;
//
//      CollectAllPostsStep := 25;
//      StartINd := StrToInt64(Linshi_Memory_Sqlitetb.Fields[1].AsString);
//      }
//    finally
//
//
////      FinalQuerySqlInuni(Linshi_Memory_Sqlitetb);
////
////      Linshi_Memory_Sqlitetb.Connection := nil;
////      Linshi_Memory_Sqlitetb.Free;
//    end;
//
//  finally
//
//  end;
//
////  CollectAllPostsStep := 26;
////  sltb_InUniConnection.Free;
////  sltb1.Free;
////  sltb2.Free;


//end;


//
//{ TCollectAllPosts_BackAdd }
//
//procedure TCollectAllPosts_BackAdd.Execute;
//var
////  Linshi_max_tieziID: string;
//  i: Int64;
//  iniTableAct: TTableIniAction;
//  Linshi_Display: string;
//  b: PChar;
//  LInsh_str: string;
//  Linshi_Memory_Sqlitetb: TUniQuery;
//begin
//  //ManageThreadCount := 1;
//
//  try
//    inherited;
//
//
//    i := max_tieziID_int64;
//
//    while True do
//    begin
//      if Terminated then
//        Break;
//
//      //EnterCriticalSection(CS);
//      Linshi_Memory_Sqlitetb := TUniQuery.Create(nil);
//      Linshi_Memory_Sqlitetb.Connection := MemorySqlite_InUniConnection;
//      try
//        LInsh_str := QueryString(Linshi_Memory_Sqlitetb, 'select count(1) from [hr].SeeLiangTieziList where TieziID=' + QuotedStr(IntToStr(i)));
//      finally
//        Linshi_Memory_Sqlitetb.Connection := nil;
//        Linshi_Memory_Sqlitetb.Free;
//      end;
//      //LeaveCriticalSection(CS);
//      if LInsh_str <> '0' then
//      begin
//        i := i -1;
//        Continue;
//      end;
//
//
//
//        if Terminated then
//          Break;
//
//  //      CollectAllPostsStep := 27;
//  //      if Terminated then
//  //        Break;
//
//        while AATProxy.PActionCount > 0 do
//        begin
//          //CollectAllPostsStep := -1;
//          Delay(StrToInt(BackwardAddFullActionInterval));                 //500    100
//          Application.ProcessMessages;
//        end;
//
//        //CollectAllPostsStep := 28;
//        iniTableAct := TTableIniAction.create;
//
//        //CollectAllPostsStep := 29;
//        iniTableAct.Pub_TieziID := IntToStr(i);
//
//        //EnterCriticalSection(AddActionCriti);
//        AATProxy.AddAction(iniTableAct);
//        //LeaveCriticalSection(AddActionCriti);
//
//        //CollectAllPostsStep := 31;
//        if Terminated then
//          Break;
//
//        //CollectAllPostsStep := 32;
//        sleep(StrToInt(BackwardAddInterval));
//
//        //CollectAllPostsStep := 33;
//        if Terminated then
//          Break;                //��Ϣʱ��1000ms    30ms      20ms       10
//
//        i := i - 1;
//    end;
//
//
//  finally
//    //CollectAllPostsStep := 34;
//    //ManageThreadCount := 0;
//  end;
//end;
//
//
//{ TCollectAllPosts_BackModify }
//
//procedure TCollectAllPosts_BackModify.Execute;
//var
////  Linshi_max_tieziID: string;
//  i: Int64;
//  iniTableAct: TTableIniAction;
//  Linshi_Display: string;
//  b: PChar;
//  Linsh_str: string;
//  Linshi_Memory_Sqlitetb: TUniQuery;
//begin
//  //ManageThreadCount := 1;
//
//  try
//    inherited;
//
//
//    i := max_tieziID_int64;
//
//    while True do
//    begin
//      if Terminated then
//        Break;
//
//      Linshi_Memory_Sqlitetb := TUniQuery.Create(nil);
//      Linshi_Memory_Sqlitetb.Connection := MemorySqlite_InUniConnection;
//      try
//        Linsh_str := QueryString(Linshi_Memory_Sqlitetb, 'select count(1) from [hr].SeeLiangTieziList where TieziID=' + QuotedStr(IntToStr(i)));
//
//        //LeaveCriticalSection(CS);
//
//        if Linsh_str = '0'  then
//        begin
//          i := i - 1;
//          Continue;
//        end;
//        //EnterCriticalSection(CS);
//        Linsh_str := QueryString(Linshi_Memory_Sqlitetb, 'select LastUpdateTime from [hr].SeeLiangTieziList where TieziID=' + QuotedStr(IntToStr(i)));
//        //LeaveCriticalSection(CS);
//      finally
//        Linshi_Memory_Sqlitetb.Connection := nil;
//        Linshi_Memory_Sqlitetb.Free;
//      end;
//
//      if (TheRealTimeTime_Datetime - MyStringtoDateTime(Linsh_str)) < 7 then
//      begin
//        i := i - 1;
//        Continue;
//      end;
//
//
////      while QueryString(MemorySqliteTable_InUniConnection, 'select count(1) from [hr].SeeLiangTieziList where TieziID=' + QuotedStr(IntToStr(i))) = '0' do
////      begin
////        CollectAllPostsStep := 9;
////        if Terminated then
////          Break;
////
////  //      CollectAllPostsStep := 27;
////  //      if Terminated then
////  //        Break;
//
//        while AATProxy.PActionCount > 0 do
//        begin
//          //CollectAllPostsStep := -1;
//          Delay(StrToInt(BackwardModifyFullActionInterval));                 //500    100
//          Application.ProcessMessages;
//        end;
//
//        //CollectAllPostsStep := 28;
//        iniTableAct := TTableIniAction.create;
//
//        //CollectAllPostsStep := 29;
//        iniTableAct.Pub_TieziID := IntToStr(i);
//
//        //CollectAllPostsStep := 30;
//        //EnterCriticalSection(AddActionCriti);
//        AATProxy.AddAction(iniTableAct);
//        //LeaveCriticalSection(AddActionCriti);
//
//        //CollectAllPostsStep := 31;
//        if Terminated then
//          Break;
//
//        //CollectAllPostsStep := 32;
//        sleep(StrToInt(BackwardModifyInterval));
//
//        //CollectAllPostsStep := 33;
//        if Terminated then
//          Break;                //��Ϣʱ��1000ms    30ms      20ms       10
//
//
//        i := i - 1;
//    end;
//
//
//  finally
//    CollectAllPostsStep := 34;
//    //ManageThreadCount := 0;
//  end;
//end;

end.
