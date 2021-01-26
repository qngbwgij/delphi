unit UPublic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  system.Hash, System.NetEncoding, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.AppEvnts, Vcl.OleCtrls, SHDocVw, Vcl.Samples.Spin, System.Actions,
  Vcl.ActnList, RzEdit, MSHTML, Winapi.ActiveX, Vcl.Clipbrd, SQLiteTable3, Data.DB,
  Data.Win.ADODB, IdFTP, System.Win.ComObj, PsAPI, StrUtils, ScktComp, WinInet,
  Nb30, UrlMon, ShellApi, Registry, System.RegularExpressions, System.DateUtils,
  Winapi.WinSock, Winapi.msxml, IdHTTP, ExeStr, UGetMacAddress, UEncrpt,
  uThrdPoolClass, UPublicEX, Uni, UinstanceHua, UGlobalPublic_Function,
  IdSSLOpenSSL;

type
  Core_Content_type = (cctRandomOne, cctQuenceOne, cctFixTime, cctOther, cctFixOne);

//type
//  TUseRestrict = class(TThread)
//  private
//    { Private declarations }
//    remotetimes: Integer;
//    function isFirstTime(var str_MacAddress: string; var varExpireDateForOfficialVersion: string; var errMasg: string): Boolean;
//  protected
//    procedure Execute; override; {执行}
//  public
//    procedure Init;
//  end;


type
  TGetFullfilledMemoryTable = class(TBusiaction)
  public
    UniConnectionWenJianMing: TUniConnection;
    UniQueryWenJianMing: TUniQuery;

    iSerialNo: Integer;
    WenJianMingPath: string;
    WenJianMing: string;


    Ba_PlanScheme_BarName: string;
    Ba_PlanScheme_Topic: string;
    Ba_PlanScheme_Content: string;
    Ba_PlanScheme_TopicContent: string;
    Ba_Control2FloorVacancy: string;
    Ba_LastHowManyDays: string;
    Ba_ReplyCountBegin: string;
    Ba_ReplyCountEnd: string;
    Ba_FollowPopulationBegin: string;
    Ba_FollowPopulationEnd: string;
    Ba_TieBaPostTotalBegin: string;
    Ba_TieBaPostTotalEnd: string;
    Ba_dingtie_type: string;
    Ba_dingtie_content: string;

    Ba_add, Ba_substract: string;
    procedure Operate; override;
    procedure ImportRelatedTieziIDToMemoryTable;
  end;


  TGetAddedPostToTempTable = class(TBusiaction)
  public
    UniConnectionWenJianMing: TUniConnection;
    UniQueryWenJianMing: TUniQuery;

    iSerialNo: Integer;
    WenJianMingPath: string;
    WenJianMing: string;
//
//
//    Ba_PlanScheme_BarName: string;
//    Ba_PlanScheme_Topic: string;
//    Ba_PlanScheme_Content: string;
//    Ba_PlanScheme_TopicContent: string;
//    Ba_Control2FloorVacancy: string;
//    Ba_LastHowManyDays: string;
//    Ba_ReplyCountBegin: string;
//    Ba_ReplyCountEnd: string;
//    Ba_FollowPopulationBegin: string;
//    Ba_FollowPopulationEnd: string;
//    Ba_TieBaPostTotalBegin: string;
//    Ba_TieBaPostTotalEnd: string;
//    Ba_dingtie_type: string;
//    Ba_dingtie_content: string;
//
//    Ba_add, Ba_substract: string;
    //Ba_add: string;
    procedure Operate; override;
    procedure ImportRelatedTieziIDToMemoryTable;
  end;

  TCarryKeySearchedPostToTempTable = class(TBusiaction)
  public
    UniConnectionWenJianMing: TUniConnection;
    UniQueryWenJianMing: TUniQuery;
    deleteorno: Boolean;
    //iSerialNo: Integer;
    WenJianMingPath: string;
    WenJianMing: string;

    Ba_FollowPopulationBegin: string;
    Ba_FollowPopulationEnd: string;
    Ba_TieBaPostTotalBegin: string;
    Ba_TieBaPostTotalEnd: string;

    //Ba_add: string;
    procedure Operate; override;
    procedure ImportRelatedTieziIDToTempFile;
  end;

  TTransFerFromTempFileToMemoryTable = class(TBusiaction)
  public
//    Ba_PlanScheme_BarName: string;
//    Ba_PlanScheme_Topic: string;
//    Ba_PlanScheme_Content: string;
//    Ba_PlanScheme_TopicContent: string;
//    Ba_Control2FloorVacancy: string;
//    Ba_LastHowManyDays: string;
//    Ba_ReplyCountBegin: string;
//    Ba_ReplyCountEnd: string;
//    Ba_FollowPopulationBegin: string;
//    Ba_FollowPopulationEnd: string;
//    Ba_TieBaPostTotalBegin: string;
//    Ba_TieBaPostTotalEnd: string;
//    Ba_dingtie_type: string;
//    Ba_dingtie_content: string;
//
//    Ba_add, Ba_substract: string;
      Ba_TieziID: string;
    procedure Operate; override;
    //procedure ImportRelatedTieziIDToMemoryTable;
  end;

  TSaveSearchedofTieziOnline = class(TBusiaction)
  public
    ThreadCForOnlineSearch: Integer;
    HowManyPage: Integer;
    KeyWords: string;
    WebNames: string;
    MulThreadornot: Boolean;
    //SavedPath: string;

    UniConnectionWenJianMing: TUniConnection;
    UniQueryWenJianMing: TUniQuery;

    iSerialNo: Integer;
    WenJianMingPath: string;
    WenJianMing: string;


    Ba_PlanScheme_BarName: string;
    Ba_PlanScheme_Topic: string;
    Ba_PlanScheme_Content: string;
    Ba_PlanScheme_TopicContent: string;
    Ba_Control2FloorVacancy: string;
    Ba_LastHowManyDays: string;
    Ba_ReplyCountBegin: string;
    Ba_ReplyCountEnd: string;
    Ba_FollowPopulationBegin: string;
    Ba_FollowPopulationEnd: string;
    Ba_TieBaPostTotalBegin: string;
    Ba_TieBaPostTotalEnd: string;
    Ba_dingtie_type: string;
    Ba_dingtie_content: string;

    Ba_add, Ba_substract: string;
    procedure Operate; override;
    procedure ImportRelatedTieziIDToMemoryTable;
  end;

  TSingleSaveSearchedofTieziOnline = class(TBusiaction)
  public
    WhichPage: Integer;
    KeyWord: string;
    BaName: string;
    ii: Integer;
    //MulThreadornot: Boolean;
    //SavedPath: string;

    UniConnectionWenJianMing: TUniConnection;
    UniQueryWenJianMing: TUniQuery;

    iSerialNo: Integer;
    WenJianMingPath: string;
    WenJianMing: string;


    Ba_PlanScheme_BarName: string;
    Ba_PlanScheme_Topic: string;
    Ba_PlanScheme_Content: string;
    Ba_PlanScheme_TopicContent: string;
    Ba_Control2FloorVacancy: string;
    Ba_LastHowManyDays: string;
    Ba_ReplyCountBegin: string;
    Ba_ReplyCountEnd: string;
    Ba_FollowPopulationBegin: string;
    Ba_FollowPopulationEnd: string;
    Ba_TieBaPostTotalBegin: string;
    Ba_TieBaPostTotalEnd: string;
    Ba_dingtie_type: string;
    Ba_dingtie_content: string;

    Ba_add, Ba_substract: string;
    procedure Operate; override;
    procedure ImportRelatedTieziIDToMemoryTable;
  end;


  TSplitDBFromSource = class(TBusiaction)
  public
    SplitDirectory: string;
    SourceDBaseDire: string;
    procedure Operate; override;
  end;


type
  TBasicParamConf = record
   WaitingTimeBeforeLoad: Integer;
   BGModeSubReplyTimeaScrol: Integer;
//ModeChoose, OpenBrowserModeOrnot, ControlCirculationKind, CirculationMaxNumber
   //ModeChoose: Integer;
   OpenBrowserModeOrnot: Integer;
   ControlCirculationKind: Integer;
   CirculationMaxNumber: string;

//  x_wo: Integer;
//  y_wo: Integer;
//  x_wo_sub: Integer;
//  y_wo_sub: Integer;
//  x_hui: Integer;
//  y_hui: Integer;
//  x_hui_sub: Integer;
//  y_hui_sub: Integer;
//
//  x_wo_inputbox: Integer;
//  y_wo_inputbox: Integer;
//  x_hui_inputbox: Integer;
//  y_hui_inputbox: Integer;
//  x_inputbox: Integer;
//  y_inputbox: Integer;








  OnePostOneAccount: Integer;
  CheckLoginedAcc: Integer;

//  x_inputbox_sub: Integer;
//  y_inputbox_sub: Integer;

//  set_inputbox: Integer;
//  set_inputbox_sub: Integer;


  setwo: Integer;
  setwo_inputbox: Integer;
  setwo_sub: Integer;


//  sethui: Integer;
//  sethui_inputbox: Integer;
//  sethui_sub: Integer;

  ShutDownorNot: Integer;
  SamePlanorNot: Integer;
  PostCountPerPlan: Integer;
  //StartPostId: string;

  DownloadorNot: Integer;
  DownloadMode: Integer;
  Totalthread: Integer;

  end;


type
  TPlanSchemeConfig = record
  Temp_PlanScheme_BarName: string;
  Temp_PlanScheme_Topic: string;
  Temp_PlanScheme_Content: string;
  Temp_PlanScheme_TopicContent: string;
  Temp_Control2FloorVacancy: string;
  Temp_LastHowManyDays: string;
  Temp_ReplyCountBegin: string;
  Temp_ReplyCountEnd: string;
  Temp_FollowPopulationBegin: string;
  Temp_FollowPopulationEnd: string;
  Temp_TieBaPostTotalBegin: string;
  Temp_TieBaPostTotalEnd: string;
  Temp_dingtie_type: string;
  Temp_dingtie_content: string;
  Temp_usedAcc: string;
  SpinEditStartPostIdText: string;
  Temp_onlyForMainFloor: string;
  Temp_PlanScheme_DownloadorOffline: string;
  Temp_PlanScheme_TotalThreadForDownloadMode: string;
  TempPlanScheme_index: string;
  TempPlanScheme_PlanName: string;
  Temp_add: string;
  Temp_substract: string;
  end;


var

  Glosbstr: string;
  sldb1: TSQLiteDatabase;
  SaveTempFileOrNot: Boolean = True;
  SuccCo, FailCo: Integer;
  LinshiMemoryTableUniConnection: TUniConnection;


  StopInAdvance: Boolean = False;   //同方案不同登录账号下，在某个方案下，是否提前结束贴子ID循环
  SetIdHttpType_IPProxy_count: Integer = 0;
  Restart_Flag: Boolean = False;
  SpeedButtonRestartorNot: Boolean = False;

  PlanindexForRestart: string;
  GetAllAccForSequenceTimesForRestart: string;
  i_CirculationsForRestart: string;
  Pri_TieziIDForRestart: string;
  Action1_TagForRestart, Action1_TagForRestart1: string;


  UsedOrNot_PlanindexForRestart: Boolean = False;

  UsedOrNot_Pri_TieziIDForRestart: Boolean = False;

  UsedOrNot_Action1_TagForRestart: Boolean = False;
  UsedOrNot_Action1_TagForRestart1: Boolean = False;
  UsedOrNot_GetAllAccForSequenceTimes: Boolean = False;

  UsedOrNot_i_CirculationsForRestart: Boolean = False;
  //StartMethod: Integer=0;//0手工启动 1程序启动

  MaxCreatetimeList: array of TDateTime;
  FullFilledRecordCountsList: array of Integer;
  NewestDateTimeInDB: TDateTime;


  SearchOfRecordsCount: string;
  CurWhichRecord: Integer;
  SucRecordCount: Integer;
  UsuccessOrnot: Boolean;
  PauseOrNot: Boolean = False;

  BasicParamConf: TBasicParamConf;
  b_isRuning: Boolean = False;
  killWindowsCount, ManageThreadCount: Integer;
  G_Status: string;
  CollectAllPostsStep: Integer = 0;
  //ShouldFilteredWindowCaptionList: TStringList;
  ChoosedContentType: Core_Content_type;
  ListForRandomize: TStringList;
  //ListForQuence: TStringList;
  //TieziListPerTask: TStringList;
  //ListForFixTime: TStringList;
  FixOne: string;
  i_tiezi_index: Integer;
  i_PlanScheme_index: Integer;
  TieZi_MaxCount: Integer = 400;
  PlanScheme_MaxCount: Integer = 400;
  Re_Start: Boolean;


//  Thelogintime: string; //第几次使用

//  ReadExe_Boolean: Boolean;
//  ReadExe_ReadOut: string;
//  GetContactWay: string;

  //str_ExpiredTime: string = '';//'20201116235959'; //试用版的时候，会另外算出

  RzStatusPane1Caption: string;



  InsertIntoTempFIle: TRTLCriticalSection;
  SaveOnlinesearchedDB: TRTLCriticalSection;

//  RestrictHttp: TRTLCriticalSection;
//  KeepDiaryLogSyn: TRTLCriticalSection;

  initializationcount: Integer = 0;
  finalizationcount: Integer = 0;
  //AATProxy: TInstActionProxy;
  CollectAllPostsFlag: Boolean = True;



  TemptDirectory, TemptDirectory1, TemptDirectory2: string;

  ProxyIPlist: TStringList;
  RealPlanNameList: TStringList;
  //ProxyIPlist: TStringList;
  //SetIdHttpType_IPProxy_count: Integer;


  GlobalClose: Boolean = False;

  //CookieForReplyinMainFieldList: TStringList;
  LinshiCOoke_BYJS: string;
  RzComboBoxCookieSourceIntem: Integer = 2;

  GetCoreContentForSequenceTimes: Integer;
  GetAllAccForSequenceTimes: Integer;

  breaktrue: Boolean;




  hasbawo_set_hui: Boolean = False;
  hasbawo_set_hui_input: Boolean = False;
  hasbawo_set_hui_sub: Boolean = False;

  hasbawo_set_wo: Boolean = False;
  hasbawo_set_wo_input: Boolean = False;
  hasbawo_set_wo_sub: Boolean = False;


  hasbawo_set_input: Boolean = False;
  hasbawo_set_sub: Boolean = False;

  SplitUsernamePass: string = '@';

const

  relativePasth: string = 'DbSource\';       //核心搜索源数据库所在目录
  relativePasth1: string = 'tempDb\';
  //PostRecord
  relativePasth2: string = 'PostRecord\';

  DbName2: string = 'PostRecord.db';//'KS.db3';



  //ConfirmRemoteCloseService_MyInfo1: string = '请联系微信号15557131067';     //这个联系方式不改
//  ConfirmRemoteCloseService_MyInfo1: string = '请关注微信公众号：花苍比，获取最新版本下载链接';     //这个联系方式不改

  //ConstPayWay: string = '(收款支付宝账号同微信号均为：15557131067)';
  //ConstPayWay: string = '    ◆◆关注公众号：花苍比，将定期公布最新版本下载链接◆◆';

//  str_Version: string = '1'; //0试用版，1正式版
//
//  str_debug: string = '0';
//
//  FirstTimeRegisterInfo: string = '0000000001'; //试用版均用0000000001，正式版从0000000002开始一一对应，并记录
//  FixMacAdress: string = '98-3B-8F-E9-19-39';
//  //FixMacAdress: string = '';



//  str_Version: string = '0'; //0试用版
//  str_debug: string = '0';
//  FirstTimeRegisterInfo: string = '0000000001';
  //FixMacAdress: string = '98-3B-8F-E9-19-39';
  //FixMacAdress: string = '4C-34-88-C4-2F-CA';
  //FixMacAdress: string = '56-A6-03-19-2D-44';
  //FixMacAdress: string = '00-0C-29-25-AE-0F';
  //FixMacAdress: string = '00-0C-29-9A-EF-BF';
  //FixMacAdress: string = '00-0C-29-D4-95-BF';
//  FixMacAdress: string = '';




//  Url_CloseService_Active: string    //正式版的时候用，一个实体对应一个
//  //= 'https://pan.baidu.com/s/1LVhrDSjlerIUjCMWaopVYg';
//  = '';
//
//  subString_For_closeservice: string
//  = '分享的文件已经被取消了';
//
//  Url_CloseService_Active_ControlAllTrialVersion: string
//  = 'https://pan.baidu.com/s/1LVhrDSjlerIUjCMWaopVYg';
//  //= '';

  Basic_PostLink: string = 'http://tieba.baidu.com/p/';

  strfileName_PlanList: string = 'Save\方案计划列表.txt';
  HttpProxytxt: string = 'Save\HttpProxy.txt';


  PropagandaSentence: string = '__yi_shang_xin_xi_lai_zi_zi_dong_hui_tie_ruan_jian，guan_zhu_wei_xin_gong_zhong_hao_花苍比_ji_ke_mian_fei_huo_qu';
  //PropagandaSentenceHttpAddress: string = 'http://tiebapic.baidu.com/forum/pic/item/86d6277f9e2f0708c7b50d7efe24b899a901f218.jpg';
  PropagandaSentenceHttpAddress: string = 'https://wx1.sinaimg.cn/mw690/40e64182gy1gc3tx50v9qj20cd0c9q5m.jpg';



//procedure LoadProxyIplist;  //ProxyIPlist

//function TranslateIntoHighVague(LSourceStr: string): string;
//
//function AlreadyloginCounts: string;

//procedure CloseP;

//procedure Delay(dwMilliseconds: DWORD);//Longint
function QueryStringForPostRecord(sSQL: string): string;

procedure DelayEx(dwMilliseconds: DWORD);//Longint
procedure DelayExEx(dwMilliseconds: DWORD);//Longint

//procedure initializeSqlite;
//
//procedure finalizeSqlite;

//function ReadEXE(var Readout: string): Boolean;
//
//procedure WriteEXE(Writeinto: string);

//function QueryString(sSQL: string): string;
//
//function QueryStringEX(sSQL: string; var A: string; var B: string): Boolean;
//
//function QueryStringEXEX(sSQL: string; var A: string; var B: string; var C: string): Boolean;
//
//function QueryStringEXEXEX(sSQL: string; var A: string; var B: string; var C: string; var D: string): Boolean;
//
//function QueryStringEXEXEXEX(sSQL: string; var A: string; var B: string; var C: string; var D: string; var E: string): Boolean;

//function UpdateSQLs(strSQL: string): Boolean;

//function ConfirmRemoteCloseService(iKind: Integer = 0): Boolean;

//procedure showme(a: string);

//function GetCritiTable(ssqlStrings: string): TSQLIteTable;

function GetMaxValueFromArray(A: array of TDateTime): TDateTime;

function GetSumValueFromArray(A: array of Integer): Integer;

implementation

{ TMyThread }

//procedure showme(a: string);
//var
//  Linshi_Display: string;
//  b: PChar;
//  sysDir: string;
//  logfile: string;
//  mylog: TextFile;
//  inputtext: WideString;
//  sltbs: TSQLiteTable;
//begin
//  Linshi_Display := a + #13#10;
//
//  sltbs := GetCritiTable('select * from TieziList');
//  Linshi_Display := Linshi_Display + '磁盘表TieziList总共：' + IntToStr(sltbs.RowCount) + '条记录';
//  sltbs.Free;
//
//  Linshi_Display := FormatDateTime('MM-DD hh:mm:ss', now) + #13#10 + Linshi_Display;
//
//
//  sysDir := extractfilepath(application.ExeName);
//  logfile := formatdatetime('yyyyy-mm-dd', now) + '日志.log'; // 在字符串前加上日期
//  //    if not directoryexists(sysdir) then
//  //      createdir(sysdir);
//
//
//  //EnterCriticalSection(KeepDiaryLogSyn);
//  AssignFile(mylog, logfile);
//  if fileexists(sysDir + logfile) then
//    append(mylog)
//  else
//    rewrite(mylog);
//  Writeln(mylog, Linshi_Display);                 //写日志里
//  CloseFile(mylog);                               //关闭文件流
//  //LeaveCriticalSection(KeepDiaryLogSyn);
//end;

//function GetCritiTable(ssqlStrings: string): TSQLIteTable;
//begin
//  EnterCriticalSection(CS);
//  Result := sldb.GetTable(ssqlStrings);
//  LeaveCriticalSection(CS);
//end;


function GetMaxValueFromArray(A: array of TDateTime): TDateTime;
var
  X: Integer;
  tmpMax: TDateTime;
begin
  tmpMax := A[0];
  for X := low(A) to High(A) do
  begin
    if A[X] > tmpMax then tmpMax := A[X];
  end;
  Result := tmpMax;
end;

function GetSumValueFromArray(A: array of Integer): Integer;
var
  X: Integer;
  tmpSumValue: Integer;
begin
  tmpSumValue := 0;
  for X := low(A) to High(A) do
  begin
    tmpSumValue := A[X] + tmpSumValue;
  end;
  Result := tmpSumValue;
end;

//procedure LoadProxyIplist;  //ProxyIPlist
//var
//  F: TextFile;
//  i: integer;
//  fileStr: string;
//  ProxyIPlistFileP: string;
//  OneValues: string;
//
//  Pri_IP, Pri_Port: string;
//begin
//  ProxyIPlistFileP := APPCommonPath + '代理IP列表.txt';
//  if FileExists(ProxyIPlistFileP) then
//  begin
//    AssignFile(F, ProxyIPlistFileP); //把一个外部文件名和一个文件变量相关联
//    try
//
//      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
//      while not Eof(F) do
//      begin
//        ReadLn(F, fileStr); //从文本文件中读取信息
//
//          OneValues := Trim(fileStr);
//
//          if OneValues = '' then
//            Continue;
//
//          if not TRegEx.Match(OneValues, '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}').Success then
//            Continue;
//
//          Pri_IP := TRegEx.Match(OneValues, '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}').Value;
//
//          OneValues := Copy(OneValues, Pos(Pri_IP, OneValues) + Length(Pri_IP), Length(OneValues) - Pos(Pri_IP, OneValues) - Length(Pri_IP) + 1);
//
//          if not TRegEx.Match(OneValues, '\d{2,5}').Success then
//            Continue;
//
//          Pri_Port := TRegEx.Match(OneValues, '\d{2,5}').Value;
//
//          ProxyIPlist.Add(Pri_IP + '=' + Pri_Port);
//      end;
//
//    finally
//      CloseFile(F); //关闭文件
//    end;
//
//    SetIdHttpType_IPProxy_count := ProxyIPlist.Count;
//  end;   //strfileName_displayWindowList
//end;



//function TranslateIntoHighVague(LSourceStr: string): string;
//var
//  I: Integer;
//  LSstr: string;
//  LSLSourceStr: string;
//begin
//  LSstr := '%';
//  LSLSourceStr := LSourceStr;
//  for I := 1 to Length(LSLSourceStr) do
//  begin
//    LSstr := LSstr + LSLSourceStr[I] + '%';
//  end;
//  Result := LSstr;
//end;

//function AlreadyloginCounts: string;
//begin
//  if Thelogintime = '' then
//    Result := '0'
//  else
//    Result := Thelogintime;
//end;

//procedure CloseP;
//begin
//  if GlobalClose then
//  begin
//    GlobalClose := False;
//    Abort;
//  end;
//end;

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
function QueryStringForPostRecord(sSQL: string): string;
var
  sltb: TSQLIteTable;
begin
  //EnterCriticalSection(CS);
  sltb := sldb1.GetTable(sSQL);
  try
    if sltb.Count <= 0 then
      raise Exception.Create('查询SQL语句未查出结果：' + #13#10 + sSQL);

    Result := sltb.FieldAsString(0);
  finally
    sltb.Free;
  end;
  //LeaveCriticalSection(CS);
end;

procedure DelayEx(dwMilliseconds: DWORD);//Longint
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Application.ProcessMessages;

    if GlobalClose then
    begin
      GlobalClose := False;
      Abort;
    end;
  until (iStop - iStart) >= dwMilliseconds;
end;

procedure DelayExEx(dwMilliseconds: DWORD);//Longint
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Application.ProcessMessages;

    if GlobalClose then
    begin
      //GlobalClose := False;
      Abort;
    end;
  until (iStop - iStart) >= dwMilliseconds;
end;




//
//procedure initializeSqlite;
//var
//  slDBpath: string;
//  sltb: TSQLIteTable;
//  sSQL: string;
//begin
//
//  //ListForRandomize := TStringList.Create;
//  //ListForQuence := TStringList.Create;
//  //ListForFixTime := TStringList.Create;
//  //TieziListPerTask := TStringList.Create;
//
//
////    slDBpath := ExtractFilepath(application.exename) + DbName1;
////    sldb := TSQLiteDatabase.Create(slDBpath);
//
////
////      InitializeCriticalSection(CS);    //   FirstTimeRegisterInfo
////      //InsertIntoTempFIle: TRTLCriticalSection;
////      InitializeCriticalSection(InsertIntoTempFIle);
//
//
//
//
//
////      try
////        slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
////        sldbDugInfo := TSQLiteDatabase.Create(slDBpath);
////
////
////
////        if not sldbDugInfo.TableExists('SeeLiangTieziList') then
////          raise Exception.Create('Error Message');
////
////
////
////      except
////        Halt;
////      end;
//
//
//      //GetContactWay := QueryString('select ContactWay from SystemInfo');
////      QueryStringEX('select ContactWay, FirstTimeRegisterInfo from SystemInfo', GetContactWay, FirstTimeRegisterInfo);
////
////      ShowMessageMyTaobao_MyInfo1 := ShowMessageMyTaobao_MyInfo1 + GetContactWay;
////      PemanantShow := PemanantShow + GetContactWay; //'微信号wujiannotliar';
//
//
////      InitializeCriticalSection(RestrictHttp);
////      InitializeCriticalSection(KeepDiaryLogSyn);
//
//      //AATProxy := TInstActionProxy.create;
//      //ShouldFilteredWindowCaptionList := TStringList.Create;
////      RealPlanNameList := TStringList.Create;
////      ProxyIPlist := TStringList.Create;
//      //ProxyIPlist := TStringList.Create;
//      //CookieForReplyinMainFieldList := TStringList.Create;
//
//      //LoadProxyIplist
//
//end;
//
//procedure finalizeSqlite;
//var
//  i: Integer;
//begin
//  //AATProxy.Free;
////  sldb.Free;
////  //sldbDugInfo.Free;
////  DeleteCriticalSection(CS);
////
////  DeleteCriticalSection(InsertIntoTempFIle);
//////  DeleteCriticalSection(RestrictHttp);
//////  DeleteCriticalSection(KeepDiaryLogSyn);
////
////  //ListForRandomize.Free;
////  //ListForQuence.Free;
////  //TieziListPerTask.Free;
////  //ShouldFilteredWindowCaptionList.Free;
////  RealPlanNameList.Free;
////  ProxyIPlist.Free;
//
//  //ProxyIPlist.Free;
//  //CookieForReplyinMainFieldList.Free;
//
////  for i := ListForFixTime.Count - 1 downto 0 do
////  begin
////    if Assigned(ListForFixTime.Objects[i]) then
////      ListForFixTime.Objects[i].Free;
////    ListForFixTime.Delete(i);
////  end;
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
//end;
//
//procedure WriteEXE(Writeinto: string);
//var
//  s: TExeStream;
//  a: Char;
//  j: Integer;
//  SaveDFileName: string;
//begin
//  //wow_helper.exe
//  //SaveDFileName := ExtractFilePath(Application.ExeName) + 'copyDingTie.exe';
//  SaveDFileName := ExtractFilePath(Application.ExeName) + 'wow_helper.exe';
//  //CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'DingTie.exe'), PChar(SaveDFileName), False);
//
//  s := TExeStream.Create(SaveDFileName, False);
//  j := 1;
//  while j <= Length(Writeinto) do
//  begin
//    a := Writeinto[j];
//    s.Write(a, 1);
//    Inc(j);
//  end;
//  //ShowMessage(IntToStr(s.Size) + ' bytes saved.');
//  s.Free;
//end;


//function UpdateSQLs(strSQL: string): Boolean;
//begin
//  Result := False;
//  sldb.BeginTransaction;
//  try
//    sldb.ExecSQL(strSQL);
//  finally
//    sldb.Commit;
//  end;
//  Result := true;
//end;
//
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
//      try
//        Self_MacAdd := MacAddressEX;
//        TheRealTimeTime_Datetime := getnow;
//        self_Datetime := StrToInt64(FormatDateTime('YYYYMMDDHHMMSS', TheRealTimeTime_Datetime));
//        if self_Datetime = 29991212121212 then
//        begin
//          ShowMessageEX('网络环境异常，即将退出！');
//          ExitProcess(0);
//        end;
//
//        QueryStringEXEXEX('SELECT b_Debug, Version, MacAddress, ExpiredTime FROM SystemInfo', Save_Debug, Saved_Version, Saved_MacAdd, Save_ExpiredTime);
//
//        if Save_Debug <> str_debug then
//        begin
//          ShowMessageEX('Save_Debug <> str_debug！');
//          ExitProcess(0);
//        end;
//
//        if Saved_Version <> str_Version then
//        begin
//          ShowMessageEX('Saved_Version <> str_Version！');
//          ExitProcess(0);
//        end;
//        Saved_MacAdd := Copy(Saved_MacAdd, 1, 17);
//        if Saved_MacAdd <> str_MacAdd then
//        begin
//          ShowMessageEX('Saved_MacAdd <> str_MacAdd！');
//          ExitProcess(0);
//        end;
//
//
////      if str_Version <> '0' then
//        if Save_ExpiredTime <> str_ExpiredTime then
//        begin
//          ShowMessageEX('Save_ExpiredTime <> str_ExpiredTime！');
//          ExitProcess(0);
//        end;
//
//        if Saved_MacAdd <> Self_MacAdd then
//        begin
//          ShowMessageEX('上网环境发生变化，即将退出！');
//          ExitProcess(0);
//        end;
//
//        if StrToInt64(Save_ExpiredTime) <= self_Datetime then
//        begin
//          if str_Version = '0' then
//          begin
//            ShowMessageEX('使用期限已到，即将退出！');
//          end
//          else
//          if str_Version = '1' then
//          begin
//            ShowMessageEX('使用期限已到，即将退出！');
//          end
//          else
//          if str_Version = '0' then
//          begin
//            ShowMessageEX('使用期限已到，即将退出，关注微信公众号：花苍比，获取最新版本！');
//          end;
//          //ShowMessageMyTaobao('使用期限已到，即将退出，关注微信公众号：花苍比，获取最新版本！');
//
//          ExitProcess(0);
//        end;
//
//        if remotetimes = 0 then
//        begin
//          remotetimes := 1;
//
//          if str_Version = '0' then
//            Linshi_str := '当前版本为试用版，'
//          else if str_Version = '1' then
//            Linshi_str := '当前版本为正式版，'
//          else
//          if str_Version = '2' then
//            Linshi_str := '当前版本为内测版，'
//          else
//          begin
//            ShowMessageex('版本错乱！');
//          //Halt;
//            ExitProcess(0);
//          end;
//
//    //      if str_Version = '1' then
//    //      begin
//          if (Url_CloseService_Active <> '') and (subString_For_closeservice <> '') then
//            if ConfirmRemoteCloseService then
//            begin
//              ShowMessageex(Linshi_str + #13#10 + '未知原因退出！');
//              //ShowMessageex('当前版本为正式版' + #13#10 +ConfirmRemoteCloseService_MyInfo1);
//              //Halt;
//              ExitProcess(0);
//            end;
//    //      end
//    //      else
//    //      if str_Version = '0' then
//    //      begin
//          if (Url_CloseService_Active_ControlAllTrialVersion <> '') and (subString_For_closeservice <> '') then
//            if ConfirmRemoteCloseService(1) then
//            begin
//              ShowMessageex(Linshi_str + #13#10 + ConfirmRemoteCloseService_MyInfo1 + '，即将退出');
//              //Halt;
//              ExitProcess(0);
//            end;
//    //      end
//    //      else
//    //        raise Exception.Create('版本信息不正确，无法判定控制方案');
//
////          if str_Version = '1' then
////          begin
////            if (Url_AddPromptWords_Active <> '') and (subString_For_closeservice <> '') then
////              if ConfirmRemoteCloseService(2) then
////              begin
////                PemanantShow_ForOfficial := '，  如有改进建议或其他需求，  ' + ConfirmRemoteCloseService_MyInfo1;
////              end;
////          end;
//
//        end;
//
//        Sleep(300000);
//      except
//        ExitProcess(0);
//      end;
//    end;
//  finally
//    RestrictUseCount := 0;
//  end;
//end;
//
//procedure TUseRestrict.Init;
//var
//  Get_MacAddress, GetExpirdate, Get_errMSG: string;
//  Obeject: string;
//  base64: TBase64Encoding;
//  L_logintimeList, L_logintimeList_encrypt: TStringList;
//  self_Datetime: Int64;
//  Linshi_datetime: TDateTime;
//begin
//  remotetimes := 0;
//{
//   str_Version: string = '0'; //0试用版
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
//
//
//  str_ExpiredTime
//}
//
//  if isFirstTime(Get_MacAddress, GetExpirdate, Get_errMSG) then
//  begin
//    base64 := TBase64Encoding.Create;
//    L_logintimeList := TStringList.Create;
//    try
//      L_logintimeList.Add('1');
//      L_logintimeList.Add(Get_MacAddress+GetExpirdate);
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
//        ShowMessageEX('网络环境异常，即将退出！');
//        Halt;
//      end;
//
//      str_ExpiredTime := FormatDateTime('YYYYMMDDHHMMSS', IncDay(Linshi_datetime, 1));
//    end
//    else
//    begin
//      str_ExpiredTime := GetExpirdate;
//    end;
//
//    EnterCriticalSection(CS);
//    UpdateSQLs('update SystemInfo set b_Debug=' + str_debug + ', LoginTimes=''' + Obeject + ''', Version=' + str_Version + ', MacAddress=''' + Get_MacAddress+GetExpirdate + ''', ExpiredTime=''' + str_ExpiredTime + '''');
//    LeaveCriticalSection(CS);
//
//    WriteEXE(Get_MacAddress+GetExpirdate);     //LoginTimes
//  end
//  else
//  begin
//    if Get_MacAddress = '' then
//    begin
//      ShowMessageEX(Get_errMSG);
//      Halt;
//    end;
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
//    begin
//      str_MacAdd := Get_MacAddress;
//      str_ExpiredTime := QueryString('select ExpiredTime from SystemInfo');
//    end
//    else
//    begin
//      str_MacAdd := Copy(Get_MacAddress, 1, 17);
//      str_ExpiredTime := Copy(Get_MacAddress, 18, 14);
//    end;
//
//    EnterCriticalSection(CS);
//    UpdateSQLs('update SystemInfo set LoginTimes=''' + Obeject + '''');
//    LeaveCriticalSection(CS);
//  end;
//end;
//
//function TUseRestrict.isFirstTime(var str_MacAddress: string;var varExpireDateForOfficialVersion: string; var errMasg: string): Boolean;
//
//  function FixMacAdressFunction(var Linshi_ExpireDateForOfficialVersion: string): string;
//  var
//    hashMd5str: string;
//    FixMacAddressLinshi: string;
//    DeCrptMacAddress, DeCrptMacAddressLinshi: string;
//    DeCrptMacAddressAnsi: AnsiString;
//    DeCrptMacAddressPAnsi: PAnsiChar;
//  begin
//    Result := '';
//    Linshi_ExpireDateForOfficialVersion := '';
//    if str_Version = '0' then
//    begin
//      Result := FixMacAdress;
//    end
//    else if str_Version = '1' then
//    begin
//      hashMd5str := THashMD5.GetHashString(FirstTimeRegisterInfo_ForOfficial);
//      FixMacAddressLinshi := Trim(QueryString('SELECT FixMacAddress from SystemInfo'));
//      if FixMacAddressLinshi = '' then
//      begin
//        //ShowMessageEX('FixMacAddress字段为空');
//        ShowMessageEX('错误编号009');
//        Halt;
//      end;
//
//      if Pos(hashMd5str, FixMacAddressLinshi) < 1 then
//      begin
//        //ShowMessageEX('FixMacAddress字段值不正确');
//        ShowMessageEX('错误编号010');
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
//          //ShowMessageEX('FixMacAddress字段值不正确');
//          ShowMessageEX('错误编号011');
//          Halt;
//        end;
//        DeCrptMacAddressLinshi :=   DeCrptMacAddress;
//        DeCrptMacAddress := Copy(DeCrptMacAddress, 1, 2) + '-' + Copy(DeCrptMacAddress, 3, 2) + '-' + Copy(DeCrptMacAddress, 5, 2) + '-' + Copy(DeCrptMacAddress, 7, 2) + '-' + Copy(DeCrptMacAddress, 9, 2) + '-' + Copy(DeCrptMacAddress, 11, 2);
//        Linshi_ExpireDateForOfficialVersion := Copy(DeCrptMacAddressLinshi, 13, Length(DeCrptMacAddressLinshi) - 12);
//        if (Linshi_ExpireDateForOfficialVersion='') or (not TRegEx.Match(Linshi_ExpireDateForOfficialVersion, '\d{14,}').Success) then
//        begin
//          //ShowMessageEX('FixMacAddress字段信息不正确');
//          ShowMessageEX('错误编号012');
//          Halt;
//        end;
//        result := DeCrptMacAddress;
//      except
//        //ShowMessageEX('FixMacAddress字段值不正确');
//        ShowMessageEX('错误编号013');
//        Halt;
//      end;
//
//    end
//    else if str_Version = '2' then
//    begin
//      hashMd5str := THashMD5.GetHashString(FirstTimeRegisterInfo_ForOfficial);
//      FixMacAddressLinshi := Trim(QueryString('SELECT FixMacAddress from SystemInfo'));
//      if FixMacAddressLinshi = '' then
//      begin
//        //ShowMessageEX('FixMacAddress字段为空');
//        ShowMessageEX('错误编号009');
//        Halt;
//      end;
//
//      if Pos(hashMd5str, FixMacAddressLinshi) < 1 then
//      begin
//        //ShowMessageEX('FixMacAddress字段值不正确');
//        ShowMessageEX('错误编号010');
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
//          //ShowMessageEX('FixMacAddress字段值不正确');
//          ShowMessageEX('错误编号011');
//          Halt;
//        end;
//        DeCrptMacAddressLinshi :=   DeCrptMacAddress;
//        DeCrptMacAddress := Copy(DeCrptMacAddress, 1, 2) + '-' + Copy(DeCrptMacAddress, 3, 2) + '-' + Copy(DeCrptMacAddress, 5, 2) + '-' + Copy(DeCrptMacAddress, 7, 2) + '-' + Copy(DeCrptMacAddress, 9, 2) + '-' + Copy(DeCrptMacAddress, 11, 2);
//        Linshi_ExpireDateForOfficialVersion := Copy(DeCrptMacAddressLinshi, 13, Length(DeCrptMacAddressLinshi) - 12);
//        if (Linshi_ExpireDateForOfficialVersion='') or (not TRegEx.Match(Linshi_ExpireDateForOfficialVersion, '\d{14,}').Success) then
//        begin
//          //ShowMessageEX('FixMacAddress字段信息不正确');
//          ShowMessageEX('错误编号012');
//          Halt;
//        end;
//        result := DeCrptMacAddress;
//        //Result := FixMacAdress;
//      except
//        //ShowMessageEX('FixMacAddress字段值不正确');
//        ShowMessageEX('错误编号013');
//        Halt;
//      end;
//    end
//    else
//    begin
//      //ShowMessageEX('版本错误');
//      ShowMessageEX('错误编号014');
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
//  ExpireDateForOfficialVersion: string;
//begin
//{
//   ReadExe_Boolean: Boolean;
//  ReadExe_ReadOut: string;
//
//}
//  str_MacAddress := '';
//  Result := False;
//  errMasg := '';
//  varExpireDateForOfficialVersion := '';
//
//  try
//    QueryStringEX('SELECT LoginTimes, MacAddress from SystemInfo', L_logintime, L_macaddr);
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
//          FixMacAdress := FixMacAdressFunction(ExpireDateForOfficialVersion);
//
//
//          if str_Version <> '2' then
//          begin
//            if FixMacAdress <> '' then
//            begin
//              if str_MacAddress <> FixMacAdress then
//              begin
//                //ShowMessageEX('本机MAC地址' + str_MacAddress + '与' + FixMacAdress + '不匹配');
//                ShowMessageEX('错误编号001');
//                Halt;
//              end;
//            end;
//          end;
//
//          varExpireDateForOfficialVersion := ExpireDateForOfficialVersion;
//
//          Result := true;
//          Exit;
//        end
//        else
//        begin
//          //errMasg := '第一次登录的时候竟然读到了保存的MacAddress字段内容';
//          errMasg := '错误编号002';
//          Exit;
//        end;
//      end
//      else
//      begin
//        //errMasg := '第一次登录的时候竟然读到了EXE内置内容';
//        errMasg := '错误编号003';
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
//          //errMasg := 'LoginTimes字段无值！';
//          errMasg := '错误编号004';
//          Exit;
//        end;
//
//        L_logintimeList.Text := base64.Decode(L_logintime);
//        Thelogintime := L_logintimeList.Strings[0];
//        if StrToInt64Def(Thelogintime, 0) = 0 then
//        begin
//          //errMasg := '找不到第几次登录的数据了！';
//          errMasg := '错误编号005';
//          Exit;
//        end;
//        subMacA1 := Trim(L_logintimeList.Strings[1]);
//
//        if not ReadExe_Boolean then
//        begin
//          //errMasg := '第' + Thelogintime + '次登录的时候没有读到EXE内置内容！';
//          errMasg := '错误编号006';
//          Exit;
//        end
//        else
//        begin
//          subMacA2 := Trim(ReadExe_ReadOut);
//          if subMacA2 <> subMacA1 then
//          begin
//            //errMasg := '第' + Thelogintime + '次登录的时候EXE内置内容和数据库解密保存的物理地址对不上！';
//            errMasg := '错误编号007';
//            Exit;
//          end;
//        end;
//
//        if Trim(L_macaddr) <> subMacA2 then
//        begin
//          //errMasg := '第' + Thelogintime + '次登录的时候EXE内置内容和数据库明文物理地址对不上！';
//          errMasg := '错误编号008';
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


//function ConfirmRemoteCloseService(iKind: Integer = 0): Boolean;
//var
//  IdHttp: TIdHTTP;
//  ResponseStream: TStringStream; //返回信息
//  ResponseStr: string;
//  LinshiBoolean1, LinshiBoolean2: Boolean;
//  i: Integer;
//begin
//  Result := False;
//
//  i := 0;
//  repeat
//    inc(i);
//
//    LinshiBoolean1 := False;
//    //创建IDHTTP控件
//    IdHttp := TIdHTTP.Create(nil);
//    IdHttp.HandleRedirects := True;
////    IdHttp.ReadTimeout := 3000;
//    IdHttp.Request.ContentType := 'application/x-www-form-urlencoded';
////    IdHttp.Request.CharSet := 'utf-8';
////    IdHttp.Request.ContentEncoding := 'utf-8';//可以省略，目前感觉没用
//    ResponseStream := TStringStream.Create('');
//    try
//        //请求地址
//      try
//        if iKind = 0 then
//          IdHttp.Get(Url_CloseService_Active, ResponseStream)
//        else if iKind = 1 then
//          IdHttp.Get(Url_CloseService_Active_ControlAllTrialVersion, ResponseStream)
//        else if iKind = 2 then
//          //IdHttp.Get(Url_AddPromptWords_Active, ResponseStream)
//        else
//          raise Exception.Create('不知道要控制什么版本');
//      except
//        on E: Exception do
//        begin
//          //ShowMessageEX(e.Message);
//          LinshiBoolean1 := True;
//        end;
//      end;
//        //获取网页返回的信息
//      ResponseStr := ResponseStream.DataString;
//        //网页中的存在中文时，需要进行UTF8解码
//      ResponseStr := UTF8Decode(ResponseStr);
//
//      if Pos(subString_For_closeservice, ResponseStr) > 0 then
//      begin
//          //ShowMessageEX('竟然包含已取消分享');
//        LinshiBoolean1 := True;
//      end;
//
//    finally
//      IdHttp.Free;
//      ResponseStream.Free;
//    end;
//
////    if str_debug = '1' then
////    begin
////      if LinshiBoolean1 then
////        SendMessage(AppMainHangle, WM_USER + 100, iKind, 1)
////      else
////        SendMessage(AppMainHangle, WM_USER + 100, iKind, 0);
////    end;
//
//    if i <> 1 then
//    begin
//      if LinshiBoolean1 <> LinshiBoolean2 then
//      begin
//        Exit;
//      end
//    end
//    else
//    begin
//      LinshiBoolean2 := LinshiBoolean1;
//    end;
//  until i = 3;
//
//  Result := LinshiBoolean2;
//end;


{ TGetFullfilledMemoryTable }

procedure TGetFullfilledMemoryTable.Operate;
var
  slDBpath, Linshi_String: string;
  sSQL: string;


begin
  inherited;

  //slDBpath := ':memory:';
  //slDBpath := TemptDirectory;
  slDBpath := WenJianMingPath;
  UniConnectionWenJianMing := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  UniConnectionWenJianMing.ConnectString := Linshi_String;

  UniConnectionWenJianMing.Password := 'SYNCHRONOUSNORMAL';

  UniConnectionWenJianMing.Connected := True;
  UniConnectionWenJianMing.Connected := False;



  UniQueryWenJianMing := TUniQuery.Create(nil);
  UniQueryWenJianMing.Connection := UniConnectionWenJianMing;



  //sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');







  //initializeSqliteMemoryTable;
  ImportRelatedTieziIDToMemoryTable;




  UniQueryWenJianMing.Connection := nil;
  UniQueryWenJianMing.Free;
  UniConnectionWenJianMing.Free;

end;

procedure TGetFullfilledMemoryTable.ImportRelatedTieziIDToMemoryTable;
var
  BasestrSQL, strSQL: string;
  BasestrSQL1: string;
  Linshi_stringlist: Tstringlist;
  strCount: Integer;
  Linsh_str, strSQLSingle: string;
  xx: Integer;
  LinshiTianShu: Integer;
  LinshiRiQi: TDateTime;
  LinshiRiQi_String: string;
  //MaxCreatetimeStr: string;
  sSQL: string;

  LishiIdex: Integer;
  LogicSymbol: string;
  bHighVague: Boolean;
  LogicSymbolLeng: Integer;
begin
    //BasestrSQL := 'select TieziID, FloorDetails from [hr].SeeLiangTieziList where 1=1 ';
    BasestrSQL := 'select TieziID,  ' + QuotedStr(WenJianMing) + '  from SeeLiangTieziList where 1=1 ';

    Linshi_stringlist := Tstringlist.create;
    try
        BasestrSQL1 := '';
//          strSQL := '';
//          Linshi_stringlist.clear;
//          Linshi_stringlist.Delimiter := '|';
//          Linshi_Stringlist.DelimitedText := Ba_add;       //Ba_add, Ba_substract: string;
//          strCount := Linshi_Stringlist.Count;
//          if strCount > 0 then
//          begin
//            for xx := 0 to strCount - 1 do
//            begin
//              Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
//              if Linsh_str <> '' then
//              begin
//                strSQLSingle := Linsh_str;
//                strSQL := strSQL + ', ' + strSQLSingle;
//              end;
//            end;
//          end;
//          if strSQL <> '' then
//          begin
//            strSQL := Trim(Copy(strSQL, 3, length(strSQL) - 2));
//            BasestrSQL1 := 'select TieziID,  ' + QuotedStr(WenJianMing) + ' from [hr].SeeLiangTieziList where TieziID in (' + strSQL + ') union ';
//          end;


        strSQL := '';
        Linshi_stringlist.clear;
        Linshi_stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := Ba_substract;
        strCount := Linshi_Stringlist.Count;
        if strCount > 0 then
        begin
          for xx := 0 to strCount - 1 do
          begin
            Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
            if Linsh_str <> '' then
            begin
              strSQLSingle := Linsh_str;
              strSQL := strSQL + ', ' + strSQLSingle;
            end;
          end;
        end;
        if strSQL <> '' then
        begin
          strSQL := Trim(Copy(strSQL, 3, length(strSQL) - 2));
          BasestrSQL := BasestrSQL + ' and (TieziID not in (' + strSQL + ')) ';
        end;


        strSQL := '';
        Linshi_stringlist.clear;
        Linshi_stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := Ba_PlanScheme_BarName;
        strCount := Linshi_Stringlist.Count;
        if strCount > 0 then
        begin
                LishiIdex := Linshi_Stringlist.IndexOf('%%%%%');
                if LishiIdex >= 0 then
                begin
                  strSQL := strSQL + ' or (TieBaName<>'''')';
                  LogicSymbol := ' or ';
                  LogicSymbolLeng := 4;
                end
                else
                begin
                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    LogicSymbol := ' and ';
                    LogicSymbolLeng :=  5;
                  end
                  else
                  begin
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end;

                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    bHighVague := True;
                  end
                  else
                  begin
                    bHighVague := False;
                  end;
                  for xx := 0 to strCount - 1 do
                  begin
                    Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                    if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                    begin
                      if bHighVague then
                        strSQLSingle := '(TieBaName like "' + TranslateIntoHighVague(Linsh_str) + '")'
                      else
                        strSQLSingle := '(TieBaName like "%' + Linsh_str + '%")';
                      strSQL := strSQL + LogicSymbol + strSQLSingle;
                    end;
//                      if Linsh_str <> '' then
//                      begin
//                        if Linsh_str = '%%%%%' then
//                        begin
//                          strSQLSingle := '(TieBaName<>'''')';
//                          strSQL := strSQL + ' or ' + strSQLSingle;
//                        end
//                        else
//                        begin
//                          strSQLSingle := '(TieBaName like "%' + Linsh_str + '%")';
//                          strSQL := strSQL + ' or ' + strSQLSingle;
//                        end;
//                      end;
                  end;
                end;
        end;
        if strSQL <> '' then
        begin
          //strSQL := Trim(Copy(strSQL, 5, length(strSQL) - 4));
          strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
          BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
        end;



        strSQL := '';
        Linshi_stringlist.clear;
        Linshi_stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := Ba_PlanScheme_Topic;
        strCount := Linshi_Stringlist.Count;
        if strCount > 0 then
        begin
                LishiIdex := Linshi_Stringlist.IndexOf('%%%%%');
                if LishiIdex >= 0 then
                begin
                  strSQL := strSQL + ' or (TitleName<>'''')';
                  LogicSymbol := ' or ';
                  LogicSymbolLeng := 4;
                end
                else
                begin
                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    LogicSymbol := ' and ';
                    LogicSymbolLeng :=  5;
                  end
                  else
                  begin
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end;

                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    bHighVague := True;
                  end
                  else
                  begin
                    bHighVague := False;
                  end;
                  for xx := 0 to strCount - 1 do
                  begin
                    Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                    if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                    begin
                      if bHighVague then
                        strSQLSingle := '(TitleName like "' + TranslateIntoHighVague(Linsh_str) + '")'
                      else
                        strSQLSingle := '(TitleName like "%' + Linsh_str + '%")';
                      strSQL := strSQL + LogicSymbol + strSQLSingle;
                    end;
//                      if Linsh_str <> '' then
//                      begin
//                        strSQLSingle := '(TitleName like "%' + Linsh_str + '%")';
//                        strSQL := strSQL + ' or ' + strSQLSingle;
//                      end;
                  end;
                end;
        end;
        if strSQL <> '' then
        begin
          strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
          //strSQL := Trim(Copy(strSQL, 5, length(strSQL) - 4));
          BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
        end;


        strSQL := '';
        Linshi_stringlist.clear;
        Linshi_stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := Ba_PlanScheme_Content;
        strCount := Linshi_Stringlist.Count;
        if strCount > 0 then
        begin
                LishiIdex := Linshi_Stringlist.IndexOf('%%%%%');
                if LishiIdex >= 0 then
                begin
                  strSQL := strSQL + ' or (TieZiContent<>'''')';
                  LogicSymbol := ' or ';
                  LogicSymbolLeng := 4;
                end
                else
                begin
                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    LogicSymbol := ' and ';
                    LogicSymbolLeng :=  5;
                  end
                  else
                  begin
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end;

                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    bHighVague := True;
                  end
                  else
                  begin
                    bHighVague := False;
                  end;
                  for xx := 0 to strCount - 1 do
                  begin
                    Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                    if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                    begin
                      if bHighVague then
                        strSQLSingle := '(TieZiContent like "' + TranslateIntoHighVague(Linsh_str) + '")'
                      else
                        strSQLSingle := '(TieZiContent like "%' + Linsh_str + '%")';
                      strSQL := strSQL + LogicSymbol + strSQLSingle;
                    end;
//                      if Linsh_str <> '' then
//                      begin
//                        strSQLSingle := '(TieZiContent like "%' + Linsh_str + '%")';
//                        strSQL := strSQL + ' or ' + strSQLSingle;
//                      end;
                  end;
                end;
        end;
        if strSQL <> '' then
        begin
          strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
          //strSQL := Trim(Copy(strSQL, 5, length(strSQL) - 4));
          BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
        end;


        strSQL := '';
        Linshi_stringlist.clear;
        Linshi_stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := Ba_PlanScheme_TopicContent;
        strCount := Linshi_Stringlist.Count;
        if strCount > 0 then
        begin
                LishiIdex := Linshi_Stringlist.IndexOf('%%%%%');
                if LishiIdex >= 0 then
                begin
                  strSQL := strSQL + ' or (TitleName||TieZiContent<>'''')';
                  LogicSymbol := ' or ';
                  LogicSymbolLeng := 4;
                end
                else
                begin
                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    LogicSymbol := ' and ';
                    LogicSymbolLeng :=  5;
                  end
                  else
                  begin
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end;

                  LishiIdex := Linshi_Stringlist.IndexOf('%%%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    bHighVague := True;
                  end
                  else
                  begin
                    bHighVague := False;
                  end;
                  for xx := 0 to strCount - 1 do
                  begin
                    Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                    if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                    begin
                      if bHighVague then
                        strSQLSingle := '(TitleName||TieZiContent like "' + TranslateIntoHighVague(Linsh_str) + '")'
                      else
                        strSQLSingle := '(TitleName||TieZiContent like "%' + Linsh_str + '%")';
                      strSQL := strSQL + LogicSymbol + strSQLSingle;
                    end;
//                      if Linsh_str <> '' then
//                      begin
//                        strSQLSingle := '(TitleName||TieZiContent like "%' + Linsh_str + '%")';
//                        strSQL := strSQL + ' or ' + strSQLSingle;
//                      end;
                  end;
                end;
        end;
        if strSQL <> '' then
        begin
          strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
          //strSQL := Trim(Copy(strSQL, 5, length(strSQL) - 4));
          BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
        end;



        if Ba_Control2FloorVacancy<>'0' then
          BasestrSQL := BasestrSQL + ' and ((SUBSTR(FloorDetails, 7, 1)="0") or (SUBSTR(FloorDetails, 7, 1)="1")) ';



        LinshiTianShu := StrToInt(Ba_LastHowManyDays);
        if LinshiTianShu <> 0 then
        begin
//            initializeSqliteHardwareTable;
//            MaxCreatetimeStr := Uniquerystring(sltb_InUniConnection, 'select max(createtime) from SeeLiangTieziList');
//            finalizeSqliteHardwareTable;   //NewestDateTimeInDB


          //MyStringtoDateTime(MaxCreatetimeStr) then



          //LinshiRiQi := incDay(MyStringtoDateTime(MaxCreatetimeStr), (0 - LinshiTianShu));
          LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
          LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
          BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
        end;

       if (Ba_ReplyCountBegin <> '0')
        or (Ba_ReplyCountEnd <> '0')
       then
       begin
         if (Ba_ReplyCountBegin <> '0') then
         BasestrSQL := BasestrSQL + ' and (FloorCount>=' + Ba_ReplyCountBegin + ') ';
         if (Ba_ReplyCountEnd <> '0') then
         BasestrSQL := BasestrSQL + ' and (FloorCount<=' + Ba_ReplyCountEnd + ') ';
       end;


       if (Ba_FollowPopulationBegin <> '0')
        or (Ba_FollowPopulationEnd <> '0')
       then
       begin
         if (Ba_FollowPopulationBegin <> '0') then
         BasestrSQL := BasestrSQL + ' and (FollowCountForOneTieBa>=' + Ba_FollowPopulationBegin + ') ';
         if  (Ba_FollowPopulationEnd <> '0') then
         BasestrSQL := BasestrSQL + ' and (FollowCountForOneTieBa<=' + Ba_FollowPopulationEnd + ') ';
       end;


       if (Ba_TieBaPostTotalBegin <> '0')
        or (Ba_TieBaPostTotalEnd <> '0')
       then
       begin
         if (Ba_TieBaPostTotalBegin <> '0') then
         BasestrSQL := BasestrSQL + ' and (TotalPostForOneTieBa>=' + Ba_TieBaPostTotalBegin + ') ';
         if (Ba_TieBaPostTotalEnd <> '0') then
         BasestrSQL := BasestrSQL + ' and (TotalPostForOneTieBa<=' + Ba_TieBaPostTotalEnd + ') ';
       end;

       BasestrSQL := BasestrSQL + ' and (CanReplyOrNot<=0) and (DeleteOrNot<>1)';


       if BasestrSQL1 <> '' then BasestrSQL := BasestrSQL1 +  BasestrSQL;

       //MemorySqlite_InUniConnection.ExecSQL('insert into SaveSomeTieziIDEX (TieziID, FloorDetails) ' + BasestrSQL);
       //MemorySqlite_InUniConnection.ExecSQL('insert into SaveSomeTieziID (TieziID) ' + BasestrSQL);


        EnterCriticalSection(InsertIntoTempFIle);
        sSQL := 'ATTACH DATABASE "' + TemptDirectory + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');
        UniConnectionWenJianMing.ExecSQL(sSQL);
        sSQL := 'replace into [hr].SaveSomeTieziID (TieziID, FileMing) ' + BasestrSQL;//select TieziID, ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList';
        UniConnectionWenJianMing.ExecSQL(sSQL);
        UniConnectionWenJianMing.ExecSQL('DETACH DATABASE "hr"');
        LeaveCriticalSection(InsertIntoTempFIle);
    finally
      Linshi_stringlist.free;
    end;
end;

{ TTransFerFromTempFileToMemoryTable }
procedure TTransFerFromTempFileToMemoryTable.Operate;
begin
  inherited;
  initializeSqliteMemoryTableEXEX(TemptDirectory);
  //sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');




  MemorySqlite_InUniConnection.ExecSQL('replace into SaveSomeTieziID select * from [hr].SaveSomeTieziID');


  MemorySqlite_InUniConnection.ExecSQL('DETACH DATABASE "hr"');
//  //
//  ImportRelatedTieziIDToMemoryTable;
//
//
//
//
//  UniQueryWenJianMing.Connection := nil;
//  UniQueryWenJianMing.Free;
//  UniConnectionWenJianMing.Free;




    if Ba_TieziID <> '' then
    begin
      SearchOfRecordsCount := UniQueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SaveSomeTieziID where TieziID>' + Ba_TieziID);
      QuerySqlInuni(MemorySqliteTable_InUniConnection, 'select TieziID, FileMing from SaveSomeTieziID where TieziID>' + Ba_TieziID + ' order by TieziID asc');
    end
    else
    begin
      SearchOfRecordsCount := UniQueryString(MemorySqliteTable_InUniConnection, 'select count(1) from SaveSomeTieziID');
      QuerySqlInuni(MemorySqliteTable_InUniConnection, 'select TieziID, FileMing from SaveSomeTieziID order by TieziID asc');
    end;

  //finalizeSqliteMemoryTable;
end;

{ TGetAddedPostToTempTable }

procedure TGetAddedPostToTempTable.ImportRelatedTieziIDToMemoryTable;
var
  sSQL: string;
  BasestrSQL: string;

  strSQL: string;
  Linshi_stringlist: TStringList;
  strCount: Integer;
  xx: Integer;
  Linsh_str: string;
  strSQLSingle: string;
begin
//          strSQL := '';
//          Linshi_stringlist := TStringList.Create;
//
//          try
//            Linshi_stringlist.Delimiter := '|';
//            Linshi_Stringlist.DelimitedText := Ba_add;       //Ba_add, Ba_substract: string;
//            strCount := Linshi_Stringlist.Count;
//            if strCount > 0 then
//            begin
//              for xx := 0 to strCount - 1 do
//              begin
//                Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
//                if (Linsh_str <> '') and (Linsh_str <> '%%%%%') then
//                begin
//                  strSQLSingle := Linsh_str;
//                  strSQL := strSQL + ', ' + strSQLSingle;
//                end;
//              end;
//            end;
//            if strSQL <> '' then
//            begin
//              strSQL := Trim(Copy(strSQL, 3, length(strSQL) - 2));
//              BasestrSQL := 'select TieziID,  ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList where TieziID in (' + strSQL + ') and DeleteOrNot<>1 and CanReplyOrNot<=0';
//            end;
//          finally
//            Linshi_stringlist.Free;
//          end;


  BasestrSQL := 'select TieziID,  ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList where DeleteOrNot<>1 and CanReplyOrNot<=0';

  //BasestrSQL := 'select TieziID, ' + '' + ' from SeeLiangTieziList where TieziID in ;
  //EnterCriticalSection(InsertIntoTempFIle);
  sSQL := 'ATTACH DATABASE "' + TemptDirectory + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');
  UniConnectionWenJianMing.ExecSQL(sSQL);
  sSQL := 'replace into [hr].SaveSomeTieziID (TieziID, FileMing) ' + BasestrSQL;//select TieziID, ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList';
  UniConnectionWenJianMing.ExecSQL(sSQL);
  UniConnectionWenJianMing.ExecSQL('DETACH DATABASE "hr"');
  //LeaveCriticalSection(InsertIntoTempFIle);
end;

procedure TGetAddedPostToTempTable.Operate;
var
  slDBpath, Linshi_String: string;
  sSQL: string;


begin
  inherited;

  //slDBpath := ':memory:';
  //slDBpath := TemptDirectory;
  slDBpath := WenJianMingPath;
  UniConnectionWenJianMing := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  UniConnectionWenJianMing.ConnectString := Linshi_String;

  UniConnectionWenJianMing.Password := 'SYNCHRONOUSNORMAL';

  UniConnectionWenJianMing.Connected := True;
  UniConnectionWenJianMing.Connected := False;



  UniQueryWenJianMing := TUniQuery.Create(nil);
  UniQueryWenJianMing.Connection := UniConnectionWenJianMing;



  //sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');







  //initializeSqliteMemoryTable;
  ImportRelatedTieziIDToMemoryTable;




  UniQueryWenJianMing.Connection := nil;
  UniQueryWenJianMing.Free;
  UniConnectionWenJianMing.Free;

end;

{ TSaveSearchedofTieziOnline }

procedure TSaveSearchedofTieziOnline.ImportRelatedTieziIDToMemoryTable;
begin

end;

procedure TSaveSearchedofTieziOnline.Operate;
var
  ThreadManage: TInstActionProxy;
  SingleSaveSearchedofTieziOnline: TSingleSaveSearchedofTieziOnline;

  Linshi_stringlist, Linshi_stringlist1: TStringList;
  strCount, strCount1: Integer;
  xx, yy, zz: Integer;
  Linsh_str, Linsh_str1: string;
  Pagec: Integer;
  ii: Integer;
begin
  ii := 1;
  Linshi_stringlist := TStringList.Create;
  try
    Linshi_stringlist.Delimiter := '|';
    Linshi_Stringlist.DelimitedText := KeyWords;
    strCount := Linshi_Stringlist.Count;
    if strCount > 0 then
    begin

      Linshi_stringlist1 := TStringList.Create;
      try
        Linshi_stringlist1.Delimiter := '|';
        Linshi_Stringlist1.DelimitedText := WebNames;
        strCount1 := Linshi_Stringlist1.Count;
        if strCount1 <= 0 then
        begin
            ThreadManage := TInstActionProxy.create;
            ThreadManage.BldThreadPool(ThreadCForOnlineSearch); //创建6个线程用来加载表   55    90    120
            //ThreadManage.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
            ThreadManage.StartWork; //开始工作

            try
                for xx := 0 to strCount - 1 do
                begin
                  Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                  if (Linsh_str <> '') and (Linsh_str <> '%%%%%') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                  begin
                    if HowManyPage<= 0 then Pagec := 10 else Pagec := HowManyPage;
                    for yy := 1 to Pagec do
                    begin
                      while ThreadManage.PActionCount > 0 do Delay(100);


                      SingleSaveSearchedofTieziOnline := TSingleSaveSearchedofTieziOnline.create;
                      SingleSaveSearchedofTieziOnline.KeyWord := Linsh_str;
                      SingleSaveSearchedofTieziOnline.ii := ii;
                      Inc(ii);
                      SingleSaveSearchedofTieziOnline.WhichPage := yy;
                      //SingleSaveSearchedofTieziOnline.SavedPath := SavedPath;

                      ThreadManage.AddAction(SingleSaveSearchedofTieziOnline);

                      Delay(10);
                    end;
                  end;

                end;
                ThreadManage.WaitforThreadsFinishedWithProcessMsg;
            finally
               ThreadManage.Free;
            end;
        end
        else
        begin
          ThreadManage := TInstActionProxy.create;
          ThreadManage.BldThreadPool(ThreadCForOnlineSearch); //创建6个线程用来加载表   55    90    120
          //ThreadManage.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
          ThreadManage.StartWork; //开始工作
          try
            for zz := 0 to strCount1 - 1 do
            begin
              Linsh_str1 :=  Trim(Linshi_Stringlist1.strings[zz]);
              if (Linsh_str1 <> '') and (Linsh_str1 <> '%%%%%') and (Linsh_str1 <> '%%%%%%') and (Linsh_str1 <> '%%%%%%%') then
              begin
                for xx := 0 to strCount - 1 do
                begin
                  Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
                  if (Linsh_str <> '') and (Linsh_str <> '%%%%%') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                  begin
                    if HowManyPage<= 0 then Pagec := 10 else Pagec := HowManyPage;
                    for yy := 1 to Pagec do
                    begin
                      while ThreadManage.PActionCount > 0 do DelayExEx(100);


                      SingleSaveSearchedofTieziOnline := TSingleSaveSearchedofTieziOnline.create;
                      SingleSaveSearchedofTieziOnline.KeyWord := Linsh_str;
                      SingleSaveSearchedofTieziOnline.BaName :=  Linsh_str1;
                      SingleSaveSearchedofTieziOnline.ii := ii;
                      Inc(ii);
                      SingleSaveSearchedofTieziOnline.WhichPage := yy;
                      //SingleSaveSearchedofTieziOnline.SavedPath := SavedPath;

                      ThreadManage.AddAction(SingleSaveSearchedofTieziOnline);

                      DelayExEx(10);
                    end;
                  end;
                end;
              end;
            end;
            ThreadManage.WaitforThreadsFinishedWithProcessMsg;
          finally
            ThreadManage.Free;
          end;
        end;
      finally
        Linshi_stringlist1.Free;
      end;
    end;
  finally
    Linshi_stringlist.Free;
  end;
end;

{ TSingleSaveSearchedofTieziOnline }

procedure TSingleSaveSearchedofTieziOnline.ImportRelatedTieziIDToMemoryTable;
begin

end;

procedure TSingleSaveSearchedofTieziOnline.Operate;
var
  HTTPCon: TIdHTTP;
//   AntiFreeze : TIdAntiFreeze;
  SSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;

  respnsestr: string;
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
  trimLinshi_Title: string;
  Linshi_BaName, Linshi_CreateTime: string;
  Lerror: string;


  V: OleVariant;
  Doc: IHTMLDocument2;
  Doc1, Doc2: IHTMLDocument7;
  ElementCollection1, ElementCollection2: IHTMLElementCollection;
  ElementCollection3, ElementCollection4: IHTMLElementCollection;

  I: Integer;
  HTMLElement1, HTMLElement2: IHTMLElement;
  innerHTMLStr: string;

  //table: IHTMLTABLE;

  TrimKeyWord: string;
  //KeySearchType: Integer;
  slDBpath, Linshi_String: string;


  //varprogrss: string;
begin
  try
    try
           { AntiFreeze }
//           AntiFreeze := TIdAntiFreeze.Create(NIL);
//           AntiFreeze.Active := true;
           { Create & Set IdHTTP properties }

      HTTPCon := TIdHTTP.Create(NIL);


      SSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
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

      TrimKeyWord := Trim(KeyWord);
      if Copy(TrimKeyWord, Length(TrimKeyWord) - 1, 2) = '_0' then   //按相关性顺序
      begin
        //KeySearchType := 0;
        linshiURL :=
      'https://tieba.baidu.com/f/search/res?isnew=1&kw=' +
      Trim(BaName) +
      '&qw=' + Copy(TrimKeyWord, 1, Length(TrimKeyWord) - 2)
      //%D5%D2%C0%CF%C6%C5
       +
      '&rn=20&un=&only_thread=0&sm=2&sd=&ed=&pn=' + IntToStr(WhichPage);
      end
      else
      if Copy(TrimKeyWord, Length(TrimKeyWord) - 1, 2) = '_1' then   //按时间倒序
      begin
        //KeySearchType := 1;
        linshiURL :=
      'https://tieba.baidu.com/f/search/res?isnew=1&kw=' +
      Trim(BaName) +
      '&qw=' + Copy(TrimKeyWord, 1, Length(TrimKeyWord) - 2)
      //%D5%D2%C0%CF%C6%C5
       +
      '&rn=20&un=&only_thread=0&sm=1&sd=&ed=&pn=' + IntToStr(WhichPage);
      end
      else
      begin
        //KeySearchType := 2;
        linshiURL :=
      'https://tieba.baidu.com/f/search/res?isnew=1&kw=' +
      Trim(BaName) +
      '&qw=' +  TrimKeyWord
      //%D5%D2%C0%CF%C6%C5
       +
      '&rn=20&un=&only_thread=1&sm=1&sd=&ed=&pn=' + IntToStr(WhichPage);
      end;

      linshiURL := urlencode(linshiURL);

      //ResponseStream1 := TStringStream.Create('', TEncoding.UTF8);
      //ResponseStream1 := TStringStream.Create('', TEncoding.BigEndianUnicode);
      //try

        //Lerror := '1';
//        HTTPCon.Get(linshiURL, ResponseStream1);
//
//        Lerror := '2';
//        respnsestr := ResponseStream1.DataString;

      respnsestr := HTTPCon.Get(linshiURL);





      LinshiPattern := 'class\="s\_post".+?\<font\s*class\="p\_green\s*p\_date"\>\d{4}\-\d{2}\-\d{2}\s*\d{2}\:\d{2}\<\/font\>';
      matchs := TRegEx.Matches(respnsestr, LinshiPattern);

      if matchs.Count > 0 then
      begin

        for match in matchs do
        begin
                //HTMLElement1 := ElementCollection1.item(I, 0) as IHTMLElement;
                //innerHTMLStr := HTMLElement1.innerHTML;
                innerHTMLStr := match.Value;

                Parent_PostID := TRegEx.Match(innerHTMLStr, 'data\-tid\=\"\d+\"').Value;
                Linshi_PostID := TRegEx.Match(Parent_PostID, '\d+').Value;



//                Doc := coHTMLDocument.Create as IHTMLDocument2; // create IHTMLDocument2 instance
//                V := VarArrayCreate([0,0],varVariant);
//                V[0] := innerHTMLStr;
//                Doc.Write(PSafeArray(TVarData(v).VArray)); // write data from IdHTTP
//                Doc1 := Doc as IHTMLDocument7;


                //Linshi_Title := (Doc1.getElementsByClassName('bluelink').item(0, 0) as IHTMLElement).innerText;
                Linshi_Title := TRegEx.Match(innerHTMLStr, 'bluelink.+?\<\/a\>').Value; //em
                Linshi_Title := StringReplace(Linshi_Title, '<em>', '', [rfReplaceAll]);
                Linshi_Title := StringReplace(Linshi_Title, '</em>', '', [rfReplaceAll]);
                Linshi_Title := TRegEx.Match(Linshi_Title, '\>.+?\<').Value; //em
                Linshi_Title := StringReplace(Linshi_Title, '<', '', [rfReplaceAll]);
                Linshi_Title := StringReplace(Linshi_Title, '>', '', [rfReplaceAll]);
                Linshi_Title := StringReplace(Linshi_Title, '''', '', [rfReplaceAll]);
                Linshi_Title := StringReplace(Linshi_Title, '"', '', [rfReplaceAll]);
                Linshi_Title := StringReplace(Linshi_Title, '''''', '', [rfReplaceAll]);

                //Linshi_Content := (Doc1.getElementsByClassName('p_content').item(0, 0) as IHTMLElement).innerText;
                Linshi_Content := TRegEx.Match(innerHTMLStr, 'p\_content.+?\<\/div\>').Value; //em
                Linshi_Content := StringReplace(Linshi_Content, '<em>', '', [rfReplaceAll]);
                Linshi_Content := StringReplace(Linshi_Content, '</em>', '', [rfReplaceAll]);
                Linshi_Content := TRegEx.Match(Linshi_Content, '\>.+?\<').Value; //em
                Linshi_Content := StringReplace(Linshi_Content, '<', '', [rfReplaceAll]);
                Linshi_Content := StringReplace(Linshi_Content, '>', '', [rfReplaceAll]);
                Linshi_Content := StringReplace(Linshi_Content, '''', '', [rfReplaceAll]);
                Linshi_Content := StringReplace(Linshi_Content, '"', '', [rfReplaceAll]);
                Linshi_Content := StringReplace(Linshi_Content, '''''', '', [rfReplaceAll]);

                //Linshi_BaName := (Doc1.getElementsByClassName('p_violet').item(0, 0) as IHTMLElement).innerText;
                Linshi_BaName := TRegEx.Match(innerHTMLStr, 'p\_violet.+?\<\/font\>').Value; //em
                Linshi_BaName := StringReplace(Linshi_BaName, '<em>', '', [rfReplaceAll]);
                Linshi_BaName := StringReplace(Linshi_BaName, '</em>', '', [rfReplaceAll]);
                Linshi_BaName := TRegEx.Match(Linshi_BaName, '\>.+?\<').Value; //em
                Linshi_BaName := StringReplace(Linshi_BaName, '<', '', [rfReplaceAll]);
                Linshi_BaName := StringReplace(Linshi_BaName, '>', '', [rfReplaceAll]);
//                Linshi_BaName := StringReplace(Linshi_Content, '''', '', [rfReplaceAll]);
//                Linshi_BaName := StringReplace(Linshi_Content, '"', '', [rfReplaceAll]);
//                Linshi_BaName := StringReplace(Linshi_Content, '''''', '', [rfReplaceAll]);





                Linshi_BaName := Trim(Linshi_BaName);
                if Copy(Linshi_BaName, Length(Linshi_BaName), 1) <> '吧' then Linshi_BaName := Linshi_BaName + '吧';


                //Linshi_CreateTime := (Doc1.getElementsByClassName('p_green p_date').item(0, 0) as IHTMLElement).innerText;
                Linshi_CreateTime := TRegEx.Match(innerHTMLStr, 'p\_green\s*p\_date.+?\<\/font\>').Value; //em
                Linshi_CreateTime := StringReplace(Linshi_CreateTime, '<em>', '', [rfReplaceAll]);
                Linshi_CreateTime := StringReplace(Linshi_CreateTime, '</em>', '', [rfReplaceAll]);
                Linshi_CreateTime := TRegEx.Match(Linshi_CreateTime, '\>.+?\<').Value; //em
                Linshi_CreateTime := StringReplace(Linshi_CreateTime, '<', '', [rfReplaceAll]);
                Linshi_CreateTime := StringReplace(Linshi_CreateTime, '>', '', [rfReplaceAll]);
//                Linshi_Content := StringReplace(Linshi_Content, '''', '', [rfReplaceAll]);
//                Linshi_Content := StringReplace(Linshi_Content, '"', '', [rfReplaceAll]);
//                Linshi_Content := StringReplace(Linshi_Content, '''''', '', [rfReplaceAll]);



                trimLinshi_Title := Linshi_Title;
                if Copy(trimLinshi_Title, 1, 3) = '回复:' then
                begin
                  Linshi_Content := '';
                  Linshi_CreateTime := '';
                  Linshi_Title := Copy(trimLinshi_Title, 4, Length(trimLinshi_Title) - 3);
                end;


                EnterCriticalSection(SaveOnlinesearchedDB);
                try

                          sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
                          'values (' + Linshi_PostID
                           + ', ' +  QuotedStr(Linshi_BaName)
                           + ', ' +  QuotedStr(Linshi_Title)
                           + ', ' +  QuotedStr(Linshi_Content)
                           + ', ' +  QuotedStr(Linshi_CreateTime)
                           + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime))
                           + ', 0, -1)';
                          LinshiMemoryTableUniConnection.ExecSQL(sSQL);
                finally
                  LeaveCriticalSection(SaveOnlinesearchedDB);
                end;
        end;
        SendMessage(AppMainHangle, WM_USER + 101, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage))), LPARAM(PChar(BaName)));
      end
      else
      begin
        Lerror := '未找到匹配贴';
        EnterCriticalSection(SaveOnlinesearchedDB);
        try

                  sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
                  'values (' + IntToStr(ii)
                   + ', ' +  QuotedStr(BaName)
                   + ', ' +  QuotedStr(Lerror)
                   + ', ' +  QuotedStr(KeyWord)
                   + ', ' +  QuotedStr(IntToStr(WhichPage))
                   + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now))
                   + ', 1, 100)';
                  LinshiMemoryTableUniConnection.ExecSQL(sSQL);
        finally
          LeaveCriticalSection(SaveOnlinesearchedDB);
        end;
        Glosbstr := respnsestr;
        //string 转成 pchar，如果里面有#0，字符串就会被切断，变得不完整了
        SendMessage(AppMainHangle, WM_USER + 102, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage) + '|' + Lerror + ',' + linshiURL + ',' + respnsestr)), LPARAM(PChar(BaName)));
        Glosbstr := '';
      end;



//      Doc := coHTMLDocument.Create as IHTMLDocument2; // create IHTMLDocument2 instance
//      V := VarArrayCreate([0,0],varVariant);
//      V[0] := respnsestr;
//      Doc.Write(PSafeArray(TVarData(v).VArray)); // write data from IdHTTP
//
//      //Doc.all.
//      //varprogrss := '2';
//      Doc1 := Doc as IHTMLDocument7;
//      //Doc1.
//      //Doc1 := IHTMLDocument7(Doc);
//
//
//      //varprogrss := '3';
//      ElementCollection1 := Doc1.getElementsByClassName('s_post');
//
//
//
//
//
//
//
//      if ElementCollection1.length > 0 then
//      begin
//              for I := 0 to ElementCollection1.length - 1 do
//              begin
//                //varprogrss := '4';
//                HTMLElement1 := ElementCollection1.item(I, 0) as IHTMLElement;
//                innerHTMLStr := HTMLElement1.innerHTML;
//
//
//                Parent_PostID := TRegEx.Match(innerHTMLStr, 'data\-tid\=\"\d+\"').Value;
//                Linshi_PostID := TRegEx.Match(Parent_PostID, '\d+').Value;
//
//                Doc := coHTMLDocument.Create as IHTMLDocument2; // create IHTMLDocument2 instance
//                V := VarArrayCreate([0,0],varVariant);
//                V[0] := innerHTMLStr;
//                Doc.Write(PSafeArray(TVarData(v).VArray)); // write data from IdHTTP
//                Doc1 := Doc as IHTMLDocument7;
//
//
//                Linshi_Title := (Doc1.getElementsByClassName('bluelink').item(0, 0) as IHTMLElement).innerText;
//
//                Linshi_Content := (Doc1.getElementsByClassName('p_content').item(0, 0) as IHTMLElement).innerText;
//
//                Linshi_BaName := (Doc1.getElementsByClassName('p_violet').item(0, 0) as IHTMLElement).innerText;
//                Linshi_BaName := Trim(Linshi_BaName);
//                if Copy(Linshi_BaName, Length(Linshi_BaName), 1) <> '吧' then Linshi_BaName := Linshi_BaName + '吧';
//
//
//                Linshi_CreateTime := (Doc1.getElementsByClassName('p_green p_date').item(0, 0) as IHTMLElement).innerText;
//
//                trimLinshi_Title := Linshi_Title;
//                if Copy(trimLinshi_Title, 1, 3) = '回复:' then
//                begin
//                  Linshi_Content := '';
//                  Linshi_CreateTime := '';
//                  Linshi_Title := Copy(trimLinshi_Title, 4, Length(trimLinshi_Title) - 3);
//                end;
//
//
//                EnterCriticalSection(SaveOnlinesearchedDB);
//                //LinshiUniConnection := TUniConnection.Create(nil);
//                try
//        //            slDBpath := SavedPath;//':memory:';
//        //            Linshi_String := 'Provider Name=SQLite;';
//        //            Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
//        //            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//        //            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
//        //            Linshi_String := Linshi_String + 'Use Unicode=false;';
//        //            Linshi_String := Linshi_String + 'Login Prompt=False';
//        //
//        //            LinshiUniConnection.ConnectString := Linshi_String;
//        //
//        //            LinshiUniConnection.Password := 'SYNCHRONOUSNORMAL';
//        //
//        //            LinshiUniConnection.Connected := True;
//        //            LinshiUniConnection.Connected := False;
//
//
//        //
//        //  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
//        //  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;
//
//
//                  //slDataBase := TSQLiteDatabase.Create(SavedPath);
//                  //try
//                        //slDataBase.BeginTransaction;
//                        //try
//
//                          sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
//                          'values (' + Linshi_PostID
//                           + ', ' +  QuotedStr(Linshi_BaName)
//                           + ', ' +  QuotedStr(Linshi_Title)
//                           + ', ' +  QuotedStr(Linshi_Content)
//                           + ', ' +  QuotedStr(Linshi_CreateTime)
//                           + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime))
//                           + ', 0, -1)';
//                          LinshiMemoryTableUniConnection.ExecSQL(sSQL);
//
//
//        //                finally
//        //                  slDataBase.Commit;
//        //                end;
//        //          finally
//        //            slDataBase.Free;
//        //          end;
//                finally
//                  //LinshiUniConnection.Free;
//                  LeaveCriticalSection(SaveOnlinesearchedDB);
//                end;
//
//
//
//        //        HTMLElement1.children;
//        //        HTMLElement1.all;
//
//        //        Doc2 := (HTMLElement1.all) as IHTMLDocument7;
//        //        ElementCollection2 := Doc2.getElementsByClassName('bluelink');
//
//                //ElementCollection3 := ElementCollection2.tags('a') as IHTMLElementCollection;
//        //        HTMLElement2 := ElementCollection2.item(0, 0) as IHTMLElement;
//        //        ShowMessage(HTMLElement2.innerHTML);
//        //        Linshi_PostID := HTMLElement2.getAttribute('data-tid', 0);
//        //        ShowMessage(HTMLElement1.innerHTML);
//              end;
//
//              SendMessage(AppMainHangle, WM_USER + 101, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage))), LPARAM(PChar(BaName)));
//      end
//      else
//      begin
//        Lerror := '未找到匹配贴';
//        EnterCriticalSection(SaveOnlinesearchedDB);
//        //LinshiUniConnection := TUniConnection.Create(nil);
//        try
////  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
////  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;
//
//
//          //slDataBase := TSQLiteDatabase.Create(SavedPath);
//          //try
//                //slDataBase.BeginTransaction;
//                //try
//
//                  sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
//                  'values (' + IntToStr(ii)
//                   + ', ' +  QuotedStr(BaName)
//                   + ', ' +  QuotedStr(Lerror)
//                   + ', ' +  QuotedStr(KeyWord)
//                   + ', ' +  QuotedStr(IntToStr(WhichPage))
//                   + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now))
//                   + ', 1, 100)';
//                  LinshiMemoryTableUniConnection.ExecSQL(sSQL);
//
//
////                finally
////                  slDataBase.Commit;
////                end;
////          finally
////            slDataBase.Free;
////          end;
//        finally
//          LeaveCriticalSection(SaveOnlinesearchedDB);
//        end;
//        Glosbstr := respnsestr;
//        //string 转成 pchar，如果里面有#0，字符串就会被切断，变得不完整了
//        SendMessage(AppMainHangle, WM_USER + 102, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage) + '|' + Lerror + ',' + linshiURL + ',' + respnsestr)), LPARAM(PChar(BaName)));
//        Glosbstr := '';
//      end;


      //ShowMessage(IntToStr(ElementCollection1.length));


//      LinshiPattern := 'data\-tid\=\"\d+\"';
//      matchs := TRegEx.Matches(respnsestr, LinshiPattern);
//
//      for match in matchs do
//      begin
//        linshiStr := match.Value;
//        LinshiPattern := '\d+';
//        if TRegEx.Match(linshiStr, LinshiPattern).Success then
//        begin
//          Linshi_PostID := TRegEx.Match(linshiStr, LinshiPattern).Value;
//
////          Pls_FloorInfo1 := TRegEx.Match(Pls_FloorInfo, '\d+楼').Value;
////          Pls_FloorInfo := TRegEx.Match(Pls_FloorInfo, LinshiPattern).Value;
////              //Pls_FloorNo, Pls_FloorReplyC
////          if Pls_FloorInfo = '>回复' then
////            Pls_FloorReplyC := '0'
////          else
////            Pls_FloorReplyC := TRegEx.Match(Pls_FloorInfo, '\d+').Value;
////
////          Pls_FloorNo := TRegEx.Match(Pls_FloorInfo1, '\d+').Value;
////
////          Pls_FloorInfo1 := Pls_FloorNo + '=' + Pls_FloorReplyC;
////          Pls_FloorInfoList.Add(Pls_FloorInfo1);
//        end;
//      end;


//      LinshiPattern :=
//      'data-tid';
//      match := TRegEx.Match(respnsestr, LinshiPattern);
//      if not match.Success then
//      begin
////        InterlockedIncrement(GetornotGet_404);
////        Pls_DeleteOrNot := '1';
//        Exit;
//      end;





    finally

      if HTTPCon.Connected then
        HTTPCon.Disconnect;

      HTTPCon.IOHandler := nil;

      FreeAndNil(HTTPCon);

      FreeAndNil(SSLIOHandlerSocketOpenSSL);

           //if Assigned(AntiFreeze) then FreeAndNil(AntiFreeze);
    end;
  except
    on E: Exception do
    begin
        //Lerror := varprogrss + ' ' + E.Message;
        Lerror := E.Message;


        EnterCriticalSection(SaveOnlinesearchedDB);
        //LinshiUniConnection := TUniConnection.Create(nil);
        try
//  MemorySqliteTable_InUniConnection := TUniQuery.Create(nil);
//  MemorySqliteTable_InUniConnection.Connection := MemorySqlite_InUniConnection;


          //slDataBase := TSQLiteDatabase.Create(SavedPath);
          //try
                //slDataBase.BeginTransaction;
                //try

                  sSQL := 'replace into SeeLiangTieziList (TieziID, TieBaName, TitleName, TieZiContent, Createtime, LastUpdateTime, DeleteOrNot, CanReplyOrNot) ' +
                  'values (' + IntToStr(ii)
                   + ', ' +  QuotedStr(BaName)
                   + ', ' +  QuotedStr(Lerror)
                   + ', ' +  QuotedStr(KeyWord)
                   + ', ' +  QuotedStr(IntToStr(WhichPage))
                   + ', ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now))
                   + ', 1, 100)';
                  LinshiMemoryTableUniConnection.ExecSQL(sSQL);


//                finally
//                  slDataBase.Commit;
//                end;
//          finally
//            slDataBase.Free;
//          end;
        finally
          LeaveCriticalSection(SaveOnlinesearchedDB);
        end;
        Glosbstr := Lerror;
        SendMessage(AppMainHangle, WM_USER + 102, WPARAM(PChar(KeyWord + '|' + IntToStr(WhichPage) + '|' + Lerror)), LPARAM(PChar(BaName)));
        Glosbstr := '';
    end;
  end;

end;

{ TCarryKeySearchedPostToTempTable }

procedure TCarryKeySearchedPostToTempTable.ImportRelatedTieziIDToTempFile;
var
  sSQL: string;
  BasestrSQL: string;

  strSQL: string;
  Linshi_stringlist: TStringList;
  strCount: Integer;
  xx: Integer;
  Linsh_str: string;
  strSQLSingle: string;
  deleteconditon: string;
begin
//          strSQL := '';
//          Linshi_stringlist := TStringList.Create;
//
//          try
//            Linshi_stringlist.Delimiter := '|';
//            Linshi_Stringlist.DelimitedText := Ba_add;       //Ba_add, Ba_substract: string;
//            strCount := Linshi_Stringlist.Count;
//            if strCount > 0 then
//            begin
//              for xx := 0 to strCount - 1 do
//              begin
//                Linsh_str :=  Trim(Linshi_Stringlist.strings[xx]);
//                if (Linsh_str <> '') and (Linsh_str <> '%%%%%') then
//                begin
//                  strSQLSingle := Linsh_str;
//                  strSQL := strSQL + ', ' + strSQLSingle;
//                end;
//              end;
//            end;
//            if strSQL <> '' then
//            begin
//              strSQL := Trim(Copy(strSQL, 3, length(strSQL) - 2));
//              BasestrSQL := 'select TieziID,  ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList where TieziID in (' + strSQL + ') and DeleteOrNot<>1 and CanReplyOrNot<=0';
//            end;
//          finally
//            Linshi_stringlist.Free;

  if deleteorno then
  begin
               deleteconditon := ' 1=1 ';
               if (StrToInt64Def(Ba_TieBaPostTotalBegin, 0) > 0)
                or (StrToInt64Def(Ba_TieBaPostTotalEnd, 0) > 0)
               then
               begin
                 if StrToInt64Def(Ba_TieBaPostTotalBegin, 0) > 0 then
                 deleteconditon := deleteconditon + ' and (AllPostCount<' + Ba_TieBaPostTotalBegin + ') ';
                 if (StrToInt64Def(Ba_TieBaPostTotalEnd, 0) > 0) then
                 deleteconditon := deleteconditon + ' and (AllPostCount>' + Ba_TieBaPostTotalEnd + ') ';
               end;


               if (StrToInt64Def(Ba_FollowPopulationBegin, 0) > 0)
                or (StrToInt64Def(Ba_FollowPopulationEnd, 0) > 0)
               then
               begin
                 if (StrToInt64Def(Ba_FollowPopulationBegin, 0) > 0) then
                 deleteconditon := deleteconditon + ' and (FollowerCount<' + Ba_FollowPopulationBegin + ') ';
                 if  (StrToInt64Def(Ba_FollowPopulationEnd, 0) > 0) then
                 deleteconditon := deleteconditon + ' and (FollowerCount>' + Ba_FollowPopulationEnd + ') ';
               end;
               if deleteconditon = ' 1=1 ' then deleteconditon := ' 1=0 ';



              EnterCriticalSection(CS);
              sSQL := 'ATTACH DATABASE "' + APPCommonPath + DbName1 + '" AS hrr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');
              UniConnectionWenJianMing.ExecSQL(sSQL);
              sSQL := 'delete from SeeLiangTieziList where (DeleteOrNot=1) or (CanReplyOrNot>0) or TieBaName in (select TieBaMing from [hrr].TieBa_BasicInfo where '
              + deleteconditon + ')';
              UniConnectionWenJianMing.ExecSQL(sSQL);
              UniConnectionWenJianMing.ExecSQL('DETACH DATABASE "hrr"');
              LeaveCriticalSection(CS);

  end;

//  sSQL := 'replace into [hr].SaveSomeTieziID (TieziID, FileMing) ' + BasestrSQL;//select TieziID, ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList';
//  UniConnectionWenJianMing.ExecSQL(sSQL);


  BasestrSQL := 'select TieziID,  ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList  where (DeleteOrNot<>1) and (CanReplyOrNot<=0)';
  //BasestrSQL := 'select TieziID, ' + '' + ' from SeeLiangTieziList where TieziID in ;
  //EnterCriticalSection(InsertIntoTempFIle);
  sSQL := 'ATTACH DATABASE "' + TemptDirectory + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');
  UniConnectionWenJianMing.ExecSQL(sSQL);
  sSQL := 'replace into [hr].SaveSomeTieziID (TieziID, FileMing) ' + BasestrSQL;//select TieziID, ' + QuotedStr(WenJianMing) + ' from SeeLiangTieziList';
  UniConnectionWenJianMing.ExecSQL(sSQL);
  UniConnectionWenJianMing.ExecSQL('DETACH DATABASE "hr"');
  //LeaveCriticalSection(InsertIntoTempFIle);
end;

procedure TCarryKeySearchedPostToTempTable.Operate;
var
  slDBpath, Linshi_String: string;
  sSQL: string;


begin
  inherited;

  //slDBpath := ':memory:';
  //slDBpath := TemptDirectory;
  slDBpath := WenJianMingPath;
  UniConnectionWenJianMing := TUniConnection.Create(nil);
  Linshi_String := 'Provider Name=SQLite;';
  Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
  Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
  Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
  Linshi_String := Linshi_String + 'Use Unicode=false;';
  Linshi_String := Linshi_String + 'Login Prompt=False';

  UniConnectionWenJianMing.ConnectString := Linshi_String;

  UniConnectionWenJianMing.Password := 'SYNCHRONOUSNORMAL';

  UniConnectionWenJianMing.Connected := True;
  UniConnectionWenJianMing.Connected := False;



  UniQueryWenJianMing := TUniQuery.Create(nil);
  UniQueryWenJianMing.Connection := UniConnectionWenJianMing;



  //sSQL := 'ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL');







  //initializeSqliteMemoryTable;
  ImportRelatedTieziIDToTempFile;




  UniQueryWenJianMing.Connection := nil;
  UniQueryWenJianMing.Free;
  UniConnectionWenJianMing.Free;

end;

{ TSplitDBFromSource }

procedure TSplitDBFromSource.Operate;
var
  Linshi_slDBpath, Linshi_String: string;

  SQLPart: string;
  SQLPartPos: Integer;

  SQLPart1, SQLPart2: string;

  UniConnection_Move: TUniConnection;
  UniQuery_Move: TUniQuery;
  //UniQuery_Move1: TUniQuery;


  UniConnection_Spit: TUniConnection;
  //UniQuery_Spit: TUniQuery;
  //UniQuery_Move1: TUniQuery;

  ttcs0, ttcs1: Integer;

  mindate, maxdate: TDateTime;
  Differencedays: Integer;

  soureRcordCount: Integer;
  i: Integer;
  Linshitieziid: string;
  Linshiupdatetim, Linshiupdatetim1: string;
  LinshiCreateTime, LinshiCreateTime1: string;
  existtieziidornot: string;
  sSQL: string;
  slDataBase: TSQLiteDatabase;
  SplitDirectoryEX: string;

  WHereSql: string;
begin
  //try
      SplitDirectoryEX := SplitDirectory;

      UniConnection_Move := TUniConnection.Create(nil);

      Linshi_slDBpath := ':memory:';

      Linshi_String := 'Provider Name=SQLite;';
      Linshi_String := Linshi_String + 'Database=' + Linshi_slDBpath + ';';
      Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
      Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
      Linshi_String := Linshi_String + 'Use Unicode=false;';
      Linshi_String := Linshi_String + 'Login Prompt=False';

      UniConnection_Move.ConnectString := Linshi_String;

      UniConnection_Move.Password := 'SYNCHRONOUSNORMAL';


      UniConnection_Move.Connected := True;
      UniConnection_Move.Connected := False;


      UniQuery_Move := TUniQuery.Create(nil);
      UniQuery_Move.Connection := UniConnection_Move;

      if SourceDBaseDire = '' then
      begin
        SourceDBaseDire := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
      end;

      UniConnection_Move.ExecSQL('ATTACH DATABASE "' + SourceDBaseDire + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));

//      sSQL := 'CREATE TABLE SeeLiangTieziList (' +
//      '[FloorDetails] TEXT,' +
//      '[TieziID] INTEGER NOT NULL,' +
//      '[TieBaName] TEXT,' +
//      '[TitleName] TEXT,' +
//      '[TieZiContent] TEXT,' +
//      '[DeleteOrNot] integer NOT NULL,' +
//      '[CanReplyOrNot] integer,' +
//      '[FloorCount] integer,' +
//      '[Createtime] TEXT,' +
//      '[FollowCountForOneTieBa] integer,' +
//      '[TotalPostForOneTieBa] integer,' +
//      '[LastUpdateTime] TEXT,' +
//      'PRIMARY KEY ([TieziID]));';

        sSQL := 'CREATE TABLE CreateTimeList (' +
      '[Createtime] TEXT,' +
      'PRIMARY KEY ([Createtime]));';

      UniConnection_Move.ExecSQL(sSQL);

      WHereSql :=  'FollowCountForOneTieBa<>'''' and FloorCount<>''''' + ' and DeleteOrNot<>1 and CanReplyOrNot<=0';

      sSQL := 'insert into CreateTimeList SELECT DISTINCT SUBSTR(Createtime, 1, 10) FROM [hr].SeeLiangTieziList WHERE Createtime<>'''' and ' + WHereSql;

      UniConnection_Move.ExecSQL(sSQL);

      UniConnection_Move.ExecSQL('DETACH DATABASE "hr"');




        QuerySqlInuni(UniQuery_Move, 'select Createtime from CreateTimeList order by Createtime asc');

        UniQuery_Move.First;
        while not UniQuery_Move.Eof  do
        begin
          Delay(10);
          LinshiCreateTime := UniQuery_Move.Fields[0].AsString;
          LinshiCreateTime1 := StringReplace(LinshiCreateTime, '-', '', [rfReplaceAll]);


          if SplitDirectoryEX = '' then
             SplitDirectory := ExtractFilepath(application.exename) + 'SplitedDB\' + LinshiCreateTime1 + '.db3'
          else
             SplitDirectory := SplitDirectoryEX + LinshiCreateTime1 + '.db3';
          slDataBase := TSQLiteDatabase.Create(SplitDirectory);
          try

                sSQL :=
                //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                //'CREATE TABLE SeeLiangTieziList (' +
                'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                '[FloorDetails] TEXT,' +
                '[TieziID] INTEGER NOT NULL,' +
                '[TieBaName] TEXT,' +
                '[TitleName] TEXT,' +
                '[TieZiContent] TEXT,' +
                '[DeleteOrNot] integer NOT NULL,' +
                '[CanReplyOrNot] integer,' +
                '[FloorCount] integer,' +
                '[Createtime] TEXT,' +
                '[FollowCountForOneTieBa] integer,' +
                '[TotalPostForOneTieBa] integer,' +
                '[LastUpdateTime] TEXT,' +
                'PRIMARY KEY ([TieziID]));';

                //'[LastUpdateTime] TEXT);';

                slDataBase.ExecSQL(sSQL);

          finally
            slDataBase.Free;
          end;



            UniConnection_Spit := TUniConnection.Create(nil);
            try
                //Linshi_slDBpath := ':memory:';

                Linshi_String := 'Provider Name=SQLite;';
                Linshi_String := Linshi_String + 'Database=' + SplitDirectory + ';';
                Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                Linshi_String := Linshi_String + 'Use Unicode=false;';
                Linshi_String := Linshi_String + 'Login Prompt=False';

                UniConnection_Spit.ConnectString := Linshi_String;

                UniConnection_Spit.Password := 'SYNCHRONOUSNORMAL';


                UniConnection_Spit.Connected := True;
                UniConnection_Spit.Connected := False;


//                sSQL :=
//                //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//                'CREATE TABLE SeeLiangTieziList (' +
//                '[FloorDetails] TEXT,' +
//                '[TieziID] INTEGER NOT NULL,' +
//                '[TieBaName] TEXT,' +
//                '[TitleName] TEXT,' +
//                '[TieZiContent] TEXT,' +
//                '[DeleteOrNot] integer NOT NULL,' +
//                '[CanReplyOrNot] integer,' +
//                '[FloorCount] integer,' +
//                '[Createtime] TEXT,' +
//                '[FollowCountForOneTieBa] integer,' +
//                '[TotalPostForOneTieBa] integer,' +
//                '[LastUpdateTime] TEXT,' +
//                'PRIMARY KEY ([TieziID]));';
//                UniConnection_Spit.ExecSQL(sSQL);


    //            UniQuery_Move := TUniQuery.Create(nil);
    //            UniQuery_Move.Connection := UniConnection_Move;

                //UniConnection_Spit.ExecSQL('ATTACH DATABASE "' + ExtractFilepath(application.exename) + 'SaveDugInfo.db3" AS hrr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                //SourceDBaseDire
                UniConnection_Spit.ExecSQL('ATTACH DATABASE "' + SourceDBaseDire + '" AS hrr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                sSQL := 'replace into SeeLiangTieziList select * from [hrr].SeeLiangTieziList where Createtime like "' +  LinshiCreateTime + '%" and ' + WHereSql;
                UniConnection_Spit.ExecSQL(sSQL);
                UniConnection_Spit.ExecSQL('DETACH DATABASE "hrr"');
            finally
                UniConnection_Spit.Free;
            end;





//            slDataBase.ExecSQL('ATTACH DATABASE "' + Trim(ExtractFilepath(application.exename)) + 'SaveDugInfo.db3" AS hrr');
//            sSQL := 'replace into SeeLiangTieziList select * from [hrr].SeeLiangTieziList where Createtime like "' +  LinshiCreateTime + '%"';
//            slDataBase.BeginTransaction;
//            slDataBase.ExecSQL(sSQL);
//            slDataBase.Commit;
//            slDataBase.ExecSQL('DETACH DATABASE "hrr"');


          UniQuery_Move.Next;
        end;
        FinalQuerySqlInuni(UniQuery_Move);




//      UniQuery_Move1 := TUniQuery.Create(nil);
//      UniQuery_Move1.Connection := UniConnection_Move;

      //UniConnection_Move.ExecSQL('ATTACH DATABASE "' + DestinFileDir + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));

//      ttcs0 := StrToInt(QueryString(UniQuery_Move, 'select count(1) from [hr].SeeLiangTieziList'));

//      mindate := MyStringtoDateTime(QueryString(UniQuery_Move, 'SELECT MIN(Createtime) FROM SeeLiangTieziList WHERE Createtime <> '''''));
//      maxdate := MyStringtoDateTime(QueryString(UniQuery_Move, 'SELECT MAX(Createtime) FROM SeeLiangTieziList WHERE Createtime <> '''''));
//
//      Differencedays :=  Trunc(maxdate -  mindate);
//
//      if Differencedays > RestrictDays then
//      begin
//          maxdate := IncDay(maxdate, 0 - RestrictDays);
//
//          UniConnection_Move.ExecSQL('delete from SeeLiangTieziList where Createtime<=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', maxdate)));
//
//          ttcs1 := StrToInt(QueryString(UniQuery_Move, 'select count(1) from [hr].SeeLiangTieziList'));
//
//          GErrorInfo := '';
//          Gchangedcount := IntToStr(ttcs0 - ttcs1);
//      end
//      else
//      begin
//        GErrorInfo := '';
//        Gchangedcount := '0';
//      end;

      //UniConnection_Move.ExecSQL('DETACH DATABASE "hr"');
      UniQuery_Move.Connection := nil;
      UniQuery_Move.Free;

//      UniQuery_Move1.Connection := nil;
//      UniQuery_Move1.Free;

      UniConnection_Move.Free;

      //GErrorInfo := '';
  //except //on E: Exception do
    //begin
      //GErrorInfo := e.Message;
      //Gchangedcount := '';
    //end;
  //end;
end;

end.

