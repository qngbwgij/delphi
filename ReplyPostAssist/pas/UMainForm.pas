unit UMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, UPublic, Vcl.Menus, CnClasses,
  CnTrayIcon, Vcl.StdCtrls, RzLabel, RzButton, Vcl.Mask, RzEdit, RzCmboBx,
  RzPanel, Vcl.ExtCtrls, RzSplit, Vcl.Buttons, main, UinstanceHua, RzRadChk,
  Vcl.Samples.Spin, UGlobalPublic_VersionControl, UGlobalPublic_Function, SQLiteTable3,
  RzStatus, Vcl.AppEvnts, UGlobalPublic_IE, System.Actions, Vcl.ActnList,
  System.StrUtils, System.RegularExpressions, uThrdPoolClass, System.Math, UPublicEX,
  Winapi.ShellAPI, Winapi.UrlMon, Winapi.WinInet, UniProvider, SQLiteUniProvider,
  Vcl.ComCtrls, Uni, System.DateUtils, UGetMacAddress;

type
  TFrmBaseForm1 = class(TFrmBaseForm)
    RzPanelPS: TRzPanel;
    RzMemo_PlanScheme: TRzMemo;
    RzPanelControlPos: TRzPanel;
    SpeedButtonDown: TSpeedButton;
    SpeedButtonUp: TSpeedButton;
    SpinEdit_hour: TSpinEdit;
    Label1: TLabel;
    SpinEdit_minute: TSpinEdit;
    Label2: TLabel;
    SpinEdit_second: TSpinEdit;
    Label3: TLabel;
    rbStart: TRzButton;
    RzButtonSetPlanScheme: TRzButton;
    RzCheckBoxExploer: TRzCheckBox;
    RzCheckBoxOnePostOneAccount: TRzComboBox;
    RzCheckBoxshudown: TRzCheckBox;
    RzEditTestTieZiID: TRzEdit;
    RzLabel1: TRzLabel;
    ActionList1: TActionList;
    ActionInterfaceMode: TAction;
    Action_setintervaltime: TAction;
    ActionRestrictUseConfig: TAction;
    Actiontestreadandwrite: TAction;
    ActionTestGetMacAddress: TAction;
    ActionHttpPostSingleThread: TAction;
    ActionHttpPostMulThread: TAction;
    ActionUpdate: TAction;
    ActionQunFaWeiXin: TAction;
    RzCheckBoxSamePlan: TRzCheckBox;
    SpinEditPostCount: TSpinEdit;
    SQLiteUniProvider1: TSQLiteUniProvider;
    RzComboBoxWorkTimesType: TRzComboBox;
    RzEditWorkTimes: TRzEdit;
    ActionOnlineSearchMode: TAction;
    ProgressBar1: TProgressBar;
    ActionOnlineSearchTieba: TAction;
    ActionOnlineSearchPostID: TAction;
    RzCheckBoxDeleteDownloadedFiles: TRzCheckBox;
    SpinEditDays: TSpinEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzComboBoxRoutine: TRzComboBox;
    RzCheckBoxDownloadCheckedMode: TAction;
    SpeedButtonRestart: TSpeedButton;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEdit3: TRzEdit;
    RzEdit4: TRzEdit;
    RzEdit5: TRzEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer4Timer(Sender: TObject);
    procedure Action_setintervaltimeExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RzButtonSetPlanSchemeClick(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure rbStartClick(Sender: TObject);
    procedure ActionInterfaceModeExecute(Sender: TObject);
    procedure RzMemo_PlanSchemeExit(Sender: TObject);
    procedure SpeedButtonUpClick(Sender: TObject);
    procedure SpeedButtonDownClick(Sender: TObject);
    procedure RzCheckBoxSamePlanClick(Sender: TObject);
    procedure ActionOnlineSearchModeExecute(Sender: TObject);
    procedure SpeedButtonRestartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    //procedure RzCheckBoxDownloadClick(Sender: TObject);
    //procedure SpinEditTotalThreadChange(Sender: TObject);
    //procedure RzCheckBoxDownloadCheckedModeExecute(Sender: TObject);
  private
    { Private declarations }
    Pri_FloorDetails: string;
    Pri_CanReplyOrNot: string;
    Pri_DeleteOrNot: string;
    Pri_FloorCount: string;
    Pri_FollowCountForOneTieBa: string;
    Pri_TotalPostForOneTieBa: string;
    PriBaName: string;

    Pri_FloorDetails_subfloorreply: string;
    Pri_FloorDetails_pos: Integer;
    Pri_TieziID: string;
    Pri_TieziIDFileNmae: string;
    repeatedFatieCount: string;

    Pri_BarName: string;
    Pri_Topic: string;
    Pri_Content: string;


    Pri_CreateTime: string;


    procedure PopAdvertisement;
    procedure ExecuteSamePlanDifferentLoginACC(PassPlanSchemeConfigIndex: string; Pass_i_Circulations: Integer);
    procedure ExecuteNonSamePlanDifferentLoginACC;


//    resetAddedTieziDatabase_recordlist: TStringList;//记录所有方案下是否已经对新增贴的数据库初始化
//    resetOnlineSearchedofTieziDatabase_recordlist: TStringList;//记录所有方案下是否已经对在线搜索出的贴的数据库初始化



    function SubFloorReply(RealWhichFloor: string; WhichFloor: Integer; WhichReplyPoint: Integer; WHichPasteContent: string): Boolean;
    procedure ScrollToSpecifyFloor(iFloor: Integer); //滚动到第几楼
    procedure ScrollTospecifyLoca(iFloor: Integer;addv: Integer); //滚动到第几楼
    function GetHuiFuButtonPoint_JS(iFloor: Integer; var InputPlaceEx_JS: TPoint): Boolean;
    procedure CLickHuiFuButton(iFloor: Integer); //点击回复
    function GetInputContentKuangPoint_JS(iFloor: Integer; sourcekind: Integer;var InputPlaceEx_JS: TPoint): Boolean;
    procedure InputContentToSpecifyFloor(iFloor: Integer; sPasteContent: string);
    procedure GetSubmitButtonForOneFloorPoint_JS(iFloor: Integer; sourcekind: Integer; var InputPlaceEx_JS: TPoint);
    procedure SubmitToSpecifyFloor(iFloor: Integer; sPasteContent: string);
    function GetWoYeShuoYiJuButtonPoint_JS(iFloor: Integer; var InputPlaceEx_JS: TPoint): Boolean;
    procedure CLickWoYeShuoYiJuButton(iFloor: Integer); //点击我也说一句


    procedure LoadDataFromFile;
    procedure LoadDataFromDb;

    procedure SaveDataIntoFile;
    procedure SaveDataIntoDb;

    procedure RzMemoLogLinesAddEX(sourStr: string; conPerTieziURL: string);

    function GetValidCountOfList: Integer;
    function GetValidCountOfListEX: Integer;
    function GetPlanIndex: Integer;

    procedure ShowProgressInmemo(var Msg: TMessage); message WM_USER + 101;
    procedure Showerror(var Msg: TMessage); message WM_USER + 102;
    procedure PromptQuit(var Msg: TMessage); message WM_USER + 103;
  public
    { Public declarations }
    Action1_Tag: Integer;
    Action1_Tag1: Integer;
    G_TimerInterval: Integer;

    procedure disableSomething;
    procedure enableSomething;


//    procedure disableSomethingEX;
//    procedure enableSomethingEX;



   function GetLoginedAccount: string;
   procedure SetProxy(username, password, proxy: ansistring);

    function GetPublishContent(tz_index: Integer): string;
    function GetCoreContent(tz_index: Integer): string;
    function GetCoreContentForRandomize(sDingTieContList: string): string;
    function GetCoreContentForSequence(sDingTieContList: string): string;
  end;

var
  FrmBaseForm1: TFrmBaseForm1;

implementation

{$R *.dfm}

uses
USetPlanScheme;

procedure TFrmBaseForm1.ActionInterfaceModeExecute(Sender: TObject);
var
  whichProxy: Integer;
  whichProxyindex: Integer;

  setproxyrightorwrong: Boolean;
  setproxyrightorwrongsth: string;
  tempserverIP: string;
  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;

  gtc1, gtc2: DWORD;
  isNeedSaving: Boolean;
  VarFeedbackIn: string;
  i: Int64;
  iii: Integer;
  ii: Integer;
  PlanInd: Integer;
  Existss: Boolean;
  SourceText: string;

  PasteContent_total: string;

  posPasteContenttotal: Integer;
  PasteContent: string;
  PasteContent_Main: string;
  posPasteContent_Main: Integer;
  PatternForHttps: string;

  matchs: TMatchCollection;
  match: TMatch;
  matchvalue: string;
  matchCoun: Integer;
  //Stringarr: array of string;
  Stringarr: array of TVarRec;
  formatori: string;
  JScript: string;


  n: Integer;
  arr: array[0..255] of Char;
  oldHtmlSourceCode: string;
  submittype: Integer;
  PerTieziURL: string;
  InputPlaceEx_JS: TPoint;
  Linshi_Circulations, i_Circulations: Integer;
  Max_tiezi_ID: Int64;
  addContent: string;
  Updatesqll, Insertsqll: string;
  Linshi_String: string;
  PlanSchemeTable: TSQLiteTable;
  TotalPlansCheme: Integer;
  isReplyinsubFloor: Boolean;
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

  //Temp_onlyForwechat: string;
  SpinEditStartPostIdText: string;
  Temp_onlyForMainFloor: string;

  Temp_add: string;
  Temp_add_Pervalue: string;
  Temp_addlist: TStringList;
  Temp_substract: string;

  succsulFatie: Boolean;


  TheCopyTableAct: TGetFullfilledMemoryTable;
  TheCopyTableAct2: TGetMaxDateInDataBase;
  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;

  TheCopyTableAct3: TGetAddedPostToTempTable;
  VarHint: string;
  AATProxyEX: TInstActionProxy;

  TempPlanScheme_index: string;
  TempPlanScheme_PlanName: string;

  slDataBase: TSQLiteDatabase;
  sSQL: string;


 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;

  F: TextFile;
  //i: integer;
  fileStr: string;
  strfileName: string;
  Firststr,SecondStr: string;


  SetCacheDir: string;
  inputtext: string;

  LoginedAcc: string;
  linshiPoint: TPoint;
  CI: TCursorInfo;

  function SatisfyRestrict: Boolean;
  begin
    Result := False;
    if Linshi_Circulations > 0 then
    begin
      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
      begin
        if i_Circulations = 0 then
          Result := True;
      end
      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
      begin
        if (Action1_Tag - 1) = Linshi_Circulations then
        begin
          Result := True;
        end;
      end
    end;
    DelayEx(10);
  end;

  function judgeMustReplyInSecondFloor(var varsuccsulFatie: Boolean): Boolean;
  var
    linshi_strlist: TStringList;
    linshi_singlestr: string;
    SymboPos: Integer;
    strFoorNo: string;
    strReplyNum: string;
  begin
    Result := False;
    if Pri_FloorDetails = '' then
      Exit;

    linshi_strlist := TStringList.Create;
    try
      linshi_strlist.Delimiter := '|';
      linshi_strlist.DelimitedText := Pri_FloorDetails;

      if linshi_strlist.Count < 6 then
        Exit;
       //2楼分析
      linshi_singlestr := linshi_strlist.Strings[1];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;

       //3楼分析
      linshi_singlestr := linshi_strlist.Strings[2];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;

         //4楼分析
      linshi_singlestr := linshi_strlist.Strings[3];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;


       //5楼分析
      linshi_singlestr := linshi_strlist.Strings[4];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;

    finally
      linshi_strlist.Free;
    end;

  end;

  function IsDeletedOrNoReplyTieZi(var FeedbackIn: string): Boolean;
  var
    JsScriptstr: string;
    replynum: string;
    cardmenNum: string;   //关注数
    cardinfoNum: string;  //贴吧总贴子数
    posterwarning: string;
  begin
    Result := True;

    G_InputP := '';
    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("head")[0]) var blanks=1;else var blanks=0;' + 'alert(blanks);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第1个');
    end;
    if G_InputP <> '1' then
    begin
      G_InputP := '';

      FeedbackIn := '空白页面！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("title")[0].innerText=="403 Forbidden") var Forbiddens=1;else var Forbiddens=0;' + 'alert(Forbiddens);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第2个');
    end;
    if G_InputP = '1' then
    begin
      G_InputP := '';

      FeedbackIn := '无法正常打开贴子！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementById("errorText")) ' + 'var isdelete=1; else var isdelete=0;' + 'alert(isdelete);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第3个');
    end;
    if G_InputP = '0' then
    begin

    end
    else if G_InputP = '1' then
    begin
      //Pri_DeleteOrNot := '1';
      G_InputP := '';

      FeedbackIn := '该贴已不存在或无法回复或已删除！';
      Pri_DeleteOrNot := '1';
      isNeedSaving := True;
      Exit;
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '判定是否删除出错！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr :=
    'try{' +
      'var element=document.getElementsByClassName("l_reply_num")[0];' +
      'var first=element.children[0];' +
      'var replynum=first.innerText;' +
      'var Z = replynum;' +
      'Z+="|";' +
      'alert(Z);' +
    '}' +
      'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第4个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      replynum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      replynum := StringReplace(replynum, ',', '', [rfReplaceAll]);

      Pri_FloorCount := replynum;
      Pri_DeleteOrNot := '0';

      G_InputP := '';
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '找回复数出错，可能是空白页！';

      Exit;
    end;
//
//    JsScriptstr :=
//    'try{' +
//      'var posterwarning=0;' +
//      //'if (document.getElementsByClassName("tb_poster_info poster_warning"))' +
//
//      'if (document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable")[0])' +
//         '{' +
////         'var posterwarningelement=document.getElementsByClassName("tb_poster_info poster_warning")[0];' +
////         'if (posterwarningelement.children[0]) {' +
////         'var posterwarningchild=posterwarningelement.children[0];' +
////         'var posterwarninginnertext=posterwarningchild.innerText;' +
////         'posterwarning=parseInt(posterwarninginnertext);' +
////         '} else posterwarning=100;' +
//
//
//         'posterwarning=100;' +
//
//
//
//         '}' +
//         'else posterwarning=0;' +
//         'var Z = posterwarning;' +
//         'Z+="|";' +
//         'alert(Z);' +
//    '}' +
//      'catch(e)' +
//      '{alert(e)}';
//
//
//    JsScriptstr := 'alert(document.body.innerHTML)';
//    MainForm.ExeJs(JsScriptstr);
//    while G_InputP = '' do
//    begin
//      DelayEX(100);
//      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第5个');
//    end;


//
//    if Pos('tb_poster_info poster_warning', G_InputP) > 0 then
//    begin
//      ShowMessageEX('1');
//    end
//    else
//    begin
//      ShowMessageEX('2');
//    end;
//
//    if Pos('ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
//    end;
//
//    if Pos('抱歉', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
////    end;
//
//    Abort;
//
//    if Pos('|', G_InputP) > 0 then
//    begin
//      posterwarning := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := posterwarning;
//    end
//    else if Pos('children', G_InputP) > 0 then
//    begin
//      posterwarning := '0';
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := '0';
//    end
//    else
//    begin
//      FeedbackIn := '找警告信息出错！';
//
//      Exit;
//    end;
//    if Pri_CanReplyOrNot = 'NaN' then
//    begin
//      FeedbackIn := '警告信息十分罕见！';
//      Exit;
//    end;


    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_menNum")[0]) var element=document.getElementsByClassName("card_menNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[0];' + 'var cardmenNum=element.innerText;' + 'var Z = cardmenNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第6个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardmenNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardmenNum := StringReplace(cardmenNum, ',', '', [rfReplaceAll]);

      Pri_FollowCountForOneTieBa := cardmenNum;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_infoNum")[0]) var element=document.getElementsByClassName("card_infoNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' + 'var cardinfoNum=element.innerText;' + 'var Z = cardinfoNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第7个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardinfoNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      Pri_TotalPostForOneTieBa := cardinfoNum;
    end;
    G_InputP := '';

    //JsScriptstr := 'try{' + 'var oP = document.getElementsByClassName("core_reply_tail clearfix");' + 'var OutPtInfo = "";' + 'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' + 'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' + 'var tailinfoFloorNo=parseInt(tailinfo);' + 'if (tailinfoFloorNo==1) var unfoldcount=0;else ' + '{' + 'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' + 'if (unfoldcount=="") unfoldcount=0;' + '}' + 'tailinfoFloorNo+="=";' + 'tailinfoFloorNo+=unfoldcount;' + 'OutPtInfo+="|";' + 'OutPtInfo+=tailinfoFloorNo;' + '}' + 'OutPtInfo+="|";' + 'OutPtInfo+=oP.length;' + 'alert(OutPtInfo);' + '}' + 'catch(e)' + '{alert(e)}';
    JsScriptstr :=
    'try{' +
       'var oP = document.getElementsByClassName("core_reply_tail clearfix");' +
       'var OutPtInfo = "";' +
       'for(var i = 0; i < oP.length; i++)' +
         '{' +
         'var element=oP[i];' +
         'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
         'var tailinfoFloorNo=parseInt(tailinfo);' +
         'if (tailinfoFloorNo>=2018) {' +
            'tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
            'tailinfoFloorNo=parseInt(tailinfo);' +
            '}' +
         'if (tailinfoFloorNo==1) var unfoldcount=0;else ' +
            '{' +
            'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' +
            'if (unfoldcount=="") unfoldcount=0;' +
            '}' +
         'tailinfoFloorNo+="=";' +
         'tailinfoFloorNo+=unfoldcount;' +
         'OutPtInfo+="|";' +
         'OutPtInfo+=tailinfoFloorNo;' +
         '}' +
       'OutPtInfo+="|";' +
       'OutPtInfo+=oP.length;' +
       'alert(OutPtInfo);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第8个');
    end;
    if (G_InputP <> '|0') and (Pos('|', G_InputP) > 0) then
    begin
      Pri_FloorDetails_pos := LastPos('|', G_InputP);

      Pri_FloorDetails := Copy(G_InputP, 2, Pri_FloorDetails_pos - 2);
      Pri_FloorDetails_subfloorreply := Copy(G_InputP, Pri_FloorDetails_pos + 1, Length(G_InputP) - Pri_FloorDetails_pos);

    end;

    G_InputP := '';

//保存所有信息

//    if Pri_CanReplyOrNot <> '0' then
//    begin
//      FeedbackIn := '有等级要求无法回复！';
//
//      isNeedSaving := true;
//
//      Exit;
//    end;

    isNeedSaving := true;
    Result := False;
  end;

begin
  if b_isRuning then
    Exit;

  b_isRuning := True;


  //LoadProxyIP;
  whichProxy := -1;
  disableSomething;

  try
    TotalPlansCheme := GetValidCountOfList;
    if TotalPlansCheme < 1 then
    begin
      ShowMessageEX('无方案配置可用！');
      Exit;
    end;

//    Automatic_Mode := 2;
//    submittype := StrToInt(QueryString('SELECT Submit_Type FROM SystemInfo'));
    Linshi_Circulations := StrToIntDef(Trim(RzEditWorkTimes.Text), 0);
    if Linshi_Circulations < 0 then
      Linshi_Circulations := 0;

    i_Circulations := Linshi_Circulations;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_i_CirculationsForRestart then
      begin
        i_Circulations := StrToInt(ParamStr(2));
        UsedOrNot_i_CirculationsForRestart := True;
      end;
    end;

    //Max_tiezi_ID := GetMax_tiezi_ID;

    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart then
      begin
        Action1_Tag := StrToInt(ParamStr(3));
        UsedOrNot_Action1_TagForRestart := True;
      end;
    end;
    Action1_Tag1 := 1;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart1 then
      begin
        Action1_Tag1 := StrToInt(ParamStr(4));
        UsedOrNot_Action1_TagForRestart1 := True;
      end;
    end;




    repeat
      RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作开始' + #13#10#13#10#13#10);
      RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作开始' + #13#10#13#10#13#10);

      try
        EnterCriticalSection(CS);
        PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
        'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
        'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
        'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
        ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
        ' OnlyForWechat, OnlyMainFloor  ' +
        'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' +
        IntToStr(TotalPlansCheme));
        LeaveCriticalSection(CS);

        try
          PlanSchemeTable.MoveFirst;
          while not PlanSchemeTable.EOF do
          begin
            VarHint := rbStart.Caption;
            rbStart.Caption := '';
            with THandleWaitings.create(100) do
            try
                iniWaiting(rbstart, 7, 7);



                    if RzCheckBoxSamePlan.Checked and (not PlanSchemeTable.BOF) then
                    begin
    //                  Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
    //                  Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
    //                  Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
    //                  Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
    //                  Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
    //                  Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
    //                  Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
    //                  Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
    //                  Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
    //                  Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
    //                  Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
    //                  Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
    //                  Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
    //                  Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);
    //
    //
    //                  Temp_add := PlanSchemeTable.FieldAsString(15);
    //                  Temp_substract := PlanSchemeTable.FieldAsString(16);
                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                      if b_Debug then
                      begin
                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                      end;

    //                  Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
    //                  Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
                    end
                    else
                    //if PlanSchemeTable.BOF then
                    begin
                      Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
                      Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
                      Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
                      Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
                      Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
                      Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
                      Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
                      Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
                      Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
                      Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
                      Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
                      Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
                      Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
                      Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);


                      Temp_add := PlanSchemeTable.FieldAsString(15);
                      Temp_substract := PlanSchemeTable.FieldAsString(16);
                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                      if b_Debug then
                      begin
                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                      end;

                      //Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
                      SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
                      Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
                    end;

                if not (StrToInt64Def(Trim(RzEditTestTieZiID.Text), 0) > 0) then
                begin
    //                if Temp_onlyForwechat = '1' then
    //                begin
    //                  PlanSchemeTable.Next;
    //                  Continue;
    //                end;

                    if (ParamCount>=1) then
                    begin
                      if not UsedOrNot_PlanindexForRestart then
                      begin
                        if StrToInt(TempPlanScheme_index) < StrToInt(ParamStr(1)) then
                        begin
                          PlanSchemeTable.Next;
                          Continue;
                        end
                        else
                        begin
                          UsedOrNot_PlanindexForRestart := True;
                        end;
                      end;
                    end;

//                    if RzCheckBoxCheckLoginedAcc.Checked then
//                    begin
//                      LoginedAcc := GetLoginedAccount;
//                      if (LoginedAcc = '') or (LoginedAcc <> SetCacheDirectoryNa) then
//                      begin
//                        ShowMessageEX('当前没有登录任何账号或登录的账号不对');
//                        Abort;
//                      end;
//
//                    end
//                    else
//                    begin
                      LoginedAcc := SetCacheDirectoryNa;
                    //end;


                    if LoginedAcc <> Temp_usedAcc then
                    begin
                      CnTrayIcon1.Tag := 1;
                      Restart_Flag := True;
                      PlanindexForRestart := TempPlanScheme_index;
                      i_CirculationsForRestart := IntToStr(i_Circulations);
                      Pri_TieziIDForRestart := Pri_TieziID;
                      Action1_TagForRestart := IntToStr(Action1_Tag);
                      Action1_TagForRestart1 := IntToStr(Action1_Tag1);

                      RzComboBoxWillLoginAcc.ItemIndex := RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc);
                      self.Close;
                      Abort;

                      {strfileName := ExtractFilePath(Application.ExeName) + 'Save\CacheNameConfig.txt';
                      if fileexists(strfileName) then
                        DeleteFile(strfileName);

                      AssignFile(F, strfileName);
                      try
                        if fileexists(strfileName) then
                          append(F)
                        else
                          rewrite(F);

                        inputtext := '0';
                        Writeln(F, inputtext);                 //写日志里


                      finally
                        CloseFile(F);                        //关闭文件流
                      end;


                      AssignFile(F, strfileName);
                      try
                        if fileexists(strfileName) then
                          append(F)
                        else
                          rewrite(F);

                        inputtext := IntToStr(RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc));
                        Writeln(F, inputtext);                 //写日志里


                      finally
                        CloseFile(F);                        //关闭文件流
                      end;

                      if RzComboBoxWillLoginAcc.Items.Count > 0 then
                      for ii := 0 to RzComboBoxWillLoginAcc.Items.Count - 1 do
                      begin
                        AssignFile(F, strfileName);
                        try
                          if fileexists(strfileName) then
                            append(F)
                          else
                            rewrite(F);

                          inputtext := RzComboBoxWillLoginAcc.Items.Strings[ii];
                          Writeln(F, inputtext);                 //写日志里


                        finally
                          CloseFile(F);                        //关闭文件流
                        end;
                      end; }
                    end;




                //if not (b_Debug and (StrToInt64Def(Trim(RzEditTestTieZiID.Text), 0) > 0)) then

                    TemptDirectory := APPCommonPath + 'temp.temp';

                    if RzCheckBoxSamePlan.Checked and ((not PlanSchemeTable.BOF) or (Action1_Tag1 > 1)) then
                    begin
                      if not FileExists(TemptDirectory) then
                      begin
                        ShowMessageEX('符合条件的上一方案对应贴子临时文件不存在');
                        Abort;
                      end;

                      AATProxyEX := TInstActionProxy.create;
                      AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                      AATProxyEX.StartWork; //开始工作
                      try
                          TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                          if (ParamCount>=1) then
                          begin
                            if Trim(ParamStr(5)) <> '' then
                            begin
                              if not UsedOrNot_Pri_TieziIDForRestart then
                              begin
                                Pri_TieziID := ParamStr(5);
                                UsedOrNot_Pri_TieziIDForRestart := True;
                              end;
                            end;
                          end;

                          TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
                          AATProxyEX.AddAction(TheCopyTableAct1);
                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                      finally
                          AATProxyEX.Free;
                      end;


                    end
                    else
                    begin
                        if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                        try
                            sSQL :=
                              'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                              '[TieziID] integer NOT NULL,' +
                              '[FileMing] TEXT NOT NULL,' +
                              'PRIMARY KEY ([TieziID],[FileMing]));';

        //                      sSQL :=
        //                      //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
        //                      //'CREATE TABLE SeeLiangTieziList (' +
        //                      'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
        //                      '[FloorDetails] TEXT,' +
        //                      '[TieziID] INTEGER NOT NULL,' +
        //                      '[TieBaName] TEXT,' +
        //                      '[TitleName] TEXT,' +
        //                      '[TieZiContent] TEXT,' +
        //                      '[DeleteOrNot] integer NOT NULL,' +
        //                      '[CanReplyOrNot] integer,' +
        //                      '[FloorCount] integer,' +
        //                      '[Createtime] TEXT,' +
        //                      '[FollowCountForOneTieBa] integer,' +
        //                      '[TotalPostForOneTieBa] integer,' +
        //                      '[LastUpdateTime] TEXT,' +
        //                      'PRIMARY KEY ([TieziID]));';
        //
        //                      //'[LastUpdateTime] TEXT);';

                              slDataBase.ExecSQL(sSQL);

                        finally
                          slDataBase.Free;
                        end;


                        //add.temp
                        //if Temp_add then
                        //if Pos('%%%%%', Temp_add) > 0 then
                        if Trim(Temp_add) <> '' then
                        begin
                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;

                          try
//                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) >= 0 then
//                              begin
//                                  TemptDirectory1 := APPCommonPath + relativePasth + 'add' + TempPlanScheme_index + '.temp';
//                                  if not FileExists(TemptDirectory1) then
//                                  begin
//                                    ShowMessageEX('额外新增贴所在的临时文件被删除');
//                                    Abort;
//                                  end;
//
//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
//                                  try
//                                    if not slDataBase.TableExists('SeeLiangTieziList') then
//                                    begin
//                                      ShowMessageEX('额外新增贴所在的临时文件被修改');
//                                      Abort;
//                                    end;
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//                              end
//                              else
//                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) < 0 then
                              begin

                                  TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_index + '.temp';
                                  if not FileExists(TemptDirectory1) then //DeleteFile(TemptDirectory1);
                                  begin
                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                  try
        //                                sSQL :=
        //                                'CREATE TABLE SaveSomeTieziID (' +
        //                                '[TieziID] integer NOT NULL,' +
        //                                '[FileMing] TEXT NOT NULL,' +
        //                                'PRIMARY KEY ([TieziID]));';

                                        sSQL :=
                                        //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                        'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                        //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                        slDataBase.ExecSQL(sSQL);

                                  finally
                                    slDataBase.Free;
                                  end;


                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                  try
                                        slDataBase.BeginTransaction;

                                        try
                                          for ii := 0 to Temp_addlist.Count - 1 do
                                          begin
                                            Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
                                            if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
                                            begin
                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
                                              QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
                                              slDataBase.ExecSQL(sSQL);
                                            end;
                                          end;
                                        finally
                                          slDataBase.Commit;
                                        end;
                                  finally
                                    slDataBase.Free;
                                  end;



                                  //resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
                                  end;
                              end;





                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin

                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try
                                          //TheCopyTableAct3: TGetAddedPostToTempTable;
                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                              if RzCheckBoxSamePlan.Checked then
                                              begin
                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                              end;

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                              end
                              else
                              begin
                                  suDBNameList := TStringList.Create;

                                  try
                                           SourceFileDir := APPCommonPath + relativePasth;

                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                           while found=0 do
                                           begin
                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                               and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                               then
                                               begin
                                                 suDBName := SearchRec.Name;
                                                 suDBNameList.Add(suDBName);
                                               end;
                                               found:=FindNext(SearchRec);
                                           end;
                                           FindClose(SearchRec);


                                           suDBNameListCount := suDBNameList.Count;

                                           if suDBNameListCount < 1 then
                                           begin
                                              ShowMessageEX('数据源不存在');
                                              Exit;
                                           end;


                                           SetLength(MaxCreatetimeList, suDBNameListCount);


                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

                                              if Temp_LastHowManyDays <> '0' then
                                              begin

                                                  for J := 0 to suDBNameListCount - 1 do
                                                  begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                                    TheCopyTableAct2.iSerialNo := J;
                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                    AATProxyEX.AddAction(TheCopyTableAct2);
                                                  end;
                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                              end;
                                              SetLength(MaxCreatetimeList, 0);



                                              for J := 0 to suDBNameListCount - 1 do
                                              begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                                    with TheCopyTableAct do
                                                    begin
                                                        iSerialNo := J;
                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                        WenJianMing := Trim(suDBNameList.Strings[J]);

                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                        Ba_dingtie_type := Temp_dingtie_type;
                                                        Ba_dingtie_content := Temp_dingtie_content;

                                                        Ba_add := Temp_add;
                                                        Ba_substract := Temp_substract;


                                                        if b_Debug then
                                                        begin
                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                        end;

                                                      //Ba_add, Ba_substract: string;
                                                    end;
                                                    AATProxyEX.AddAction(TheCopyTableAct);
                                              end;
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
                                              if RzCheckBoxSamePlan.Checked then
                                              begin
                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                                  finally
                                         suDBNameList.free;
                                  end;
                              end;
                          finally
                            Temp_addlist.Free;
                          end;





                        end
                        else
                        begin

                            suDBNameList := TStringList.Create;

                            try
                                     SourceFileDir := APPCommonPath + relativePasth;

                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                     while found=0 do
                                     begin
                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                         and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                         then
                                         begin
                                           suDBName := SearchRec.Name;
                                           suDBNameList.Add(suDBName);
                                         end;
                                         found:=FindNext(SearchRec);
                                     end;
                                     FindClose(SearchRec);


                                     suDBNameListCount := suDBNameList.Count;

                                     if suDBNameListCount < 1 then
                                     begin
                                        ShowMessageEX('数据源不存在');
                                        Exit;
                                     end;


                                     SetLength(MaxCreatetimeList, suDBNameListCount);


                                    AATProxyEX := TInstActionProxy.create;
                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        if Temp_LastHowManyDays <> '0' then
                                        begin

                                            for J := 0 to suDBNameListCount - 1 do
                                            begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                              TheCopyTableAct2.iSerialNo := J;
                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                              AATProxyEX.AddAction(TheCopyTableAct2);
                                            end;
                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                        end;
                                        SetLength(MaxCreatetimeList, 0);



                                        for J := 0 to suDBNameListCount - 1 do
                                        begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                              with TheCopyTableAct do
                                              begin
                                                  iSerialNo := J;
                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                  WenJianMing := Trim(suDBNameList.Strings[J]);

                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                  Ba_dingtie_type := Temp_dingtie_type;
                                                  Ba_dingtie_content := Temp_dingtie_content;

                                                  Ba_add := Temp_add;
                                                  Ba_substract := Temp_substract;

                                                  if b_Debug then
                                                  begin
                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                  end;

                                                //Ba_add, Ba_substract: string;
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct);
                                        end;
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
                                        if RzCheckBoxSamePlan.Checked then
                                        begin
                                          if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                            TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                        end;
                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                            finally
                                   suDBNameList.free;
                            end;
                        end;
                    end;
                end
                else
                begin
                  initializeSqliteMemoryTable;
                  //ImportRelatedTieziIDToMemoryTable;      //'[FileMing] TEXT NOT NULL,' +
                  sSQL := 'insert into SaveSomeTieziID (TieziID, FileMing) values (' + Trim(RzEditTestTieZiID.Text) + ', '''')';
                  MemorySqlite_InUniConnection.ExecSQL(sSQL);
                  //MemorySqlite_InUniConnection.ExecSQL('DETACH DATABASE "hr"');
                  SearchOfRecordsCount := '1';
                  QuerySqlInuni(MemorySqliteTable_InUniConnection, 'select TieziID,  FileMing from SaveSomeTieziID');
                end;


            finally
              finalWaiting;
              rbStart.Caption := VarHint;
            end;

            if MemorySqliteTable_InUniConnection.RecordCount = 0 then
            begin
              if b_Debug then
              begin
                RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                RzMemoLogLinesAdd('当前方案下没有任何符合条件的贴子' + #13#10);
                RzMemoLogLinesAdd('是否提前终止的：' + ifthen(StopInAdvance, '是', '否') + #13#10);
              end;
            end;

            StopInAdvance := false;

            try    //MemorySqliteTable_InUniConnection
              MemorySqliteTable_InUniConnection.First;

              GetCoreContentForSequenceTimes := 1;
              CurWhichRecord := 0;
              SucRecordCount := 0;

              while not MemorySqliteTable_InUniConnection.Eof do
              begin
                isNeedSaving := false;
                UsuccessOrnot := False;

//                SearchOfRecordsCount: string;
//                CurWhichRecord: Integer;
//                SucRecordCount: Integer;
                if RzComboBoxRoutine.ItemIndex = 0 then

                 Pri_TieziID := IntToStr(MemorySqliteTable_InUniConnection.Fields[0].AsInteger - 2079619440 + 6374586736)
                else

                if RzComboBoxRoutine.ItemIndex = 1 then
                 Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                if not b_Debug then
                begin
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 0 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
  repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前百度账号已在此贴下发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 1 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('此贴下已发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end;
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 2 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName)
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName));
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前方案下已有在此贴下的回贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end;
                end;

                Pri_TieziIDFileNmae := MemorySqliteTable_InUniConnection.Fields[1].asstring;
                //Pri_TieziID := '6361513183';     //无权回贴
                //Pri_TieziID := '6184821068';     //被删除
                //Pri_TieziID := '6374720646';
                //Pri_TieziID := '6374670634';
                Pri_BarName := '';
                Pri_Topic := '';
                Pri_Content := '';
                Pri_DeleteOrNot := '-1';
                //Pri_CanReplyOrNot := '-1';
                Pri_CanReplyOrNot := '-1';

                Pri_FloorCount := '';
                Pri_FloorDetails := '';
                Pri_FollowCountForOneTieBa := '';
                Pri_TotalPostForOneTieBa := '';

                PerTieziURL := Basic_PostLink + Pri_TieziID;
                RzMemoLogLinesAddEX('●●●开始第' + Pri_TieziID + '个贴子链接处理，' + #13#10
                + '方案名：' + TempPlanScheme_PlanName, PerTieziURL);

                try
                  RzMemoLogLinesAddEX('打开第' + Pri_TieziID + '个贴子链接', PerTieziURL);

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

//                  a:
//                  setproxyrightorwrong := true;
//                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
//                  begin
//                    inc(whichProxy);
//                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);
//
//                    if whichProxyindex = 0 then
//                    begin
//
//                    end
//                    else
//                    begin
//                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
//                      tempPortInfoPos := Pos('|', tempPortInfo);
//                      if tempPortInfoPos > 0 then
//                      begin
//                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
//                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
//                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);
//
//
//                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);
//
//                        //这种情况还不知道怎么处理
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
//                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
//                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
//                      end
//                      else
//                      begin
//
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
//                          RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
//                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
//                      end;
//                    end;
//                  end;
//
//                  if not setproxyrightorwrong then
//                  begin
//                    RzMemoLogLinesAdd(setproxyrightorwrongsth + #13#10 + '进入下一个设置' + #13#10 + #13#10);
//                    goto a;
//                  end;

                  MainForm.Chromium1.LoadUrl(PerTieziURL);
                  MainForm.Chromium1.LoadUrl(PerTieziURL);


                  DelayEX(BasicParamConf.WaitingTimeBeforeLoad);

                  if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  //gtc1 := GetTickCount;
                  while MainForm.bLoading do
                  begin
//                    gtc2 := GetTickCount;
//                    if (gtc2 - gtc1) >= 120000 then
//                    begin
//                      setproxyrightorwrong := true;
//                      goto a;
//                    end;
                    DelayEX(500);
                  end;

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

                  if IsDeletedOrNoReplyTieZi(VarFeedbackIn) then
                  begin
                    RzMemoLogLinesAdd('无效的贴子链接，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                    Continue;
                  end;

                  RzMemoLogLinesAddEX('第' + Pri_TieziID + '个贴子链接' + '为有效链接', PerTieziURL);
                  //CloseP;
                  DelayEx(10);
                  if b_Debug then
                    RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  if RzCheckBoxExploer.Checked then
                    Continue;


                    {

                    PasteContent_total: string;
                    PasteContent: string;
                    PasteContent_Main: string;


                    }


                  if str_Version = '0' then
                  begin
                    PasteContent := '顶一下！';
                    PasteContent_Main := '顶一下！';
                  end
                  else if (str_Version = '1') or (str_Version = '3') then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;
                  end
                  else if str_Version = '2' then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;

                    //PasteContent := PasteContent + '_________________________________________________________________________________________________________________________以上信息来自自动发送软件，欲获取，add wechat official account：花苍比'
                    PasteContent := PasteContent + PropagandaSentence;
                  end;

                  //if RzComboBoxModeChoose.ItemIndex = 0 then Clipboard.SetTextBuf(PChar(PasteContent));


                  if Temp_onlyForMainFloor = '1' then
                  begin
                    ScrolltoBottom;
                    ScrolltoBottom;  //ScrolltoBottomEXE;
                    RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                    DelayEx(1000);
//                    if RzComboBoxModeChoose.ItemIndex = 0 then
//                    begin
//                      GetInputPoint_JS(InputPlaceEx_JS);
//                      SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                      if RzCheckBoxSet_input.Checked then
//                      begin
//                        RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
//
//                        while RzCheckBoxSet_input.Checked do
//                        begin
//                         DelayEx(1000);
//                        end;
//                        RzCheckBoxSet_input.Checked := True;
//
//                        GetInputPoint_JS(InputPlaceEx_JS);
//                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                        hasbawo_set_input := False;
//                        while not hasbawo_set_input do
//                        begin
//                          while RzCheckBoxSet_input.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_input.Checked := True;
//
//                          GetInputPoint_JS(InputPlaceEx_JS);
//                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//                        end;
//                      end;
//
//
//
//
//                      DelayEx(500);
//
//
////                      if PauseOrNot then
////                      begin
////                        RzMemoLogLinesAdd('已暂停！');
////                        while True do
////                        begin
////                          if PauseOrNot then
////                            DelayEx(1000)
////                          else
////                          begin
////                            RzMemoLogLinesAdd('取消暂停！');
////                            GetInputPoint_JS(InputPlaceEx_JS);
////                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////                            Break;
////                          end;
////                        end;
////                      end;
//
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      DelayEx(500);
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      DelayEx(500);
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                      if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
//
//                      DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
//
//                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//                      DelayEx(500);
//
////                      MainForm.CEFWindowParent1.SetFocus;
////                      MainForm.CEFWindowParent1.SetFocus;
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
////                      Delay(50);
////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//
//
//
//                        //找到提交按扭位置
//                        GetSubmitButtonForMainFloor(linshiPoint);
//                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                        begin
//                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                          //Pri_DeleteOrNot := '1';
//                          Exit;
//                        end;
//
//                        SetCursorPos(linshiPoint.x, linshiPoint.y);
//                  //
//                        DelayEX(1000);
//
//
//                        CI.cbSize := SizeOf(CI);
//                        GetCursorInfo(CI);
//                        if CI.hCursor <> HICON(65567) then
//                        begin
//                          Pri_CanReplyOrNot := '100';
//                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
//                          continue;
//                        end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        Delay(50);
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                        //Pri_FloorDetails := Pri_FloorDetailsNew;
//
//                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//
//                      //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                      RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
//                    end
//                    else if RzComboBoxModeChoose.ItemIndex = 1 then
//                    begin

//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(1000);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(1000);

                    //PasteContent_Main        posPasteContent_Main
                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchCoun: Integer;
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''390'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';


                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


//                            formatori :=
//                            '<img pic_type=''1'' src=''http://t8.baidu.com/it/u=1484500186,1503043093&amp;fm=79&amp;app=86&amp;f=JPEG?w=1280&amp;h=853.gif'' class' +
//                            '=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''373'' width=''560'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;


//                      //DelayEx(1000000);
//                      if IsWindowVisible(self.Handle) then
//                      begin
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
//
//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(500);
//
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                      end
//                      else
                      begin
                        MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                      end;

//                      mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
//                                     'for(i=0;i<paras.length;i++){' +
//                                     'if (paras[i] != null)' +
//                                     'paras[i].parentNode.removeChild( paras[i]);' +
//                                     '}');




                      DelayEx(1000);




                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                      //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                      RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                    //end;
                  end
                  else
                  begin
                    isReplyinsubFloor := judgeMustReplyInSecondFloor(succsulFatie);
                    if isReplyinsubFloor then   //如果需要在2楼黄金位回得
                    begin
                      if not succsulFatie then
                        Continue;
                    end
                    else
                    begin
                      ScrolltoBottom;
                      ScrolltoBottom;  //ScrolltoBottomEXE;
                      RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                      DelayEx(1000);


//                      if RzComboBoxModeChoose.ItemIndex = 0 then
//                      begin
//                        GetInputPoint_JS(InputPlaceEx_JS);
//                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                        if RzCheckBoxSet_input.Checked then
//                        begin
//                          RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
//
//                          while RzCheckBoxSet_input.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_input.Checked := True;
//
//                          GetInputPoint_JS(InputPlaceEx_JS);
//                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                          hasbawo_set_input := False;
//                          while not hasbawo_set_input do
//                          begin
//                            while RzCheckBoxSet_input.Checked do
//                            begin
//                             DelayEx(1000);
//                            end;
//                            RzCheckBoxSet_input.Checked := True;
//
//                            GetInputPoint_JS(InputPlaceEx_JS);
//                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//                          end;
//                        end;
//
//                        DelayEx(500);
//
//
//  //                      if PauseOrNot then
//  //                      begin
//  //                        RzMemoLogLinesAdd('已暂停！');
//  //                        while True do
//  //                        begin
//  //                          if PauseOrNot then
//  //                            DelayEx(1000)
//  //                          else
//  //                          begin
//  //                            RzMemoLogLinesAdd('取消暂停！');
//  //                            GetInputPoint_JS(InputPlaceEx_JS);
//  //                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//  //                            Break;
//  //                          end;
//  //                        end;
//  //                      end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        DelayEx(500);
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        DelayEx(500);
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                        if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
//
//                        DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//                        DelayEx(500);
//
//
//
//                        //找到提交按扭位置
//                        GetSubmitButtonForMainFloor(linshiPoint);
//                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                        begin
//                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                          //Pri_DeleteOrNot := '1';
//                          Exit;
//                        end;
//
//                        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//                        if RzCheckBoxSet_sub.Checked then
//                        begin
//                          RzMemoLogLinesAdd('等待主楼提交按扭位置是否正确功能已开启！#13#10');
//
//                          while RzCheckBoxSet_sub.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_sub.Checked := True;
//
//                          GetSubmitButtonForMainFloor(linshiPoint);
//                          if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                          begin
//                            if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                            Exit;
//                          end;
//                          SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//                          hasbawo_set_sub := False;
//                          while not hasbawo_set_sub do
//                          begin
//                            while RzCheckBoxSet_sub.Checked do
//                            begin
//                             DelayEx(1000);
//                            end;
//                            RzCheckBoxSet_sub.Checked := True;
//
//                            GetSubmitButtonForMainFloor(linshiPoint);
//                            if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                            begin
//                              if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                              Exit;
//                            end;
//                            SetCursorPos(linshiPoint.x, linshiPoint.y);
//                          end;
//                        end;
//                  //
//                        DelayEX(1000);
//
//
//                        CI.cbSize := SizeOf(CI);
//                        GetCursorInfo(CI);
//                        if CI.hCursor <> HICON(65567) then
//                        begin
//                          Pri_CanReplyOrNot := '100';
//                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
//                          continue;
//                        end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        Delay(50);
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
////                        Delay(50);
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//
//                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//
//                        //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                        RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
//                      end
//                      else if RzComboBoxModeChoose.ItemIndex = 1 then
//                      begin
//                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerText=' + QuotedStr(PasteContent));
//                        DelayEx(100);
                        //MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');


//                        mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
//                                       'for(i=0;i<paras.length;i++){' +
//                                       'if (paras[i] != null)' +
//                                       'paras[i].parentNode.removeChild( paras[i]);' +
//                                       '}');


                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
                      //PatternForHttps := '(https|http)\:\/\/.+?\.jpg';
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchCoun: Integer;
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';

                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                            ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' +
                        'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;


//
//                        if IsWindowVisible(self.Handle) then
//                        begin
////                          MainForm.CEFWindowParent1.SetFocus;
////                          MainForm.CEFWindowParent1.SetFocus;
////                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                          delayex(500);
//
//
//                          MainForm.CEFWindowParent1.SetFocus;
//                          MainForm.CEFWindowParent1.SetFocus;
//                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                          delayex(500);
//  //                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//  //                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                          mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                          'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                          delayex(500);
//
//
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                          Delay(50);
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        end
//                        else
                        begin
                          MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                        end;

//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//
//
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
                        DelayEx(1000);

                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                        //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                        RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                      //end;
                    end;
                  end;


                  UsuccessOrnot := True;
                  DelayEx(1000);
                finally
//              CurWhichRecord := 1;
//              SucRecordCount := 0;
                  if UsuccessOrnot then
                  begin
                    Inc(SucRecordCount);

//                    if not b_Debug then
//                    begin
                        //EnterCriticalSection(CS);
                        sldb1.BeginTransaction;
                        sldb1.ExecSQL('insert into FatieRecord (BaiduHao, TieziID, LastUpdateTime, PlanName)' +
                        'values (' + QuotedStr(SetCacheDirectoryNa) + ', ' + Pri_TieziID + ', ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                        ', ' + QuotedStr(TempPlanScheme_PlanName)+ ')');
                        //sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, PlanScheme_index, ADDTiezi, SubstractTiezi ' + 'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' + IntToStr(TotalPlansCheme));
                        sldb1.Commit;
                        //LeaveCriticalSection(CS);
                    //end;
                  end;

                  Inc(CurWhichRecord);

                  RzMemoLogLinesAdd('当前方案下总共搜索出：' + SearchOfRecordsCount + '条' + #13#10
                  + '已处理'+ IntToStr(CurWhichRecord) + '条' + #13#10
                  + '已发贴' + IntToStr(SucRecordCount) + '条' + #13#10#13#10);



                  if isNeedSaving then
                  begin
                    if Pri_DeleteOrNot = '1' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                        initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                        //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
                        sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
                        //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
                        finalizeSqliteHardwareTable;

                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                      end;
                    end
                    else if Pri_DeleteOrNot = '0' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                      //try
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                          Updatesqll := 'update SeeLiangTieziList set' + ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' + ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' + ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' + ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' + ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                          //2019-12-12 05:59:17
                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID);
                          sldb_InUniConnection.ExecSQL(Updatesqll);
                          finalizeSqliteHardwareTable;

                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      except
//                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，额外贴子，' + #13#10
//                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      end;
                      end;
                    end;
                  end
                  else
                  begin
                    RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，不保存，' + #13#10
                    + '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                  end;

                  if not rzcheckboxexploer.Checked then
                    DelayEx(G_TimerInterval);

                  if PauseOrNot then
                  begin
                    RzMemoLogLinesAdd('已暂停！');
                    while True do
                    begin
                      if PauseOrNot then
                        DelayEx(1000)
                      else
                      begin
                        RzMemoLogLinesAdd('取消暂停！');
                        Break;
                      end;
                    end;
                  end;

                  if RzCheckBoxSamePlan.Checked then
                  begin
                    if SucRecordCount >= SpinEditPostCount.Value then
                    begin
                      MemorySqliteTable_InUniConnection.Last;
                      StopInAdvance := true;
                    end;
                  end;
                  MemorySqliteTable_InUniConnection.Next;
                end;
              end;
            finally
              FinalQuerySqlInuni(MemorySqliteTable_InUniConnection);
              MemorySqliteTable_InUniConnection.Connection := nil;
              MemorySqliteTable_InUniConnection.Free;
              MemorySqlite_InUniConnection.Free;
//              if Trim(TemptDirectory) <> '' then
//              begin
//                if FileExists(TemptDirectory) then
//                begin
//                  DeleteFile(TemptDirectory);
//                end;
//              end;
            end;
            PlanSchemeTable.Next;
          end;
        finally
          PlanSchemeTable.Free;
        end;

      finally

        RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作结束' + #13#10#13#10);
        RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作结束' + #13#10#13#10);
        inc(Action1_Tag);
        inc(Action1_Tag1);

        if Linshi_Circulations > 0 then
          i_Circulations := i_Circulations - 1;
      end;
    until SatisfyRestrict;
  finally
    enableSomething;
    b_isRuning := False;
  end;

  if RzCheckBoxshudown.Checked then shellexecute(0, 'open', 'shutdown.exe', ' -f -s -t 0', nil, SW_HIDE);

end;

procedure TFrmBaseForm1.ActionOnlineSearchModeExecute(Sender: TObject);
var
  whichProxy: Integer;
  whichProxyindex: Integer;

  setproxyrightorwrong: Boolean;
  setproxyrightorwrongsth: string;
  tempserverIP: string;
  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;

  gtc1, gtc2: DWORD;
  isNeedSaving: Boolean;
  VarFeedbackIn: string;
  i: Int64;
  iii: Integer;
  ii: Integer;
  PlanInd: Integer;
  Existss: Boolean;
  SourceText: string;

  PasteContent_total: string;

  posPasteContenttotal: Integer;
  PasteContent: string;
  PasteContent_Main: string;
  posPasteContent_Main: Integer;
  PatternForHttps: string;

  matchs: TMatchCollection;
  match: TMatch;
  matchvalue: string;
  matchCoun: Integer;
  //Stringarr: array of string;
  Stringarr: array of TVarRec;
  formatori: string;
  JScript: string;


  n: Integer;
  arr: array[0..255] of Char;
  oldHtmlSourceCode: string;
  submittype: Integer;
  PerTieziURL: string;
  InputPlaceEx_JS: TPoint;
  Linshi_Circulations, i_Circulations: Integer;
  Max_tiezi_ID: Int64;
  addContent: string;
  Updatesqll, Insertsqll: string;
  Linshi_String: string;
  PlanSchemeTable: TSQLiteTable;
  TotalPlansCheme: Integer;
  isReplyinsubFloor: Boolean;
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

  //Temp_onlyForwechat: string;
  SpinEditStartPostIdText: string;
  Temp_onlyForMainFloor: string;

  Temp_add: string;
  Temp_add_Pervalue: string;
  Temp_addlist: TStringList;
  Temp_substract: string;

  succsulFatie: Boolean;


  TheCopyTableAct: TGetFullfilledMemoryTable;
  SplitDBFromSource: TSplitDBFromSource;
  TheCopyTableAct2: TGetMaxDateInDataBase;
  SaveSearchedofTieziOnline: TSaveSearchedofTieziOnline;
  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;

  TheCopyTableAct3: TGetAddedPostToTempTable;
  CarryKeySearchedPostToTempTable: TCarryKeySearchedPostToTempTable;
  VarHint: string;
  AATProxyEX: TInstActionProxy;

  TempPlanScheme_index: string;
  TempPlanScheme_PlanName: string;

  slDataBase: TSQLiteDatabase;
  sSQL: string;


 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;

  F: TextFile;
  //i: integer;
  fileStr: string;
  strfileName: string;
  Firststr,SecondStr: string;


  SetCacheDir: string;
  inputtext: string;

  LoginedAcc: string;
  linshiPoint: TPoint;
  CI: TCursorInfo;


label a, b;

  function SatisfyRestrict: Boolean;
  begin
    Result := False;
    if Linshi_Circulations > 0 then
    begin
      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
      begin
        if i_Circulations = 0 then
          Result := True;
      end
      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
      begin
        if (Action1_Tag - 1) = Linshi_Circulations then
        begin
          Result := True;
        end;
      end
    end;
    //CloseP;
    DelayEx(10);
  end;

  function judgeMustReplyInSecondFloor(var varsuccsulFatie: Boolean): Boolean;
  var
    linshi_strlist: TStringList;
    linshi_singlestr: string;
    SymboPos: Integer;
    strFoorNo: string;
    strReplyNum: string;
  begin
    Result := False;
    if Pri_FloorDetails = '' then
      Exit;

    linshi_strlist := TStringList.Create;
    try
      linshi_strlist.Delimiter := '|';
      linshi_strlist.DelimitedText := Pri_FloorDetails;

      if linshi_strlist.Count >= 2 then
      begin
       //2楼分析
      linshi_singlestr := linshi_strlist.Strings[1];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 3 then
      begin
       //3楼分析
      linshi_singlestr := linshi_strlist.Strings[2];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;



      if linshi_strlist.Count >= 4 then
      begin
         //4楼分析
      linshi_singlestr := linshi_strlist.Strings[3];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 5 then
      begin
       //5楼分析
      linshi_singlestr := linshi_strlist.Strings[4];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 6 then
      begin
       //6楼分析
      linshi_singlestr := linshi_strlist.Strings[5];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;


//      if linshi_strlist.Count >= 2 then
//      begin
//       //2楼分析
//      linshi_singlestr := linshi_strlist.Strings[1];
//      SymboPos := Pos('=', linshi_singlestr);
//      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
//      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
////      if strReplyNum = '0' then
////      begin
////        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
////        if varsuccsulFatie then
////        begin
////          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
////          Pri_FloorDetails := linshi_strlist.DelimitedText;
////        end;
////        Result := True;
////        Exit;
////      end
////      else if strReplyNum = '1' then
//      begin
//        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
//        if varsuccsulFatie then
//        begin
//          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
//          Pri_FloorDetails := linshi_strlist.DelimitedText;
//        end;
//        Result := True;
//        Exit;
//      end;
//      end;

    finally
      linshi_strlist.Free;
    end;

  end;

  function IsDeletedOrNoReplyTieZi(var FeedbackIn: string): Boolean;
  var
    JsScriptstr: string;
    replynum: string;
    cardmenNum: string;   //关注数
    cardinfoNum: string;  //贴吧总贴子数
    posterwarning: string;
  begin
    Result := True;

    G_InputP := '';
    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("head")[0]) var blanks=1;else var blanks=0;' + 'alert(blanks);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第1个');
    end;
    if G_InputP <> '1' then
    begin
      G_InputP := '';

      FeedbackIn := '空白页面！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("title")[0].innerText=="403 Forbidden") var Forbiddens=1;else var Forbiddens=0;' + 'alert(Forbiddens);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第2个');
    end;
    if G_InputP = '1' then
    begin
      G_InputP := '';

      FeedbackIn := '无法正常打开贴子！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementById("errorText")) ' + 'var isdelete=1; else var isdelete=0;' + 'alert(isdelete);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第3个');
    end;
    if G_InputP = '0' then
    begin

    end
    else if G_InputP = '1' then
    begin
      //Pri_DeleteOrNot := '1';
      G_InputP := '';

      FeedbackIn := '该贴已不存在或无法回复或已删除！';
      Pri_DeleteOrNot := '1';
      isNeedSaving := True;
      Exit;
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '判定是否删除出错！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr :=
    'try{' +
      'var element=document.getElementsByClassName("l_reply_num")[0];' +
      'var first=element.children[0];' +
      'var replynum=first.innerText;' +
      'var Z = replynum;' +
      'Z+="|";' +
      'alert(Z);' +
    '}' +
      'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第4个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      replynum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      replynum := StringReplace(replynum, ',', '', [rfReplaceAll]);

      Pri_FloorCount := replynum;
      Pri_DeleteOrNot := '0';

      G_InputP := '';
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '找回复数出错，可能是空白页！';

      Exit;
    end;
//
//    JsScriptstr :=
//    'try{' +
//      'var posterwarning=0;' +
//      //'if (document.getElementsByClassName("tb_poster_info poster_warning"))' +
//
//      'if (document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable")[0])' +
//         '{' +
////         'var posterwarningelement=document.getElementsByClassName("tb_poster_info poster_warning")[0];' +
////         'if (posterwarningelement.children[0]) {' +
////         'var posterwarningchild=posterwarningelement.children[0];' +
////         'var posterwarninginnertext=posterwarningchild.innerText;' +
////         'posterwarning=parseInt(posterwarninginnertext);' +
////         '} else posterwarning=100;' +
//
//
//         'posterwarning=100;' +
//
//
//
//         '}' +
//         'else posterwarning=0;' +
//         'var Z = posterwarning;' +
//         'Z+="|";' +
//         'alert(Z);' +
//    '}' +
//      'catch(e)' +
//      '{alert(e)}';
//
//
//    JsScriptstr := 'alert(document.body.innerHTML)';
//    MainForm.ExeJs(JsScriptstr);
//    while G_InputP = '' do
//    begin
//      DelayEX(100);
//      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第5个');
//    end;


//
//    if Pos('tb_poster_info poster_warning', G_InputP) > 0 then
//    begin
//      ShowMessageEX('1');
//    end
//    else
//    begin
//      ShowMessageEX('2');
//    end;
//
//    if Pos('ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
//    end;
//
//    if Pos('抱歉', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
////    end;
//
//    Abort;
//
//    if Pos('|', G_InputP) > 0 then
//    begin
//      posterwarning := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := posterwarning;
//    end
//    else if Pos('children', G_InputP) > 0 then
//    begin
//      posterwarning := '0';
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := '0';
//    end
//    else
//    begin
//      FeedbackIn := '找警告信息出错！';
//
//      Exit;
//    end;
//    if Pri_CanReplyOrNot = 'NaN' then
//    begin
//      FeedbackIn := '警告信息十分罕见！';
//      Exit;
//    end;


    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_menNum")[0]) var element=document.getElementsByClassName("card_menNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[0];' + 'var cardmenNum=element.innerText;' + 'var Z = cardmenNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第6个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardmenNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardmenNum := StringReplace(cardmenNum, ',', '', [rfReplaceAll]);

      Pri_FollowCountForOneTieBa := cardmenNum;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_infoNum")[0]) var element=document.getElementsByClassName("card_infoNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' + 'var cardinfoNum=element.innerText;' + 'var Z = cardinfoNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第7个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardinfoNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      Pri_TotalPostForOneTieBa := cardinfoNum;
    end;
    G_InputP := '';

    //JsScriptstr := 'try{' + 'var oP = document.getElementsByClassName("core_reply_tail clearfix");' + 'var OutPtInfo = "";' + 'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' + 'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' + 'var tailinfoFloorNo=parseInt(tailinfo);' + 'if (tailinfoFloorNo==1) var unfoldcount=0;else ' + '{' + 'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' + 'if (unfoldcount=="") unfoldcount=0;' + '}' + 'tailinfoFloorNo+="=";' + 'tailinfoFloorNo+=unfoldcount;' + 'OutPtInfo+="|";' + 'OutPtInfo+=tailinfoFloorNo;' + '}' + 'OutPtInfo+="|";' + 'OutPtInfo+=oP.length;' + 'alert(OutPtInfo);' + '}' + 'catch(e)' + '{alert(e)}';
    JsScriptstr :=
    'try{' +
       'var oP = document.getElementsByClassName("core_reply_tail clearfix");' +
       'var OutPtInfo = "";' +
       'for(var i = 0; i < oP.length; i++)' +
         '{' +
         'var element=oP[i];' +
         'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
         'var tailinfoFloorNo=parseInt(tailinfo);' +
         'if (tailinfoFloorNo>=2018) {' +
            'tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
            'tailinfoFloorNo=parseInt(tailinfo);' +
            '}' +
         'if (tailinfoFloorNo==1) var unfoldcount=0;else ' +
            '{' +
            'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' +
            'if (unfoldcount=="") unfoldcount=0;' +
            '}' +
         'tailinfoFloorNo+="=";' +
         'tailinfoFloorNo+=unfoldcount;' +
         'OutPtInfo+="|";' +
         'OutPtInfo+=tailinfoFloorNo;' +
         '}' +
       'OutPtInfo+="|";' +
       'OutPtInfo+=oP.length;' +
       'alert(OutPtInfo);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第8个');
    end;
    if (G_InputP <> '|0') and (Pos('|', G_InputP) > 0) then
    begin
      Pri_FloorDetails_pos := LastPos('|', G_InputP);

      Pri_FloorDetails := Copy(G_InputP, 2, Pri_FloorDetails_pos - 2);
      Pri_FloorDetails_subfloorreply := Copy(G_InputP, Pri_FloorDetails_pos + 1, Length(G_InputP) - Pri_FloorDetails_pos);

    end;

    G_InputP := '';

//保存所有信息

//    if Pri_CanReplyOrNot <> '0' then
//    begin
//      FeedbackIn := '有等级要求无法回复！';
//
//      isNeedSaving := true;
//
//      Exit;
//    end;

    isNeedSaving := true;
    Result := False;
  end;


//  function ConformToFloorCAndFollowCount: Boolean;
//  begin
//
//{
//                      Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
//                      Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
//                      Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
//                      Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
//                      Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
//                      Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
//
//
//                           ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
//                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
//                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
//}
//     Result := False;
//     if StrToIntDef(Pri_FloorCount, 0) >= IfThen(StrToIntDef(Temp_ReplyCountBegin, 0)<=0, -1, StrToIntDef(Temp_ReplyCountBegin, 0)) then
//     begin
//       if StrToIntDef(Temp_ReplyCountEnd, 0) > 0 then
//       begin
//         if StrToIntDef(Pri_FloorCount, 0) <= StrToIntDef(Temp_ReplyCountEnd, 0) then  //StrToIntDef(Temp_ReplyCountEnd, 0) then
//         begin
//           if StrToIntDef(Pri_FollowCountForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_FollowPopulationBegin, 0)<=0, -1, StrToIntDef(Temp_FollowPopulationBegin, 0)) then //StrToIntDef(Temp_FollowPopulationBegin, 0) then
//           begin
//              if StrToIntDef(Temp_FollowPopulationEnd, 0) > 0 then
//              begin
//                if StrToIntDef(Pri_FollowCountForOneTieBa, 0) <= StrToIntDef(Temp_FollowPopulationEnd, 0) then //StrToIntDef(Temp_FollowPopulationEnd, 0) then
//                begin
//                  if StrToIntDef(Pri_TotalPostForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_TieBaPostTotalBegin, 0)<=0, -1, StrToIntDef(Temp_TieBaPostTotalBegin, 0)) then //StrToIntDef(Temp_TieBaPostTotalBegin, 0) then
//                  begin
//                    if StrToIntDef(Temp_TieBaPostTotalEnd, 0) > 0 then
//                    begin
//                      if StrToIntDef(Pri_TotalPostForOneTieBa, 0) <= StrToIntDef(Temp_TieBaPostTotalEnd, 0) then //StrToIntDef(Temp_TieBaPostTotalEnd, 0) then
//                      begin
//                        Result := True;
//                      end;
//                    end
//                    else
//                    begin
//                      Result := True;
//                    end;
//                  end;
//                end;
//              end
//              else
//              begin
//                  if StrToIntDef(Pri_TotalPostForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_TieBaPostTotalBegin, 0)<=0, -1, StrToIntDef(Temp_TieBaPostTotalBegin, 0)) then //StrToIntDef(Temp_TieBaPostTotalBegin, 0) then
//                  begin
//                    if StrToIntDef(Temp_TieBaPostTotalEnd, 0) > 0 then
//                    begin
//                    if StrToIntDef(Pri_TotalPostForOneTieBa, 0) <= StrToIntDef(Temp_TieBaPostTotalEnd, 0) then //StrToIntDef(Temp_TieBaPostTotalEnd, 0) then
//                    begin
//                      Result := True;
//                    end;
//                    end
//                    else
//                    begin
//                      Result := True;
//                    end;
//                  end;
//              end;
//           end;
//         end;
//       end
//       else
//       begin
//           if StrToIntDef(Pri_FollowCountForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_FollowPopulationBegin, 0)<=0, -1, StrToIntDef(Temp_FollowPopulationBegin, 0)) then //StrToIntDef(Temp_FollowPopulationBegin, 0) then
//           begin
//              if StrToIntDef(Temp_FollowPopulationEnd, 0) > 0 then
//              begin
//                if StrToIntDef(Pri_FollowCountForOneTieBa, 0) <= StrToIntDef(Temp_FollowPopulationEnd, 0) then //StrToIntDef(Temp_FollowPopulationEnd, 0) then
//                begin
//                  if StrToIntDef(Pri_TotalPostForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_TieBaPostTotalBegin, 0)<=0, -1, StrToIntDef(Temp_TieBaPostTotalBegin, 0)) then //StrToIntDef(Temp_TieBaPostTotalBegin, 0) then
//                  begin
//                    if StrToIntDef(Temp_TieBaPostTotalEnd, 0) > 0 then
//                    begin
//                    if StrToIntDef(Pri_TotalPostForOneTieBa, 0) <= StrToIntDef(Temp_TieBaPostTotalEnd, 0) then //StrToIntDef(Temp_TieBaPostTotalEnd, 0) then
//                    begin
//                      Result := True;
//                    end;
//                    end
//                    else
//                    begin
//                      Result := True;
//                    end;
//                  end;
//                end;
//              end
//              else
//              begin
//
//                  if StrToIntDef(Pri_TotalPostForOneTieBa, 0) >= IfThen(StrToIntDef(Temp_TieBaPostTotalBegin, 0)<=0, -1, StrToIntDef(Temp_TieBaPostTotalBegin, 0)) then //StrToIntDef(Temp_TieBaPostTotalBegin, 0) then
//                  begin
//                    if StrToIntDef(Temp_TieBaPostTotalEnd, 0) > 0 then
//                    begin
//                    if StrToIntDef(Pri_TotalPostForOneTieBa, 0) <= StrToIntDef(Temp_TieBaPostTotalEnd, 0) then //StrToIntDef(Temp_TieBaPostTotalEnd, 0) then
//                    begin
//                      Result := True;
//                    end;
//                    end
//                    else
//                    begin
//                      Result := True;
//                    end;
//                  end;
//              end;
//           end;
//       end;
//     end;
//
//  end;

begin
  if b_isRuning then
    Exit;

  b_isRuning := True;


  //LoadProxyIP;
  //whichProxy := -1;
  disableSomething;

  try
    TotalPlansCheme := GetValidCountOfList;
    if TotalPlansCheme < 1 then
    begin
      SaveTempFileOrNot := False;
      ShowMessageEX('无方案配置可用！');
      Exit;
    end;

//    Automatic_Mode := 2;
//    submittype := StrToInt(QueryString('SELECT Submit_Type FROM SystemInfo'));
    Linshi_Circulations := StrToIntDef(Trim(RzEditWorkTimes.Text), 0);
    if Linshi_Circulations < 0 then
      Linshi_Circulations := 0;

    i_Circulations := Linshi_Circulations;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_i_CirculationsForRestart then
      begin
        i_Circulations := StrToInt(ParamStr(2));
        UsedOrNot_i_CirculationsForRestart := True;
      end;
    end;

    //Max_tiezi_ID := GetMax_tiezi_ID;

    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart then
      begin
        Action1_Tag := StrToInt(ParamStr(3));
        UsedOrNot_Action1_TagForRestart := True;
      end;
    end;

    Action1_Tag1 := 1;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart1 then
      begin
        Action1_Tag1 := StrToInt(ParamStr(4));
        UsedOrNot_Action1_TagForRestart1 := True;
      end;
    end;




    repeat
      RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作开始' + #13#10#13#10#13#10);
      RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作开始' + #13#10#13#10#13#10);

      try
        EnterCriticalSection(CS);
        PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
        'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
        'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
        'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
        ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
        ' OnlyForWechat, OnlyMainFloor  ' +
        'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' +
        IntToStr(TotalPlansCheme));
        LeaveCriticalSection(CS);

        try
          PlanSchemeTable.MoveFirst;
          while not PlanSchemeTable.EOF do
          begin
            VarHint := rbStart.Caption;
            rbStart.Caption := '';
            with THandleWaitings.create(100) do
            try
                iniWaiting(rbstart, 7, 7);

                    if RzCheckBoxSamePlan.Checked and (not PlanSchemeTable.BOF) then
                    begin
    //                  Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
    //                  Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
    //                  Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
    //                  Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
    //                  Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
    //                  Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
    //                  Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
    //                  Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
    //                  Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
    //                  Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
    //                  Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
    //                  Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
    //                  Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
    //                  Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);
    //
    //
    //                  Temp_add := PlanSchemeTable.FieldAsString(15);
    //                  Temp_substract := PlanSchemeTable.FieldAsString(16);
                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                      if b_Debug then
                      begin
                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                      end;

    //                  Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
    //                  Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
                    end
                    else
                    //if PlanSchemeTable.BOF then
                    begin
                      Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
                      Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
                      Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
                      Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
                      Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
                      Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
                      Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
                      Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
                      Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
                      Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
                      Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
                      Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
                      Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
                      Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);


                      Temp_add := PlanSchemeTable.FieldAsString(15);
                      Temp_substract := PlanSchemeTable.FieldAsString(16);
                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                      if b_Debug then
                      begin
                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                      end;

                      //Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
                      SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
                      Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
                    end;


    //                if Temp_onlyForwechat = '1' then
    //                begin
    //                  PlanSchemeTable.Next;
    //                  Continue;
    //                end;

                    if (ParamCount>=1) then
                    begin
                      if not UsedOrNot_PlanindexForRestart then
                      begin
                        if StrToInt(TempPlanScheme_index) < StrToInt(ParamStr(1)) then
                        begin
                          PlanSchemeTable.Next;
                          Continue;
                        end
                        else
                        begin
                          UsedOrNot_PlanindexForRestart := True;
                        end;
                      end;
                    end;

//                    if RzCheckBoxCheckLoginedAcc.Checked then
//                    begin
//                      LoginedAcc := GetLoginedAccount;
//                      if (LoginedAcc = '') or (LoginedAcc <> SetCacheDirectoryNa) then
//                      begin
//                        ShowMessageEX('当前没有登录任何账号或登录的账号不对');
//                        Abort;
//                      end;
//
//                    end
//                    else
//                    begin
//                      LoginedAcc := SetCacheDirectoryNa;
//                    end;

                    LoginedAcc := SetCacheDirectoryNa;


                    if LoginedAcc <> Temp_usedAcc then
                    begin
                      SaveTempFileOrNot := False;
                      CnTrayIcon1.Tag := 1;
                      Restart_Flag := True;
                      PlanindexForRestart := TempPlanScheme_index;
                      i_CirculationsForRestart := IntToStr(i_Circulations);
                      Pri_TieziIDForRestart := Pri_TieziID;
                      Action1_TagForRestart := IntToStr(Action1_Tag);
                      Action1_TagForRestart1 := IntToStr(Action1_Tag1);

                      RzComboBoxWillLoginAcc.ItemIndex := RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc);
                      self.Close;
                      Abort;

                      {strfileName := ExtractFilePath(Application.ExeName) + 'Save\CacheNameConfig.txt';
                      if fileexists(strfileName) then
                        DeleteFile(strfileName);

                      AssignFile(F, strfileName);
                      try
                        if fileexists(strfileName) then
                          append(F)
                        else
                          rewrite(F);

                        inputtext := '0';
                        Writeln(F, inputtext);                 //写日志里


                      finally
                        CloseFile(F);                        //关闭文件流
                      end;


                      AssignFile(F, strfileName);
                      try
                        if fileexists(strfileName) then
                          append(F)
                        else
                          rewrite(F);

                        inputtext := IntToStr(RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc));
                        Writeln(F, inputtext);                 //写日志里


                      finally
                        CloseFile(F);                        //关闭文件流
                      end;

                      if RzComboBoxWillLoginAcc.Items.Count > 0 then
                      for ii := 0 to RzComboBoxWillLoginAcc.Items.Count - 1 do
                      begin
                        AssignFile(F, strfileName);
                        try
                          if fileexists(strfileName) then
                            append(F)
                          else
                            rewrite(F);

                          inputtext := RzComboBoxWillLoginAcc.Items.Strings[ii];
                          Writeln(F, inputtext);                 //写日志里


                        finally
                          CloseFile(F);                        //关闭文件流
                        end;
                      end; }
                    end;




                    //if not (b_Debug and (StrToInt64Def(Trim(RzEditTestTieZiID.Text), 0) > 0)) then

                    TemptDirectory := APPCommonPath + 'temp.temp';
                    if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                    slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                    try
                      sSQL :=
                          'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                          '[TieziID] integer NOT NULL,' +
                          '[FileMing] TEXT NOT NULL,' +
                          'PRIMARY KEY ([TieziID],[FileMing]));';

      //                      sSQL :=
      //                      //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
      //                      //'CREATE TABLE SeeLiangTieziList (' +
      //                      'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
      //                      '[FloorDetails] TEXT,' +
      //                      '[TieziID] INTEGER NOT NULL,' +
      //                      '[TieBaName] TEXT,' +
      //                      '[TitleName] TEXT,' +
      //                      '[TieZiContent] TEXT,' +
      //                      '[DeleteOrNot] integer NOT NULL,' +
      //                      '[CanReplyOrNot] integer,' +
      //                      '[FloorCount] integer,' +
      //                      '[Createtime] TEXT,' +
      //                      '[FollowCountForOneTieBa] integer,' +
      //                      '[TotalPostForOneTieBa] integer,' +
      //                      '[LastUpdateTime] TEXT,' +
      //                      'PRIMARY KEY ([TieziID]));';
      //
      //                      //'[LastUpdateTime] TEXT);';

                      slDataBase.ExecSQL(sSQL);
                    finally
                      slDataBase.Free;
                    end;

                    if RzCheckBoxSamePlan.Checked and ((not PlanSchemeTable.BOF) or (Action1_Tag1 > 1)) then
                    begin
                      //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_index + '.temp';
                      //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                      //RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
                      TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
                      if not FileExists(TemptDirectory2) then
                      begin
                        SaveTempFileOrNot := False;
                        ShowMessageEX('关键词所搜出的贴所在的临时文件被删除');
                        Abort;
                      end;

                      slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                      try
                        if not slDataBase.TableExists('SeeLiangTieziList') then
                        begin
                          SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴所在的临时文件被修改');
                          Abort;
                        end;
                      finally
                        slDataBase.Free;
                      end;

                      AATProxyEX := TInstActionProxy.create;
                      AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                      AATProxyEX.StartWork; //开始工作
                      try
                      //TheCopyTableAct3: TGetAddedPostToTempTable;
                          CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                          with CarryKeySearchedPostToTempTable do
                          begin
                                                        WenJianMingPath := TemptDirectory2;   //
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                          //CarryKeySearchedPostToTempTable.Ba_add := Temp_add;
                          //CarryKeySearchedPostToTempTable.WenJianMing := 'onlinesearch0.temp';   //'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
                                                        WenJianMing := 'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';   //'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
                          end;
                          AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                          //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                          TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                          if (ParamCount>=1) then
                          begin
                            if Trim(ParamStr(5)) <> '' then
                            begin
                              if not UsedOrNot_Pri_TieziIDForRestart then
                              begin
                                Pri_TieziID := ParamStr(5);
                                UsedOrNot_Pri_TieziIDForRestart := True;
                              end;
                            end;
                          end;

                          TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
                          AATProxyEX.AddAction(TheCopyTableAct1);
                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                      finally
                          AATProxyEX.Free;
                      end;

//                      if not FileExists(TemptDirectory) then
//                      begin
//                        ShowMessageEX('符合条件的上一方案对应贴子临时文件不存在');
//                        Abort;
//                      end;

//                      AATProxyEX := TInstActionProxy.create;
//                      AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
//                      AATProxyEX.StartWork; //开始工作
//                      try
//                          TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//
//                          if (ParamCount>=1) then
//                          begin
//                            if Trim(ParamStr(4)) <> '' then
//                            begin
//                              if not UsedOrNot_Pri_TieziIDForRestart then
//                              begin
//                                Pri_TieziID := ParamStr(4);
//                                UsedOrNot_Pri_TieziIDForRestart := True;
//                              end;
//                            end;
//                          end;
//
//                          TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
//                          AATProxyEX.AddAction(TheCopyTableAct1);
//                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                      finally
//                          AATProxyEX.Free;
//                      end;


                    end
                    else
                    begin
                        //add.temp
                        //if Temp_add then
                        //if Pos('%%%%%', Temp_add) > 0 then
//                        if Trim(Temp_add) <> '' then
//                        begin
//                          Temp_addlist := TStringList.Create;
//                          Temp_addlist.Delimiter := '|';
//                          Temp_addlist.DelimitedText := Temp_add;
//
//                          try
//                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) >= 0 then
//                              begin
//                                  TemptDirectory1 := APPCommonPath + relativePasth + 'add' + TempPlanScheme_index + '.temp';
//                                  if not FileExists(TemptDirectory1) then
//                                  begin
//                                    ShowMessageEX('额外新增贴所在的临时文件被删除');
//                                    Abort;
//                                  end;
//
//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
//                                  try
//                                    if not slDataBase.TableExists('SeeLiangTieziList') then
//                                    begin
//                                      ShowMessageEX('额外新增贴所在的临时文件被修改');
//                                      Abort;
//                                    end;
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//                              end
//                              else
//                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) < 0 then
//                              begin
//
//                                  TemptDirectory1 := APPCommonPath + relativePasth + 'add' + TempPlanScheme_index + '.temp';
//                                  if FileExists(TemptDirectory1) then DeleteFile(TemptDirectory1);
//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
//                                  try
//        //                                sSQL :=
//        //                                'CREATE TABLE SaveSomeTieziID (' +
//        //                                '[TieziID] integer NOT NULL,' +
//        //                                '[FileMing] TEXT NOT NULL,' +
//        //                                'PRIMARY KEY ([TieziID]));';
//
//                                        sSQL :=
//                                        //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//                                        'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                        //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                        '[FloorDetails] TEXT,' +
//                                        '[TieziID] INTEGER NOT NULL,' +
//                                        '[TieBaName] TEXT,' +
//                                        '[TitleName] TEXT,' +
//                                        '[TieZiContent] TEXT,' +
//                                        '[DeleteOrNot] integer NOT NULL,' +
//                                        '[CanReplyOrNot] integer,' +
//                                        '[FloorCount] integer,' +
//                                        '[Createtime] TEXT,' +
//                                        '[FollowCountForOneTieBa] integer,' +
//                                        '[TotalPostForOneTieBa] integer,' +
//                                        '[LastUpdateTime] TEXT,' +
//                                        'PRIMARY KEY ([TieziID]));';
//
//
//
//                                        slDataBase.ExecSQL(sSQL);
//
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//
//
//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
//                                  try
//                                        slDataBase.BeginTransaction;
//
//                                        try
//                                          for ii := 0 to Temp_addlist.Count - 1 do
//                                          begin
//                                            Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
//                                            if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
//                                            begin
//                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
//                                              QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
//                                              slDataBase.ExecSQL(sSQL);
//                                            end;
//                                          end;
//                                        finally
//                                          slDataBase.Commit;
//                                        end;
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//
//
//
//                                  resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
//                              end;
//
//
//
//
//
//                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
//                              begin
//
//                                          AATProxyEX := TInstActionProxy.create;
//                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
//                                          AATProxyEX.StartWork; //开始工作
//                                          try
//                                          //TheCopyTableAct3: TGetAddedPostToTempTable;
//                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
//                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
//                                              TheCopyTableAct3.Ba_add := Temp_add;
//                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
//                                              AATProxyEX.AddAction(TheCopyTableAct3);
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//
//                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//
//                                              if RzCheckBoxSamePlan.Checked then
//                                              begin
//                                                if SpinEditStartPostId.Value > 0 then
//                                                  TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
//                                              end;
//
//                                              AATProxyEX.AddAction(TheCopyTableAct1);
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                                          finally
//                                              AATProxyEX.Free;
//                                          end;
//                              end
//                              else
//                              begin
//                                  suDBNameList := TStringList.Create;
//
//                                  try
//                                           SourceFileDir := APPCommonPath + relativePasth;
//
//                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);
//
//                                           while found=0 do
//                                           begin
//                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
//                                               and (SearchRec.Attr<>faDirectory) and (Pos('temp', Trim(SearchRec.Name)) < 1)
//                                               then
//                                               begin
//                                                 suDBName := SearchRec.Name;
//                                                 suDBNameList.Add(suDBName);
//                                               end;
//                                               found:=FindNext(SearchRec);
//                                           end;
//                                           FindClose(SearchRec);
//
//
//                                           suDBNameListCount := suDBNameList.Count;
//
//                                           if suDBNameListCount < 1 then
//                                           begin
//                                              ShowMessageEX('数据源不存在');
//                                              Exit;
//                                           end;
//
//
//                                           SetLength(MaxCreatetimeList, suDBNameListCount);
//
//
//                                          AATProxyEX := TInstActionProxy.create;
//                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
//                                          AATProxyEX.StartWork; //开始工作
//                                          try
//
//                                              if Temp_LastHowManyDays <> '0' then
//                                              begin
//
//                                                  for J := 0 to suDBNameListCount - 1 do
//                                                  begin
//                                                    Application.ProcessMessages;
//                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
//                                                    TheCopyTableAct2.iSerialNo := J;
//                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                                                    AATProxyEX.AddAction(TheCopyTableAct2);
//                                                  end;
//                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//
//
//                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
//                                              end;
//                                              SetLength(MaxCreatetimeList, 0);
//
//
//
//                                              for J := 0 to suDBNameListCount - 1 do
//                                              begin
//                                                    Application.ProcessMessages;
//                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
//                                                    with TheCopyTableAct do
//                                                    begin
//                                                        iSerialNo := J;
//                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                                                        WenJianMing := Trim(suDBNameList.Strings[J]);
//
//                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
//                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
//                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
//                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
//                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
//                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
//                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
//                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
//                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                                                        Ba_dingtie_type := Temp_dingtie_type;
//                                                        Ba_dingtie_content := Temp_dingtie_content;
//
//                                                        Ba_add := Temp_add;
//                                                        Ba_substract := Temp_substract;
//
//
//                                                        if b_Debug then
//                                                        begin
//                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
//                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
//                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
//                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
//                                                        end;
//
//                                                      //Ba_add, Ba_substract: string;
//                                                    end;
//                                                    AATProxyEX.AddAction(TheCopyTableAct);
//                                              end;
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
//                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
//                                              TheCopyTableAct3.Ba_add := Temp_add;
//                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
//                                              AATProxyEX.AddAction(TheCopyTableAct3);
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//
//                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//                                              if RzCheckBoxSamePlan.Checked then
//                                              begin
//                                                if SpinEditStartPostId.Value > 0 then
//                                                  TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
//                                              end;
//                                              AATProxyEX.AddAction(TheCopyTableAct1);
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                                          finally
//                                              AATProxyEX.Free;
//                                          end;
//                                  finally
//                                         suDBNameList.free;
//                                  end;
//                              end;
//                          finally
//                            Temp_addlist.Free;
//                          end;
//
//
//
//
//
//                        end
//                        else
//                        begin

                            //suDBNameList := TStringList.Create;

                            //try
//                                     SourceFileDir := APPCommonPath + relativePasth;
//
//                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);
//
//                                     while found=0 do
//                                     begin
//                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
//                                         and (SearchRec.Attr<>faDirectory) and (Pos('temp', Trim(SearchRec.Name)) < 1)
//                                         then
//                                         begin
//                                           suDBName := SearchRec.Name;
//                                           suDBNameList.Add(suDBName);
//                                         end;
//                                         found:=FindNext(SearchRec);
//                                     end;
//                                     FindClose(SearchRec);
//
//
//                                     suDBNameListCount := suDBNameList.Count;
//
//                                     if suDBNameListCount < 1 then
//                                     begin
//                                        ShowMessageEX('数据源不存在');
//                                        Exit;
//                                     end;
//
//
//                                     SetLength(MaxCreatetimeList, suDBNameListCount);

                              TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
//                              if resetOnlineSearchedofTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) >= 0 then
//                              begin
//                                  if not FileExists(TemptDirectory2) then
//                                  begin
//                                    ShowMessageEX('关键词所搜出的贴所在的临时文件被删除');
//                                    Abort;
//                                  end;
//
//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
//                                  try
//                                    if not slDataBase.TableExists('SeeLiangTieziList') then
//                                    begin
//                                      ShowMessageEX('关键词所搜出的贴所在的临时文件被修改');
//                                      Abort;
//                                    end;
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//                              end
//                              else
//                              if resetOnlineSearchedofTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) < 0 then
//                              begin
                                  //TemptDirectory2 := APPCommonPath + relativePasth + 'onlinesearch' + TempPlanScheme_index + '.temp';
                                  if not FileExists(TemptDirectory2) then //DeleteFile(TemptDirectory2);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                                    try
          //                                sSQL :=
          //                                'CREATE TABLE SaveSomeTieziID (' +
          //                                '[TieziID] integer NOT NULL,' +
          //                                '[FileMing] TEXT NOT NULL,' +
          //                                'PRIMARY KEY ([TieziID]));';

                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try
                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
                                        try
                                            Linshi_String := 'Provider Name=SQLite;';
                                            Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
                                            Linshi_String := Linshi_String + 'Login Prompt=False';

                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;

                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

                                            LinshiMemoryTableUniConnection.Connected := True;
                                            LinshiMemoryTableUniConnection.Connected := False;


                                            sSQL :=
                                            //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                            'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                            //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);

                                            SuccCo := 0;
                                            FailCo := 0;

                                            SaveSearchedofTieziOnline := TSaveSearchedofTieziOnline.create;
                                            SaveSearchedofTieziOnline.HowManyPage := strtointdef(Temp_LastHowManyDays, 0);
                                            SaveSearchedofTieziOnline.KeyWords := Temp_PlanScheme_TopicContent;
                                            SaveSearchedofTieziOnline.WebNames := Temp_PlanScheme_BarName;
                                            SaveSearchedofTieziOnline.MulThreadornot := true;
                                            //SaveSearchedofTieziOnline.SavedPath := TemptDirectory2;
        //                                    TheCopyTableAct2.iSerialNo := J;
        //                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                            AATProxyEX.AddAction(SaveSearchedofTieziOnline);

                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                            LinshiMemoryTableUniConnection.ExecSQL('ATTACH DATABASE "' + TemptDirectory2 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                                            LinshiMemoryTableUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
                                            LinshiMemoryTableUniConnection.ExecSQL('DETACH DATABASE "hr"');
                                        finally
                                            LinshiMemoryTableUniConnection.Free;
                                        end;
                                    finally
                                      AATProxyEX.Free;
                                    end;
                                  end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                                        with CarryKeySearchedPostToTempTable do
                                        begin
                                                        WenJianMingPath := TemptDirectory2;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                        //CarryKeySearchedPostToTempTable.Ba_add := Temp_add;
                                                        WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';//'onlinesearch0.temp';
                                        end;
                                        AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                        if RzCheckBoxSamePlan.Checked then
                                        begin
                                          if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                            TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                        end;

                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;




//                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
//                                  try
//                                        slDataBase.BeginTransaction;
//
//                                        try
//                                          for ii := 0 to Temp_addlist.Count - 1 do
//                                          begin
//                                            Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
//                                            if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
//                                            begin
//                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
//                                              QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
//                                              slDataBase.ExecSQL(sSQL);
//                                            end;
//                                          end;
//                                        finally
//                                          slDataBase.Commit;
//                                        end;
//                                  finally
//                                    slDataBase.Free;
//                                  end;
//
//
//
//                                  //resetOnlineSearchedofTieziDatabase_recordlist.Add(TempPlanScheme_index);
//
//
//
//
//
//                                    AATProxyEX := TInstActionProxy.create;
//                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
//                                    AATProxyEX.StartWork; //开始工作
//                                    try
//
//                                        if Temp_LastHowManyDays <> '0' then
//                                        begin
//
//                                            for J := 0 to suDBNameListCount - 1 do
//                                            begin
//                                              Application.ProcessMessages;
//                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
//                                              TheCopyTableAct2.iSerialNo := J;
//                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                                              AATProxyEX.AddAction(TheCopyTableAct2);
//                                            end;
//                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//
//
//                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
//                                        end;
//                                        SetLength(MaxCreatetimeList, 0);
//
//
//
//                                        for J := 0 to suDBNameListCount - 1 do
//                                        begin
//                                              Application.ProcessMessages;
//                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
//                                              with TheCopyTableAct do
//                                              begin
//                                                  iSerialNo := J;
//                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                                                  WenJianMing := Trim(suDBNameList.Strings[J]);
//
//                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
//                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
//                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
//                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
//                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
//                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
//                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
//                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
//                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                                                  Ba_dingtie_type := Temp_dingtie_type;
//                                                  Ba_dingtie_content := Temp_dingtie_content;
//
//                                                  Ba_add := Temp_add;
//                                                  Ba_substract := Temp_substract;
//
//                                                  if b_Debug then
//                                                  begin
//                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
//                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
//                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
//                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
//                                                  end;
//
//                                                //Ba_add, Ba_substract: string;
//                                              end;
//                                              AATProxyEX.AddAction(TheCopyTableAct);
//                                        end;
//                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//
//                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//                                        if RzCheckBoxSamePlan.Checked then
//                                        begin
//                                          if SpinEditStartPostId.Value > 0 then
//                                            TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
//                                        end;
//                                        AATProxyEX.AddAction(TheCopyTableAct1);
//                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                                    finally
//                                        AATProxyEX.Free;
//                                    end;

                    end;



            finally
              finalWaiting;
              rbStart.Caption := VarHint;
            end;



            DelayEX(10);

            if MemorySqliteTable_InUniConnection.RecordCount = 0 then
            begin
              if b_Debug then
              begin
                RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                RzMemoLogLinesAdd('当前方案下没有任何符合条件的贴子' + #13#10);
                RzMemoLogLinesAdd('上一方案是否提前终止的：' + ifthen(StopInAdvance, '是', '否') + #13#10);
              end;
              if rzcheckboxsameplan.Checked then
                abort;
            end;

            StopInAdvance := false;

            try    //MemorySqliteTable_InUniConnection
              MemorySqliteTable_InUniConnection.First;

              GetCoreContentForSequenceTimes := 1;
              CurWhichRecord := 0;
              SucRecordCount := 0;

              while not MemorySqliteTable_InUniConnection.Eof do
              begin
                isNeedSaving := false;
                UsuccessOrnot := False;

//                SearchOfRecordsCount: string;
//                CurWhichRecord: Integer;
//                SucRecordCount: Integer;
                if RzComboBoxRoutine.ItemIndex = 0 then

                Pri_TieziID := IntToStr(MemorySqliteTable_InUniConnection.Fields[0].AsInteger - 2079619440 + 6374586736)
                else
                if RzComboBoxRoutine.ItemIndex = 1 then
                Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //if not b_Debug then
                //begin
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 0 then
                  begin

                    //EnterCriticalSection(CS);
                    if SpinEditDays.Value > 0 then
                    begin
{
                  LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
                  LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
                  BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
}
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID
   + ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前百度账号已在此贴下发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 1 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('此贴下已发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 2 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName)
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName));
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前方案下已有在此贴下的回贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end;
                //end;

                Pri_TieziIDFileNmae := MemorySqliteTable_InUniConnection.Fields[1].asstring;
                //Pri_TieziID := '6361513183';     //无权回贴
                //Pri_TieziID := '6184821068';     //被删除
                //Pri_TieziID := '6374720646';
                //Pri_TieziID := '6374670634';
                Pri_BarName := '';
                Pri_Topic := '';
                Pri_Content := '';
                Pri_DeleteOrNot := '-1';
                //Pri_CanReplyOrNot := '-1';
                Pri_CanReplyOrNot := '-1';

                Pri_FloorCount := '';
                Pri_FloorDetails := '';
                Pri_FollowCountForOneTieBa := '';
                Pri_TotalPostForOneTieBa := '';

                PerTieziURL := Basic_PostLink + Pri_TieziID;
                RzMemoLogLinesAddEX('●●●开始第' + Pri_TieziID + '个贴子链接处理，' + #13#10
                + '方案名：' + TempPlanScheme_PlanName, PerTieziURL);

                try
                  RzMemoLogLinesAddEX('打开第' + Pri_TieziID + '个贴子链接', PerTieziURL);

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

//                  a:
//                  setproxyrightorwrong := true;
//                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
//                  begin
//                    inc(whichProxy);
//                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);
//
//                    if whichProxyindex = 0 then
//                    begin
//
//                    end
//                    else
//                    begin
//                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
//                      tempPortInfoPos := Pos('|', tempPortInfo);
//                      if tempPortInfoPos > 0 then
//                      begin
//                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
//                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
//                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);
//
//
//                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);
//
//                        //这种情况还不知道怎么处理
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
//                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
//                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
//                      end
//                      else
//                      begin
//
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
//                          RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
//                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
//                      end;
//                    end;
//                  end;
//
//                  if not setproxyrightorwrong then
//                  begin
//                    RzMemoLogLinesAdd(setproxyrightorwrongsth + #13#10 + '进入下一个设置' + #13#10 + #13#10);
//                    goto a;
//                  end;

                  MainForm.Chromium1.LoadUrl(PerTieziURL);
                  MainForm.Chromium1.LoadUrl(PerTieziURL);


                  DelayEX(BasicParamConf.WaitingTimeBeforeLoad);

                  if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  //gtc1 := GetTickCount;
                  while MainForm.bLoading do
                  begin
//                    gtc2 := GetTickCount;
//                    if (gtc2 - gtc1) >= 120000 then
//                    begin
//                      setproxyrightorwrong := true;
//                      goto a;
//                    end;
                    DelayEX(500);
                  end;

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

                  if IsDeletedOrNoReplyTieZi(VarFeedbackIn) then
                  begin
                    RzMemoLogLinesAdd('无效的贴子链接，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                    Continue;
                  end;

//                  if Not ConformToFloorCAndFollowCount then
//                  begin
//                    Continue;
//                  end;

                  RzMemoLogLinesAddEX('第' + Pri_TieziID + '个贴子链接' + '为有效链接', PerTieziURL);
                  DelayEX(10);
                  if b_Debug then
                    RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  if RzCheckBoxExploer.Checked then
                    Continue;


                    {

                    PasteContent_total: string;
                    PasteContent: string;
                    PasteContent_Main: string;


                    }


                  if str_Version = '0' then
                  begin
                    PasteContent := '顶一下！';
                    PasteContent_Main := '顶一下！';
                  end
                  else if (str_Version = '1') or (str_Version = '3') then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;
                  end
                  else if str_Version = '2' then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;

                    //PasteContent := PasteContent + '_________________________________________________________________________________________________________________________以上信息来自自动发送软件，欲获取，add wechat official account：花苍比'
                    PasteContent := PasteContent + PropagandaSentence;
                  end;

                  //if RzComboBoxModeChoose.ItemIndex = 0 then Clipboard.SetTextBuf(PChar(PasteContent));


                  if Temp_onlyForMainFloor = '1' then
                  begin
                    ScrolltoBottom;
                    ScrolltoBottom;  //ScrolltoBottomEXE;
                    RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                    DelayEx(1000);
//                    if RzComboBoxModeChoose.ItemIndex = 0 then
//                    begin
//                      GetInputPoint_JS(InputPlaceEx_JS);
//                      SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                      if RzCheckBoxSet_input.Checked then
//                      begin
//                        RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
//
//                        while RzCheckBoxSet_input.Checked do
//                        begin
//                         DelayEx(1000);
//                        end;
//                        RzCheckBoxSet_input.Checked := True;
//
//                        GetInputPoint_JS(InputPlaceEx_JS);
//                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                        hasbawo_set_input := False;
//                        while not hasbawo_set_input do
//                        begin
//                          while RzCheckBoxSet_input.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_input.Checked := True;
//
//                          GetInputPoint_JS(InputPlaceEx_JS);
//                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//                        end;
//                      end;
//
//
//
//
//                      DelayEx(500);
//
//
////                      if PauseOrNot then
////                      begin
////                        RzMemoLogLinesAdd('已暂停！');
////                        while True do
////                        begin
////                          if PauseOrNot then
////                            DelayEx(1000)
////                          else
////                          begin
////                            RzMemoLogLinesAdd('取消暂停！');
////                            GetInputPoint_JS(InputPlaceEx_JS);
////                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////                            Break;
////                          end;
////                        end;
////                      end;
//
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      DelayEx(500);
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      DelayEx(500);
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                      if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
//
//                      DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
//
//                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//                      DelayEx(500);
//
////                      MainForm.CEFWindowParent1.SetFocus;
////                      MainForm.CEFWindowParent1.SetFocus;
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
////                      Delay(50);
////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//
//
//
//                        //找到提交按扭位置
//                        GetSubmitButtonForMainFloor(linshiPoint);
//                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                        begin
//                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                          //Pri_DeleteOrNot := '1';
//                          Exit;
//                        end;
//
//                        SetCursorPos(linshiPoint.x, linshiPoint.y);
//                  //
//                        DelayEX(1000);
//
//
//                        CI.cbSize := SizeOf(CI);
//                        GetCursorInfo(CI);
//                        if CI.hCursor <> HICON(65567) then
//                        begin
//                          Pri_CanReplyOrNot := '100';
//                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
//                          continue;
//                        end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        Delay(50);
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                        //Pri_FloorDetails := Pri_FloorDetailsNew;
//
//                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//
//                      //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                      RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
//                    end
//                    else if RzComboBoxModeChoose.ItemIndex = 1 then
//                    begin

//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(1000);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(1000);

                    //PasteContent_Main        posPasteContent_Main
                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchCoun: Integer;
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''390'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';


                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


//                            formatori :=
//                            '<img pic_type=''1'' src=''http://t8.baidu.com/it/u=1484500186,1503043093&amp;fm=79&amp;app=86&amp;f=JPEG?w=1280&amp;h=853.gif'' class' +
//                            '=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''373'' width=''560'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;


//                      //DelayEx(1000000);
//                      if IsWindowVisible(self.Handle) then
//                      begin
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
//
//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(500);
//
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                      end
//                      else
                      begin
                        MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                      end;

//                      mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
//                                     'for(i=0;i<paras.length;i++){' +
//                                     'if (paras[i] != null)' +
//                                     'paras[i].parentNode.removeChild( paras[i]);' +
//                                     '}');




                      DelayEx(1000);




                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                      //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                      RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                    //end;
                  end
                  else
                  begin
                    isReplyinsubFloor := judgeMustReplyInSecondFloor(succsulFatie);
                    if isReplyinsubFloor then   //如果需要在2楼黄金位回得
                    begin
                      if not succsulFatie then
                        Continue;
                    end
                    else
                    begin
                      ScrolltoBottom;
                      ScrolltoBottom;  //ScrolltoBottomEXE;
                      RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                      DelayEx(1000);


//                      if RzComboBoxModeChoose.ItemIndex = 0 then
//                      begin
//                        GetInputPoint_JS(InputPlaceEx_JS);
//                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                        if RzCheckBoxSet_input.Checked then
//                        begin
//                          RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
//
//                          while RzCheckBoxSet_input.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_input.Checked := True;
//
//                          GetInputPoint_JS(InputPlaceEx_JS);
//                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//
//                          hasbawo_set_input := False;
//                          while not hasbawo_set_input do
//                          begin
//                            while RzCheckBoxSet_input.Checked do
//                            begin
//                             DelayEx(1000);
//                            end;
//                            RzCheckBoxSet_input.Checked := True;
//
//                            GetInputPoint_JS(InputPlaceEx_JS);
//                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//                          end;
//                        end;
//
//                        DelayEx(500);
//
//
//  //                      if PauseOrNot then
//  //                      begin
//  //                        RzMemoLogLinesAdd('已暂停！');
//  //                        while True do
//  //                        begin
//  //                          if PauseOrNot then
//  //                            DelayEx(1000)
//  //                          else
//  //                          begin
//  //                            RzMemoLogLinesAdd('取消暂停！');
//  //                            GetInputPoint_JS(InputPlaceEx_JS);
//  //                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//  //                            Break;
//  //                          end;
//  //                        end;
//  //                      end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        DelayEx(500);
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        DelayEx(500);
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//                        if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
//
//                        DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//                        DelayEx(500);
//
//
//
//                        //找到提交按扭位置
//                        GetSubmitButtonForMainFloor(linshiPoint);
//                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                        begin
//                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                          //Pri_DeleteOrNot := '1';
//                          Exit;
//                        end;
//
//                        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//                        if RzCheckBoxSet_sub.Checked then
//                        begin
//                          RzMemoLogLinesAdd('等待主楼提交按扭位置是否正确功能已开启！#13#10');
//
//                          while RzCheckBoxSet_sub.Checked do
//                          begin
//                           DelayEx(1000);
//                          end;
//                          RzCheckBoxSet_sub.Checked := True;
//
//                          GetSubmitButtonForMainFloor(linshiPoint);
//                          if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                          begin
//                            if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                            Exit;
//                          end;
//                          SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//                          hasbawo_set_sub := False;
//                          while not hasbawo_set_sub do
//                          begin
//                            while RzCheckBoxSet_sub.Checked do
//                            begin
//                             DelayEx(1000);
//                            end;
//                            RzCheckBoxSet_sub.Checked := True;
//
//                            GetSubmitButtonForMainFloor(linshiPoint);
//                            if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//                            begin
//                              if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
//                              Exit;
//                            end;
//                            SetCursorPos(linshiPoint.x, linshiPoint.y);
//                          end;
//                        end;
//                  //
//                        DelayEX(1000);
//
//
//                        CI.cbSize := SizeOf(CI);
//                        GetCursorInfo(CI);
//                        if CI.hCursor <> HICON(65567) then
//                        begin
//                          Pri_CanReplyOrNot := '100';
//                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
//                          continue;
//                        end;
//
//                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//                        Delay(50);
//                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
////                        Delay(50);
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//
//                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//
//                        //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                        RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
//                      end
//                      else if RzComboBoxModeChoose.ItemIndex = 1 then
//                      begin
//                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerText=' + QuotedStr(PasteContent));
//                        DelayEx(100);
                        //MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');


//                        mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
//                                       'for(i=0;i<paras.length;i++){' +
//                                       'if (paras[i] != null)' +
//                                       'paras[i].parentNode.removeChild( paras[i]);' +
//                                       '}');


                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
                      //PatternForHttps := '(https|http)\:\/\/.+?\.jpg';
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchCoun: Integer;
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';

                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                            ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;



//                        if IsWindowVisible(self.Handle) then
//                        begin
////                          MainForm.CEFWindowParent1.SetFocus;
////                          MainForm.CEFWindowParent1.SetFocus;
////                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                          delayex(500);
//
//
//                          MainForm.CEFWindowParent1.SetFocus;
//                          MainForm.CEFWindowParent1.SetFocus;
//                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                          delayex(500);
//  //                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//  //                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                          mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                          'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                          delayex(500);
//
//
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                          Delay(50);
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        end
//                        else
                        begin
                          MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                        end;

//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//
//
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
                        DelayEx(1000);

                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                        //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                        RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                      //end;
                    end;
                  end;


                  UsuccessOrnot := True;
                  DelayEx(1000);
                finally
//              CurWhichRecord := 1;
//              SucRecordCount := 0;
                  if UsuccessOrnot then
                  begin
                    Inc(SucRecordCount);

                    //if not b_Debug then
                    //begin
                        //EnterCriticalSection(CS);
                        sldb1.BeginTransaction;
                        sldb1.ExecSQL('insert into FatieRecord (BaiduHao, TieziID, LastUpdateTime, PlanName) values (' +
                        QuotedStr(SetCacheDirectoryNa) + ', ' + QuotedStr(Pri_TieziID) + ', '
                        + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime))
                        + ', ' + QuotedStr(TempPlanScheme_PlanName)
                         + ')');
                        //sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, PlanScheme_index, ADDTiezi, SubstractTiezi ' + 'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' + IntToStr(TotalPlansCheme));
                        sldb1.Commit;
                        //LeaveCriticalSection(CS);
                    //end;
                  end;

                  Inc(CurWhichRecord);

                  RzMemoLogLinesAdd('当前方案下总共搜索出：' + SearchOfRecordsCount + '条' + #13#10
                  + '已处理'+ IntToStr(CurWhichRecord) + '条' + #13#10
                  + '已发贴' + IntToStr(SucRecordCount) + '条' + #13#10#13#10);



                  if isNeedSaving then
                  begin
                    if Pri_DeleteOrNot = '1' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                        initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                        //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
                        sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
                        //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
                        finalizeSqliteHardwareTable;

                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                      end;
                    end
                    else if Pri_DeleteOrNot = '0' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                      //try
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                          Updatesqll := 'update SeeLiangTieziList set' +
                          ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
                          ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
                          ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                          //2019-12-12 05:59:17
                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                            ' where TieziID=' + QuotedStr(Pri_TieziID);
                          sldb_InUniConnection.ExecSQL(Updatesqll);
                          finalizeSqliteHardwareTable;

                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      except
//                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，额外贴子，' + #13#10
//                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      end;
                      end;
                    end;
                  end
                  else
                  begin
                    RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，不保存，' + #13#10
                    + '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                  end;

                  if not rzcheckboxexploer.Checked then
                    DelayEx(G_TimerInterval);

                  if PauseOrNot then
                  begin
                    RzMemoLogLinesAdd('已暂停！');
                    while True do
                    begin
                      if PauseOrNot then
                        DelayEx(1000)
                      else
                      begin
                        RzMemoLogLinesAdd('取消暂停！');
                        Break;
                      end;
                    end;
                  end;

                  if RzCheckBoxSamePlan.Checked then
                  begin
                    if SucRecordCount >= SpinEditPostCount.Value then
                    begin
                      MemorySqliteTable_InUniConnection.Last;
                      StopInAdvance := true;
                    end;
                  end;
                  MemorySqliteTable_InUniConnection.Next;
                end;
              end;
            finally
              FinalQuerySqlInuni(MemorySqliteTable_InUniConnection);
              MemorySqliteTable_InUniConnection.Connection := nil;
              MemorySqliteTable_InUniConnection.Free;
              MemorySqlite_InUniConnection.Free;
              if Trim(TemptDirectory) <> '' then
              begin
                if FileExists(TemptDirectory) then
                begin
                  DeleteFile(TemptDirectory);
                end;
              end;
            end;
            PlanSchemeTable.Next;
          end;
        finally
          PlanSchemeTable.Free;
        end;

      finally

        RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作结束' + #13#10#13#10);
        RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作结束' + #13#10#13#10);
        inc(Action1_Tag);
        inc(Action1_Tag1);

        if Linshi_Circulations > 0 then
          i_Circulations := i_Circulations - 1;
      end;
    until SatisfyRestrict;
  finally
    if SaveTempFileOrNot then      //保存整理新下载的文件，没有被update的记录就不保存整理了，然后删除
    begin
      RzMemoLogLinesAdd('开始整理下载的文件！');

      suDBNameList := TStringList.Create;


      AATProxyEX := TInstActionProxy.create;
      AATProxyEX.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
      AATProxyEX.StartWork; //开始工作


      VarHint := rbStart.Caption;
      rbStart.Caption := '';
      with THandleWaitings.create(100) do
      try
         iniWaiting(rbStart, 7, 7);

         SourceFileDir := APPCommonPath + relativePasth1;

         found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

         while found=0 do
         begin
           delay(10);
           if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
           and (SearchRec.Attr<>faDirectory) and
           (
           (Pos('temp', Trim(SearchRec.Name)) > 0) or
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

                SplitDBFromSource := TSplitDBFromSource.create;
                SplitDBFromSource.SplitDirectory := APPCommonPath + relativePasth;
                SplitDBFromSource.SourceDBaseDire := SourceFileDir + Trim(suDBNameList.Strings[J]);
                AATProxyEX.AddAction(SplitDBFromSource);
                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

             finally
               if RzCheckBoxDeleteDownloadedFiles.Checked then
                 DeleteFile(SourceFileDir + Trim(suDBNameList.Strings[J]));
             end;
           end;
         end;
      finally



        finalWaiting;
        rbStart.Caption := VarHint;

        AATProxyEX.Free;

        suDBNameList.Free;
        RzMemoLogLinesAdd('结束整理下载的文件！');
      end;
    end
    else
    begin
      SaveTempFileOrNot := true;
    end;
    enableSomething;
    b_isRuning := False;
  end;

  if RzCheckBoxshudown.Checked then shellexecute(0, 'open', 'shutdown.exe', ' -f -s -t 0', nil, SW_HIDE);

end;

procedure TFrmBaseForm1.Action_setintervaltimeExecute(Sender: TObject);
begin
  inherited;
  G_TimerInterval := SpinEdit_hour.Value * 60 * 60 * 1000 + SpinEdit_minute.Value * 60 * 1000 + SpinEdit_second.Value * 1000;
end;

procedure TFrmBaseForm1.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  inherited;
  if (Msg.CharCode = VK_F1) then
  begin
    PauseOrNot := True;
    Handled := True;
    RzMemoLogLinesAdd('成功开启暂停功能' + #13#10#13#10);
  end
  else if (Msg.CharCode = VK_F2) then
  begin
    PauseOrNot := False;
    Handled := True;
    RzMemoLogLinesAdd('成功关闭暂停功能' + #13#10#13#10);
  end
  else if (Msg.CharCode = VK_F3) then
  begin
    RzButton2Click(nil);
    Handled := True;
  end
  else if (Msg.CharCode = VK_F4) then
  begin
    if b_isRuning then
    begin
      GlobalClose := True;
      //ShowMessageEX('退出程序完成!');
      RzMemoLogLinesAdd('退出程序完成!' + #13#10#13#10);
    end;
    Handled := True;
  end
  else if (Msg.CharCode = VK_F5) then
  begin
//    if Self.BorderStyle = bsToolWindow then
//      Self.BorderStyle := bsNone
//    else if Self.BorderStyle = bsNone then
//      Self.BorderStyle := bsToolWindow;
    Handled := True;
  end
  else if (Msg.CharCode = VK_F6) then
  begin

    Handled := True;
  end
  else if (Msg.CharCode = VK_F7) then
  begin
    Handled := True;
  end
  else if (Msg.CharCode = VK_F8) then
  begin
    Handled := True;
  end;
end;

procedure TFrmBaseForm1.CLickHuiFuButton(iFloor: Integer);
var
  LinshiJS: string;
begin
  G_InputP := '';
  LinshiJS := 'var element=document.getElementsByClassName("lzl_link_unfold")[' + IntToStr(iFloor - 2) + '];element.click()';
  MainForm.ExeJs(LinshiJS);
  G_InputP := '';
end;

procedure TFrmBaseForm1.CLickWoYeShuoYiJuButton(iFloor: Integer);
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
  JsScriptstr: string;
begin
//  G_InputP := '';

//  JsScriptstr :=
//  'var element = document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
//  'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';
//  'document.body.scrollTop+=100';

//  MainForm.ExeJs(JsScriptstr);

  //Sleep(1000);
 // Delay(20000);

 // if iFloor = 4 then iFloor := 2;

//  RzMemoLogLinesAdd('10秒到：楼层数：' + IntToStr(iFloor));
  //Delay(120000);
  G_InputP := '';
  //'var element=document.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[' + IntToStr(i) + '];element.click()';
  LinshiJS :=
//  'var element=document.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[' + IntToStr(iFloor - 1) + '];' +
    'var oP = document.getElementsByClassName("core_reply j_lzl_wrapper");' +
//        'var OutPtInfo = "";' +
    'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' +
        //'try {var tailinfo=element.getElementsByClassName("tail-info")[1].innerText; errors=0} catch(e) {var errors=1;}' +
        //'if (element.getElementsByClassName("tail-info")[1].innerText)  ' +
        //'if (errors==0) tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
        //'else var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
    'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
        //'var tailinfo=element.children[1].children[2].innerText;' +
    'var tailinfoFloorNo=parseInt(tailinfo);' + 'if (tailinfoFloorNo==' + IntToStr(iFloor) + ') ' + '{var desElement=element.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[0];break;}}' +


//        ' unfoldcount=0;else ' +
//        '{' +
//        //'var unfold=element.getElementsByClassName("lzl_link_unfold")[0].innerText;' +
//        'var unfold=element.children[0].children[0].innerText;' +
//        'var unfoldcount=unfold.replace(/[^\d]/g,"");' +
//        'if (unfoldcount=="") unfoldcount=0;' +
//        '}' +
//        'tailinfoFloorNo+="=";' +
//        'tailinfoFloorNo+=unfoldcount;' +
//        'OutPtInfo+="|";' +
//        'OutPtInfo+=tailinfoFloorNo;' +
//        '}' +
//        //'OutPtInfo=substring(2);' +
//        'OutPtInfo+="|";' +
//        'OutPtInfo+=oP.length;'+
//        'alert(OutPtInfo);' +
    'desElement.click()'; //;element.click();element.click()';
  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';
  MainForm.ExeJs(LinshiJS);
  //MainForm.ExeJs(LinshiJS);

//  Delay(10000);
//
//  ScrollToSpecifyFloorEX(iFloor);
//  Delay(1000);
  G_InputP := '';


//  while G_InputP = '' do
//  begin
//    Delay(500);
//    CloseP;
//  end;
//  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
//  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));
//
//  G_InputP := '';
//
//  iLinshiX := Ceil(strtofloat(LinshiX));
//  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//
//  InputPlaceEx_JS.X := iLinshiX + 10;
//  InputPlaceEx_JS.Y := iLinshY + 10;
//
//  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);
end;

procedure TFrmBaseForm1.disableSomething;
begin
  rbStart.Enabled := False;
  RzButtonSetPlanScheme.Enabled := False;

  SpeedButtonRestart.Enabled := False;

  RzCheckBoxSamePlan.ReadOnly := True;
  SpinEditPostCount.ReadOnly := True;
  //RzButtonUpdate.Enabled := False;
//  resetAddedTieziDatabase_recordlist := TStringList.Create;
//  resetOnlineSearchedofTieziDatabase_recordlist := TStringlist.Create;

//  RzCheckBoxSamePlan.Visible := False;
//  SpinEditPostCount.Visible := False;
//  SpinEditStartPostId.Visible := False;
end;

//procedure TFrmBaseForm1.disableSomethingEX;
//begin
//  rbStart.Enabled := False;
//  RzButtonSetPlanScheme.Enabled := False;
//  RzButtonUpdate.Enabled := False;
//
//
//  LinshiPanel := TRzPanel.Create(nil);
//  LinshiPanel.Caption := '';
//  LinshiPanel.Parent := Panel_CEF;
//  LinshiPanel.Align := alClient;
//  LinshiPanel.Show;
//end;

procedure TFrmBaseForm1.enableSomething;
begin
  rbStart.Enabled := True;
  RzButtonSetPlanScheme.Enabled := True;
  SpeedButtonRestart.Enabled := True;

  RzCheckBoxSamePlan.ReadOnly := False;
  SpinEditPostCount.ReadOnly := False;
  //RzButtonUpdate.Enabled := True;
//  resetAddedTieziDatabase_recordlist.Free;
//  resetOnlineSearchedofTieziDatabase_recordlist.free;

//  RzCheckBoxSamePlan.Visible := True;
//  SpinEditPostCount.Visible := True;
//  SpinEditStartPostId.Visible := True;
end;

//procedure TFrmBaseForm1.ExecuteSamePlanDifferentLoginACC(
//  PassPlanSchemeConfigIndex: string);
//begin
//
//end;

//procedure TFrmBaseForm1.enableSomethingEX;
//begin
//  rbStart.Enabled := True;
//  RzButtonSetPlanScheme.Enabled := True;
//  RzButtonUpdate.Enabled := True;
//
//  LinshiPanel.Free;
//end;

procedure TFrmBaseForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SaveDataIntoFile;
  SaveDataIntoDb;
//  if not Restart_Flag then
//  SaveWillLoginAcc;
  G_Status := 'Finish Close';
end;

procedure TFrmBaseForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  G_Status := 'Finish Query';
end;

procedure TFrmBaseForm1.FormCreate(Sender: TObject);
var
  slDBpath1: string;
begin
  inherited;
  Action1_Tag := 1;

  InitializeCriticalSection(InsertIntoTempFIle);   //SaveOnlinesearchedDB

  InitializeCriticalSection(SaveOnlinesearchedDB);

  RealPlanNameList := TStringList.Create;

  BanKeyList := TStringList.Create;

  slDBpath1 := ExtractFilepath(application.exename) + relativePasth2 + DbName2;
  sldb1 := TSQLiteDatabase.Create(slDBpath1);
end;

procedure TFrmBaseForm1.FormDestroy(Sender: TObject);
var
  i: Integer;
  lpStartupInfo: TStartupInfo;
  lpProcessInformation: TProcessInformation;
  strExePara: string;
begin
  inherited;
  if finalizationcount = 0 then
  begin
    try
      DeleteCriticalSection(InsertIntoTempFIle);   //SaveOnlinesearchedDB
      DeleteCriticalSection(SaveOnlinesearchedDB);
      RealPlanNameList.Free;

      BanKeyList.Free;


      if Restart_Flag then
      begin
        FillChar( lpStartupInfo,sizeof(lpStartupInfo),0);
        FillChar(lpProcessInformation,sizeof(lpProcessInformation),0);
        lpStartupInfo.cb:=sizeof(lpStartupInfo);
        if SpeedButtonRestartorNot then
        begin
          if (Trim(RzEdit1.Text) <> '') and
          (Trim(RzEdit2.Text) <> '') and
          (Trim(RzEdit3.Text) <> '') and
          (Trim(RzEdit4.Text) <> '') and
          (Trim(RzEdit5.Text) <> '') then
          begin
            strExePara := Application.ExeName + ' '
                      + Trim(RzEdit1.Text) + ' '
                      + Trim(RzEdit2.Text) + ' '
                      + Trim(RzEdit3.Text) + ' '
                      + Trim(RzEdit4.Text) + ' '
                      + Trim(RzEdit5.Text) + ' '
                      + '';
          end
          else
          //strExePara := ExtractFilePath(Application.ExeName) + 'DingTie.exe';
          strExePara := Application.ExeName;
        end
        else
        strExePara := Application.ExeName + ' '
                      + PlanindexForRestart + ' '
                      + i_CirculationsForRestart + ' '
                      + Action1_TagForRestart + ' '
                      + Action1_TagForRestart1 + ' '
                      + GetAllAccForSequenceTimesForRestart + ' '
                      + Pri_TieziIDForRestart;

        if CreateProcess(nil,PChar(strExePara),nil,nil,false,0,nil,nil,lpStartupInfo,lpProcessInformation) then
        begin
          CloseHandle(lpProcessInformation.hThread);
          CloseHandle(lpProcessInformation.hProcess);
        end;
      end;
    finally
      finalizationcount := 1;
      G_Status := 'Finish Destroy';
    end;
  end;
end;

procedure TFrmBaseForm1.FormShow(Sender: TObject);
begin
  inherited;
  if initializationcount = 0 then
  begin
    LoadDataFromFile;
    LoadDataFromDb;







    if str_Version = '0' then
    begin
      SpinEdit_hour.ReadOnly := True;
      SpinEdit_minute.ReadOnly := true;
      SpinEdit_second.ReadOnly := True;
    end
    else
    begin
      SpinEdit_hour.ReadOnly := False;
      SpinEdit_minute.ReadOnly := False;
      SpinEdit_second.ReadOnly := False;
    end;

    RzStatusPane2.Caption := '当前所处的百度账号为：' + SetCacheDirectoryNa + '，请确保使用该账号登录，以防出错';

    if b_Debug then
      RzEditTestTieZiID.Visible := True
    else
      RzEditTestTieZiID.Visible := False;



    Action_setintervaltimeExecute(nil);

    RzEditTestTieZiID.Left := RzPanelTop.Width - RzEditTestTieZiID.Width - 10;



    if ShowSelfMacOrNot then
    begin
      ShowSelfMac := TRzMemo.Create(self);
      ShowSelfMac.Parent := RzPanelTop;
      ShowSelfMac.Align := alBottom;
      ShowSelfMac.ReadOnly := True;
      //ShowSelfMac.Text := '您的本机物理地址为：' + #13#10 + MacAddressEX;
      ShowSelfMac.Text := '您的本机物理地址为：' + MacAddressEX;
      ShowSelfMac.Font.Size := 10;
      ShowSelfMac.Font.Style := [fsBold];
      //ShowSelfMac.Width := ShowSelfMac.Width;
      ShowSelfMac.Height := 35;
      ShowSelfMac.Top := rbStart.Top +  rbStart.Height;// + 55;
    end;

//    if str_Version = '3' then
//    begin
//      self.Caption := Self.Caption + '正式版请加微信：baidutiebayinliu';
//    end;
    timer4.Enabled := true;

    initializationcount := 1;
    G_Status := 'Finish Show';
  end;
end;

function TFrmBaseForm1.GetCoreContent(tz_index: Integer): string;
var
  ChoosedContentType_index: string;
  DingTie_ContentList: string;
  sSQL: string;
begin
  sSQL := 'SELECT dingtie_type, dingtie_content FROM DingTie_Config  where tiezi_index=' + IntToStr(tz_index);

  QueryStringEX(sSQL, ChoosedContentType_index, DingTie_ContentList);
  case StrToInt(ChoosedContentType_index) of
    0:
      begin
        Result := DingTie_ContentList;
      end;
    1:
      begin
        Result := GetCoreContentForRandomize(DingTie_ContentList);
      end;
    2:
      begin
        Result := GetCoreContentForSequence(DingTie_ContentList);
      end;
    3:
      begin

      end;
    4:
      begin

      end;

  end;
end;

function TFrmBaseForm1.GetCoreContentForRandomize(
  sDingTieContList: string): string;
var
  i: Integer;
  itemcout: Integer;
  LinshiList: TStringList;
begin
  LinshiList := TStringList.Create;
  try
    LinshiList.Text := sDingTieContList;
    itemcout := LinshiList.Count;

    Randomize;
    i := Random(itemcout);
    Result := LinshiList.Strings[i];
  finally
    LinshiList.Free;
  end;
end;

function TFrmBaseForm1.GetCoreContentForSequence(
  sDingTieContList: string): string;
var
  i, i_mod: Integer;
  itemcout: Integer;
  LinshiList: TStringList;
begin
  LinshiList := TStringList.Create;
  try
    LinshiList.Text := sDingTieContList;
    itemcout := LinshiList.Count;

    i_mod := GetCoreContentForSequenceTimes mod itemcout;

    if i_mod = 0 then
      i := itemcout - 1
    else
      i := i_mod - 1;

    Result := LinshiList.Strings[i];
  finally
    LinshiList.Free;

  end;
end;

function TFrmBaseForm1.GetHuiFuButtonPoint_JS(iFloor: Integer;
  var InputPlaceEx_JS: TPoint): Boolean;
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
  JsScriptstr: string;
begin
  Result := False;

//  G_InputP := '';
//
//  JsScriptstr := 'document.body.scrollTop+=50';
//  MainForm.ExeJs(JsScriptstr);
//  Delay(5000);

  G_InputP := '';
  LinshiJS := 'var element=document.getElementsByClassName("lzl_link_unfold")[' + IntToStr(iFloor - 2) + '];var X = element.getBoundingClientRect().left;var Y = element.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z)';
  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';
  MainForm.ExeJs(LinshiJS);
  while G_InputP = '' do
  begin
    DelayEx(100);
    if b_Debug then RzMemoLogLinesAdd('正在JS循环中：GetHuiFuButtonPoint_JS');
  end;
  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));

  G_InputP := '';

  if Ceil(strtofloat(LinshY)) > (MainForm.CEFWindowParent1.Height - 200) then
  begin
    InputPlaceEx_JS.X := Ceil(strtofloat(LinshY));
    InputPlaceEx_JS.Y := MainForm.CEFWindowParent1.Height - 200;
    Exit;
  end;


  iLinshiX := Ceil(strtofloat(LinshiX));
  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//
//  InputPlaceEx_JS.X := iLinshiX + 210;
//  InputPlaceEx_JS.Y := iLinshY + 95;


//  InputPlaceEx_JS.X := iLinshiX + StrToInt(Trim(RzEditX_hui.Text));
//  InputPlaceEx_JS.Y := iLinshY + StrToInt(Trim(RzEditY_hui.Text));



  InputPlaceEx_JS.X := iLinshiX;// + StrToInt(Trim(RzEditX_hui.Text));
  InputPlaceEx_JS.Y := iLinshY;// + StrToInt(Trim(RzEditY_hui.Text));

  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);


  Result := True;
end;

function TFrmBaseForm1.GetInputContentKuangPoint_JS(iFloor, sourcekind: Integer;
  var InputPlaceEx_JS: TPoint): Boolean;
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
begin
  Result := False;

  G_InputP := '';
  LinshiJS :=
  'try{' +
  'var element=document.getElementById("j_editor_for_container");var X = element.getBoundingClientRect().left;var Y = element.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z);' +
  '}catch(e){alert("wrong")}';
  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';
  MainForm.ExeJs(LinshiJS);
  while G_InputP = '' do
  begin
    Delayex(100);
    if b_Debug then RzMemoLogLinesAdd('正在JS循环中：GetInputContentKuangPoint_JS');
  end;

  if G_InputP = 'wrong' then Exit;

  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));

  G_InputP := '';

  iLinshiX := Ceil(strtofloat(LinshiX));
  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//
//  InputPlaceEx_JS.X := iLinshiX + 140;  通过点回复点出现
//  InputPlaceEx_JS.Y := iLinshY + 122;


//  InputPlaceEx_JS.X := iLinshiX + 140; 通过点我来说一句出现
//  InputPlaceEx_JS.Y := iLinshY + 92;

  //RzEditX
  if sourcekind = 0 then
  begin
//    InputPlaceEx_JS.X := iLinshiX + 140;
//    InputPlaceEx_JS.Y := iLinshY + 122;

    InputPlaceEx_JS.X := iLinshiX;// + StrToInt(Trim(RzEditX_hui_InputBox.Text));
    InputPlaceEx_JS.Y := iLinshY;// + StrToInt(Trim(RzEditY_hui_InputBox.Text));
  end
  else
  if sourcekind = 1 then
  begin
//    InputPlaceEx_JS.X := iLinshiX + 140;
//    InputPlaceEx_JS.Y := iLinshY + 92;

    InputPlaceEx_JS.X := iLinshiX;// + StrToInt(Trim(RzEditX_wo_InputBox.Text));
    InputPlaceEx_JS.Y := iLinshY;// + StrToInt(Trim(RzEditY_wo_InputBox.Text));
  end;
//  InputPlaceEx_JS.X := iLinshiX + StrToInt(RzEditX.Text);
//  InputPlaceEx_JS.Y := iLinshY + StrToInt(RzEditY.Text);

  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);

  Result := True;
end;

function TFrmBaseForm1.GetLoginedAccount: string;
var
  JsScriptstr: string;
  replynum: string;
  cardmenNum: string;   //关注数
  cardinfoNum: string;  //贴吧总贴子数
  posterwarning: string;
begin
    Result := '';


    MainForm.Chromium1.LoadUrl('https://tieba.baidu.com/index.html');
    MainForm.Chromium1.LoadUrl('https://tieba.baidu.com/index.html');
    MainForm.Chromium1.LoadUrl('https://tieba.baidu.com/index.html');

    DelayEX(BasicParamConf.WaitingTimeBeforeLoad);

    //if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');

    while MainForm.bLoading do DelayEX(500);
    DelayEX(1000);

    G_InputP := '';
    JsScriptstr :=
    'try{' +
      'if (document.getElementsByClassName("u_username_title")) ' +
      'var acc=document.getElementsByClassName("u_username_title")[0].innerText;' +
      'else var acc="";' +
      'alert(acc);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：GetLoginedAccount');
    end;
    //'TypeError: Cannot read property ''innerText'' of undefined'
    if Pos('undefined', G_InputP) > 0 then
      Result := ''
    else
      Result := G_InputP;
    G_InputP := '';
end;

function TFrmBaseForm1.GetPlanIndex: Integer;
var
  RzMemo_UrlListLine, RzMemo_UrlListLineCount: Integer;
begin

  Result := -1;

  RzMemo_UrlListLine := RzMemo_PlanScheme.Line;

  RzMemo_UrlListLineCount := GetValidCountOfList;

  if RzMemo_UrlListLineCount < 1 then
    Exit;

  if Trim(RzMemo_PlanScheme.Lines[RzMemo_UrlListLine - 1]) = '' then
    Exit;

  Result := RealPlanNameList.IndexOf(Trim(RzMemo_PlanScheme.Lines[RzMemo_UrlListLine - 1]));
end;

procedure TFrmBaseForm1.ExecuteNonSamePlanDifferentLoginACC;
var
  //succPri_TieziID: string;
  whichProxy: Integer;
  whichProxyindex: Integer;

  setproxyrightorwrong: Boolean;
  setproxyrightorwrongsth: string;
  tempserverIP: string;
  usesimpledaili: Boolean;
  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;

  gtc1, gtc2: DWORD;
  isNeedSaving: Boolean;
  VarFeedbackIn: string;
  i,jj: Int64;
  minNumber, maxNumber: Int64;
  iii: Integer;
  ii: Integer;
  PlanInd: Integer;
  Existss: Boolean;
  SourceText: string;

  PasteContent_total: string;

  posPasteContenttotal: Integer;
  PasteContent: string;
  PasteContent_Main: string;
  posPasteContent_Main: Integer;
  PatternForHttps: string;

  matchs: TMatchCollection;
  match: TMatch;
  matchvalue: string;
  matchCoun: Integer;
  //Stringarr: array of string;
  Stringarr: array of TVarRec;
  formatori: string;
  JScript: string;


  n: Integer;
  arr: array[0..255] of Char;
  oldHtmlSourceCode: string;
  submittype: Integer;
  PerTieziURL: string;
  InputPlaceEx_JS: TPoint;
  Linshi_Circulations, i_Circulations: Integer;
  Max_tiezi_ID: Int64;
  addContent: string;
  Updatesqll, Insertsqll: string;
  Linshi_String: string;
  PlanSchemeTable: TSQLiteTable;
  TotalPlansCheme: Integer;
  isReplyinsubFloor: Boolean;
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

  //Temp_onlyForwechat: string;
  SpinEditStartPostIdText: string;
  Temp_onlyForMainFloor: string;

  Temp_PlanScheme_DownloadorOffline: string;
  Temp_PlanScheme_TotalThreadForDownloadMode: string;
  PlanScheme_ValidCount: string;

  Temp_add: string;
  Temp_add_Pervalue: string;
  Temp_addlist: TStringList;
  Temp_substract: string;

  succsulFatie: Boolean;


  TheCopyTableAct: TGetFullfilledMemoryTable;
  SplitDBFromSource: TSplitDBFromSource;
  TheCopyTableAct2: TGetMaxDateInDataBase;
  SaveSearchedofTieziOnline: TSaveSearchedofTieziOnline;
  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;

  TheCopyTableAct3: TGetAddedPostToTempTable;
  CarryKeySearchedPostToTempTable: TCarryKeySearchedPostToTempTable;
  VarHint: string;
  AATProxyEX: TInstActionProxy;

  TempPlanScheme_index: string;
  TempPlanScheme_PlanName: string;

  slDataBase: TSQLiteDatabase;
  sSQL: string;


 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;

  F: TextFile;
  //i: integer;
  fileStr: string;
  strfileName: string;
  Firststr,SecondStr: string;


  SetCacheDir: string;
  inputtext: string;

  LoginedAcc: string;
  linshiPoint: TPoint;
  CI: TCursorInfo;


label a, b;

  function SatisfyRestrict: Boolean;
  begin
    Result := False;
    if Linshi_Circulations > 0 then
    begin
      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
      begin
        if i_Circulations = 0 then
          Result := True;
      end
      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
      begin
        if (Action1_Tag - 1) = Linshi_Circulations then
        begin
          Result := True;
        end;
      end
    end;
    //CloseP;
    DelayEx(10);
  end;

  function judgeMustReplyInSecondFloor(var varsuccsulFatie: Boolean): Boolean;
  var
    linshi_strlist: TStringList;
    linshi_singlestr: string;
    SymboPos: Integer;
    strFoorNo: string;
    strReplyNum: string;
  begin
    Result := False;
    if Pri_FloorDetails = '' then
      Exit;

    linshi_strlist := TStringList.Create;
    try
      linshi_strlist.Delimiter := '|';
      linshi_strlist.DelimitedText := Pri_FloorDetails;

      if linshi_strlist.Count >= 2 then
      begin
       //2楼分析
      linshi_singlestr := linshi_strlist.Strings[1];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 3 then
      begin
       //3楼分析
      linshi_singlestr := linshi_strlist.Strings[2];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;



      if linshi_strlist.Count >= 4 then
      begin
         //4楼分析
      linshi_singlestr := linshi_strlist.Strings[3];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 5 then
      begin
       //5楼分析
      linshi_singlestr := linshi_strlist.Strings[4];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 6 then
      begin
       //6楼分析
      linshi_singlestr := linshi_strlist.Strings[5];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;


//      if linshi_strlist.Count >= 2 then
//      begin
//       //2楼分析
//      linshi_singlestr := linshi_strlist.Strings[1];
//      SymboPos := Pos('=', linshi_singlestr);
//      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
//      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
////      if strReplyNum = '0' then
////      begin
////        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
////        if varsuccsulFatie then
////        begin
////          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
////          Pri_FloorDetails := linshi_strlist.DelimitedText;
////        end;
////        Result := True;
////        Exit;
////      end
////      else if strReplyNum = '1' then
//      begin
//        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
//        if varsuccsulFatie then
//        begin
//          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
//          Pri_FloorDetails := linshi_strlist.DelimitedText;
//        end;
//        Result := True;
//        Exit;
//      end;
//      end;

    finally
      linshi_strlist.Free;
    end;

  end;

  function IsDeletedOrNoReplyTieZi(var FeedbackIn: string): Boolean;
  var
    JsScriptstr: string;
    replynum: string;
    cardmenNum: string;   //关注数
    cardinfoNum: string;  //贴吧总贴子数
    posterwarning: string;
  begin
    Result := True;

    G_InputP := '';
    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("head")[0]) var blanks=1;else var blanks=0;' + 'alert(blanks);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第1个');
    end;
    if G_InputP <> '1' then
    begin
      G_InputP := '';

      FeedbackIn := '空白页面！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("title")[0].innerText=="403 Forbidden") var Forbiddens=1;else var Forbiddens=0;' + 'alert(Forbiddens);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第2个');
    end;
    if G_InputP = '1' then
    begin
      G_InputP := '';

      FeedbackIn := '无法正常打开贴子！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementById("errorText")) ' + 'var isdelete=1; else var isdelete=0;' + 'alert(isdelete);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第3个');
    end;
    if G_InputP = '0' then
    begin

    end
    else if G_InputP = '1' then
    begin
      //Pri_DeleteOrNot := '1';
      G_InputP := '';

      FeedbackIn := '该贴已不存在或无法回复或已删除！';
      Pri_DeleteOrNot := '1';
      isNeedSaving := True;
      Exit;
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '判定是否删除出错！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr :=
    'try{' +
      'var element=document.getElementsByClassName("l_reply_num")[0];' +
      'var first=element.children[0];' +
      'var replynum=first.innerText;' +
      'var Z = replynum;' +
      'Z+="|";' +
      'alert(Z);' +
    '}' +
      'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第4个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      replynum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      replynum := StringReplace(replynum, ',', '', [rfReplaceAll]);

      Pri_FloorCount := replynum;
      Pri_DeleteOrNot := '0';

      G_InputP := '';
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '找回复数出错，可能是空白页！';

      Exit;
    end;
//
//    JsScriptstr :=
//    'try{' +
//      'var posterwarning=0;' +
//      //'if (document.getElementsByClassName("tb_poster_info poster_warning"))' +
//
//      'if (document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable")[0])' +
//         '{' +
////         'var posterwarningelement=document.getElementsByClassName("tb_poster_info poster_warning")[0];' +
////         'if (posterwarningelement.children[0]) {' +
////         'var posterwarningchild=posterwarningelement.children[0];' +
////         'var posterwarninginnertext=posterwarningchild.innerText;' +
////         'posterwarning=parseInt(posterwarninginnertext);' +
////         '} else posterwarning=100;' +
//
//
//         'posterwarning=100;' +
//
//
//
//         '}' +
//         'else posterwarning=0;' +
//         'var Z = posterwarning;' +
//         'Z+="|";' +
//         'alert(Z);' +
//    '}' +
//      'catch(e)' +
//      '{alert(e)}';
//
//
//    JsScriptstr := 'alert(document.body.innerHTML)';
//    MainForm.ExeJs(JsScriptstr);
//    while G_InputP = '' do
//    begin
//      DelayEX(100);
//      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第5个');
//    end;


//
//    if Pos('tb_poster_info poster_warning', G_InputP) > 0 then
//    begin
//      ShowMessageEX('1');
//    end
//    else
//    begin
//      ShowMessageEX('2');
//    end;
//
//    if Pos('ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
//    end;
//
//    if Pos('抱歉', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
////    end;
//
//    Abort;
//
//    if Pos('|', G_InputP) > 0 then
//    begin
//      posterwarning := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := posterwarning;
//    end
//    else if Pos('children', G_InputP) > 0 then
//    begin
//      posterwarning := '0';
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := '0';
//    end
//    else
//    begin
//      FeedbackIn := '找警告信息出错！';
//
//      Exit;
//    end;
//    if Pri_CanReplyOrNot = 'NaN' then
//    begin
//      FeedbackIn := '警告信息十分罕见！';
//      Exit;
//    end;


    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_menNum")[0]) var element=document.getElementsByClassName("card_menNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[0];' + 'var cardmenNum=element.innerText;' + 'var Z = cardmenNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第6个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardmenNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardmenNum := StringReplace(cardmenNum, ',', '', [rfReplaceAll]);

      Pri_FollowCountForOneTieBa := cardmenNum;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_infoNum")[0]) var element=document.getElementsByClassName("card_infoNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' + 'var cardinfoNum=element.innerText;' + 'var Z = cardinfoNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第7个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardinfoNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      Pri_TotalPostForOneTieBa := cardinfoNum;
    end;
    G_InputP := '';



//获取贴吧名
    JsScriptstr := 'try{' +
    'if (document.getElementsByClassName("card_title_fname")[0]) var element=document.getElementsByClassName("card_title_fname")[0];' +
    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
    'var cardinfoNum=element.innerText;' +
    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
    'Z+="|";' +
    'alert(Z);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第8个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      PriBaName := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      //cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      EnterCriticalSection(CS);
                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
                                        try
                                            Linshi_String := 'Provider Name=SQLite;';
                                            Linshi_String := Linshi_String + 'Database=' + APPCommonPath + DbName1 + ';';
                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
                                            Linshi_String := Linshi_String + 'Login Prompt=False';

                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;

                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

                                            LinshiMemoryTableUniConnection.Connected := True;
                                            LinshiMemoryTableUniConnection.Connected := False;


                                            sSQL := 'replace into TieBa_BasicInfo values ('
                                            + QuotedStr(PriBaName) + ','
                                            + Pri_FollowCountForOneTieBa + ','
                                            + Pri_TotalPostForOneTieBa + ','
                                            + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime))  + ')';



                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);

                                        finally
                                            LinshiMemoryTableUniConnection.Free;
                                        end;
      LeaveCriticalSection(CS);
    end;
    G_InputP := '';
//获取贴吧名



//新加：获取创建时间，标题，内容

  if Pri_TieziIDFileNmae <> '' then
  begin
    //if TRegEx.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
    if Pos('add', Pri_TieziIDFileNmae) > 0 then
    begin
      Pri_Topic := '';
      Pri_Content := '';
      Pri_CreateTime := '';


      JsScriptstr := 'try{' +
      'if (document.getElementsByClassName("core_title_txt pull-left text-overflow")[0]) var element=document.getElementsByClassName("core_title_txt pull-left text-overflow")[0];' +
      //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
      'var cardinfoNum=element.innerText;' +
      //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
      'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
      'Z+="|";' +
      'alert(Z);' +
      '}' +
      'catch(e)' +
      '{alert(e)}';
      MainForm.ExeJs(JsScriptstr);
      while G_InputP = '' do
      begin
        DelayEX(100);
        if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第10个');
      end;
      if Pos('|', G_InputP) > 0 then
      begin
        Pri_Topic := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      end;
      G_InputP := '';


//
//      JsScriptstr := 'try{' +
//      'if (document.getElementsByClassName("core_title_txt pull-left text-overflow")[0]) var element=document.getElementsByClassName("core_title_txt pull-left text-overflow")[0];' +
//      //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
//      'var cardinfoNum=element.innerText;' +
//      //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
//      'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
//      'Z+="|";' +
//      'alert(Z);' +
//      '}' +
//      'catch(e)' +
//      '{alert(e)}';
//      MainForm.ExeJs(JsScriptstr);
//      while G_InputP = '' do
//      begin
//        DelayEX(100);
//        if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第10个');
//      end;
//      if Pos('|', G_InputP) > 0 then
//      begin
//        Pri_Topic := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//      end;
//      G_InputP := '';


      JsScriptstr := 'try{' +
      'if (document.getElementsByClassName("d_post_content j_d_post_content")[0]) var element=document.getElementsByClassName("d_post_content j_d_post_content")[0];' +
      //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
      'var cardinfoNum=element.innerText;' +
      //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
      'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
      'Z+="|";' +
      'alert(Z);' +
      '}' +
      'catch(e)' +
      '{alert(e)}';
      MainForm.ExeJs(JsScriptstr);
      while G_InputP = '' do
      begin
        DelayEX(100);
        if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第11个');
      end;
      if Pos('|', G_InputP) > 0 then
      begin
        Pri_Content := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      end;
      G_InputP := '';


      JsScriptstr := 'try{' +
      'if (document.getElementsByClassName("post-tail-wrap")[0]) var element=document.getElementsByClassName("post-tail-wrap")[0];' +
      //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
      'var cardinfoNum=element.innerText;' +
      //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
      'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
      'Z+="|";' +
      'alert(Z);' +
      '}' +
      'catch(e)' +
      '{alert(e)}';
      MainForm.ExeJs(JsScriptstr);
      while G_InputP = '' do
      begin
        DelayEX(100);
        if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第12个');
      end;
      if Pos('|', G_InputP) > 0 then
      begin
        Pri_CreateTime := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
        Pri_CreateTime := TRegEx.Match(Pri_TieziIDFileNmae, '\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}').Value;
      end;
      G_InputP := '';

    end;
  end;


  //新加：获取创建时间，标题，内容


    //JsScriptstr := 'try{' + 'var oP = document.getElementsByClassName("core_reply_tail clearfix");' + 'var OutPtInfo = "";' + 'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' + 'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' + 'var tailinfoFloorNo=parseInt(tailinfo);' + 'if (tailinfoFloorNo==1) var unfoldcount=0;else ' + '{' + 'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' + 'if (unfoldcount=="") unfoldcount=0;' + '}' + 'tailinfoFloorNo+="=";' + 'tailinfoFloorNo+=unfoldcount;' + 'OutPtInfo+="|";' + 'OutPtInfo+=tailinfoFloorNo;' + '}' + 'OutPtInfo+="|";' + 'OutPtInfo+=oP.length;' + 'alert(OutPtInfo);' + '}' + 'catch(e)' + '{alert(e)}';
    JsScriptstr :=
    'try{' +
       'var oP = document.getElementsByClassName("core_reply_tail clearfix");' +
       'var OutPtInfo = "";' +
       'for(var i = 0; i < oP.length; i++)' +
         '{' +
         'var element=oP[i];' +
         'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
         'var tailinfoFloorNo=parseInt(tailinfo);' +
         'if (tailinfoFloorNo>=2018) {' +
            'tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
            'tailinfoFloorNo=parseInt(tailinfo);' +
            '}' +
         'if (tailinfoFloorNo==1) var unfoldcount=0;else ' +
            '{' +
            'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' +
            'if (unfoldcount=="") unfoldcount=0;' +
            '}' +
         'tailinfoFloorNo+="=";' +
         'tailinfoFloorNo+=unfoldcount;' +
         'OutPtInfo+="|";' +
         'OutPtInfo+=tailinfoFloorNo;' +
         '}' +
       'OutPtInfo+="|";' +
       'OutPtInfo+=oP.length;' +
       'alert(OutPtInfo);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第9个');
    end;
    if (G_InputP <> '|0') and (Pos('|', G_InputP) > 0) then
    begin
      Pri_FloorDetails_pos := LastPos('|', G_InputP);

      Pri_FloorDetails := Copy(G_InputP, 2, Pri_FloorDetails_pos - 2);
      Pri_FloorDetails_subfloorreply := Copy(G_InputP, Pri_FloorDetails_pos + 1, Length(G_InputP) - Pri_FloorDetails_pos);

    end;

    G_InputP := '';

//保存所有信息

//    if Pri_CanReplyOrNot <> '0' then
//    begin
//      FeedbackIn := '有等级要求无法回复！';
//
//      isNeedSaving := true;
//
//      Exit;
//    end;

    isNeedSaving := true;
    Result := False;
  end;

  function ConformToFloorCAndFollowCount(var LFeedbackIn: string): Boolean;
  var
    LinshiRiQi: TDateTime;
    LinshiRiQi_String: string;
  begin
    Result := False;
    LFeedbackIn := '';
//    if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//    begin
//      Result := True;
//    end
//    else
    if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
    begin
      if StrToInt64Def(Temp_ReplyCountBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) < StrToInt64Def(Temp_ReplyCountBegin, 0) then
        begin
          LFeedbackIn := '回复数少于最少回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_ReplyCountEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) > StrToInt64Def(Temp_ReplyCountEnd, 0) then
        begin
          LFeedbackIn := '回复数大于最大回复数';
          Exit;
        end;
      end;


      if Temp_Control2FloorVacancy <> '0' then
      begin
        if Trim(Pri_FloorDetails) <> '' then
        begin
          if Length(Trim(Pri_FloorDetails)) >= 7 then
          begin
            if (Copy(Trim(Pri_FloorDetails), 7, 1) <> '0') and
            (Copy(Trim(Pri_FloorDetails), 7, 1) <> '1')
            then
            begin
              LFeedbackIn := '无热贴2楼空位';
              Exit;
            end;
          end
          else
          begin
            LFeedbackIn := '无热贴2楼空位，无2楼';
            Exit;
          end;
        end;
      end;


      Result := True;
    end
    else
    if Temp_PlanScheme_DownloadorOffline = '1' then //贴子ID
    begin
      if StrToInt64Def(Temp_ReplyCountBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) < StrToInt64Def(Temp_ReplyCountBegin, 0) then
        begin
          LFeedbackIn := '回复数少于最少回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_ReplyCountEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) > StrToInt64Def(Temp_ReplyCountEnd, 0) then
        begin
          LFeedbackIn := '回复数大于最大回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_FollowPopulationBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FollowCountForOneTieBa, 0) < StrToInt64Def(Temp_FollowPopulationBegin, 0) then
        begin
          LFeedbackIn := '贴吧关注数少于最少关注数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_FollowPopulationEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FollowCountForOneTieBa, 0) > StrToInt64Def(Temp_FollowPopulationEnd, 0) then
        begin
          LFeedbackIn := '贴吧关注数大于最大关注数';
          Exit;
        end;
      end;


      if StrToInt64Def(Temp_TieBaPostTotalBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_TotalPostForOneTieBa, 0) < StrToInt64Def(Temp_TieBaPostTotalBegin, 0) then
        begin
          LFeedbackIn := '贴吧总贴数少于最少贴吧贴子数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_TieBaPostTotalEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_TotalPostForOneTieBa, 0) > StrToInt64Def(Temp_TieBaPostTotalEnd, 0) then
        begin
          LFeedbackIn := '贴吧总贴数大于最大贴吧贴子数';
          Exit;
        end;
      end;

      if StrToIntDef(Temp_LastHowManyDays, 0) > 0 then
      begin
        LinshiRiQi := incDay(TheRealTimeTime_Datetime, (0 - StrToIntDef(Temp_LastHowManyDays, 0)));
        LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);

        if Pri_CreateTime < LinshiRiQi_String then
        begin
          LFeedbackIn := '贴子创建时间不在最近' + Temp_LastHowManyDays + '天';
          Exit;
        end;
      end;

      if Temp_Control2FloorVacancy <> '0' then
      begin
        if Trim(Pri_FloorDetails) <> '' then
        begin
          if Length(Trim(Pri_FloorDetails)) >= 7 then
          begin
            if (Copy(Trim(Pri_FloorDetails), 7, 1) <> '0') and
            (Copy(Trim(Pri_FloorDetails), 7, 1) <> '1')
            then
            begin
              LFeedbackIn := '无热贴2楼空位';
              Exit;
            end;
          end
          else
          begin
            LFeedbackIn := '无热贴2楼空位，无2楼';
            Exit;
          end;
        end;
      end;

      Result := True;
    end;
  end;

begin
  if b_isRuning then
    Exit;

  b_isRuning := True;


  //LoadProxyIP;
  //whichProxy := -1;
  disableSomething;

  try
    TotalPlansCheme := GetValidCountOfListEX;
    if TotalPlansCheme < 1 then
    begin
      SaveTempFileOrNot := False;
      ShowMessageEX('无方案配置可用！');
      Exit;
    end;

    TotalPlansCheme := GetValidCountOfList;

//    Automatic_Mode := 2;
//    submittype := StrToInt(QueryString('SELECT Submit_Type FROM SystemInfo'));
    Linshi_Circulations := StrToIntDef(Trim(RzEditWorkTimes.Text), 0);
    if Linshi_Circulations < 0 then
      Linshi_Circulations := 0;

    i_Circulations := Linshi_Circulations;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_i_CirculationsForRestart then
      begin
        i_Circulations := StrToInt(ParamStr(2));
        UsedOrNot_i_CirculationsForRestart := True;
      end;
    end;

    //Max_tiezi_ID := GetMax_tiezi_ID;

    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart then
      begin
        Action1_Tag := StrToInt(ParamStr(3));
        UsedOrNot_Action1_TagForRestart := True;
      end;
    end;

    Action1_Tag1 := 1;
    if (ParamCount>=1) then
    begin
      if not UsedOrNot_Action1_TagForRestart1 then
      begin
        Action1_Tag1 := StrToInt(ParamStr(4));
        UsedOrNot_Action1_TagForRestart1 := True;
      end;
    end;




    repeat
      RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作开始' + #13#10#13#10#13#10);
      RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作开始' + #13#10#13#10#13#10);

      try
        EnterCriticalSection(CS);
        PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
        'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
        'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
        'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
        ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
        ' OnlyForWechat, OnlyMainFloor, DownloadorOffline, TotalThreadForDownloadMode, PlanScheme_ValidCount   ' +
        'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' +
        IntToStr(TotalPlansCheme));
        LeaveCriticalSection(CS);

        try
          PlanSchemeTable.MoveFirst;
          while not PlanSchemeTable.EOF do
          begin
            VarHint := rbStart.Caption;
            rbStart.Caption := '';
            with THandleWaitings.create(100) do
            try
                    iniWaiting(rbstart, 7, 7);

                    Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
                    Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
                    Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
                    Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
                    Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
                    Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
                    Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
                    Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
                    Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
                    Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
                    Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
                    Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
                    Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
                    Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);


                    Temp_add := PlanSchemeTable.FieldAsString(15);
                    Temp_substract := PlanSchemeTable.FieldAsString(16);
                    Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                    TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
                    //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
                    TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                    if b_Debug then
                    begin
                      RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                      RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                      RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                      RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                    end;

                    //Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
                    SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
                    Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);


                    Temp_PlanScheme_DownloadorOffline := PlanSchemeTable.FieldAsString(20);
                    Temp_PlanScheme_TotalThreadForDownloadMode := PlanSchemeTable.FieldAsString(21);
                    PlanScheme_ValidCount := PlanSchemeTable.FieldAsString(22);


                    if Pos('//', TempPlanScheme_PlanName) > 0 then
                    begin
                      PlanSchemeTable.Next;
                      Continue;
                    end;


                    if (ParamCount>=1) then
                    begin
                      if not UsedOrNot_PlanindexForRestart then
                      begin
                        if StrToInt(TempPlanScheme_index) < StrToInt(ParamStr(1)) then
                        begin
                          PlanSchemeTable.Next;
                          Continue;
                        end
                        else
                        begin
                          UsedOrNot_PlanindexForRestart := True;
                        end;
                      end;
                    end;

                    LoginedAcc := SetCacheDirectoryNa;


                    if LoginedAcc <> Temp_usedAcc then
                    begin
                      SaveTempFileOrNot := False;
                      CnTrayIcon1.Tag := 1;
                      Restart_Flag := True;

                      PlanindexForRestart := TempPlanScheme_index;
                      i_CirculationsForRestart := IntToStr(i_Circulations);
                      Pri_TieziIDForRestart := Pri_TieziID;
                      Action1_TagForRestart := IntToStr(Action1_Tag);
                      Action1_TagForRestart1 := IntToStr(Action1_Tag1);

                      RzComboBoxWillLoginAcc.ItemIndex := RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc);
                      self.Close;
                      Abort;
                    end;

//                    TemptDirectory := APPCommonPath + 'temp.temp';
//                    if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
//                    slDataBase := TSQLiteDatabase.Create(TemptDirectory);
//                    try
//                      sSQL :=
//                          'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
//                          '[TieziID] integer NOT NULL,' +
//                          '[FileMing] TEXT NOT NULL,' +
//                          'PRIMARY KEY ([TieziID],[FileMing]));';
//
//                      slDataBase.ExecSQL(sSQL);
//                    finally
//                      slDataBase.Free;
//                    end;

                    if Action1_Tag1 > 1 then
                    begin
                      if Temp_PlanScheme_DownloadorOffline = '0' then  //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin

                              TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';


                              if not FileExists(TemptDirectory1) then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID形成的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                              try
                                if not slDataBase.TableExists('SeeLiangTieziList') then
                                //SeeLiangTieziList
                                begin
                                  SaveTempFileOrNot := False;
                                  ShowMessageEX('额外添加帖子ID形成的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;

                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;
                          try

                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin

                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try
                                          //TheCopyTableAct3: TGetAddedPostToTempTable;
                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

//                                              if RzCheckBoxSamePlan.Checked then
//                                              begin
//                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
//                                              end;

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                              end
                              else
                              begin
                                  suDBNameList := TStringList.Create;

                                  try
                                           SourceFileDir := APPCommonPath + relativePasth;

                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                           while found=0 do
                                           begin
                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                               and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                               then
                                               begin
                                                 suDBName := SearchRec.Name;
                                                 suDBNameList.Add(suDBName);
                                               end;
                                               found:=FindNext(SearchRec);
                                           end;
                                           FindClose(SearchRec);


                                           suDBNameListCount := suDBNameList.Count;

                                           if suDBNameListCount < 1 then
                                           begin
                                              ShowMessageEX('数据源不存在');
                                              abort;
                                           end;


                                           SetLength(MaxCreatetimeList, suDBNameListCount);


                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

                                              if Temp_LastHowManyDays <> '0' then
                                              begin

                                                  for J := 0 to suDBNameListCount - 1 do
                                                  begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                                    TheCopyTableAct2.iSerialNo := J;
                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                    AATProxyEX.AddAction(TheCopyTableAct2);
                                                  end;
                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                              end;
                                              SetLength(MaxCreatetimeList, 0);



                                              for J := 0 to suDBNameListCount - 1 do
                                              begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                                    with TheCopyTableAct do
                                                    begin
                                                        iSerialNo := J;
                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                        WenJianMing := Trim(suDBNameList.Strings[J]);

                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                        Ba_dingtie_type := Temp_dingtie_type;
                                                        Ba_dingtie_content := Temp_dingtie_content;

                                                        Ba_add := Temp_add;
                                                        Ba_substract := Temp_substract;


                                                        if b_Debug then
                                                        begin
                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                        end;

                                                      //Ba_add, Ba_substract: string;
                                                    end;
                                                    AATProxyEX.AddAction(TheCopyTableAct);
                                              end;
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                                  finally
                                         suDBNameList.free;
                                  end;
                              end;
                          finally
                            Temp_addlist.free;
                          end;

                        end
                        else
                        begin
                          TemptDirectory := APPCommonPath + 'temp.temp';
                          if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                          slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                          try
                            sSQL :=
                                'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                '[TieziID] integer NOT NULL,' +
                                '[FileMing] TEXT NOT NULL,' +
                                'PRIMARY KEY ([TieziID],[FileMing]));';
                            slDataBase.ExecSQL(sSQL);
                          finally
                            slDataBase.Free;
                          end;

                            suDBNameList := TStringList.Create;
                            try
                                     SourceFileDir := APPCommonPath + relativePasth;

                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                     while found=0 do
                                     begin
                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                         and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                         then
                                         begin
                                           suDBName := SearchRec.Name;
                                           suDBNameList.Add(suDBName);
                                         end;
                                         found:=FindNext(SearchRec);
                                     end;
                                     FindClose(SearchRec);


                                     suDBNameListCount := suDBNameList.Count;

                                     if suDBNameListCount < 1 then
                                     begin
                                        ShowMessageEX('数据源不存在');
                                        abort;
                                     end;


                                     SetLength(MaxCreatetimeList, suDBNameListCount);


                                    AATProxyEX := TInstActionProxy.create;
                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        if Temp_LastHowManyDays <> '0' then
                                        begin

                                            for J := 0 to suDBNameListCount - 1 do
                                            begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                              TheCopyTableAct2.iSerialNo := J;
                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                              AATProxyEX.AddAction(TheCopyTableAct2);
                                            end;
                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                        end;
                                        SetLength(MaxCreatetimeList, 0);



                                        for J := 0 to suDBNameListCount - 1 do
                                        begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                              with TheCopyTableAct do
                                              begin
                                                  iSerialNo := J;
                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                  WenJianMing := Trim(suDBNameList.Strings[J]);

                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                  Ba_dingtie_type := Temp_dingtie_type;
                                                  Ba_dingtie_content := Temp_dingtie_content;

                                                  Ba_add := Temp_add;
                                                  Ba_substract := Temp_substract;

                                                  if b_Debug then
                                                  begin
                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                  end;

                                                //Ba_add, Ba_substract: string;
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct);
                                        end;
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                          if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                            TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                            finally
                                   suDBNameList.free;
                            end;
                        end;

                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '3' then  //贴吧名
//                      begin
//
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then  //关键字
                      begin
                          //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_index + '.temp';
                          //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                          //RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
                          TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                          if not FileExists(TemptDirectory2) then
                          begin
                            SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴所在的临时文件被删除');
                            Abort;
                          end;

                          slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                          try
                            if not slDataBase.TableExists('SeeLiangTieziList') then
                            begin
                              SaveTempFileOrNot := False;
                              ShowMessageEX('关键词所搜出的贴所在的临时文件被修改');
                              Abort;
                            end;
                          finally
                            slDataBase.Free;
                          end;

                          TemptDirectory := APPCommonPath + 'temp.temp';
                          if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                          slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                          try
                            sSQL :=
                                'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                '[TieziID] integer NOT NULL,' +
                                '[FileMing] TEXT NOT NULL,' +
                                'PRIMARY KEY ([TieziID],[FileMing]));';
                            slDataBase.ExecSQL(sSQL);
                          finally
                            slDataBase.Free;
                          end;

                          AATProxyEX := TInstActionProxy.create;
                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                          AATProxyEX.StartWork; //开始工作
                          try
                          //TheCopyTableAct3: TGetAddedPostToTempTable;
                              CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                              with CarryKeySearchedPostToTempTable do
                              begin
                                  WenJianMingPath := TemptDirectory2;   //
                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                  deleteorno := False; //TempPlanScheme_PlanName
                                  //WenJianMing := 'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';   //'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
                                  WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                              end;
                              AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

    //                          if (ParamCount>=1) then
    //                          begin
    //                            if Trim(ParamStr(5)) <> '' then
    //                            begin
    //                              if not UsedOrNot_Pri_TieziIDForRestart then
    //                              begin
    //                                Pri_TieziID := ParamStr(5);
    //                                UsedOrNot_Pri_TieziIDForRestart := True;
    //                              end;
    //                            end;
    //                          end;

                              if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                              //TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
                              AATProxyEX.AddAction(TheCopyTableAct1);
                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                          finally
                              AATProxyEX.Free;
                          end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴子ID
                      begin
                              TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';


                              if not FileExists(TemptDirectory1) then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                              try
                                if not slDataBase.TableExists('SeeLiangTieziList') then
                                begin
                                  SaveTempFileOrNot := False;
                                  ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;

                            AATProxyEX := TInstActionProxy.create;
                            AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                            AATProxyEX.StartWork; //开始工作
                            try
                            //TheCopyTableAct3: TGetAddedPostToTempTable;
                                TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                //TheCopyTableAct3.Ba_add := Temp_add;
                                TheCopyTableAct3.WenJianMing := 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                AATProxyEX.AddAction(TheCopyTableAct3);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);


                                AATProxyEX.AddAction(TheCopyTableAct1);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                            finally
                                AATProxyEX.Free;
                            end;
                      end;

                    end
                    else
                    begin
                      if Temp_PlanScheme_DownloadorOffline = '0' then  //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin
                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;

                          try
                                  TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';
                                  if not FileExists(TemptDirectory1) then //DeleteFile(TemptDirectory1);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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

                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;


                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          slDataBase.BeginTransaction;

                                          try
                                            for ii := 0 to Temp_addlist.Count - 1 do
                                            begin
                                              Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
                                              if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
                                              begin
                                                sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
                                                QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
                                                slDataBase.ExecSQL(sSQL);
                                              end;
                                            end;
                                          finally
                                            slDataBase.Commit;
                                          end;
                                    finally
                                      slDataBase.Free;
                                    end;



                                  //resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
                                  end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;



                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin
                                AATProxyEX := TInstActionProxy.create;
                                AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                AATProxyEX.StartWork; //开始工作
                                try
                                //TheCopyTableAct3: TGetAddedPostToTempTable;
                                    TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                    TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                    //TheCopyTableAct3.Ba_add := Temp_add;
                                    TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                    AATProxyEX.AddAction(TheCopyTableAct3);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                    //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                    TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


//                                    if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                      TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                    AATProxyEX.AddAction(TheCopyTableAct1);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                finally
                                    AATProxyEX.Free;
                                end;
                              end
                              else
                              begin
                                  suDBNameList := TStringList.Create;

                                  try
                                           SourceFileDir := APPCommonPath + relativePasth;

                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                           while found=0 do
                                           begin
                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                               and (SearchRec.Attr<>faDirectory) //and (Pos('temp', Trim(SearchRec.Name)) < 1)
                                               and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                               then
                                               begin
                                                 suDBName := SearchRec.Name;
                                                 suDBNameList.Add(suDBName);
                                               end;
                                               found:=FindNext(SearchRec);
                                           end;
                                           FindClose(SearchRec);


                                           suDBNameListCount := suDBNameList.Count;

                                           if suDBNameListCount < 1 then
                                           begin
                                              ShowMessageEX('数据源不存在');
                                              abort;
                                           end;


                                           SetLength(MaxCreatetimeList, suDBNameListCount);


                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

                                              if Temp_LastHowManyDays <> '0' then
                                              begin

                                                  for J := 0 to suDBNameListCount - 1 do
                                                  begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                                    TheCopyTableAct2.iSerialNo := J;
                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                    AATProxyEX.AddAction(TheCopyTableAct2);
                                                  end;
                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                              end;
                                              SetLength(MaxCreatetimeList, 0);



                                              for J := 0 to suDBNameListCount - 1 do
                                              begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                                    with TheCopyTableAct do
                                                    begin
                                                        iSerialNo := J;
                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                        WenJianMing := Trim(suDBNameList.Strings[J]);

                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                        Ba_dingtie_type := Temp_dingtie_type;
                                                        Ba_dingtie_content := Temp_dingtie_content;

                                                        Ba_add := Temp_add;
                                                        Ba_substract := Temp_substract;


                                                        if b_Debug then
                                                        begin
                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                        end;

                                                      //Ba_add, Ba_substract: string;
                                                    end;
                                                    AATProxyEX.AddAction(TheCopyTableAct);
                                              end;
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                              if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                                  finally
                                         suDBNameList.free;
                                  end;
                              end;
                          finally
                            Temp_addlist.Free;
                          end;
                        end
                        else
                        begin
                            TemptDirectory := APPCommonPath + 'temp.temp';
                            if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                            slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                            try
                              sSQL :=
                                  'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                  '[TieziID] integer NOT NULL,' +
                                  '[FileMing] TEXT NOT NULL,' +
                                  'PRIMARY KEY ([TieziID],[FileMing]));';
                              slDataBase.ExecSQL(sSQL);
                            finally
                              slDataBase.Free;
                            end;

                            suDBNameList := TStringList.Create;
                            try
                                     SourceFileDir := APPCommonPath + relativePasth;

                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                     while found=0 do
                                     begin
                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                         and (SearchRec.Attr<>faDirectory) //and (Pos('temp', Trim(SearchRec.Name)) < 1)
                                         and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                         then
                                         begin
                                           suDBName := SearchRec.Name;
                                           suDBNameList.Add(suDBName);
                                         end;
                                         found:=FindNext(SearchRec);
                                     end;
                                     FindClose(SearchRec);


                                     suDBNameListCount := suDBNameList.Count;

                                     if suDBNameListCount < 1 then
                                     begin
                                        ShowMessageEX('数据源不存在');
                                        abort;
                                     end;


                                     SetLength(MaxCreatetimeList, suDBNameListCount);


                                    AATProxyEX := TInstActionProxy.create;
                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        if Temp_LastHowManyDays <> '0' then
                                        begin

                                            for J := 0 to suDBNameListCount - 1 do
                                            begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                              TheCopyTableAct2.iSerialNo := J;
                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                              AATProxyEX.AddAction(TheCopyTableAct2);
                                            end;
                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                        end;
                                        SetLength(MaxCreatetimeList, 0);



                                        for J := 0 to suDBNameListCount - 1 do
                                        begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                              with TheCopyTableAct do
                                              begin
                                                  iSerialNo := J;
                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                  WenJianMing := Trim(suDBNameList.Strings[J]);

                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                  Ba_dingtie_type := Temp_dingtie_type;
                                                  Ba_dingtie_content := Temp_dingtie_content;

                                                  Ba_add := Temp_add;
                                                  Ba_substract := Temp_substract;

                                                  if b_Debug then
                                                  begin
                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                  end;

                                                //Ba_add, Ba_substract: string;
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct);
                                        end;
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
                                        if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                          TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                            finally
                                   suDBNameList.free;
                            end;
                        end;
                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//                      begin
//
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then  //关键字
                      begin

                          TemptDirectory := APPCommonPath + 'temp.temp';
                          if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                          slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                          try
                            sSQL :=
                                'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                '[TieziID] integer NOT NULL,' +
                                '[FileMing] TEXT NOT NULL,' +
                                'PRIMARY KEY ([TieziID],[FileMing]));';
                            slDataBase.ExecSQL(sSQL);
                          finally
                            slDataBase.Free;
                          end;
                                  TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                                  if not FileExists(TemptDirectory2) then //DeleteFile(TemptDirectory2);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try
                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
                                        try
                                            Linshi_String := 'Provider Name=SQLite;';
                                            Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
                                            Linshi_String := Linshi_String + 'Login Prompt=False';

                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;

                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

                                            LinshiMemoryTableUniConnection.Connected := True;
                                            LinshiMemoryTableUniConnection.Connected := False;


                                            sSQL :=
                                            //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                            'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                            //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);

                                            SuccCo := 0;
                                            FailCo := 0;

                                            SaveSearchedofTieziOnline := TSaveSearchedofTieziOnline.create;
                                            SaveSearchedofTieziOnline.ThreadCForOnlineSearch := StrToIntDef(Temp_PlanScheme_TotalThreadForDownloadMode, 1);
                                            SaveSearchedofTieziOnline.HowManyPage := strtointdef(Temp_LastHowManyDays, 0);
                                            SaveSearchedofTieziOnline.KeyWords := Temp_PlanScheme_TopicContent;
                                            SaveSearchedofTieziOnline.WebNames := Temp_PlanScheme_BarName;
                                            SaveSearchedofTieziOnline.MulThreadornot := true;
                                            //SaveSearchedofTieziOnline.SavedPath := TemptDirectory2;
        //                                    TheCopyTableAct2.iSerialNo := J;
        //                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                            AATProxyEX.AddAction(SaveSearchedofTieziOnline);

                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                            LinshiMemoryTableUniConnection.ExecSQL('ATTACH DATABASE "' + TemptDirectory2 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                                            LinshiMemoryTableUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
                                            LinshiMemoryTableUniConnection.ExecSQL('DETACH DATABASE "hr"');
                                        finally
                                            LinshiMemoryTableUniConnection.Free;
                                        end;
                                    finally
                                      AATProxyEX.Free;
                                    end;
                                  end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                                        with CarryKeySearchedPostToTempTable do
                                        begin
                                          WenJianMingPath := TemptDirectory2;
                                          Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                          Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                          Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                          Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                          deleteorno := True;
                                          WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';//'onlinesearch0.temp';
                                        end;
                                        AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                        if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                          TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴子ID
                      begin
                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;

                         try
                           if Temp_addlist.Count <> 2 then
                           begin
                             ShowMessageEX('指定贴ID下载模式下，必须只有两个额外加上的贴子');
                             abort;
                           end;

                          if (strtoint64def(trim(Temp_addlist.Strings[0]), 0) < 1)
                          or (strtoint64def(trim(Temp_addlist.Strings[1]), 0) < 1)
                          or (strtoint64def(trim(Temp_addlist.Strings[0]), 0) = strtoint64def(trim(Temp_addlist.Strings[1]), 0))
                          then
                          begin
                            ShowMessageEX('指定贴ID下载模式下，必须只有两个额外加上的贴子，且为两个不相等的正整数');
                            abort;
                          end;
                          if strtoint64def(trim(Temp_addlist.Strings[0]), 0) < strtoint64def(trim(Temp_addlist.Strings[1]), 0) then
                          begin
                            minNumber := strtoint64def(trim(Temp_addlist.Strings[0]), 0);
                            maxNumber := strtoint64def(trim(Temp_addlist.Strings[1]), 0);
                          end
                          else
                          begin
                            minNumber := strtoint64def(trim(Temp_addlist.Strings[1]), 0);
                            maxNumber := strtoint64def(trim(Temp_addlist.Strings[0]), 0);
                          end;



                                  TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                  if not FileExists(TemptDirectory1) then //DeleteFile(TemptDirectory1);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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

                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;


                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          slDataBase.BeginTransaction;

                                          try
                                            for jj := minNumber to maxNumber do
                                            begin
                                              application.ProcessMessages;
                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
                                              inttostr(jj) + ', 0, -1)';
                                              slDataBase.ExecSQL(sSQL);
                                            end;
                                          finally
                                            slDataBase.Commit;
                                          end;
                                    finally
                                      slDataBase.Free;
                                    end;



                                  //resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
                                  end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;




                                AATProxyEX := TInstActionProxy.create;
                                AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                AATProxyEX.StartWork; //开始工作
                                try
                                //TheCopyTableAct3: TGetAddedPostToTempTable;
                                    TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                    TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                    //TheCopyTableAct3.Ba_add := Temp_add;
                                    TheCopyTableAct3.WenJianMing := 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                    AATProxyEX.AddAction(TheCopyTableAct3);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                    //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                    TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                    if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                      TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);


                                    AATProxyEX.AddAction(TheCopyTableAct1);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                finally
                                    AATProxyEX.Free;
                                end;

                         finally
                           Temp_addlist.Free;
                         end;
                      end;

                    end;
            finally
              finalWaiting;
              rbStart.Caption := VarHint;
            end;



            DelayEX(10);

            if MemorySqliteTable_InUniConnection.RecordCount = 0 then
            begin
              if b_Debug then
              begin
                RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                RzMemoLogLinesAdd('当前方案下没有任何符合条件的贴子' + #13#10);
                RzMemoLogLinesAdd('上一方案是否提前终止的：' + ifthen(StopInAdvance, '是', '否') + #13#10);
              end;
              RzMemoLogLinesAdd('本方案无符合条件的贴子，本方案结束' + #13#10);
              PlanSchemeTable.Next;
              Continue;
            end;


//BasicParamConf.setwo_inputbox
                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
                  begin
                    //if  then

                    whichProxy := BasicParamConf.setwo_inputbox;
                    //inc(whichProxy);
                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);

                    if whichProxyindex = 0 then
                    begin
                      RzMemoLogLinesAdd('不代理设置' + #13#10);
                    end
                    else
                    begin
                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
                      tempPortInfoPos := Pos('|', tempPortInfo);
                      if tempPortInfoPos > 0 then
                      begin
                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);


                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);

                        //这种情况还不知道怎么处理
                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
                      end
                      else
                      begin
                        ChangeProxy(tempserverIP, tempPortInfo, '1', True);
                        usesimpledaili := true;
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
                        RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo + #13#10);
                        delayex(5000);

                        //                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
                      end;
                    end;
                    try
                    BasicParamConf.setwo_inputbox := BasicParamConf.setwo_inputbox + 1;
                    except
                    BasicParamConf.setwo_inputbox := 0;
                    end;
                  end;

            StopInAdvance := false;

            GetCoreContentForSequenceTimes := 1;



            try    //MemorySqliteTable_InUniConnection
              MemorySqliteTable_InUniConnection.First;


              CurWhichRecord := 0;
              SucRecordCount := 0;

              while not MemorySqliteTable_InUniConnection.Eof do
              begin
                if StopInAdvance then Break;

                isNeedSaving := false;
                UsuccessOrnot := False;

//                SearchOfRecordsCount: string;
//                CurWhichRecord: Integer;
//                SucRecordCount: Integer;
                if RzComboBoxRoutine.ItemIndex = 0 then

                Pri_TieziID := IntToStr(MemorySqliteTable_InUniConnection.Fields[0].AsInteger - 2079619440 + 6374586736)
                else
                if RzComboBoxRoutine.ItemIndex = 1 then
                Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //if not b_Debug then
                //begin
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 0 then
                  begin

                    //EnterCriticalSection(CS);
                    if SpinEditDays.Value > 0 then
                    begin
{
                  LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
                  LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
                  BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
}
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID
   + ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前百度账号已在此贴下发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 1 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('此贴下已发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 2 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName)
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName));
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前方案下已有在此贴下的回贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end;
                //end;

                Pri_TieziIDFileNmae := MemorySqliteTable_InUniConnection.Fields[1].asstring;
                //Pri_TieziID := '6361513183';     //无权回贴
                //Pri_TieziID := '6184821068';     //被删除
                //Pri_TieziID := '6374720646';
                //Pri_TieziID := '6374670634';
                Pri_BarName := '';
                Pri_Topic := '';
                Pri_Content := '';
                Pri_DeleteOrNot := '-1';
                //Pri_CanReplyOrNot := '-1';
                Pri_CanReplyOrNot := '-1';

                Pri_FloorCount := '';
                Pri_FloorDetails := '';
                Pri_FollowCountForOneTieBa := '';
                Pri_TotalPostForOneTieBa := '';

                PerTieziURL := Basic_PostLink + Pri_TieziID;
                RzMemoLogLinesAddEX('●●●开始第' + Pri_TieziID + '个贴子链接处理，' + #13#10
                + '方案名：' + TempPlanScheme_PlanName, PerTieziURL);



                  if str_Version = '0' then
                  begin
                    PasteContent := '顶一下！';
                    PasteContent_Main := '顶一下！';
                  end
                  else if (str_Version = '1') or (str_Version = '3') then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;
                  end
                  else if str_Version = '2' then
                  begin
                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
                    raise Exception.Create('不支持的取顶贴内容方式');

                    posPasteContenttotal := pos('|', PasteContent_total);
                    if posPasteContenttotal > 1 then
                    begin
                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
                    end
                    else
                    begin
                      PasteContent := PasteContent_total;
                      PasteContent_Main := PasteContent_total;
                    end;

                    //PasteContent := PasteContent + '_________________________________________________________________________________________________________________________以上信息来自自动发送软件，欲获取，add wechat official account：花苍比'
                    PasteContent := PasteContent + PropagandaSentence;
                  end;


                try
                  RzMemoLogLinesAddEX('打开第' + Pri_TieziID + '个贴子链接', PerTieziURL);

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

//                  a:
//                  setproxyrightorwrong := true;
//                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
//                  begin
//                    inc(whichProxy);
//                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);
//
//                    if whichProxyindex = 0 then
//                    begin
//
//                    end
//                    else
//                    begin
//                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
//                      tempPortInfoPos := Pos('|', tempPortInfo);
//                      if tempPortInfoPos > 0 then
//                      begin
//                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
//                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
//                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);
//
//
//                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);
//
//                        //这种情况还不知道怎么处理
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
//                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
//                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
//                      end
//                      else
//                      begin
//
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
//                          RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
//                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
//                      end;
//                    end;
//                  end;
//
//                  if not setproxyrightorwrong then
//                  begin
//                    RzMemoLogLinesAdd(setproxyrightorwrongsth + #13#10 + '进入下一个设置' + #13#10 + #13#10);
//                    goto a;
//                  end;

                  MainForm.Chromium1.LoadUrl(PerTieziURL);
                  MainForm.Chromium1.LoadUrl(PerTieziURL);


                  DelayEX(BasicParamConf.WaitingTimeBeforeLoad);

                  if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');


                  while pos(Pri_TieziID, MainForm.AddressEdt.Text) <= 0 do
                  begin
                    DelayEX(500);
                  end;


                  //gtc1 := GetTickCount;
                  while MainForm.bLoading do
                  begin
//                    gtc2 := GetTickCount;
//                    if (gtc2 - gtc1) >= 120000 then
//                    begin
//                      setproxyrightorwrong := true;
//                      goto a;
//                    end;
                    DelayEX(500);
                  end;

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

                  if IsDeletedOrNoReplyTieZi(VarFeedbackIn) then
                  begin
                    RzMemoLogLinesAdd('无效的贴子链接，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                    Continue;
                  end;

                  if Temp_PlanScheme_DownloadorOffline <> '0' then
                  begin
                    if Not ConformToFloorCAndFollowCount(VarFeedbackIn) then
                    begin
                      RzMemoLogLinesAdd('下载模式下贴子不符合条件，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                      Continue;
                    end;
                  end;

                  RzMemoLogLinesAddEX('第' + Pri_TieziID + '个贴子链接' + '为有效链接', PerTieziURL);
                  DelayEX(10);
                  if b_Debug then
                    RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  if RzCheckBoxExploer.Checked then
                    Continue;

                  //if RzComboBoxModeChoose.ItemIndex = 0 then Clipboard.SetTextBuf(PChar(PasteContent));


                  if Temp_onlyForMainFloor = '1' then
                  begin
                    ScrolltoBottom;
                    ScrolltoBottom;  //ScrolltoBottomEXE;
                    RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                    DelayEx(1000);
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''390'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';


                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


//                            formatori :=
//                            '<img pic_type=''1'' src=''http://t8.baidu.com/it/u=1484500186,1503043093&amp;fm=79&amp;app=86&amp;f=JPEG?w=1280&amp;h=853.gif'' class' +
//                            '=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''373'' width=''560'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;

//
//                      //DelayEx(1000000);
//                      if IsWindowVisible(self.Handle) then
//                      begin
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
//
//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(500);
//
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                      end
//                      else
                      begin
                        MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                      end;
                      DelayEx(1000);

                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                      //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                      RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                    //end;
                  end
                  else
                  begin
                    isReplyinsubFloor := judgeMustReplyInSecondFloor(succsulFatie);
                    if isReplyinsubFloor then   //如果需要在2楼黄金位回得
                    begin
                      if not succsulFatie then
                        Continue;
                    end
                    else
                    begin
                      ScrolltoBottom;
                      ScrolltoBottom;  //ScrolltoBottomEXE;
                      RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                      DelayEx(1000);

                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';

                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                            ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;



//                        if IsWindowVisible(self.Handle) then
//                        begin
////                          MainForm.CEFWindowParent1.SetFocus;
////                          MainForm.CEFWindowParent1.SetFocus;
////                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                          delayex(500);
//
//
//                          MainForm.CEFWindowParent1.SetFocus;
//                          MainForm.CEFWindowParent1.SetFocus;
//                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                          delayex(500);
//  //                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//  //                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                          mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                          'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                          delayex(500);
//
//
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                          Delay(50);
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        end
//                        else
                        begin
                          MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                        end;
                        DelayEx(1000);

                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                        //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                        RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                      //end;
                    end;
                  end;


                  UsuccessOrnot := True;
                  DelayEx(1000);

//                  if str_Version = '3' then
//                  begin
//                    randomize;
//                    if Random(2) = 0 then
//                    begin
//                      ShowMessageEX('你使用的是弹广告版，即将弹广告，正式版请加微信：baidutiebayinliu');
//                      PopAdvertisement;
//                    end;
//                  end;
                finally
//              CurWhichRecord := 1;
//              SucRecordCount := 0;
                  if UsuccessOrnot then
                  begin
                    //succPri_TieziID := Pri_TieziID;
                    Inc(SucRecordCount);
                    Inc(GetCoreContentForSequenceTimes);
                    //if not b_Debug then
                    //begin
                        //EnterCriticalSection(CS);
                        sldb1.BeginTransaction;
                        sldb1.ExecSQL('insert into FatieRecord (BaiduHao, TieziID, LastUpdateTime, PlanName) values (' +
                        QuotedStr(SetCacheDirectoryNa) + ', ' + QuotedStr(Pri_TieziID) + ', '
                        + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime))
                        + ', ' + QuotedStr(TempPlanScheme_PlanName)
                         + ')');
                        //sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, PlanScheme_index, ADDTiezi, SubstractTiezi ' + 'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' + IntToStr(TotalPlansCheme));
                        sldb1.Commit;
                        //LeaveCriticalSection(CS);
                    //end;
                  end;

                  Inc(CurWhichRecord);

                  RzMemoLogLinesAdd('当前方案下总共搜索出：' + SearchOfRecordsCount + '条' + #13#10
                  + '已处理'+ IntToStr(CurWhichRecord) + '条' + #13#10
                  + '已发贴' + IntToStr(SucRecordCount) + '条' + #13#10#13#10);



                  if isNeedSaving then
                  begin
                    if Pri_DeleteOrNot = '1' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
//                        initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
//                        //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
//                        sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
//                        //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
//                        finalizeSqliteHardwareTable;
//
//                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
//                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);



                        try
                          if tregex.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
                            initializeSqliteHardwareTable(APPCommonPath + relativePasth +  Pri_TieziIDFileNmae)
                          else
                            initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                          //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
                          sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
                          //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
                          finalizeSqliteHardwareTable;
                        except on E: exception do
                        begin
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                          '方案名：' + TempPlanScheme_PlanName  + #13#10 + '保存出错，原因：' + e.Message + #13#10#13#10#13#10);
                        end;
                        end;

                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                      end;
                    end
                    else if Pri_DeleteOrNot = '0' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                        try
//                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
//                          Updatesqll := 'update SeeLiangTieziList set' +
//                          ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
//                          ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
//                          ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
//                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
//                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
//                          //2019-12-12 05:59:17
//                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
//                            ' where TieziID=' + QuotedStr(Pri_TieziID);
//                          sldb_InUniConnection.ExecSQL(Updatesqll);
//                          finalizeSqliteHardwareTable;
//
//                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
//                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      except
//                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，额外贴子，' + #13#10
//                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
//                      end;

                          if TRegEx.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth +  Pri_TieziIDFileNmae)
                          else
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);


                          if Pos('add', Pri_TieziIDFileNmae) > 0 then
                          begin
//                            Pri_Topic := '';
//                            Pri_Content := '';
//                            Pri_CreateTime := '';

                            Updatesqll := 'update SeeLiangTieziList set' +
                            ' TieBaName=' + QuotedStr(Pri_BarName) + ', ' +
                            ' TitleName=' + QuotedStr(Pri_Topic) + ', ' +
                            ' TieZiContent=' + QuotedStr(Pri_Content) + ', ' +
                            ' Createtime=' + QuotedStr(Pri_CreateTime) + ', ' +

                            ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
                            ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
                            ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
                            ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
                            ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                            //2019-12-12 05:59:17
                              ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                              ' where TieziID=' + QuotedStr(Pri_TieziID);
                          end
                          else
                          Updatesqll := 'update SeeLiangTieziList set' +
                          ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
                          ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
                          ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                          //2019-12-12 05:59:17
                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                            ' where TieziID=' + QuotedStr(Pri_TieziID);
                          sldb_InUniConnection.ExecSQL(Updatesqll);
                          finalizeSqliteHardwareTable;


                        except on E: exception do
                        begin
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot
                          + #13#10 + '保存出错，原因：' + e.Message
                          + #13#10#13#10#13#10);
                        end;
                        end;
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
                      end;
                    end;
                  end
                  else
                  begin
                    RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，不保存，' + #13#10
                    + '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                  end;

                  if not rzcheckboxexploer.Checked then
                    DelayEx(G_TimerInterval);

                  if PauseOrNot then
                  begin
                    RzMemoLogLinesAdd('已暂停！');
                    while True do
                    begin
                      if PauseOrNot then
                        DelayEx(1000)
                      else
                      begin
                        RzMemoLogLinesAdd('取消暂停！');
                        Break;
                      end;
                    end;
                  end;


                  if strtointdef(PlanScheme_ValidCount, 0) > 0 then
                  if SucRecordCount >= strtointdef(PlanScheme_ValidCount, 0) then
                  begin
                    RzMemoLogLinesAdd('●●●完成本方案的有效贴子发贴数' + #13#10#13#10#13#10);
                    StopInAdvance := true;
                  end;

//                  if RzCheckBoxSamePlan.Checked then
//                  begin
//                    if SucRecordCount >= SpinEditPostCount.Value then
//                    begin
//                      MemorySqliteTable_InUniConnection.Last;
//                      StopInAdvance := true;
//                    end;
//                  end;
                  MemorySqliteTable_InUniConnection.Next;
                end;
              end;
            finally
              if usesimpledaili then
              begin
                ChangeProxy(tempserverIP, tempPortInfo, '1', false);
                tempserverIP := '';
                tempPortInfo := '';
                usesimpledaili := false;
              end;
              FinalQuerySqlInuni(MemorySqliteTable_InUniConnection);
              MemorySqliteTable_InUniConnection.Connection := nil;
              MemorySqliteTable_InUniConnection.Free;
              MemorySqlite_InUniConnection.Free;
              if Trim(TemptDirectory) <> '' then
              begin
                if FileExists(TemptDirectory) then
                begin
                  DeleteFile(TemptDirectory);
                end;
              end;



              if trim(Pri_TieziID) <> '' then
              begin
                if not rzcheckboxexploer.Checked then
                begin
                  EnterCriticalSection(CS);
                  sSQL := 'update PlanScheme_Config' +
                  ' set OnlyForWechat=' + trim(Pri_TieziID) + ' where PlanScheme_index=' + TempPlanScheme_index;
                  sldb.BeginTransaction;
                  try
                    sldb.ExecSQL(sSQL);
                    RzMemoLogLinesAdd('成功更新当前方案下的起始贴子ID:' + trim(Pri_TieziID) + #13#10#13#10);
                  finally
                    sldb.Commit;
                  end;
                  LeaveCriticalSection(CS);
                end;
              end;
            end;
            PlanSchemeTable.Next;
          end;
        finally
          PlanSchemeTable.Free;
        end;

      finally

        RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作结束' + #13#10#13#10);
        RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作结束' + #13#10#13#10);
        inc(Action1_Tag);
        inc(Action1_Tag1);

        if Linshi_Circulations > 0 then
          i_Circulations := i_Circulations - 1;
      end;
    until SatisfyRestrict;
  finally
    if SaveTempFileOrNot then      //保存整理新下载的文件，没有被update的记录就不保存整理了，然后删除
    begin
      RzMemoLogLinesAdd('开始整理下载的文件！');

      suDBNameList := TStringList.Create;


      AATProxyEX := TInstActionProxy.create;
      AATProxyEX.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
      AATProxyEX.StartWork; //开始工作


      VarHint := rbStart.Caption;
      rbStart.Caption := '';
      with THandleWaitings.create(100) do
      try
         iniWaiting(rbStart, 7, 7);

         SourceFileDir := APPCommonPath + relativePasth1;

         found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

         while found=0 do
         begin
           delay(10);
           if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
           and (SearchRec.Attr<>faDirectory) and
           (
           (Pos('temp', Trim(SearchRec.Name)) > 0) or
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

                SplitDBFromSource := TSplitDBFromSource.create;
                SplitDBFromSource.SplitDirectory := APPCommonPath + relativePasth;
                SplitDBFromSource.SourceDBaseDire := SourceFileDir + Trim(suDBNameList.Strings[J]);
                AATProxyEX.AddAction(SplitDBFromSource);
                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

             finally
               if RzCheckBoxDeleteDownloadedFiles.Checked then
                 DeleteFile(SourceFileDir + Trim(suDBNameList.Strings[J]));
             end;
           end;
         end;
      finally



        finalWaiting;
        rbStart.Caption := VarHint;

        AATProxyEX.Free;

        suDBNameList.Free;
        RzMemoLogLinesAdd('结束整理下载的文件！');
      end;
    end
    else
    begin
      SaveTempFileOrNot := true;
    end;
    enableSomething;
    b_isRuning := False;
  end;

  if RzCheckBoxshudown.Checked then shellexecute(0, 'open', 'shutdown.exe', ' -f -s -t 0', nil, SW_HIDE);

end;

procedure TFrmBaseForm1.ExecuteSamePlanDifferentLoginACC(PassPlanSchemeConfigIndex: string; Pass_i_Circulations: Integer);
var
  //succPri_TieziID: string;
  whichProxy: Integer;
  whichProxyindex: Integer;

  setproxyrightorwrong: Boolean;
  setproxyrightorwrongsth: string;
  tempserverIP: string;
  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;

  gtc1, gtc2: DWORD;
  isNeedSaving: Boolean;
  VarFeedbackIn: string;
  i,jj: Int64;
  iii: Integer;
  ii: Integer;
  PlanInd: Integer;
  Existss: Boolean;
  SourceText: string;

  PasteContent_total: string;

  posPasteContenttotal: Integer;
  PasteContent: string;
  PasteContent_Main: string;
  posPasteContent_Main: Integer;
  PatternForHttps: string;

  matchs: TMatchCollection;
  match: TMatch;
  matchvalue: string;
  matchCoun: Integer;
  //Stringarr: array of string;
  Stringarr: array of TVarRec;
  formatori: string;
  JScript: string;

  iiii, i_mod: Integer;
  itemcout: Integer;

  n: Integer;
  arr: array[0..255] of Char;
  oldHtmlSourceCode: string;
  submittype: Integer;
  PerTieziURL: string;
  InputPlaceEx_JS: TPoint;
  Linshi_Circulations, i_Circulations: Integer;
  Max_tiezi_ID: Int64;
  addContent: string;
  Updatesqll, Insertsqll: string;
  Linshi_String: string;
  PlanSchemeTable: TSQLiteTable;
  TotalPlansCheme: Integer;
  isReplyinsubFloor: Boolean;
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

  //Temp_onlyForwechat: string;
  SpinEditStartPostIdText: string;
  Temp_onlyForMainFloor: string;

  Temp_PlanScheme_DownloadorOffline: string;
  Temp_PlanScheme_TotalThreadForDownloadMode: string;
  PlanScheme_ValidCount: string;

  Temp_add: string;
  Temp_add_Pervalue: string;
  Temp_addlist: TStringList;
  minNumber, maxNumber: Int64;
  Temp_substract: string;

  succsulFatie: Boolean;


  TheCopyTableAct: TGetFullfilledMemoryTable;
  SplitDBFromSource: TSplitDBFromSource;
  TheCopyTableAct2: TGetMaxDateInDataBase;
  SaveSearchedofTieziOnline: TSaveSearchedofTieziOnline;
  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;

  TheCopyTableAct3: TGetAddedPostToTempTable;
  CarryKeySearchedPostToTempTable: TCarryKeySearchedPostToTempTable;
  VarHint: string;
  AATProxyEX: TInstActionProxy;

  TempPlanScheme_index: string;
  TempPlanScheme_PlanName: string;

  slDataBase: TSQLiteDatabase;
  sSQL: string;


 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;

  F: TextFile;
  //i: integer;
  fileStr: string;
  strfileName: string;
  Firststr,SecondStr: string;


  SetCacheDir: string;
  inputtext: string;

  LoginedAcc: string;
  linshiPoint: TPoint;
  CI: TCursorInfo;


  label a, b;

//  function SatisfyRestrict: Boolean;
//  begin
//    Result := False;
//    if Linshi_Circulations > 0 then
//    begin
//      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
//      begin
//        if i_Circulations = 0 then
//          Result := True;
//      end
//      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
//      begin
//        if (Action1_Tag - 1) = Linshi_Circulations then
//        begin
//          Result := True;
//        end;
//      end
//    end;
//    //CloseP;
//    DelayEx(10);
//  end;

  function judgeMustReplyInSecondFloor(var varsuccsulFatie: Boolean): Boolean;
  var
    linshi_strlist: TStringList;
    linshi_singlestr: string;
    SymboPos: Integer;
    strFoorNo: string;
    strReplyNum: string;
  begin
    Result := False;
    if Pri_FloorDetails = '' then
      Exit;

    linshi_strlist := TStringList.Create;
    try
      linshi_strlist.Delimiter := '|';
      linshi_strlist.DelimitedText := Pri_FloorDetails;

      if linshi_strlist.Count >= 2 then
      begin
       //2楼分析
      linshi_singlestr := linshi_strlist.Strings[1];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 3 then
      begin
       //3楼分析
      linshi_singlestr := linshi_strlist.Strings[2];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 3, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[2] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;



      if linshi_strlist.Count >= 4 then
      begin
         //4楼分析
      linshi_singlestr := linshi_strlist.Strings[3];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 4, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[3] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 5 then
      begin
       //5楼分析
      linshi_singlestr := linshi_strlist.Strings[4];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 5, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[4] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;

      if linshi_strlist.Count >= 6 then
      begin
       //6楼分析
      linshi_singlestr := linshi_strlist.Strings[5];
      SymboPos := Pos('=', linshi_singlestr);
      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
      if strReplyNum = '0' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 0, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end
      else if strReplyNum = '1' then
      begin
        varsuccsulFatie := SubFloorReply(strFoorNo, 6, 1, PasteContent);
        if varsuccsulFatie then
        begin
          linshi_strlist.Strings[5] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
          Pri_FloorDetails := linshi_strlist.DelimitedText;
        end;
        Result := True;
        Exit;
      end;
      end;


//      if linshi_strlist.Count >= 2 then
//      begin
//       //2楼分析
//      linshi_singlestr := linshi_strlist.Strings[1];
//      SymboPos := Pos('=', linshi_singlestr);
//      strFoorNo := Copy(linshi_singlestr, 1, SymboPos - 1);
//      strReplyNum := Copy(linshi_singlestr, SymboPos + 1, Length(linshi_singlestr) - SymboPos);
////      if strReplyNum = '0' then
////      begin
////        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 0, PasteContent);
////        if varsuccsulFatie then
////        begin
////          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
////          Pri_FloorDetails := linshi_strlist.DelimitedText;
////        end;
////        Result := True;
////        Exit;
////      end
////      else if strReplyNum = '1' then
//      begin
//        varsuccsulFatie := SubFloorReply(strFoorNo, 2, 1, PasteContent);
//        if varsuccsulFatie then
//        begin
//          linshi_strlist.Strings[1] := strFoorNo + '=' + IntToStr((strtoint(strReplyNum) + 1));
//          Pri_FloorDetails := linshi_strlist.DelimitedText;
//        end;
//        Result := True;
//        Exit;
//      end;
//      end;

    finally
      linshi_strlist.Free;
    end;

  end;

  function IsDeletedOrNoReplyTieZi(var FeedbackIn: string): Boolean;
  var
    JsScriptstr: string;
    replynum: string;
    cardmenNum: string;   //关注数
    cardinfoNum: string;  //贴吧总贴子数
    posterwarning: string;
  begin
    Result := True;

    G_InputP := '';
    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("head")[0]) var blanks=1;else var blanks=0;' + 'alert(blanks);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第1个');
    end;
    if G_InputP <> '1' then
    begin
      G_InputP := '';

      FeedbackIn := '空白页面！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByTagName("title")[0].innerText=="403 Forbidden") var Forbiddens=1;else var Forbiddens=0;' + 'alert(Forbiddens);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第2个');
    end;
    if G_InputP = '1' then
    begin
      G_InputP := '';

      FeedbackIn := '无法正常打开贴子！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementById("errorText")) ' + 'var isdelete=1; else var isdelete=0;' + 'alert(isdelete);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第3个');
    end;
    if G_InputP = '0' then
    begin

    end
    else if G_InputP = '1' then
    begin
      //Pri_DeleteOrNot := '1';
      G_InputP := '';

      FeedbackIn := '该贴已不存在或无法回复或已删除！';
      Pri_DeleteOrNot := '1';
      isNeedSaving := True;
      Exit;
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '判定是否删除出错！';

      Exit;
    end;
    G_InputP := '';

    JsScriptstr :=
    'try{' +
      'var element=document.getElementsByClassName("l_reply_num")[0];' +
      'var first=element.children[0];' +
      'var replynum=first.innerText;' +
      'var Z = replynum;' +
      'Z+="|";' +
      'alert(Z);' +
    '}' +
      'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第4个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      replynum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      replynum := StringReplace(replynum, ',', '', [rfReplaceAll]);

      Pri_FloorCount := replynum;
      Pri_DeleteOrNot := '0';

      G_InputP := '';
    end
    else
    begin
      G_InputP := '';

      FeedbackIn := '找回复数出错，可能是空白页！';

      Exit;
    end;
//
//    JsScriptstr :=
//    'try{' +
//      'var posterwarning=0;' +
//      //'if (document.getElementsByClassName("tb_poster_info poster_warning"))' +
//
//      'if (document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable")[0])' +
//         '{' +
////         'var posterwarningelement=document.getElementsByClassName("tb_poster_info poster_warning")[0];' +
////         'if (posterwarningelement.children[0]) {' +
////         'var posterwarningchild=posterwarningelement.children[0];' +
////         'var posterwarninginnertext=posterwarningchild.innerText;' +
////         'posterwarning=parseInt(posterwarninginnertext);' +
////         '} else posterwarning=100;' +
//
//
//         'posterwarning=100;' +
//
//
//
//         '}' +
//         'else posterwarning=0;' +
//         'var Z = posterwarning;' +
//         'Z+="|";' +
//         'alert(Z);' +
//    '}' +
//      'catch(e)' +
//      '{alert(e)}';
//
//
//    JsScriptstr := 'alert(document.body.innerHTML)';
//    MainForm.ExeJs(JsScriptstr);
//    while G_InputP = '' do
//    begin
//      DelayEX(100);
//      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第5个');
//    end;


//
//    if Pos('tb_poster_info poster_warning', G_InputP) > 0 then
//    begin
//      ShowMessageEX('1');
//    end
//    else
//    begin
//      ShowMessageEX('2');
//    end;
//
//    if Pos('ui_btn ui_btn_m j_submit poster_submit ui_btn_disable ui_btn_m_disable', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
//    end;
//
//    if Pos('抱歉', G_InputP) > 0 then
//    begin
//      ShowMessageEX('3');
//    end
//    else
//    begin
//      ShowMessageEX('4');
////    end;
//
//    Abort;
//
//    if Pos('|', G_InputP) > 0 then
//    begin
//      posterwarning := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := posterwarning;
//    end
//    else if Pos('children', G_InputP) > 0 then
//    begin
//      posterwarning := '0';
//      G_InputP := '';
//
//      Pri_CanReplyOrNot := '0';
//    end
//    else
//    begin
//      FeedbackIn := '找警告信息出错！';
//
//      Exit;
//    end;
//    if Pri_CanReplyOrNot = 'NaN' then
//    begin
//      FeedbackIn := '警告信息十分罕见！';
//      Exit;
//    end;


    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_menNum")[0]) var element=document.getElementsByClassName("card_menNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[0];' + 'var cardmenNum=element.innerText;' + 'var Z = cardmenNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第6个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardmenNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardmenNum := StringReplace(cardmenNum, ',', '', [rfReplaceAll]);

      Pri_FollowCountForOneTieBa := cardmenNum;
    end;
    G_InputP := '';

    JsScriptstr := 'try{' + 'if (document.getElementsByClassName("card_infoNum")[0]) var element=document.getElementsByClassName("card_infoNum")[0];' + 'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' + 'var cardinfoNum=element.innerText;' + 'var Z = cardinfoNum;' + 'Z+="|";' + 'alert(Z);' + '}' + 'catch(e)' + '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第7个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      cardinfoNum := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      Pri_TotalPostForOneTieBa := cardinfoNum;
    end;
    G_InputP := '';


//获取贴吧名
    JsScriptstr := 'try{' +
    'if (document.getElementsByClassName("card_title_fname")[0]) var element=document.getElementsByClassName("card_title_fname")[0];' +
    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
    'var cardinfoNum=element.innerText;' +
    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
    'Z+="|";' +
    'alert(Z);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第8个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      PriBaName := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      //cardinfoNum := StringReplace(cardinfoNum, ',', '', [rfReplaceAll]);

      EnterCriticalSection(CS);
                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
                                        try
                                            Linshi_String := 'Provider Name=SQLite;';
                                            Linshi_String := Linshi_String + 'Database=' + APPCommonPath + DbName1 + ';';
                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
                                            Linshi_String := Linshi_String + 'Login Prompt=False';

                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;

                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

                                            LinshiMemoryTableUniConnection.Connected := True;
                                            LinshiMemoryTableUniConnection.Connected := False;


                                            sSQL := 'replace into TieBa_BasicInfo values ('
                                            + QuotedStr(PriBaName) + ','
                                            + Pri_FollowCountForOneTieBa + ','
                                            + Pri_TotalPostForOneTieBa + ','
                                            + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', TheRealTimeTime_Datetime))  + ')';



                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);

                                        finally
                                            LinshiMemoryTableUniConnection.Free;
                                        end;
      LeaveCriticalSection(CS);
    end;
    G_InputP := '';
//获取贴吧名


//新加：获取创建时间，标题，内容

if Pri_TieziIDFileNmae <> '' then
begin
  //if TRegEx.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
  if Pos('add', Pri_TieziIDFileNmae) > 0 then
  begin
    Pri_Topic := '';
    Pri_Content := '';
    Pri_CreateTime := '';


    JsScriptstr := 'try{' +
    'if (document.getElementsByClassName("core_title_txt pull-left text-overflow")[0]) var element=document.getElementsByClassName("core_title_txt pull-left text-overflow")[0];' +
    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
    'var cardinfoNum=element.innerText;' +
    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
    'Z+="|";' +
    'alert(Z);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第10个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      Pri_Topic := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
    end;
    G_InputP := '';



//    JsScriptstr := 'try{' +
//    'if (document.getElementsByClassName("core_title_txt pull-left text-overflow")[0]) var element=document.getElementsByClassName("core_title_txt pull-left text-overflow")[0];' +
//    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
//    'var cardinfoNum=element.innerText;' +
//    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
//    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
//    'Z+="|";' +
//    'alert(Z);' +
//    '}' +
//    'catch(e)' +
//    '{alert(e)}';
//    MainForm.ExeJs(JsScriptstr);
//    while G_InputP = '' do
//    begin
//      DelayEX(100);
//      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第10个');
//    end;
//    if Pos('|', G_InputP) > 0 then
//    begin
//      Pri_Topic := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
//    end;
//    G_InputP := '';


    JsScriptstr := 'try{' +
    'if (document.getElementsByClassName("d_post_content j_d_post_content")[0]) var element=document.getElementsByClassName("d_post_content j_d_post_content")[0];' +
    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
    'var cardinfoNum=element.innerText;' +
    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
    'Z+="|";' +
    'alert(Z);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第11个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      Pri_Content := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
    end;
    G_InputP := '';


    JsScriptstr := 'try{' +
    'if (document.getElementsByClassName("post-tail-wrap")[0]) var element=document.getElementsByClassName("post-tail-wrap")[0];' +
    //'else element=document.getElementsByClassName("j_post_num plat_post_num")[1];' +
    'var cardinfoNum=element.innerText;' +
    //'var Z = trim(cardinfoNum);' +  //.replace(/^\s*|\s*$/g,"")
    'var Z = cardinfoNum.replace(/^\s*|\s*$/g,"");' +  //
    'Z+="|";' +
    'alert(Z);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第12个');
    end;
    if Pos('|', G_InputP) > 0 then
    begin
      Pri_CreateTime := StringReplace(G_InputP, '|', '', [rfReplaceAll]);
      Pri_CreateTime := TRegEx.Match(Pri_TieziIDFileNmae, '\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}').Value;
    end;
    G_InputP := '';

  end;
end;


//新加：获取创建时间，标题，内容




    //JsScriptstr := 'try{' + 'var oP = document.getElementsByClassName("core_reply_tail clearfix");' + 'var OutPtInfo = "";' + 'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' + 'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' + 'var tailinfoFloorNo=parseInt(tailinfo);' + 'if (tailinfoFloorNo==1) var unfoldcount=0;else ' + '{' + 'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' + 'if (unfoldcount=="") unfoldcount=0;' + '}' + 'tailinfoFloorNo+="=";' + 'tailinfoFloorNo+=unfoldcount;' + 'OutPtInfo+="|";' + 'OutPtInfo+=tailinfoFloorNo;' + '}' + 'OutPtInfo+="|";' + 'OutPtInfo+=oP.length;' + 'alert(OutPtInfo);' + '}' + 'catch(e)' + '{alert(e)}';
    JsScriptstr :=
    'try{' +
       'var oP = document.getElementsByClassName("core_reply_tail clearfix");' +
       'var OutPtInfo = "";' +
       'for(var i = 0; i < oP.length; i++)' +
         '{' +
         'var element=oP[i];' +
         'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
         'var tailinfoFloorNo=parseInt(tailinfo);' +
         'if (tailinfoFloorNo>=2018) {' +
            'tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
            'tailinfoFloorNo=parseInt(tailinfo);' +
            '}' +
         'if (tailinfoFloorNo==1) var unfoldcount=0;else ' +
            '{' +
            'var unfold=element.children[0].children[0].innerText;' + 'var unfoldcount=unfold.replace(/[^\d]/g,"");' +
            'if (unfoldcount=="") unfoldcount=0;' +
            '}' +
         'tailinfoFloorNo+="=";' +
         'tailinfoFloorNo+=unfoldcount;' +
         'OutPtInfo+="|";' +
         'OutPtInfo+=tailinfoFloorNo;' +
         '}' +
       'OutPtInfo+="|";' +
       'OutPtInfo+=oP.length;' +
       'alert(OutPtInfo);' +
    '}' +
    'catch(e)' +
    '{alert(e)}';
    MainForm.ExeJs(JsScriptstr);
    while G_InputP = '' do
    begin
      DelayEX(100);
      if b_Debug then RzMemoLogLinesAdd('正在JS循环中：IsDeletedOrNoReplyTieZi>>>第9个');
    end;
    if (G_InputP <> '|0') and (Pos('|', G_InputP) > 0) then
    begin
      Pri_FloorDetails_pos := LastPos('|', G_InputP);

      Pri_FloorDetails := Copy(G_InputP, 2, Pri_FloorDetails_pos - 2);
      Pri_FloorDetails_subfloorreply := Copy(G_InputP, Pri_FloorDetails_pos + 1, Length(G_InputP) - Pri_FloorDetails_pos);

    end;

    G_InputP := '';



//保存所有信息

//    if Pri_CanReplyOrNot <> '0' then
//    begin
//      FeedbackIn := '有等级要求无法回复！';
//
//      isNeedSaving := true;
//
//      Exit;
//    end;

    isNeedSaving := true;
    Result := False;
  end;


  function ConformToFloorCAndFollowCount(var LFeedbackIn: string): Boolean;
  var
    LinshiRiQi: TDateTime;
    LinshiRiQi_String: string;
  begin
    Result := False;
    LFeedbackIn := '';
//    if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//    begin
//      Result := True;
//    end
//    else
    if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
    begin
      if StrToInt64Def(Temp_ReplyCountBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) < StrToInt64Def(Temp_ReplyCountBegin, 0) then
        begin
          LFeedbackIn := '回复数少于最少回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_ReplyCountEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) > StrToInt64Def(Temp_ReplyCountEnd, 0) then
        begin
          LFeedbackIn := '回复数大于最大回复数';
          Exit;
        end;
      end;


      if Temp_Control2FloorVacancy <> '0' then
      begin
        if Trim(Pri_FloorDetails) <> '' then
        begin
          if Length(Trim(Pri_FloorDetails)) >= 7 then
          begin
            if (Copy(Trim(Pri_FloorDetails), 7, 1) <> '0') and
            (Copy(Trim(Pri_FloorDetails), 7, 1) <> '1')
            then
            begin
              LFeedbackIn := '无热贴2楼空位';
              Exit;
            end;
          end
          else
          begin
            LFeedbackIn := '无热贴2楼空位，无2楼';
            Exit;
          end;
        end;
      end;


      Result := True;
    end
    else
    if Temp_PlanScheme_DownloadorOffline = '1' then //贴子ID
    begin
      if StrToInt64Def(Temp_ReplyCountBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) < StrToInt64Def(Temp_ReplyCountBegin, 0) then
        begin
          LFeedbackIn := '回复数少于最少回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_ReplyCountEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FloorCount, 0) > StrToInt64Def(Temp_ReplyCountEnd, 0) then
        begin
          LFeedbackIn := '回复数大于最大回复数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_FollowPopulationBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FollowCountForOneTieBa, 0) < StrToInt64Def(Temp_FollowPopulationBegin, 0) then
        begin
          LFeedbackIn := '贴吧关注数少于最少关注数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_FollowPopulationEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_FollowCountForOneTieBa, 0) > StrToInt64Def(Temp_FollowPopulationEnd, 0) then
        begin
          LFeedbackIn := '贴吧关注数大于最大关注数';
          Exit;
        end;
      end;


      if StrToInt64Def(Temp_TieBaPostTotalBegin, 0) > 0 then
      begin
        if StrToInt64Def(Pri_TotalPostForOneTieBa, 0) < StrToInt64Def(Temp_TieBaPostTotalBegin, 0) then
        begin
          LFeedbackIn := '贴吧总贴数少于最少贴吧贴子数';
          Exit;
        end;
      end;

      if StrToInt64Def(Temp_TieBaPostTotalEnd, 0) > 0 then
      begin
        if StrToInt64Def(Pri_TotalPostForOneTieBa, 0) > StrToInt64Def(Temp_TieBaPostTotalEnd, 0) then
        begin
          LFeedbackIn := '贴吧总贴数大于最大贴吧贴子数';
          Exit;
        end;
      end;

      if StrToIntDef(Temp_LastHowManyDays, 0) > 0 then
      begin
        LinshiRiQi := incDay(TheRealTimeTime_Datetime, (0 - StrToIntDef(Temp_LastHowManyDays, 0)));
        LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);

        if Pri_CreateTime < LinshiRiQi_String then
        begin
          LFeedbackIn := '贴子创建时间不在最近' + Temp_LastHowManyDays + '天';
          Exit;
        end;
      end;

      if Temp_Control2FloorVacancy <> '0' then
      begin
        if Trim(Pri_FloorDetails) <> '' then
        begin
          if Length(Trim(Pri_FloorDetails)) >= 7 then
          begin
            if (Copy(Trim(Pri_FloorDetails), 7, 1) <> '0') and
            (Copy(Trim(Pri_FloorDetails), 7, 1) <> '1')
            then
            begin
              LFeedbackIn := '无热贴2楼空位';
              Exit;
            end;
          end
          else
          begin
            LFeedbackIn := '无热贴2楼空位，无2楼';
            Exit;
          end;
        end;
      end;

      Result := True;
    end;
  end;


begin
  GetAllAccForSequenceTimes := 1;
  if (ParamCount>=1) then
  begin
    if not UsedOrNot_GetAllAccForSequenceTimes then
    begin
      GetAllAccForSequenceTimes := StrToInt(ParamStr(5));
      UsedOrNot_GetAllAccForSequenceTimes := True;
      if b_Debug then
        RzMemoLogLinesAdd('●●●●●●GetAllAccForSequenceTimes重置为：' + ParamStr(5) + #13#10#13#10);
    end
    else
    begin
      if b_Debug then
      RzMemoLogLinesAdd('●●●●●●UsedOrNot_GetAllAccForSequenceTimes为ture不再重置GetAllAccForSequenceTimes' + #13#10#13#10);
    end;
  end
  else
  if b_Debug then
  begin
    RzMemoLogLinesAdd('●●●●●●ParamCount小于1' + #13#10#13#10);
  end;

  try
    breaktrue := False;
    while not breaktrue do
    begin

        i_mod := GetAllAccForSequenceTimes mod Gitemcout;

        if i_mod = 0 then
          iiii := Gitemcout - 1
        else
          iiii := i_mod - 1;

        Temp_usedAcc := RzComboBoxWillLoginAcc.Items.Strings[iiii];


        LoginedAcc := SetCacheDirectoryNa;


        if LoginedAcc <> Temp_usedAcc then
        begin
          if b_Debug then
          begin
            RzMemoLogLinesAdd('●●●●●●LoginedAcc为：' + LoginedAcc + #13#10
             + '●●●●●●Temp_usedAcc：' + Temp_usedAcc + #13#10
             + '●●●●●●GetAllAccForSequenceTimes：' + inttostr(GetAllAccForSequenceTimes) + #13#10
             + '●●●●●●iiii：' + inttostr(iiii)  + #13#10
             + '●●●●●●RzComboBoxWillLoginAcc.Items.Count：' + inttostr(RzComboBoxWillLoginAcc.Items.Count)  + #13#10
             //+ '●●●●●●RzComboBoxWillLoginAcc.Items.Text：' + RzComboBoxWillLoginAcc.Items.Text  + #13#10
             + '●●●●●●RzComboBoxWillLoginAcc.Items.CommaText：' + RzComboBoxWillLoginAcc.Items.CommaText  + #13#10
             + ' 即将重启' + #13#10#13#10);
          end;
          SaveTempFileOrNot := False;
          CnTrayIcon1.Tag := 1;
          Restart_Flag := True;

          PlanindexForRestart := PassPlanSchemeConfigIndex;
          i_CirculationsForRestart := IntToStr(Pass_i_Circulations);

          Action1_TagForRestart := IntToStr(Action1_Tag);
          Action1_TagForRestart1 := IntToStr(Action1_Tag1);
          GetAllAccForSequenceTimesForRestart := IntToStr(GetAllAccForSequenceTimes);

          Pri_TieziIDForRestart := Pri_TieziID;

          RzComboBoxWillLoginAcc.ItemIndex := RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc);
          self.Close;
          Abort;
        end;


      RzMemoLogLinesAdd('●●●●●●当前工作开始，信息：账号总序列号为' + IntToStr(GetAllAccForSequenceTimes) + #13#10
      + '●●●●●●获取账号为' + Temp_usedAcc + #13#10
      + '●●●●●●当前为第' + IntToStr(iiii + 1) + '个账号' + #13#10#13#10#13#10);

      try
        EnterCriticalSection(CS);
        PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
        'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
        'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
        'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
        ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
        ' OnlyForWechat, OnlyMainFloor, DownloadorOffline, TotalThreadForDownloadMode, PlanScheme_ValidCount  ' +
        'FROM PlanScheme_Config ' +  ' where PlanScheme_index=' + PassPlanSchemeConfigIndex);
//        'ORDER BY PlanScheme_index ASC limit ' +
//        IntToStr(TotalPlansCheme));
        LeaveCriticalSection(CS);



            VarHint := rbStart.Caption;
            rbStart.Caption := '';
            with THandleWaitings.create(100) do
            try
                      iniWaiting(rbstart, 7, 7);

                      Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
                      Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
                      Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
                      Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
                      Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
                      Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
                      Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
                      Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
                      Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
                      Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
                      Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
                      Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
                      Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
                      Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);


                      Temp_add := PlanSchemeTable.FieldAsString(15);
                      Temp_substract := PlanSchemeTable.FieldAsString(16);
                      //Temp_usedAcc := PlanSchemeTable.FieldAsString(17);

                      TempPlanScheme_index := PassPlanSchemeConfigIndex;
                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];

                      if b_Debug then
                      begin
                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                      end;

                      //Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
                      SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
                      Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);

                      Temp_PlanScheme_DownloadorOffline := PlanSchemeTable.FieldAsString(20);
                      Temp_PlanScheme_TotalThreadForDownloadMode := PlanSchemeTable.FieldAsString(21);
                      PlanScheme_ValidCount := PlanSchemeTable.FieldAsString(22);



                    if (GetAllAccForSequenceTimes <> 1 ) and (Action1_Tag1 <= 1) then
                    begin
                      if Temp_PlanScheme_DownloadorOffline = '0' then  //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin

                              TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';


                              if not FileExists(TemptDirectory1) then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID形成的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                              try
                                if not slDataBase.TableExists('SeeLiangTieziList') then
                                begin
                                  SaveTempFileOrNot := False;
                                  ShowMessageEX('额外添加帖子ID形成的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if not FileExists(TemptDirectory) then
                              begin
                                //SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID处理后的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                if not slDataBase.TableExists('SaveSomeTieziID') then
                                begin
                                  //SaveTempFileOrNot := False;
                                  ShowMessageEX('额外添加帖子ID处理后的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;



                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin

                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

//                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
//                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
//                                              TheCopyTableAct3.Ba_add := Temp_add;
//                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
//                                              AATProxyEX.AddAction(TheCopyTableAct3);
//                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


                                              if (ParamCount>=1) then
                                              begin
                                                if Trim(ParamStr(6)) <> '' then
                                                begin
                                                  if not UsedOrNot_Pri_TieziIDForRestart then
                                                  begin
                                                    Pri_TieziID := ParamStr(6);
                                                    UsedOrNot_Pri_TieziIDForRestart := True;
                                                  end;
                                                end;
                                              end;
                                              TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                              end
                              else
                              begin

                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                              if (ParamCount>=1) then
                                              begin
                                                if Trim(ParamStr(6)) <> '' then
                                                begin
                                                  if not UsedOrNot_Pri_TieziIDForRestart then
                                                  begin
                                                    Pri_TieziID := ParamStr(6);
                                                    UsedOrNot_Pri_TieziIDForRestart := True;
                                                  end;
                                                end;
                                              end;
                                              TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                              end;

                        end
                        else
                        begin
                          TemptDirectory := APPCommonPath + 'temp.temp';
                          if not FileExists(TemptDirectory) then
                          begin
                            //SaveTempFileOrNot := False;
                            ShowMessageEX('离线文件处理后的临时文件被删除');
                            Abort;
                          end;

                          slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                          try
                            if not slDataBase.TableExists('SaveSomeTieziID') then
                            begin
                              //SaveTempFileOrNot := False;
                              ShowMessageEX('离线文件处理后的临时文件被修改');
                              Abort;
                            end;
                          finally
                            slDataBase.Free;
                          end;

                          AATProxyEX := TInstActionProxy.create;
                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                          AATProxyEX.StartWork; //开始工作
                          try
                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
                              if (ParamCount>=1) then
                              begin
                                if Trim(ParamStr(6)) <> '' then
                                begin
                                  if not UsedOrNot_Pri_TieziIDForRestart then
                                  begin
                                    Pri_TieziID := ParamStr(6);
                                    UsedOrNot_Pri_TieziIDForRestart := True;
                                  end;
                                end;
                              end;
                              TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
                              AATProxyEX.AddAction(TheCopyTableAct1);
                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                          finally
                              AATProxyEX.Free;
                          end;
                        end;
                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//                      begin
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
                      begin

//                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
//                        try
//                          sSQL :=
//                              'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
//                              '[TieziID] integer NOT NULL,' +
//                              '[FileMing] TEXT NOT NULL,' +
//                              'PRIMARY KEY ([TieziID],[FileMing]));';
//                          slDataBase.ExecSQL(sSQL);
//                        finally
//                          slDataBase.Free;
//                        end;

                        TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';

                        if not FileExists(TemptDirectory2) then
                        begin
                          SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴下载的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                        try
                          if not slDataBase.TableExists('SeeLiangTieziList') then
                          begin
                            SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴下载的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;


                        TemptDirectory := APPCommonPath + 'temp.temp';
                        if not FileExists(TemptDirectory) then
                        begin
                          //SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴处理后的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                        try
                          if not slDataBase.TableExists('SaveSomeTieziID') then
                          begin
                            //SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴处理后的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;

                        AATProxyEX := TInstActionProxy.create;
                        AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                        AATProxyEX.StartWork; //开始工作
                        try
//                            CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
//                            with CarryKeySearchedPostToTempTable do
//                            begin
//                                WenJianMingPath := TemptDirectory2;   //
//                                Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                                deleteorno := False;
//                                WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
//                            end;
//                            AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
//                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                            TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;



//                            if (GetAllAccForSequenceTimes = 1 ) and (Action1_Tag1 > 1)  then
//                            begin
//                              if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
//                            end
//                            else
//                            begin

                                if (ParamCount>=1) then
                                begin
                                  if Trim(ParamStr(6)) <> '' then
                                  begin
                                    if not UsedOrNot_Pri_TieziIDForRestart then
                                    begin
                                      Pri_TieziID := ParamStr(6);
                                      UsedOrNot_Pri_TieziIDForRestart := True;
                                    end;
                                  end;
                                end;

                                TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
                            //end;
                            AATProxyEX.AddAction(TheCopyTableAct1);
                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                        finally
                            AATProxyEX.Free;
                        end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then //贴子ID
                      begin
                        TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';


                        if not FileExists(TemptDirectory1) then
                        begin
                          SaveTempFileOrNot := False;
                          ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                        try
                          if not slDataBase.TableExists('SeeLiangTieziList') then
                          begin
                            SaveTempFileOrNot := False;
                            ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;


                        TemptDirectory := APPCommonPath + 'temp.temp';
                        if not FileExists(TemptDirectory) then
                        begin
                          //SaveTempFileOrNot := False;
                          ShowMessageEX('下载模式额外添加帖子ID处理后的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                        try
                          if not slDataBase.TableExists('SaveSomeTieziID') then
                          begin
                            //SaveTempFileOrNot := False;
                            ShowMessageEX('下载模式额外添加帖子ID处理后的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;

                        AATProxyEX := TInstActionProxy.create;
                        AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                        AATProxyEX.StartWork; //开始工作
                        try
                            TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


                            if (ParamCount>=1) then
                            begin
                              if Trim(ParamStr(6)) <> '' then
                              begin
                                if not UsedOrNot_Pri_TieziIDForRestart then
                                begin
                                  Pri_TieziID := ParamStr(6);
                                  UsedOrNot_Pri_TieziIDForRestart := True;
                                end;
                              end;
                            end;
                            TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                            AATProxyEX.AddAction(TheCopyTableAct1);
                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                        finally
                            AATProxyEX.Free;
                        end;

                      end;
                    end
                    else
                    if (GetAllAccForSequenceTimes <> 1 ) and (Action1_Tag1 > 1) then
                    begin
                      if Temp_PlanScheme_DownloadorOffline = '0' then  //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin

                            TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';


                            if not FileExists(TemptDirectory1) then
                            begin
                              SaveTempFileOrNot := False;
                              ShowMessageEX('额外添加帖子ID形成的临时文件被删除');
                              Abort;
                            end;

                            slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                            try
                              if not slDataBase.TableExists('SeeLiangTieziList') then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID形成的临时文件被修改');
                                Abort;
                              end;
                            finally
                              slDataBase.Free;
                            end;


                            TemptDirectory := APPCommonPath + 'temp.temp';
                            if not FileExists(TemptDirectory) then
                            begin
                              //SaveTempFileOrNot := False;
                              ShowMessageEX('额外添加帖子ID处理后的临时文件被删除');
                              Abort;
                            end;

                            slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                            try
                              if not slDataBase.TableExists('SaveSomeTieziID') then
                              begin
                                //SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID处理后的临时文件被修改');
                                Abort;
                              end;
                            finally
                              slDataBase.Free;
                            end;

                            AATProxyEX := TInstActionProxy.create;
                            AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                            AATProxyEX.StartWork; //开始工作
                            try
                                TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                if (ParamCount>=1) then
                                begin
                                  if Trim(ParamStr(6)) <> '' then
                                  begin
                                    if not UsedOrNot_Pri_TieziIDForRestart then
                                    begin
                                      Pri_TieziID := ParamStr(6);
                                      UsedOrNot_Pri_TieziIDForRestart := True;
                                    end;
                                  end;
                                end;

                                TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                                AATProxyEX.AddAction(TheCopyTableAct1);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                            finally
                                AATProxyEX.Free;
                            end;
                        end
                        else
                        begin
                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if not FileExists(TemptDirectory) then
                              begin
                                //SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID处理后的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                if not slDataBase.TableExists('SaveSomeTieziID') then
                                begin
                                  //SaveTempFileOrNot := False;
                                  ShowMessageEX('额外添加帖子ID处理后的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;

                              AATProxyEX := TInstActionProxy.create;
                              AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                              AATProxyEX.StartWork; //开始工作
                              try
                                  TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                  if (ParamCount>=1) then
                                  begin
                                    if Trim(ParamStr(6)) <> '' then
                                    begin
                                      if not UsedOrNot_Pri_TieziIDForRestart then
                                      begin
                                        Pri_TieziID := ParamStr(6);
                                        UsedOrNot_Pri_TieziIDForRestart := True;
                                      end;
                                    end;
                                  end;

                                  TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                                  AATProxyEX.AddAction(TheCopyTableAct1);
                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                              finally
                                  AATProxyEX.Free;
                              end;

                        end;
                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//                      begin
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
                      begin
                        TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';

                        if not FileExists(TemptDirectory2) then
                        begin
                          SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴下载的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                        try
                          if not slDataBase.TableExists('SeeLiangTieziList') then
                          begin
                            SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴下载的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;


                        TemptDirectory := APPCommonPath + 'temp.temp';
                        if not FileExists(TemptDirectory) then
                        begin
                          //SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴处理后的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                        try
                          if not slDataBase.TableExists('SaveSomeTieziID') then
                          begin
                            //SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴处理后的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;

                        AATProxyEX := TInstActionProxy.create;
                        AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                        AATProxyEX.StartWork; //开始工作
                        try
//                            CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
//                            with CarryKeySearchedPostToTempTable do
//                            begin
//                                WenJianMingPath := TemptDirectory2;   //
//                                Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                                deleteorno := False;
//                                WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
//                            end;
//                            AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
//                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                            TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;




                                if (ParamCount>=1) then
                                begin
                                  if Trim(ParamStr(6)) <> '' then
                                  begin
                                    if not UsedOrNot_Pri_TieziIDForRestart then
                                    begin
                                      Pri_TieziID := ParamStr(6);
                                      UsedOrNot_Pri_TieziIDForRestart := True;
                                    end;
                                  end;
                                end;

                                TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                            AATProxyEX.AddAction(TheCopyTableAct1);
                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                        finally
                            AATProxyEX.Free;
                        end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then //贴子ID
                      begin

                            TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';


                            if not FileExists(TemptDirectory1) then
                            begin
                              SaveTempFileOrNot := False;
                              ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被删除');
                              Abort;
                            end;

                            slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                            try
                              if not slDataBase.TableExists('SeeLiangTieziList') then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被修改');
                                Abort;
                              end;
                            finally
                              slDataBase.Free;
                            end;


                            TemptDirectory := APPCommonPath + 'temp.temp';
                            if not FileExists(TemptDirectory) then
                            begin
                              //SaveTempFileOrNot := False;
                              ShowMessageEX('下载模式额外添加帖子ID处理后的临时文件被删除');
                              Abort;
                            end;

                            slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                            try
                              if not slDataBase.TableExists('SaveSomeTieziID') then
                              begin
                                //SaveTempFileOrNot := False;
                                ShowMessageEX('下载模式额外添加帖子ID处理后的临时文件被修改');
                                Abort;
                              end;
                            finally
                              slDataBase.Free;
                            end;

                            AATProxyEX := TInstActionProxy.create;
                            AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                            AATProxyEX.StartWork; //开始工作
                            try
                                TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                if (ParamCount>=1) then
                                begin
                                  if Trim(ParamStr(6)) <> '' then
                                  begin
                                    if not UsedOrNot_Pri_TieziIDForRestart then
                                    begin
                                      Pri_TieziID := ParamStr(6);
                                      UsedOrNot_Pri_TieziIDForRestart := True;
                                    end;
                                  end;
                                end;

                                TheCopyTableAct1.Ba_TieziID := Pri_TieziID;

                                AATProxyEX.AddAction(TheCopyTableAct1);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                            finally
                                AATProxyEX.Free;
                            end;
                      end;
                    end
                    else
                    if (GetAllAccForSequenceTimes = 1 ) and (Action1_Tag1 > 1) then
                    begin
                      if Temp_PlanScheme_DownloadorOffline = '0' then  //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin

                              TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';


                              if not FileExists(TemptDirectory1) then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('额外添加帖子ID形成的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                              try
                                if not slDataBase.TableExists('SeeLiangTieziList') then
                                begin
                                  SaveTempFileOrNot := False;
                                  ShowMessageEX('额外添加帖子ID形成的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;




                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin

                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try
                                          //TheCopyTableAct3: TGetAddedPostToTempTable;
                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

//                                              if RzCheckBoxSamePlan.Checked then
//                                              begin
//                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
//                                              end;

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                              end
                              else
                              begin
                                  suDBNameList := TStringList.Create;

                                  try
                                           SourceFileDir := APPCommonPath + relativePasth;

                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                           while found=0 do
                                           begin
                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                               and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                               then
                                               begin
                                                 suDBName := SearchRec.Name;
                                                 suDBNameList.Add(suDBName);
                                               end;
                                               found:=FindNext(SearchRec);
                                           end;
                                           FindClose(SearchRec);


                                           suDBNameListCount := suDBNameList.Count;

                                           if suDBNameListCount < 1 then
                                           begin
                                              ShowMessageEX('数据源不存在');
                                              abort;
                                           end;


                                           SetLength(MaxCreatetimeList, suDBNameListCount);


                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

                                              if Temp_LastHowManyDays <> '0' then
                                              begin

                                                  for J := 0 to suDBNameListCount - 1 do
                                                  begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                                    TheCopyTableAct2.iSerialNo := J;
                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                    AATProxyEX.AddAction(TheCopyTableAct2);
                                                  end;
                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                              end;
                                              SetLength(MaxCreatetimeList, 0);



                                              for J := 0 to suDBNameListCount - 1 do
                                              begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                                    with TheCopyTableAct do
                                                    begin
                                                        iSerialNo := J;
                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                        WenJianMing := Trim(suDBNameList.Strings[J]);

                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                        Ba_dingtie_type := Temp_dingtie_type;
                                                        Ba_dingtie_content := Temp_dingtie_content;

                                                        Ba_add := Temp_add;
                                                        Ba_substract := Temp_substract;


                                                        if b_Debug then
                                                        begin
                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                        end;

                                                      //Ba_add, Ba_substract: string;
                                                    end;
                                                    AATProxyEX.AddAction(TheCopyTableAct);
                                              end;
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                                  finally
                                         suDBNameList.free;
                                  end;
                              end;

                        end
                        else
                        begin
                          TemptDirectory := APPCommonPath + 'temp.temp';
                          if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                          slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                          try
                            sSQL :=
                                'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                '[TieziID] integer NOT NULL,' +
                                '[FileMing] TEXT NOT NULL,' +
                                'PRIMARY KEY ([TieziID],[FileMing]));';
                            slDataBase.ExecSQL(sSQL);
                          finally
                            slDataBase.Free;
                          end;

                            suDBNameList := TStringList.Create;
                            try
                                     SourceFileDir := APPCommonPath + relativePasth;

                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                     while found=0 do
                                     begin
                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                         and (SearchRec.Attr<>faDirectory) and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                         then
                                         begin
                                           suDBName := SearchRec.Name;
                                           suDBNameList.Add(suDBName);
                                         end;
                                         found:=FindNext(SearchRec);
                                     end;
                                     FindClose(SearchRec);


                                     suDBNameListCount := suDBNameList.Count;

                                     if suDBNameListCount < 1 then
                                     begin
                                        ShowMessageEX('数据源不存在');
                                        abort;
                                     end;


                                     SetLength(MaxCreatetimeList, suDBNameListCount);


                                    AATProxyEX := TInstActionProxy.create;
                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        if Temp_LastHowManyDays <> '0' then
                                        begin

                                            for J := 0 to suDBNameListCount - 1 do
                                            begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                              TheCopyTableAct2.iSerialNo := J;
                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                              AATProxyEX.AddAction(TheCopyTableAct2);
                                            end;
                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                        end;
                                        SetLength(MaxCreatetimeList, 0);



                                        for J := 0 to suDBNameListCount - 1 do
                                        begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                              with TheCopyTableAct do
                                              begin
                                                  iSerialNo := J;
                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                  WenJianMing := Trim(suDBNameList.Strings[J]);

                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                  Ba_dingtie_type := Temp_dingtie_type;
                                                  Ba_dingtie_content := Temp_dingtie_content;

                                                  Ba_add := Temp_add;
                                                  Ba_substract := Temp_substract;

                                                  if b_Debug then
                                                  begin
                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                  end;

                                                //Ba_add, Ba_substract: string;
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct);
                                        end;
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                          if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                            TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                            finally
                                   suDBNameList.free;
                            end;
                        end;
                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//                      begin
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
                      begin

                        TemptDirectory := APPCommonPath + 'temp.temp';
                        if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                        slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                        try
                          sSQL :=
                              'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                              '[TieziID] integer NOT NULL,' +
                              '[FileMing] TEXT NOT NULL,' +
                              'PRIMARY KEY ([TieziID],[FileMing]));';
                          slDataBase.ExecSQL(sSQL);
                        finally
                          slDataBase.Free;
                        end;

                        TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';

                        if not FileExists(TemptDirectory2) then
                        begin
                          SaveTempFileOrNot := False;
                          ShowMessageEX('关键词所搜出的贴下载的临时文件被删除');
                          Abort;
                        end;

                        slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                        try
                          if not slDataBase.TableExists('SeeLiangTieziList') then
                          begin
                            SaveTempFileOrNot := False;
                            ShowMessageEX('关键词所搜出的贴下载的临时文件被修改');
                            Abort;
                          end;
                        finally
                          slDataBase.Free;
                        end;

                        AATProxyEX := TInstActionProxy.create;
                        AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                        AATProxyEX.StartWork; //开始工作
                        try
                            CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                            with CarryKeySearchedPostToTempTable do
                            begin
                                WenJianMingPath := TemptDirectory2;   //
                                Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                deleteorno := False;
                                WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
                            end;
                            AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                            TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;



//                            if (GetAllAccForSequenceTimes = 1 ) and (Action1_Tag1 > 1)  then
//                            begin
                              if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
//                            end
//                            else
//                            begin
//
//                                if (ParamCount>=1) then
//                                begin
//                                  if Trim(ParamStr(6)) <> '' then
//                                  begin
//                                    if not UsedOrNot_Pri_TieziIDForRestart then
//                                    begin
//                                      Pri_TieziID := ParamStr(6);
//                                      UsedOrNot_Pri_TieziIDForRestart := True;
//                                    end;
//                                  end;
//                                end;
//
//                                TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
//                            end;
                            AATProxyEX.AddAction(TheCopyTableAct1);
                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                        finally
                            AATProxyEX.Free;
                        end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then //贴子ID
                      begin
                              TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';


                              if not FileExists(TemptDirectory1) then
                              begin
                                SaveTempFileOrNot := False;
                                ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被删除');
                                Abort;
                              end;

                              slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                              try
                                if not slDataBase.TableExists('SeeLiangTieziList') then
                                begin
                                  SaveTempFileOrNot := False;
                                  ShowMessageEX('下载模式额外添加帖子ID形成的临时文件被修改');
                                  Abort;
                                end;
                              finally
                                slDataBase.Free;
                              end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;

                            AATProxyEX := TInstActionProxy.create;
                            AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                            AATProxyEX.StartWork; //开始工作
                            try
                            //TheCopyTableAct3: TGetAddedPostToTempTable;
                                TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                //TheCopyTableAct3.Ba_add := Temp_add;
                                TheCopyTableAct3.WenJianMing := 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                AATProxyEX.AddAction(TheCopyTableAct3);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


                                if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                  TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);


                                AATProxyEX.AddAction(TheCopyTableAct1);
                                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                            finally
                                AATProxyEX.Free;
                            end;

                      end;
                    end
                    else
                    begin

                      if Temp_PlanScheme_DownloadorOffline = '0' then    //离线模式
                      begin
                        if Trim(Temp_add) <> '' then
                        begin
                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;

                          try
                                  TemptDirectory1 := APPCommonPath + relativePasth1 + 'add' + TempPlanScheme_PlanName + '.temp';
                                  if not FileExists(TemptDirectory1) then //DeleteFile(TemptDirectory1);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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

                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;


                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          slDataBase.BeginTransaction;

                                          try
                                            for ii := 0 to Temp_addlist.Count - 1 do
                                            begin
                                              Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
                                              if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
                                              begin
                                                sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
                                                QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
                                                slDataBase.ExecSQL(sSQL);
                                              end;
                                            end;
                                          finally
                                            slDataBase.Commit;
                                          end;
                                    finally
                                      slDataBase.Free;
                                    end;



                                  //resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
                                  end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;



                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
                              begin
                                AATProxyEX := TInstActionProxy.create;
                                AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                AATProxyEX.StartWork; //开始工作
                                try
                                //TheCopyTableAct3: TGetAddedPostToTempTable;
                                    TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                    TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                    //TheCopyTableAct3.Ba_add := Temp_add;
                                    TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                    AATProxyEX.AddAction(TheCopyTableAct3);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                    //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                    TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


//                                    if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                      TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                    AATProxyEX.AddAction(TheCopyTableAct1);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                finally
                                    AATProxyEX.Free;
                                end;
                              end
                              else
                              begin
                                  suDBNameList := TStringList.Create;

                                  try
                                           SourceFileDir := APPCommonPath + relativePasth;

                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                           while found=0 do
                                           begin
                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                               and (SearchRec.Attr<>faDirectory) //and (Pos('temp', Trim(SearchRec.Name)) < 1)
                                               and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                               then
                                               begin
                                                 suDBName := SearchRec.Name;
                                                 suDBNameList.Add(suDBName);
                                               end;
                                               found:=FindNext(SearchRec);
                                           end;
                                           FindClose(SearchRec);


                                           suDBNameListCount := suDBNameList.Count;

                                           if suDBNameListCount < 1 then
                                           begin
                                              ShowMessageEX('数据源不存在');
                                              abort;
                                           end;


                                           SetLength(MaxCreatetimeList, suDBNameListCount);


                                          AATProxyEX := TInstActionProxy.create;
                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                          AATProxyEX.StartWork; //开始工作
                                          try

                                              if Temp_LastHowManyDays <> '0' then
                                              begin

                                                  for J := 0 to suDBNameListCount - 1 do
                                                  begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                                    TheCopyTableAct2.iSerialNo := J;
                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                    AATProxyEX.AddAction(TheCopyTableAct2);
                                                  end;
                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                              end;
                                              SetLength(MaxCreatetimeList, 0);



                                              for J := 0 to suDBNameListCount - 1 do
                                              begin
                                                    Application.ProcessMessages;
                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                                    with TheCopyTableAct do
                                                    begin
                                                        iSerialNo := J;
                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                        WenJianMing := Trim(suDBNameList.Strings[J]);

                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                        Ba_dingtie_type := Temp_dingtie_type;
                                                        Ba_dingtie_content := Temp_dingtie_content;

                                                        Ba_add := Temp_add;
                                                        Ba_substract := Temp_substract;


                                                        if b_Debug then
                                                        begin
                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                        end;

                                                      //Ba_add, Ba_substract: string;
                                                    end;
                                                    AATProxyEX.AddAction(TheCopyTableAct);
                                              end;
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                              //TheCopyTableAct3.Ba_add := Temp_add;
                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_PlanName + '.temp';
                                              AATProxyEX.AddAction(TheCopyTableAct3);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                              if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                                TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);

                                              AATProxyEX.AddAction(TheCopyTableAct1);
                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                          finally
                                              AATProxyEX.Free;
                                          end;
                                  finally
                                         suDBNameList.free;
                                  end;
                              end;
                          finally
                            Temp_addlist.Free;
                          end;
                        end
                        else
                        begin
                            TemptDirectory := APPCommonPath + 'temp.temp';
                            if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                            slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                            try
                              sSQL :=
                                  'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                  '[TieziID] integer NOT NULL,' +
                                  '[FileMing] TEXT NOT NULL,' +
                                  'PRIMARY KEY ([TieziID],[FileMing]));';
                              slDataBase.ExecSQL(sSQL);
                            finally
                              slDataBase.Free;
                            end;

                            suDBNameList := TStringList.Create;
                            try
                                     SourceFileDir := APPCommonPath + relativePasth;

                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

                                     while found=0 do
                                     begin
                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                                         and (SearchRec.Attr<>faDirectory) //and (Pos('temp', Trim(SearchRec.Name)) < 1)
                                         and (TRegEx.Match(Trim(SearchRec.Name), '^\d{4}\.db3$').Success)
                                         then
                                         begin
                                           suDBName := SearchRec.Name;
                                           suDBNameList.Add(suDBName);
                                         end;
                                         found:=FindNext(SearchRec);
                                     end;
                                     FindClose(SearchRec);


                                     suDBNameListCount := suDBNameList.Count;

                                     if suDBNameListCount < 1 then
                                     begin
                                        ShowMessageEX('数据源不存在');
                                        abort;
                                     end;


                                     SetLength(MaxCreatetimeList, suDBNameListCount);


                                    AATProxyEX := TInstActionProxy.create;
                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        if Temp_LastHowManyDays <> '0' then
                                        begin

                                            for J := 0 to suDBNameListCount - 1 do
                                            begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
                                              TheCopyTableAct2.iSerialNo := J;
                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                              AATProxyEX.AddAction(TheCopyTableAct2);
                                            end;
                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                                        end;
                                        SetLength(MaxCreatetimeList, 0);



                                        for J := 0 to suDBNameListCount - 1 do
                                        begin
                                              Application.ProcessMessages;
                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
                                              with TheCopyTableAct do
                                              begin
                                                  iSerialNo := J;
                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                                  WenJianMing := Trim(suDBNameList.Strings[J]);

                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                                  Ba_dingtie_type := Temp_dingtie_type;
                                                  Ba_dingtie_content := Temp_dingtie_content;

                                                  Ba_add := Temp_add;
                                                  Ba_substract := Temp_substract;

                                                  if b_Debug then
                                                  begin
                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                                                  end;

                                                //Ba_add, Ba_substract: string;
                                              end;
                                              AATProxyEX.AddAction(TheCopyTableAct);
                                        end;
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
                                        if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                          TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                            finally
                                   suDBNameList.free;
                            end;
                        end;
                      end
//                      else
//                      if Temp_PlanScheme_DownloadorOffline = '1' then  //贴吧名
//                      begin
//                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '2' then //关键字
                      begin

                                  TemptDirectory := APPCommonPath + 'temp.temp';
                                  if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                                  try
                                    sSQL :=
                                        'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                        '[TieziID] integer NOT NULL,' +
                                        '[FileMing] TEXT NOT NULL,' +
                                        'PRIMARY KEY ([TieziID],[FileMing]));';
                                    slDataBase.ExecSQL(sSQL);
                                  finally
                                    slDataBase.Free;
                                  end;

                                  TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';

                                  if not FileExists(TemptDirectory2) then //DeleteFile(TemptDirectory2);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try
                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
                                        try
                                            Linshi_String := 'Provider Name=SQLite;';
                                            Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
                                            Linshi_String := Linshi_String + 'Login Prompt=False';

                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;

                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';

                                            LinshiMemoryTableUniConnection.Connected := True;
                                            LinshiMemoryTableUniConnection.Connected := False;


                                            sSQL :=
                                            //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                            'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                            //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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



                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);

                                            SuccCo := 0;
                                            FailCo := 0;

                                            SaveSearchedofTieziOnline := TSaveSearchedofTieziOnline.create;
                                            SaveSearchedofTieziOnline.ThreadCForOnlineSearch := StrToIntDef(Temp_PlanScheme_TotalThreadForDownloadMode, 1);
                                            SaveSearchedofTieziOnline.HowManyPage := strtointdef(Temp_LastHowManyDays, 0);
                                            SaveSearchedofTieziOnline.KeyWords := Temp_PlanScheme_TopicContent;
                                            SaveSearchedofTieziOnline.WebNames := Temp_PlanScheme_BarName;
                                            SaveSearchedofTieziOnline.MulThreadornot := true;
                                            //SaveSearchedofTieziOnline.SavedPath := TemptDirectory2;
        //                                    TheCopyTableAct2.iSerialNo := J;
        //                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
                                            AATProxyEX.AddAction(SaveSearchedofTieziOnline);

                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                            LinshiMemoryTableUniConnection.ExecSQL('ATTACH DATABASE "' + TemptDirectory2 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
                                            LinshiMemoryTableUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
                                            LinshiMemoryTableUniConnection.ExecSQL('DETACH DATABASE "hr"');
                                        finally
                                            LinshiMemoryTableUniConnection.Free;
                                        end;
                                    finally
                                      AATProxyEX.Free;
                                    end;
                                  end;

                                    AATProxyEX := TInstActionProxy.create;
                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                    AATProxyEX.StartWork; //开始工作
                                    try

                                        CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
                                        with CarryKeySearchedPostToTempTable do
                                        begin
                                          WenJianMingPath := TemptDirectory2;
                                          Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
                                          Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
                                          Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
                                          Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
                                          deleteorno := True;
                                          WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';//'onlinesearch0.temp';
                                        end;
                                        AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;


                                        if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                          TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);


                                        AATProxyEX.AddAction(TheCopyTableAct1);
                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                    finally
                                        AATProxyEX.Free;
                                    end;
                      end
                      else
                      if Temp_PlanScheme_DownloadorOffline = '1' then      //贴子ID
                      begin

                          Temp_addlist := TStringList.Create;
                          Temp_addlist.Delimiter := '|';
                          Temp_addlist.DelimitedText := Temp_add;

                         try
                           if Temp_addlist.Count <> 2 then
                           begin
                             ShowMessageEX('指定贴ID下载模式下，必须只有两个额外加上的贴子');
                             abort;
                           end;

                          if (strtoint64def(trim(Temp_addlist.Strings[0]), 0) < 1)
                          or (strtoint64def(trim(Temp_addlist.Strings[1]), 0) < 1)
                          or (strtoint64def(trim(Temp_addlist.Strings[0]), 0) = strtoint64def(trim(Temp_addlist.Strings[1]), 0))
                          then
                          begin
                            ShowMessageEX('指定贴ID下载模式下，必须只有两个额外加上的贴子，且为两个不相等的正整数');
                            abort;
                          end;
                          if strtoint64def(trim(Temp_addlist.Strings[0]), 0) < strtoint64def(trim(Temp_addlist.Strings[1]), 0) then
                          begin
                            minNumber := strtoint64def(trim(Temp_addlist.Strings[0]), 0);
                            maxNumber := strtoint64def(trim(Temp_addlist.Strings[1]), 0);
                          end
                          else
                          begin
                            minNumber := strtoint64def(trim(Temp_addlist.Strings[1]), 0);
                            maxNumber := strtoint64def(trim(Temp_addlist.Strings[0]), 0);
                          end;



                                  TemptDirectory1 := APPCommonPath + relativePasth1 + 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                  if not FileExists(TemptDirectory1) then //DeleteFile(TemptDirectory1);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          sSQL :=
                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
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

                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;


                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
                                    try
                                          slDataBase.BeginTransaction;

                                          try
                                            for jj := minNumber to maxNumber do
                                            begin
                                              application.ProcessMessages;
                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
                                              inttostr(jj) + ', 0, -1)';
                                              slDataBase.ExecSQL(sSQL);
                                            end;
                                          finally
                                            slDataBase.Commit;
                                          end;
                                    finally
                                      slDataBase.Free;
                                    end;



                                  //resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
                                  end;


                              TemptDirectory := APPCommonPath + 'temp.temp';
                              if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
                              slDataBase := TSQLiteDatabase.Create(TemptDirectory);
                              try
                                sSQL :=
                                    'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
                                    '[TieziID] integer NOT NULL,' +
                                    '[FileMing] TEXT NOT NULL,' +
                                    'PRIMARY KEY ([TieziID],[FileMing]));';
                                slDataBase.ExecSQL(sSQL);
                              finally
                                slDataBase.Free;
                              end;




                                AATProxyEX := TInstActionProxy.create;
                                AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
                                AATProxyEX.StartWork; //开始工作
                                try
                                //TheCopyTableAct3: TGetAddedPostToTempTable;
                                    TheCopyTableAct3 := TGetAddedPostToTempTable.create;
                                    TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
                                    //TheCopyTableAct3.Ba_add := Temp_add;
                                    TheCopyTableAct3.WenJianMing := 'onlinesearchadd' + TempPlanScheme_PlanName + '.temp';
                                    AATProxyEX.AddAction(TheCopyTableAct3);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;


                                    //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
                                    TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;

                                    if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
                                      TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);


                                    AATProxyEX.AddAction(TheCopyTableAct1);
                                    AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
                                finally
                                    AATProxyEX.Free;
                                end;

                         finally
                           Temp_addlist.Free;
                         end;
                      end;

                    end;



            finally
                finalWaiting;
                rbStart.Caption := VarHint;

                PlanSchemeTable.Free;
            end;



            DelayEX(10);

            if MemorySqliteTable_InUniConnection.RecordCount = 0 then
            begin
              if b_Debug then
              begin
                RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
                RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
                RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
                RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
                RzMemoLogLinesAdd('当前方案下没有任何符合条件的贴子' + #13#10);
                RzMemoLogLinesAdd('上一方案是否提前终止的：' + ifthen(StopInAdvance, '是', '否') + #13#10);
              end;
//              if rzcheckboxsameplan.Checked then
//                abort;
              RzMemoLogLinesAdd('无任何符合条件的数据记录，本方案执行结束' + #13#10);
              Break;
            end;

            GetCoreContentForSequenceTimes := 1;


            StopInAdvance := false;

            try    //MemorySqliteTable_InUniConnection
              MemorySqliteTable_InUniConnection.First;


              CurWhichRecord := 0;
              SucRecordCount := 0;

              while not MemorySqliteTable_InUniConnection.Eof do
              begin
                isNeedSaving := false;
                UsuccessOrnot := False;

//                SearchOfRecordsCount: string;
//                CurWhichRecord: Integer;
//                SucRecordCount: Integer;
                if RzComboBoxRoutine.ItemIndex = 0 then

                Pri_TieziID := IntToStr(MemorySqliteTable_InUniConnection.Fields[0].AsInteger - 2079619440 + 6374586736)
                else
                if RzComboBoxRoutine.ItemIndex = 1 then
                Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;

                //if not b_Debug then
                //begin
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 0 then
                  begin

                    //EnterCriticalSection(CS);
                    if SpinEditDays.Value > 0 then
                    begin
{
                  LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
                  LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
                  BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
}
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID
   + ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前百度账号已在此贴下发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 1 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID);
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('此贴下已发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end
                  else
                  if RzCheckBoxOnePostOneAccount.ItemIndex = 2 then
                  begin

                    //EnterCriticalSection(CS);
                    if spineditdays.Value > 0 then
                    begin
                   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName)
+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
                    end
                    else
                    begin
                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName));
                    end;
                    //LeaveCriticalSection(CS);

                    if repeatedFatieCount <> '0' then
                    begin
                      RzMemoLogLinesAdd('当前方案下已有在此贴下的回贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
                      MemorySqliteTable_InUniConnection.Next;
                      Continue;
                    end;
                  end;
                //end;

                Pri_TieziIDFileNmae := MemorySqliteTable_InUniConnection.Fields[1].asstring;
                //Pri_TieziID := '6361513183';     //无权回贴
                //Pri_TieziID := '6184821068';     //被删除
                //Pri_TieziID := '6374720646';
                //Pri_TieziID := '6374670634';
                Pri_BarName := '';
                Pri_Topic := '';
                Pri_Content := '';
                Pri_DeleteOrNot := '-1';
                //Pri_CanReplyOrNot := '-1';
                Pri_CanReplyOrNot := '-1';

                Pri_FloorCount := '';
                Pri_FloorDetails := '';
                Pri_FollowCountForOneTieBa := '';
                Pri_TotalPostForOneTieBa := '';

                PerTieziURL := Basic_PostLink + Pri_TieziID;
                RzMemoLogLinesAddEX('●●●开始第' + Pri_TieziID + '个贴子链接处理，' + #13#10
                + '方案名：' + TempPlanScheme_PlanName, PerTieziURL);

            if str_Version = '0' then
            begin
              PasteContent := '顶一下！';
              PasteContent_Main := '顶一下！';
            end
            else if (str_Version = '1') or (str_Version = '3') then
            begin
              if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
              if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
              if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
              raise Exception.Create('不支持的取顶贴内容方式');

              posPasteContenttotal := pos('|', PasteContent_total);
              if posPasteContenttotal > 1 then
              begin
                PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
              end
              else
              begin
                PasteContent := PasteContent_total;
                PasteContent_Main := PasteContent_total;
              end;
            end
            else if str_Version = '2' then
            begin
              if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
              if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
              if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
              raise Exception.Create('不支持的取顶贴内容方式');

              posPasteContenttotal := pos('|', PasteContent_total);
              if posPasteContenttotal > 1 then
              begin
                PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
                PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
              end
              else
              begin
                PasteContent := PasteContent_total;
                PasteContent_Main := PasteContent_total;
              end;

              //PasteContent := PasteContent + '_________________________________________________________________________________________________________________________以上信息来自自动发送软件，欲获取，add wechat official account：花苍比'
              PasteContent := PasteContent + PropagandaSentence;
            end;


                try
                  RzMemoLogLinesAddEX('打开第' + Pri_TieziID + '个贴子链接', PerTieziURL);

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

//                  a:
//                  setproxyrightorwrong := true;
//                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
//                  begin
//                    inc(whichProxy);
//                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);
//
//                    if whichProxyindex = 0 then
//                    begin
//
//                    end
//                    else
//                    begin
//                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
//                      tempPortInfoPos := Pos('|', tempPortInfo);
//                      if tempPortInfoPos > 0 then
//                      begin
//                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
//                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
//                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);
//
//
//                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);
//
//                        //这种情况还不知道怎么处理
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
//                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
//                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
//                      end
//                      else
//                      begin
//
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
//                          RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
//                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
//                      end;
//                    end;
//                  end;
//
//                  if not setproxyrightorwrong then
//                  begin
//                    RzMemoLogLinesAdd(setproxyrightorwrongsth + #13#10 + '进入下一个设置' + #13#10 + #13#10);
//                    goto a;
//                  end;

                  MainForm.Chromium1.LoadUrl(PerTieziURL);
                  MainForm.Chromium1.LoadUrl(PerTieziURL);


                  DelayEX(BasicParamConf.WaitingTimeBeforeLoad);

                  if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  //gtc1 := GetTickCount;
                  while MainForm.bLoading do
                  begin
//                    gtc2 := GetTickCount;
//                    if (gtc2 - gtc1) >= 120000 then
//                    begin
//                      setproxyrightorwrong := true;
//                      goto a;
//                    end;
                    DelayEX(500);
                  end;

//                  if PauseOrNot then
//                  begin
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                       Break;
//                    end;
//                  end;

                  if IsDeletedOrNoReplyTieZi(VarFeedbackIn) then
                  begin
                    RzMemoLogLinesAdd('无效的贴子链接，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                    Continue;
                  end;

                  if Temp_PlanScheme_DownloadorOffline <> '0' then
                  begin
                    if Not ConformToFloorCAndFollowCount(VarFeedbackIn) then
                    begin
                      RzMemoLogLinesAdd('下载模式下贴子不符合条件，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
                      Continue;
                    end;
                  end;

                  RzMemoLogLinesAddEX('第' + Pri_TieziID + '个贴子链接' + '为有效链接', PerTieziURL);
                  DelayEX(10);
                  if b_Debug then
                    RzMemoLogLinesAdd('全局关闭判定为不关闭');

                  if RzCheckBoxExploer.Checked then
                    Continue;


                    {

                    PasteContent_total: string;
                    PasteContent: string;
                    PasteContent_Main: string;


                    }


                  //if RzComboBoxModeChoose.ItemIndex = 0 then Clipboard.SetTextBuf(PChar(PasteContent));


                  if Temp_onlyForMainFloor = '1' then
                  begin
                    ScrolltoBottom;
                    ScrolltoBottom;  //ScrolltoBottomEXE;
                    RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                    DelayEx(1000);
                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''390'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';


                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


//                            formatori :=
//                            '<img pic_type=''1'' src=''http://t8.baidu.com/it/u=1484500186,1503043093&amp;fm=79&amp;app=86&amp;f=JPEG?w=1280&amp;h=853.gif'' class' +
//                            '=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''373'' width=''560'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;

//
//                      //DelayEx(1000000);
//                      if IsWindowVisible(self.Handle) then
//                      begin
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
//
//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(500);
//
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                      end
//                      else
                      begin
                        MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                      end;

//                      mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
//                                     'for(i=0;i<paras.length;i++){' +
//                                     'if (paras[i] != null)' +
//                                     'paras[i].parentNode.removeChild( paras[i]);' +
//                                     '}');




                      DelayEx(1000);




                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                      //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                      RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                    //end;
                  end
                  else
                  begin
                    isReplyinsubFloor := judgeMustReplyInSecondFloor(succsulFatie);
                    if isReplyinsubFloor then   //如果需要在2楼黄金位回得
                    begin
                      if not succsulFatie then
                        Continue;
                    end
                    else
                    begin
                      ScrolltoBottom;
                      ScrolltoBottom;  //ScrolltoBottomEXE;
                      RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
                      DelayEx(1000);

                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
                      begin
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchCoun: Integer;
                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
                            matchCoun := matchs.Count;
                            setlength(Stringarr, matchCoun);

//                            Memo1.Clear;
//                            for match in matchs do
//                            begin
//                              Memo1.Lines.Add(match.Value);
//                            end;

                            //Memo1.Lines.Add('----------');
                            for iii := 0 to matchCoun - 1 do
                            begin
                              matchvalue := matchs[iii].Value;
                              Stringarr[iii].VType := 17;
//                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' /><br />');

                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' /><br />');


                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');

                            end;



                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
                            formatori := format(formatori, Stringarr);
                            setlength(Stringarr, 0);


                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);

                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);



                            if str_Version = '2' then
                            formatori :=
                            formatori + PropagandaSentence +

//                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
//                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
//                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
//                              + ''' unselectable=''on'' pic_type=''0'' />';

                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';

                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
                            ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';


                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
                            MainForm.ExeJs(JScript);
                            DelayEx(1000);
                      end
                      else
                      begin
                        //posPasteContent_Main :
                        if str_Version = '2' then
                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
                        DelayEx(100);
                      end;



//                        if IsWindowVisible(self.Handle) then
//                        begin
////                          MainForm.CEFWindowParent1.SetFocus;
////                          MainForm.CEFWindowParent1.SetFocus;
////                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                          delayex(500);
//
//
//                          MainForm.CEFWindowParent1.SetFocus;
//                          MainForm.CEFWindowParent1.SetFocus;
//                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                          delayex(500);
//  //                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//  //                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                          mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                          'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                          delayex(500);
//
//
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                          Delay(50);
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        end
//                        else
                        begin
                          MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
                        end;

//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//
//
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
                        DelayEx(1000);

                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
                        //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
                        RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
                      //end;
                    end;
                  end;


                  UsuccessOrnot := True;
                  DelayEx(1000);
//                  if str_Version = '3' then
//                  begin
//                    randomize;
//                    if Random(2) = 0 then
//                    begin
//                      ShowMessageEX('你使用的是弹广告版，即将弹广告，正式版请加微信：baidutiebayinliu');
//                      PopAdvertisement;
//                    end;
                  //end;
                finally
//              CurWhichRecord := 1;
//              SucRecordCount := 0;
                  if UsuccessOrnot then
                  begin
                    //succPri_TieziID := Pri_TieziID;
                    Inc(SucRecordCount);
                    Inc(GetCoreContentForSequenceTimes);

                    //if not b_Debug then
                    //begin
                        //EnterCriticalSection(CS);
                        sldb1.BeginTransaction;
                        sldb1.ExecSQL('insert into FatieRecord (BaiduHao, TieziID, LastUpdateTime, PlanName) values (' +
                        QuotedStr(SetCacheDirectoryNa) + ', ' + QuotedStr(Pri_TieziID) + ', '
                        + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime))
                        + ', ' + QuotedStr(TempPlanScheme_PlanName)
                         + ')');
                        //sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, PlanScheme_index, ADDTiezi, SubstractTiezi ' + 'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' + IntToStr(TotalPlansCheme));
                        sldb1.Commit;
                        //LeaveCriticalSection(CS);
                    //end;
                  end;

                  Inc(CurWhichRecord);

                  RzMemoLogLinesAdd('当前方案下总共搜索出：' + SearchOfRecordsCount + '条' + #13#10
                  + '已处理'+ IntToStr(CurWhichRecord) + '条' + #13#10
                  + '已发贴' + IntToStr(SucRecordCount) + '条' + #13#10#13#10);



                  if isNeedSaving then
                  begin
                    if Pri_DeleteOrNot = '1' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                        try
                          if tregex.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
                            initializeSqliteHardwareTable(APPCommonPath + relativePasth +  Pri_TieziIDFileNmae)
                          else
                            initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
                          //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
                          sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
                          //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
                          finalizeSqliteHardwareTable;
                        except on E: exception do
                        begin
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                          '方案名：' + TempPlanScheme_PlanName  + #13#10 + '保存出错，原因：' + e.Message + #13#10#13#10#13#10);
                        end;
                        end;

                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                      end;
                    end
                    else if Pri_DeleteOrNot = '0' then
                    begin
                      if Pri_TieziIDFileNmae <> '' then
                      begin
                        try
                          if TRegEx.Match(Pri_TieziIDFileNmae, '^\d{4}\.db3$').Success then
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth +  Pri_TieziIDFileNmae)
                          else
                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);


                          if Pos('add', Pri_TieziIDFileNmae) > 0 then
                          begin
//                            Pri_Topic := '';
//                            Pri_Content := '';
//                            Pri_CreateTime := '';

                            Updatesqll := 'update SeeLiangTieziList set' +
                            ' TieBaName=' + QuotedStr(Pri_BarName) + ', ' +
                            ' TitleName=' + QuotedStr(Pri_Topic) + ', ' +
                            ' TieZiContent=' + QuotedStr(Pri_Content) + ', ' +
                            ' Createtime=' + QuotedStr(Pri_CreateTime) + ', ' +

                            ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
                            ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
                            ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
                            ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
                            ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                            //2019-12-12 05:59:17
                              ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                              ' where TieziID=' + QuotedStr(Pri_TieziID);
                          end
                          else
                          Updatesqll := 'update SeeLiangTieziList set' +
                          ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
                          ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
                          ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
                          //2019-12-12 05:59:17
                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
                            ' where TieziID=' + QuotedStr(Pri_TieziID);
                          sldb_InUniConnection.ExecSQL(Updatesqll);
                          finalizeSqliteHardwareTable;


                        except on E: exception do
                        begin
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot
                          + #13#10 + '保存出错，原因：' + e.Message
                          + #13#10#13#10#13#10);
                        end;
                        end;
                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);

                      end;
                    end;
                  end
                  else
                  begin
                    RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，不保存，' + #13#10
                    + '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
                  end;

                  if not rzcheckboxexploer.Checked then
                    DelayEx(G_TimerInterval);

                  if PauseOrNot then
                  begin
                    RzMemoLogLinesAdd('已暂停！');
                    while True do
                    begin
                      if PauseOrNot then
                        DelayEx(1000)
                      else
                      begin
                        RzMemoLogLinesAdd('取消暂停！');
                        Break;
                      end;
                    end;
                  end;

//                  if RzCheckBoxSamePlan.Checked then
//                  begin
                    if SucRecordCount >= SpinEditPostCount.Value then
                    begin
                      MemorySqliteTable_InUniConnection.Last;
                      StopInAdvance := true;
                    end
                    else
                    begin

                    end;
                  //end;
                  MemorySqliteTable_InUniConnection.Next;
                end;
              end;
            finally
              FinalQuerySqlInuni(MemorySqliteTable_InUniConnection);
              MemorySqliteTable_InUniConnection.Connection := nil;
              MemorySqliteTable_InUniConnection.Free;
              MemorySqlite_InUniConnection.Free;
//              if Trim(TemptDirectory) <> '' then
//              begin
//                if FileExists(TemptDirectory) then
//                begin
//                  DeleteFile(TemptDirectory);
//                end;
//              end;
            end;
      finally

        RzMemoLogLinesAdd('●●●●●●当前工作结束，信息：账号总序列号为' + IntToStr(GetAllAccForSequenceTimes) + #13#10
        + '●●●●●●获取账号为' + Temp_usedAcc + #13#10
        + '●●●●●●当前为第' + IntToStr(iiii + 1) + '个账号' + #13#10#13#10#13#10);

        if StopInAdvance then
        begin
          RzMemoLogLinesAdd('●●●提前结束本方案贴子发贴' + #13#10);
          inc(GetAllAccForSequenceTimes);
          if strtointdef(PlanScheme_ValidCount, 0) > 0 then
          if GetAllAccForSequenceTimes > strtointdef(PlanScheme_ValidCount, 0) then
          begin
            RzMemoLogLinesAdd('●●●完成本方案的有效贴子发贴数' + #13#10#13#10#13#10);
            breaktrue := true;
          end;
        end;
      end;
    end;
  finally
    if SaveTempFileOrNot then      //保存整理新下载的文件，没有被update的记录就不保存整理了，然后删除
    begin
      RzMemoLogLinesAdd('开始整理下载的文件！');

      suDBNameList := TStringList.Create;


      AATProxyEX := TInstActionProxy.create;
      AATProxyEX.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
      AATProxyEX.StartWork; //开始工作


      VarHint := rbStart.Caption;
      rbStart.Caption := '';
      with THandleWaitings.create(100) do
      try
         iniWaiting(rbStart, 7, 7);

         SourceFileDir := APPCommonPath + relativePasth1;

         found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

         while found=0 do
         begin
           delay(10);
           if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
           and (SearchRec.Attr<>faDirectory) and
           (
           (Pos('temp', Trim(SearchRec.Name)) > 0) or
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

                SplitDBFromSource := TSplitDBFromSource.create;
                SplitDBFromSource.SplitDirectory := APPCommonPath + relativePasth;
                SplitDBFromSource.SourceDBaseDire := SourceFileDir + Trim(suDBNameList.Strings[J]);
                AATProxyEX.AddAction(SplitDBFromSource);
                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

             finally
               if RzCheckBoxDeleteDownloadedFiles.Checked then
                 DeleteFile(SourceFileDir + Trim(suDBNameList.Strings[J]));
             end;
           end;
         end;
      finally



        finalWaiting;
        rbStart.Caption := VarHint;

        AATProxyEX.Free;

        suDBNameList.Free;


        if trim(Pri_TieziID) <> '' then
        begin
          if not rzcheckboxexploer.Checked then
          begin
            EnterCriticalSection(CS);
            sSQL := 'update PlanScheme_Config' +
            ' set OnlyForWechat=' + trim(Pri_TieziID) + ' where PlanScheme_index=' + PassPlanSchemeConfigIndex;
            sldb.BeginTransaction;
            try
              sldb.ExecSQL(sSQL);
              RzMemoLogLinesAdd('成功更新当前方案下的起始贴子ID:' + trim(Pri_TieziID) + #13#10#13#10);
            finally
              sldb.Commit;
            end;
            LeaveCriticalSection(CS);
          end;
        end;

        RzMemoLogLinesAdd('结束整理下载的文件！' + #13#10#13#10#13#10);
      end;
    end
    else
    begin
      SaveTempFileOrNot := true;
    end;
  end;

end;

function TFrmBaseForm1.GetPublishContent(tz_index: Integer): string;
begin
  Result := GetCoreContent(tz_index);
end;

procedure TFrmBaseForm1.GetSubmitButtonForOneFloorPoint_JS(iFloor,
  sourcekind: Integer; var InputPlaceEx_JS: TPoint);
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
  JsScriptstr: string;
begin
//  G_InputP := '';

//  JsScriptstr :=
////  'var element = document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
////  'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';
//    'document.body.scrollTop+=50';
//  MainForm.ExeJs(JsScriptstr);
//  Delay(5000);

  G_InputP := '';
  LinshiJS := 'try {' +
  'var is_exist = typeof document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
              'if (is_exist!="undefined") {var element=document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
              'var X = element.getBoundingClientRect().left;' +
              'var Y = element.getBoundingClientRect().top;' +
              'var Z = X;Z+="|";Z+=Y;alert(Z);} else alert("0");' +
              '}catch(e){alert(e)}';
  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';
  MainForm.ExeJs(LinshiJS);
  while G_InputP = '' do
  begin
    DelayEX(100);
    if b_Debug then RzMemoLogLinesAdd('正在JS循环中：GetSubmitButtonForOneFloorPoint_JS');
  end;

  if G_InputP='0' then
  begin
    Pri_CanReplyOrNot := '100';
    InputPlaceEx_JS.X := 0;
    InputPlaceEx_JS.Y := 0;
    Exit;
  end;


  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));

  G_InputP := '';

  iLinshiX := Ceil(strtofloat(LinshiX));
  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));



  if sourcekind = 0 then
  begin
//    InputPlaceEx_JS.X := iLinshiX + 215;
//    InputPlaceEx_JS.Y := iLinshY + 120;

    InputPlaceEx_JS.X := iLinshiX;// + StrToInt(RzEditX_hui_Sub.Text);
    InputPlaceEx_JS.Y := iLinshY;// + StrToInt(RzEditY_hui_Sub.Text);
  end
  else
  if sourcekind = 1 then
  begin
//    InputPlaceEx_JS.X := iLinshiX + 210;
//    InputPlaceEx_JS.Y := iLinshY + 95;

    InputPlaceEx_JS.X := iLinshiX;// + StrToInt(RzEditX_wo_Sub.Text);
    InputPlaceEx_JS.Y := iLinshY;// + StrToInt(RzEditY_wo_Sub.Text);
  end;
  //210   95        通过点击我也说一句

  //215   120        通过点击回复点

  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);

//
//  InputPlaceEx_JS.X := InputPlaceEx_JS.X + StrToInt(RzEditX.Text);
//  InputPlaceEx_JS.Y := InputPlaceEx_JS.Y + StrToInt(RzEditY.Text);
end;

function TFrmBaseForm1.GetValidCountOfList: Integer;
var
  i: Integer;
begin
  Result := 0;

  if RzMemo_PlanScheme.Lines.Count < 1 then
    Exit;


  RealPlanNameList.Clear;
  for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
  begin
    if Trim(RzMemo_PlanScheme.Lines.Strings[i]) <> '' then
    begin
      RealPlanNameList.Add(Trim(RzMemo_PlanScheme.Lines.Strings[i]))
    end;
  end;

  if RealPlanNameList.Count = 0 then
    Exit;

  Result := RealPlanNameList.Count;
end;

function TFrmBaseForm1.GetValidCountOfListEX: Integer;
var
  i: Integer;
  LinshiRealPlanNameList: TStringList;
begin
  LinshiRealPlanNameList := TStringList.Create;
  try
    Result := 0;

    if RzMemo_PlanScheme.Lines.Count < 1 then
      Exit;

    for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
    begin
      if Trim(RzMemo_PlanScheme.Lines.Strings[i]) <> '' then
      begin
        if Pos('//', Trim(RzMemo_PlanScheme.Lines.Strings[i])) < 1 then
        LinshiRealPlanNameList.Add(Trim(RzMemo_PlanScheme.Lines.Strings[i]))
      end;
    end;

    if LinshiRealPlanNameList.Count = 0 then
      Exit;

    Result := LinshiRealPlanNameList.Count;
  finally
    LinshiRealPlanNameList.Free;
  end;
end;

function TFrmBaseForm1.GetWoYeShuoYiJuButtonPoint_JS(iFloor: Integer;
  var InputPlaceEx_JS: TPoint): Boolean;
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
  JsScriptstr: string;
begin
  Result := False;
//  G_InputP := '';
//
//  JsScriptstr :=
////  'var element = document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
////  'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';
//    'document.body.scrollTop+=100';
//  MainForm.ExeJs(JsScriptstr);
//  Delay(5000);

  G_InputP := '';
  //LinshiJS := 'var element=document.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[' + IntToStr(iFloor - 1) + '];var X = element.getBoundingClientRect().left;var Y = element.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z)';

  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';

  //'var element=document.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[' + IntToStr(iFloor - 1) + '];' +
   LinshiJS :=
     'try {' +

//     'var getElementViewLeft = function(element) {' +
//     //'function getElementViewLeft(element){' +
//     'var actualLeft = element.offsetLeft;' +
//     'var current = element.offsetParent;' +
//
//     'while (current !== null){' +
//     'actualLeft += current.offsetLeft;' +
//     'current = current.offsetParent;' +
//     '}' +
//
//     'if (document.compatMode == "BackCompat"){' +
//     'var elementScrollLeft=document.body.scrollLeft;' +
//     '} else {' +
//     'var elementScrollLeft=document.documentElement.scrollLeft;' +
//     '}' +
//
//     'return actualLeft-elementScrollLeft;' +
//     '};' +
//
//
//     'var getElementViewTop = function(element) {' +
//     //'function getElementViewTop(element){' +
//     'var actualTop = element.offsetTop;' +
//     'var current = element.offsetParent;' +
//
//     'while (current !== null){' +
//     'actualTop += current. offsetTop;' +
//     'current = current.offsetParent;' +
//     '}' +
//
//     'if (document.compatMode == "BackCompat"){' +
//     'var elementScrollTop=document.body.scrollTop;' +
//     '} else {' +
//     'var elementScrollTop=document.documentElement.scrollTop;' +
//     '}' +
//
//     'return actualTop-elementScrollTop;' +
//     '};' +
//
//
//
//
//
//    'var oP = document.getElementsByClassName("core_reply j_lzl_wrapper");' +
//    'for(var i = 0; i < oP.length; i++)' + '{' + 'var element=oP[i];' +
//    'var tailinfo=element.getElementsByClassName("tail-info")[2].innerText;' +
//
//
//
//    'var tailinfoFloorNo=parseInt(tailinfo);' +
//
//               'if (tailinfoFloorNo>=2018) {' +
//            'tailinfo=element.getElementsByClassName("tail-info")[1].innerText;' +
//            'tailinfoFloorNo=parseInt(tailinfo);' +
//
//            //'alert(tailinfoFloorNo);' +
//
//
//            '}' +
//
//    'if (tailinfoFloorNo==' + IntToStr(iFloor) + ') ' +
//    '{' +
//    'alert(element.innerHTML);' +
//
//
//    'var desElement=element.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[0];break;}}' +
//    //'var X = desElement.getBoundingClientRect().left;var Y = desElement.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z)' +
//
//
//    //'if (typeof(desElement) != undefined) {' +
//    'if (desElement) {' +
//    'alert(desElement.offsetLeft);}' +
//
//
//    //'var X = getElementViewLeft(desElement);var Y = getElementViewTop(desElement);var Z = X;Z+="|";Z+=Y;' + //alert(Z)' +


    //'var desElement=document.getElementsByClassName("j_lzl_p btn-sub btn-small pull-right")[' + IntToStr(iFloor - 2) + '];' +

    'var getPagearea = function(element){' +
    'if (document.compatMode == "BackCompat"){' +
    'return {' +
    'width: Math.max(element.scrollWidth,' +
    'element.clientWidth),' +
    'height: Math.max(element.scrollHeight,' +
    'element.clientHeight)' +
    '}' +
    '} else {' +
    'return {' +
    'width: Math.max(element.scrollWidth,' +
    'element.clientWidth),' +
    'height: Math.max(element.scrollHeight,' +
    'element.clientHeight)' +
    '}' +
    '}' +
    '};' +

    'var desElement=document.getElementsByClassName("l_post l_post_bright j_l_post clearfix  ")[' + IntToStr(iFloor) + '];' +

    'var desElement1=document.getElementsByClassName("l_post l_post_bright j_l_post clearfix  ").length;' +

//        'if (desElement) {' +
//    'alert(desElement.offsetLeft);}' +

    'var X = desElement.getBoundingClientRect().left + getPagearea(desElement).width;var Y = desElement.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z)' +

     '}' +
     'catch(e) {alert(e+desElement1)}';

  MainForm.ExeJs(LinshiJS);
  while G_InputP = '' do
  begin
    DelayEX(100);
    if b_Debug then RzMemoLogLinesAdd('正在JS循环中：GetWoYeShuoYiJuButtonPoint_JS');
  end;
  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));

  G_InputP := '';

  //if Ceil(strtofloat(LinshY)) > (MainForm.CEFWindowParent1.Height - 200) then //CEFWindowParent1
  if Ceil(strtofloat(LinshY)) > (MainForm.CEFWindowParent1.Height - 200) then //CEFWindowParent1
  begin
    InputPlaceEx_JS.X := Ceil(strtofloat(LinshY));
    InputPlaceEx_JS.Y := MainForm.CEFWindowParent1.Height - 200;

    Exit;
  end;

  iLinshiX := Ceil(strtofloat(LinshiX));
  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));

//  InputPlaceEx_JS.X := iLinshiX + 120;
//  InputPlaceEx_JS.Y := iLinshY + 20;

//  if b_Debug then
//  begin
    InputPlaceEx_JS.X := iLinshiX;// + StrToInt(trim(RzEditX_wo.Text));
    InputPlaceEx_JS.Y := iLinshY;// + StrToInt(trim(RzEditY_wo.Text));
//  end;


  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);

  Result := True;
end;

procedure TFrmBaseForm1.InputContentToSpecifyFloor(iFloor: Integer;
  sPasteContent: string);
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
begin
  G_InputP := '';
  //Delay(5000);

  LinshiJS := 'var oP = document.getElementById("j_editor_for_container");' + 'var first=oP.children[0];first.innerHTML="' + sPasteContent + '"'; // + ';alert(first.innerText);';
//  LinshiJS :=
//  'try{' +
//  'var oP = document.getElementById("j_editor_for_container");' + 'var first=oP.children[0];first.innerHTML="' + sPasteContent + '"; alert(first.innerHTML)' +
//  '}' +
//  'catch(err){alert(err.message)}';

  //'var element=document.getElementById("j_editor_for_container");var X = element.getBoundingClientRect().left;var Y = element.getBoundingClientRect().top;var Z = X;Z+="|";Z+=Y;alert(Z)';
  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';

  MainForm.ExeJs(LinshiJS);
  //ShowMessageEX(G_InputP);
  Delay(500);
  G_InputP := '';

//  while G_InputP = '' do
//  begin
//    Delay(500);
//    CloseP;
//  end;
//  LinshiX := Copy(G_InputP, 1, Pos('|', G_InputP) - 1);
//  LinshY := Copy(G_InputP, Pos('|', G_InputP) + 1, Length(G_InputP) - Pos('|', G_InputP));
//
//  G_InputP := '';
//
//  iLinshiX := Ceil(strtofloat(LinshiX));
//  //iLinshY := RzPanelTop.Top + RzPanelTop.Height + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//  iLinshY := Panel_CEF.Top + MainForm.CEFWindowParent1.Top + Ceil(strtofloat(LinshY));
//
//  InputPlaceEx_JS.X := iLinshiX + 10;
//  InputPlaceEx_JS.Y := iLinshY + 10;
//
//  InputPlaceEx_JS := ClientToScreen(InputPlaceEx_JS);
end;


procedure TFrmBaseForm1.LoadDataFromDb;
var
  Linshi_sqlitetable: TSQLiteTable;
  Linshi_ssqlStrings: string;
begin


  //Submit_Type := QueryString('select Submit_Type from SystemInfo');

  SpinEdit_hour.Value := StrToInt(QueryString('select TaskInterval_H from SystemInfo'));
  SpinEdit_minute.Value := StrToInt(QueryString('select TaskInterval_M from SystemInfo'));
  SpinEdit_second.Value := StrToInt(QueryString('select TaskInterval_S from SystemInfo'));


  Linshi_ssqlStrings := 'select WaitingTimeBeforeLoad, BGModeSubReplyTimeaScrol,  ' +
  'ModeChoose, OpenBrowserModeOrnot, ControlCirculationKind, CirculationMaxNumber, ' +

//  x_wo: Integer;
//  y_wo: Integer;
//  x_wo_sub: Integer;
//  y_wo_sub: Integer;
//  x_hui: Integer;
//  y_hui: Integer;
//  x_hui_sub: Integer;
//  y_hui_sub: Integer;

'x_wo,  ' +
'y_wo,  ' +
'x_wo_sub,  ' +
'y_wo_sub,  ' +
'x_hui,  ' +
'y_hui,  ' +
'x_hui_sub,  ' +
'y_hui_sub, ' +


'x_wo_inputbox,  ' +
'y_wo_inputbox,  ' +
'x_hui_inputbox,  ' +
'y_hui_inputbox,  ' +
'x_inputbox,  ' +
'y_inputbox, ' +

'OnePostOneAccount, ' +
'CheckLoginedAcc,' +


  'x_inputbox_sub, ' +
  'y_inputbox_sub, ' +

  'set_inputbox, ' +
  'set_inputbox_sub, ' +


  'setwo, ' +
  'setwo_inputbox, ' +
  'setwo_sub, ' +






  'sethui, ' +
  'sethui_inputbox, ' +
  'sethui_sub, ' +



  'ShutDownorNot, ' +
  'SamePlanorNot, ' +
  'PostCountPerPlan, ' +
  'StartPostId, ' +


  'DownloadorNot, ' +
  'DownloadMode, ' +
  'Totalthread ' +






  ' from BasicParamConfig';
  EnterCriticalSection(CS);
  Linshi_sqlitetable := sldb.GetTable(Linshi_ssqlStrings);
  LeaveCriticalSection(CS);

  with BasicParamConf do
  begin
//  BasicParamConf.WaitingTimeBeforeLoad := StrToInt(Linshi_sqlitetable.FieldAsString(0));
//  BasicParamConf.BGModeSubReplyTimeaScrol := StrToInt(Linshi_sqlitetable.FieldAsString(1));
//  BasicParamConf.ModeChoose := StrToInt(Linshi_sqlitetable.FieldAsString(2));
//  BasicParamConf.OpenBrowserModeOrnot := StrToInt(Linshi_sqlitetable.FieldAsString(3));
//  BasicParamConf.ControlCirculationKind := StrToInt(Linshi_sqlitetable.FieldAsString(4));
//  BasicParamConf.CirculationMaxNumber := Linshi_sqlitetable.FieldAsString(5);

    WaitingTimeBeforeLoad := StrToInt(Linshi_sqlitetable.FieldAsString(0));
    BGModeSubReplyTimeaScrol := StrToInt(Linshi_sqlitetable.FieldAsString(1));
   //ModeChoose := StrToInt(Linshi_sqlitetable.FieldAsString(2));
    OpenBrowserModeOrnot := StrToInt(Linshi_sqlitetable.FieldAsString(3));
    ControlCirculationKind := StrToInt(Linshi_sqlitetable.FieldAsString(4));
    CirculationMaxNumber := Linshi_sqlitetable.FieldAsString(5);
//    x_wo := StrToInt(Linshi_sqlitetable.FieldAsString(6));
//    y_wo := StrToInt(Linshi_sqlitetable.FieldAsString(7));
//    x_wo_sub := StrToInt(Linshi_sqlitetable.FieldAsString(8));
//    y_wo_sub := StrToInt(Linshi_sqlitetable.FieldAsString(9));
//    x_hui := StrToInt(Linshi_sqlitetable.FieldAsString(10));
//    y_hui := StrToInt(Linshi_sqlitetable.FieldAsString(11));
//    x_hui_sub := StrToInt(Linshi_sqlitetable.FieldAsString(12));
//    y_hui_sub := StrToInt(Linshi_sqlitetable.FieldAsString(13));
//
//x_wo_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(14));
//y_wo_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(15));
//x_hui_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(16));
//y_hui_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(17));
//x_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(18));
//y_inputbox := StrToInt(Linshi_sqlitetable.FieldAsString(19));

    OnePostOneAccount :=  StrToInt(Linshi_sqlitetable.FieldAsString(20));
    CheckLoginedAcc :=   StrToInt(Linshi_sqlitetable.FieldAsString(21));


//  x_inputbox_sub :=  StrToInt(Linshi_sqlitetable.FieldAsString(22));
//  y_inputbox_sub :=  StrToInt(Linshi_sqlitetable.FieldAsString(23));
//
//  set_inputbox :=  StrToInt(Linshi_sqlitetable.FieldAsString(24));
//  set_inputbox_sub :=  StrToInt(Linshi_sqlitetable.FieldAsString(25));
//
//
    setwo :=  StrToInt(Linshi_sqlitetable.FieldAsString(26));
    setwo_inputbox :=  StrToInt(Linshi_sqlitetable.FieldAsString(27));
    setwo_sub :=  StrToInt(Linshi_sqlitetable.FieldAsString(28));
//
//
//  sethui :=  StrToInt(Linshi_sqlitetable.FieldAsString(29));
//  sethui_inputbox :=  StrToInt(Linshi_sqlitetable.FieldAsString(30));
//  sethui_sub :=  StrToInt(Linshi_sqlitetable.FieldAsString(31));


  ShutDownorNot :=  StrToInt(Linshi_sqlitetable.FieldAsString(32));
  SamePlanorNot :=  StrToInt(Linshi_sqlitetable.FieldAsString(33));
  PostCountPerPlan :=  StrToInt(Linshi_sqlitetable.FieldAsString(34));
  //StartPostId :=  Linshi_sqlitetable.FieldAsString(35);


  DownloadorNot :=  StrToInt(Linshi_sqlitetable.FieldAsString(36));
  DownloadMode :=  StrToInt(Linshi_sqlitetable.FieldAsString(37));
  Totalthread :=  StrToInt(Linshi_sqlitetable.FieldAsString(38));

  end;





  Linshi_sqlitetable.Free;



    with BasicParamConf do
    begin
      //RzComboBoxModeChoose.ItemIndex := BasicParamConf.ModeChoose;
      RzCheckBoxExploer.Checked := OpenBrowserModeOrnot=1;
      RzComboBoxWorkTimesType.ItemIndex := ControlCirculationKind;
      RzEditWorkTimes.Text := CirculationMaxNumber;
      RzSplitter1.Percent := setwo;
      RzSplitter2.Percent := setwo_sub;

//     RzEditX_wo.Text := IntToStr(x_wo);
//     RzEditY_wo.Text := IntToStr(y_wo);
//     RzEditX_wo_Sub.Text := IntToStr(x_wo_sub);
//     RzEditY_wo_Sub.Text := IntToStr(y_wo_sub);
//     RzEditX_hui.Text := IntToStr(x_hui);
//     RzEditY_hui.Text := IntToStr(y_hui);
//     RzEditX_hui_Sub.Text := IntToStr(x_hui_sub);
//     RzEditY_hui_Sub.Text := IntToStr(y_hui_sub);
//
//
//     RzEditX_wo_InputBox.Text := IntToStr(x_wo_inputbox);
//     RzEditY_wo_inputbox.Text := IntToStr(y_wo_inputbox);
//     RzEditx_hui_inputbox.Text := IntToStr(x_hui_inputbox);
//     RzEdity_hui_inputbox.Text := IntToStr(y_hui_inputbox);
//     RzEditX_input.Text := IntToStr(x_inputbox);
//     RzEditY_input.Text := IntToStr(y_inputbox);

     RzCheckBoxOnePostOneAccount.ItemIndex := BasicParamConf.OnePostOneAccount;
     RzCheckBoxDeleteDownloadedFiles.Checked := BasicParamConf.CheckLoginedAcc=1;


//    RzEditX_input_sub.Text := IntToStr(x_inputbox_sub);
//    RzEditY_input_sub.Text := IntToStr(y_inputbox_sub);
//
//
//  RzCheckBoxset_input.Checked := set_inputbox=1;
//  RzCheckBoxset_sub.Checked := set_inputbox_sub=1;
//
//
//  RzCheckBoxset_wo.Checked := setwo=1;
//  RzCheckBoxset_wo_input.Checked := setwo_inputbox=1;
//  RzCheckBoxset_wo_sub.Checked := setwo_sub=1;
//
//
//  RzCheckBoxSet_hui.Checked := sethui=1;;
//  RzCheckBoxset_hui_input.Checked := sethui_inputbox=1;
//  RzCheckBoxset_hui_sub.Checked := sethui_sub=1;

//  ShutDownorNot :=  StrToInt(Linshi_sqlitetable.FieldAsString(32));
//  SamePlanorNot :=  StrToInt(Linshi_sqlitetable.FieldAsString(33));
//  PostCountPerPlan :=  StrToInt(Linshi_sqlitetable.FieldAsString(34));
//  StartPostId :=  StrToInt(Linshi_sqlitetable.FieldAsString(35));

     RzCheckBoxshudown.Checked := ShutDownorNot=1;
     RzCheckBoxSamePlan.Checked := SamePlanorNot=1;
     SpinEditPostCount.Value := PostCountPerPlan;
     //SpinEditStartPostId.Text := StartPostId;



      //RzCheckBoxDownload.Checked := DownloadorNot=1;// :=  StrToInt(Linshi_sqlitetable.FieldAsString(36));
      //RzComboBoxDownloadMode.ItemIndex := DownloadMode;// :=  StrToInt(Linshi_sqlitetable.FieldAsString(37));
      //SpinEditTotalThread.Value := Totalthread;// :=  StrToInt(Linshi_sqlitetable.FieldAsString(38));

     RzCheckBoxSamePlanClick(nil);
//     RzCheckBoxDownloadClick(nil);
//     SpinEditTotalThreadChange(nil);
    end;
end;

procedure TFrmBaseForm1.LoadDataFromFile;
var
  F: TextFile;
  i: integer;
  fileStr: string;


  slDBpath, Linshi_String: string;
  sSQL: string;
//  Linshi_UniConnection_Manage: TUniConnection;
//  Linshi_UniQuery_Manage1: TUniQuery;
  //i: Integer;


  //F: TextFile;
  //fileStr: string;


  OneValues: string;
  LinshiNo: Integer;
  //Linshi_IP, Linshi_port: string;

  ExistCoun: Integer;
  LinshiError: string;
  LInshiSQL, LinshiValue: string;
  //iniTableAct: TCheckOneProxy;
  Linshi_Display: string;
  b: PChar;
  linshi_count, linshi_count1: string;
  GetNewestCreateTimeInTable, GetNewestCreateTimeForOneTieZiID: string;
  OYOProxy: TInstActionProxy;
  CoResult: Integer;
  //HTTP: TIdHTTP;
  Query: string;
  Buffer: string;
  Linshi_GetSetIdHttpType: Integer;
  //IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStream: TStringStream;
  Sub_IP: string;
  Abs_Port: string;
  Pri_IP: string;
  //Pri_Port: Integer;
  Pri_Port_str: string;
  PriUsernamePassword: string;
begin
  if FileExists(strfileName_PlanList) then
  begin
    AssignFile(F, strfileName_PlanList); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        ReadLn(F, fileStr); //从文本文件中读取信息
        RzMemo_PlanScheme.Lines.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;
  i := 0;
  if FileExists(HttpProxytxt) then
  begin
    AssignFile(F, HttpProxytxt); //把一个外部文件名和一个文件变量相关联
    try

      Reset(F); //为读打开文件并把文件指针移动到文件首? ? ? ?
      while not Eof(F) do
      begin
        //Application.ProcessMessages;



        ReadLn(F, fileStr); //从文本文件中读取信息


        DelayEx(10);




        OneValues := Trim(fileStr);

        Inc(i);
        if (i=1) and (OneValues<>'') and (Length(OneValues) = 1) then
        begin
          SplitUsernamePass := OneValues;
          Continue;
        end;

        if OneValues = '' then
          Continue;


        //if True then


        if not TRegEx.Match(OneValues, '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}').Success then
          Continue;

        Pri_IP := TRegEx.Match(OneValues, '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}').Value;

        OneValues := Copy(OneValues, Pos(Pri_IP, OneValues) + Length(Pri_IP), Length(OneValues) - Pos(Pri_IP, OneValues) - Length(Pri_IP) + 1);

        if not TRegEx.Match(OneValues, '\d{2,5}').Success then
          Continue;

        Pri_Port_str :=  TRegEx.Match(OneValues, '\d{2,5}').Value;

        //Pri_Port := StrToInt(Pri_Port_str);

        OneValues := Copy(OneValues, Pos(Pri_Port_str, OneValues) + Length(Pri_Port_str), Length(OneValues) - Pos(Pri_Port_str, OneValues) - Length(Pri_Port_str) + 1);

        if TRegEx.Match(OneValues, '\w+\' + SplitUsernamePass + '\w+').Success then
        begin
          PriUsernamePassword := TRegEx.Match(OneValues, '\w+\' + SplitUsernamePass + '\w+').Value;
          Pri_Port_str := Pri_Port_str + '|' +  PriUsernamePassword;
        end;


        //Pri_Port_str :=  TRegEx.Match(OneValues, '\d{2,5}').Value;


        ProxyIPlist.Add(Pri_IP + '=' + Pri_Port_str);


        //RzMemoFilteredWindow.Lines.Add(fileStr);
      end;

    finally
      CloseFile(F); //关闭文件
    end;
  end;


  SetIdHttpType_IPProxy_count := ProxyIPlist.Count;
end;

procedure TFrmBaseForm1.PopAdvertisement;
var
  RzURLLabe: TRzURLLabel;
  RzURLLabeurl: string;
begin
    RzURLLabe := TRzURLLabel.Create(nil);
    try
      if LoadBanKeyList then
      begin
        if BanKeyList.Count > 0 then
        begin
          Randomize;
          RzURLLabeurl := BanKeyList.Strings[Random(BanKeyList.Count)];
          if TRegEx.Match(RzURLLabeurl, '(http|https)\:\/\/').Success then //(https|http)\:\/\/.+?
          begin
            RzURLLabe.URL := RzURLLabeurl;
            RzURLLabe.Click;
          end;
        end;
      end;
    finally
      RzURLLabe.Free;
    end;
end;

procedure TFrmBaseForm1.PromptQuit(var Msg: TMessage);
begin
  RzMemoLogLinesAdd(ConfirmRemoteCloseService_MyInfo1 + #13#10#13#10#13#10);
end;

procedure TFrmBaseForm1.rbStartClick(Sender: TObject);
var
  whichProxy: Integer;
  whichProxyindex: Integer;

  setproxyrightorwrong: Boolean;
  setproxyrightorwrongsth: string;
  tempserverIP: string;
  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;

  gtc1, gtc2: DWORD;
  isNeedSaving: Boolean;
  VarFeedbackIn: string;
  i: Int64;
  iii: Integer;
  ii: Integer;
  PlanInd: Integer;
  Existss: Boolean;
  SourceText: string;

  PasteContent_total: string;

  posPasteContenttotal: Integer;
  PasteContent: string;
  PasteContent_Main: string;
  posPasteContent_Main: Integer;
  PatternForHttps: string;

  matchs: TMatchCollection;
  match: TMatch;
  matchvalue: string;
  matchCoun: Integer;
  //Stringarr: array of string;
  Stringarr: array of TVarRec;
  formatori: string;
  JScript: string;


  n: Integer;
  arr: array[0..255] of Char;
  oldHtmlSourceCode: string;
  submittype: Integer;
  PerTieziURL: string;
  InputPlaceEx_JS: TPoint;
  Linshi_Circulations, i_Circulations: Integer;
  Max_tiezi_ID: Int64;
  addContent: string;
  Updatesqll, Insertsqll: string;
  Linshi_String: string;
  PlanSchemeTable: TSQLiteTable;
  TotalPlansCheme: Integer;
  isReplyinsubFloor: Boolean;


  TempPlanScheme_index: string;

  //TempPlanSchemeConfig: TPlanSchemeConfig;

  Temp_add_Pervalue: string;
  Temp_addlist: TStringList;


  succsulFatie: Boolean;


  TheCopyTableAct: TGetFullfilledMemoryTable;
  SplitDBFromSource: TSplitDBFromSource;
  TheCopyTableAct2: TGetMaxDateInDataBase;
  SaveSearchedofTieziOnline: TSaveSearchedofTieziOnline;
  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;

  TheCopyTableAct3: TGetAddedPostToTempTable;
  CarryKeySearchedPostToTempTable: TCarryKeySearchedPostToTempTable;
  VarHint: string;
  AATProxyEX: TInstActionProxy;



  slDataBase: TSQLiteDatabase;
  sSQL: string;


 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 J: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;

  F: TextFile;
  //i: integer;
  fileStr: string;
  strfileName: string;
  Firststr,SecondStr: string;


  SetCacheDir: string;
  inputtext: string;

  LoginedAcc: string;
  linshiPoint: TPoint;
  CI: TCursorInfo;
  function SatisfyRestrict: Boolean;
  begin
    Result := False;
    if Linshi_Circulations > 0 then
    begin
      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
      begin
        if i_Circulations = 0 then
          Result := True;
      end
      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
      begin
        if (Action1_Tag - 1) = Linshi_Circulations then
        begin
          Result := True;
        end;
      end
    end;
    //CloseP;
    DelayEx(10);
  end;
begin
  if RzCheckBoxSamePlan.Checked then
  begin
        if b_isRuning then
          Exit;
        b_isRuning := True;
        disableSomething;
        try
          TotalPlansCheme := GetValidCountOfListEX;
          if TotalPlansCheme < 1 then
          begin
            //SaveTempFileOrNot := False;
            ShowMessageEX('无方案配置可用！');
            Exit;
          end;

          TotalPlansCheme := GetValidCountOfList;

          Linshi_Circulations := StrToIntDef(Trim(RzEditWorkTimes.Text), 0);
          if Linshi_Circulations < 0 then
            Linshi_Circulations := 0;

          i_Circulations := Linshi_Circulations;

          if (ParamCount>=1) then
          begin
            if not UsedOrNot_i_CirculationsForRestart then
            begin
              i_Circulations := StrToInt(ParamStr(2));
              UsedOrNot_i_CirculationsForRestart := True;
            end;
          end;

          if (ParamCount>=1) then
          begin
            if not UsedOrNot_Action1_TagForRestart then
            begin
              Action1_Tag := StrToInt(ParamStr(3));
              UsedOrNot_Action1_TagForRestart := True;
            end;
          end;

          Action1_Tag1 := 1;
          if (ParamCount>=1) then
          begin
            if not UsedOrNot_Action1_TagForRestart1 then
            begin
              Action1_Tag1 := StrToInt(ParamStr(4));
              UsedOrNot_Action1_TagForRestart1 := True;
            end;
          end;




          repeat
            RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作开始' + #13#10#13#10#13#10);
            RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作开始' + #13#10#13#10#13#10);

            try
//              EnterCriticalSection(CS);
//              PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
//              'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
//              'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
//              'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
//              ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
//              ' OnlyForWechat, OnlyMainFloor, DownloadorOffline, TotalThreadForDownloadMode  ' +
//              'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' +
//              IntToStr(TotalPlansCheme));
//              LeaveCriticalSection(CS);
//
//              try
//                PlanSchemeTable.MoveFirst;
//                while not PlanSchemeTable.EOF do
//                begin
//      //            with TempPlanSchemeConfig do
//      //            begin
//      //              Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
//      //              Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
//      //              Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
//      //              Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
//      //              Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
//      //              Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
//      //              Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
//      //              Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
//      //              Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
//      //              Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
//      //              Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
//      //              Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
//      //              Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
//      //              Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);
//      //
//      //
//      //              Temp_add := PlanSchemeTable.FieldAsString(15);
//      //              Temp_substract := PlanSchemeTable.FieldAsString(16);
//      //              Temp_usedAcc := PlanSchemeTable.FieldAsString(17);
//      //
//                    TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
//      //
//      //              TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
//      //
//      //              SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
//      //              Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
//      //              Temp_PlanScheme_DownloadorOffline := PlanSchemeTable.FieldAsString(20);
//      //              Temp_PlanScheme_TotalThreadForDownloadMode := PlanSchemeTable.FieldAsString(21);
//      //            end;
//
//
//                    if (ParamCount>=1) then
//                    begin
//                      if not UsedOrNot_PlanindexForRestart then
//                      begin
//                        if StrToInt(TempPlanScheme_index) < StrToInt(ParamStr(1)) then
//                        begin
//                          PlanSchemeTable.Next;
//                          Continue;
//                        end
//                        else
//                        begin
//                          UsedOrNot_PlanindexForRestart := True;
//                        end;
//                      end;
//                    end;
//                  DelayEx(10);
//                  ExecuteSamePlanDifferentLoginACC(TempPlanScheme_index, i_Circulations);
//                  DelayEx(10);
//                  PlanSchemeTable.Next;
//                end;
//              finally
//                PlanSchemeTable.Free;
//              end;


              for J := 0 to TotalPlansCheme - 1 do
              begin
                TempPlanScheme_index := IntToStr(J);

                if Pos('//', RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)]) > 0 then
                begin
                  Continue;
                end;

                    if (ParamCount>=1) then
                    begin


                      if not UsedOrNot_PlanindexForRestart then
                      begin
                        if J < StrToInt(ParamStr(1)) then
                        begin
                          Continue;
                        end
                        else
                        begin
                          UsedOrNot_PlanindexForRestart := True;
                        end;
                      end;
                    end;
                  DelayEx(10);
                  ExecuteSamePlanDifferentLoginACC(TempPlanScheme_index, i_Circulations);
                  DelayEx(10);
              end;


            finally
              RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作结束' + #13#10#13#10);
              RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作结束' + #13#10#13#10);
              inc(Action1_Tag);
              inc(Action1_Tag1);

              if Linshi_Circulations > 0 then
                i_Circulations := i_Circulations - 1;
              if b_Debug then
              begin
                RzMemoLogLinesAdd('Action1_Tag为：' + IntToStr(Action1_Tag) + #13#10 +
                                 ' Action1_Tag1为：' + IntToStr(Action1_Tag1) + #13#10+
                                 'i_Circulations为：' + IntToStr(i_Circulations) + #13#10);
              end;
            end;
          until SatisfyRestrict;
        finally
          enableSomething;
          b_isRuning := False;
        end;

        if RzCheckBoxshudown.Checked then shellexecute(0, 'open', 'shutdown.exe', ' -f -s -t 0', nil, SW_HIDE);

  end
  else
  begin
    if StrToInt64Def(Trim(RzEditTestTieZiID.Text), 0) > 0 then
      ActionInterfaceMode.Execute
    else
    begin
      ExecuteNonSamePlanDifferentLoginACC;
    end;
  end;
end;

procedure TFrmBaseForm1.RzButtonSetPlanSchemeClick(Sender: TObject);
begin
  i_PlanScheme_index := GetPlanIndex;
  if i_PlanScheme_index = -1 then
  begin
    ShowMessageEX('请先选中想要设置的方案名');
    Exit;
  end;

  FormSetPlanScheme := TFormSetPlanScheme.Create(Application);
  try
    FormSetPlanScheme.Position := poMainFormCenter;
    FormSetPlanScheme.applicationh := Application.Handle;
    FormSetPlanScheme.Caption := FormSetPlanScheme.Caption + '（第' + IntToStr(i_PlanScheme_index + 1) + '个方案)';
    CanMin := False;
    FormSetPlanScheme.ShowModal;
  finally
    CanMin := True;
    FormSetPlanScheme.Free;
  end;
end;

//procedure TFrmBaseForm1.RzCheckBoxDownloadCheckedModeExecute(Sender: TObject);
//var
//  whichProxy: Integer;
//  whichProxyindex: Integer;
//
//  setproxyrightorwrong: Boolean;
//  setproxyrightorwrongsth: string;
//  tempserverIP: string;
//  tempPortInfo, tempPortInfo_port, tempPortInfo_UsernamePass: string;
//  tempPortInfoPos, tempPortInfo_UsernamePassPos: integer;
//
//  gtc1, gtc2: DWORD;
//  isNeedSaving: Boolean;
//  VarFeedbackIn: string;
//  i: Int64;
//  iii: Integer;
//  ii: Integer;
//  PlanInd: Integer;
//  Existss: Boolean;
//  SourceText: string;
//
//  PasteContent_total: string;
//
//  posPasteContenttotal: Integer;
//  PasteContent: string;
//  PasteContent_Main: string;
//  posPasteContent_Main: Integer;
//  PatternForHttps: string;
//
//  matchs: TMatchCollection;
//  match: TMatch;
//  matchvalue: string;
//  matchCoun: Integer;
//  //Stringarr: array of string;
//  Stringarr: array of TVarRec;
//  formatori: string;
//  JScript: string;
//
//
//  n: Integer;
//  arr: array[0..255] of Char;
//  oldHtmlSourceCode: string;
//  submittype: Integer;
//  PerTieziURL: string;
//  InputPlaceEx_JS: TPoint;
//  Linshi_Circulations, i_Circulations: Integer;
//  Max_tiezi_ID: Int64;
//  addContent: string;
//  Updatesqll, Insertsqll: string;
//  Linshi_String: string;
//  PlanSchemeTable: TSQLiteTable;
//  TotalPlansCheme: Integer;
//  isReplyinsubFloor: Boolean;
//  Temp_PlanScheme_BarName: string;
//  Temp_PlanScheme_Topic: string;
//  Temp_PlanScheme_Content: string;
//  Temp_PlanScheme_TopicContent: string;
//  Temp_Control2FloorVacancy: string;
//  Temp_LastHowManyDays: string;
//  Temp_ReplyCountBegin: string;
//  Temp_ReplyCountEnd: string;
//  Temp_FollowPopulationBegin: string;
//  Temp_FollowPopulationEnd: string;
//  Temp_TieBaPostTotalBegin: string;
//  Temp_TieBaPostTotalEnd: string;
//  Temp_dingtie_type: string;
//  Temp_dingtie_content: string;
//  Temp_usedAcc: string;
//
//  //Temp_onlyForwechat: string;
//  SpinEditStartPostIdText: string;
//  Temp_onlyForMainFloor: string;
//
//  Temp_add: string;
//  Temp_add_Pervalue: string;
//  Temp_addlist: TStringList;
//  Temp_substract: string;
//
//  succsulFatie: Boolean;
//
//
//  TheCopyTableAct: TGetFullfilledMemoryTable;
//  SplitDBFromSource: TSplitDBFromSource;
//  TheCopyTableAct2: TGetMaxDateInDataBase;
//  SaveSearchedofTieziOnline: TSaveSearchedofTieziOnline;
//  TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//
//  TheCopyTableAct3: TGetAddedPostToTempTable;
//  CarryKeySearchedPostToTempTable: TCarryKeySearchedPostToTempTable;
//  VarHint: string;
//  AATProxyEX: TInstActionProxy;
//
//  TempPlanScheme_index: string;
//  TempPlanScheme_PlanName: string;
//
//  slDataBase: TSQLiteDatabase;
//  sSQL: string;
//
//
// SearchRec:TSearchRec;
// found:integer;
// suDBName: string;
// suDBNameListCount: Integer;
// J: Integer;
//
//  suDBNameList: TStringList;
//  SourceFileDir: string;
//
//  F: TextFile;
//  //i: integer;
//  fileStr: string;
//  strfileName: string;
//  Firststr,SecondStr: string;
//
//
//  SetCacheDir: string;
//  inputtext: string;
//
//  LoginedAcc: string;
//  linshiPoint: TPoint;
//  CI: TCursorInfo;
//  function SatisfyRestrict: Boolean;
//  begin
//    Result := False;
//    if Linshi_Circulations > 0 then
//    begin
//      if RzComboBoxWorkTimesType.Text = '限制单次最大循环数' then
//      begin
//        if i_Circulations = 0 then
//          Result := True;
//      end
//      else if RzComboBoxWorkTimesType.Text = '限制总最大循环数' then
//      begin
//        if (Action1_Tag - 1) = Linshi_Circulations then
//        begin
//          Result := True;
//        end;
//      end
//    end;
//    //CloseP;
//    DelayEx(10);
//  end;
//begin
//
//    case RzComboBoxDownloadMode.ItemIndex of
//    0:
//    begin
//      ActionOnlineSearchTieba.Execute;
//    end;
//    1:  //关键字模式，首做
//    begin
//      //ActionOnlineSearchMode.Execute;
//
//  if b_isRuning then
//    Exit;
//
//  b_isRuning := True;
//
//
//  //LoadProxyIP;
//  //whichProxy := -1;
//  disableSomething;
//
//  try
//    TotalPlansCheme := GetValidCountOfList;
//    if TotalPlansCheme < 1 then
//    begin
//      SaveTempFileOrNot := False;
//      ShowMessageEX('无方案配置可用！');
//      Exit;
//    end;
//
////    Automatic_Mode := 2;
////    submittype := StrToInt(QueryString('SELECT Submit_Type FROM SystemInfo'));
//    Linshi_Circulations := StrToIntDef(Trim(RzEditWorkTimes.Text), 0);
//    if Linshi_Circulations < 0 then
//      Linshi_Circulations := 0;
//
//    i_Circulations := Linshi_Circulations;
//    if (ParamCount>=1) then
//    begin
//      if not UsedOrNot_i_CirculationsForRestart then
//      begin
//        i_Circulations := StrToInt(ParamStr(2));
//        UsedOrNot_i_CirculationsForRestart := True;
//      end;
//    end;
//
//    //Max_tiezi_ID := GetMax_tiezi_ID;
//
//    if (ParamCount>=1) then
//    begin
//      if not UsedOrNot_Action1_TagForRestart then
//      begin
//        Action1_Tag := StrToInt(ParamStr(3));
//        UsedOrNot_Action1_TagForRestart := True;
//      end;
//    end;
//
//    Action1_Tag1 := 1;
//    if (ParamCount>=1) then
//    begin
//      if not UsedOrNot_Action1_TagForRestart1 then
//      begin
//        Action1_Tag1 := StrToInt(ParamStr(4));
//        UsedOrNot_Action1_TagForRestart1 := True;
//      end;
//    end;
//
//
//
//
//    repeat
//      RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作开始' + #13#10#13#10#13#10);
//      RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作开始' + #13#10#13#10#13#10);
//
//      try
//        EnterCriticalSection(CS);
//        PlanSchemeTable := sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' +
//        'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' +
//        'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' +
//        'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, ' +
//        ' PlanScheme_index, ADDTiezi, SubstractTiezi, ChoosedAccount, ' +
//        ' OnlyForWechat, OnlyMainFloor  ' +
//        'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' +
//        IntToStr(TotalPlansCheme));
//        LeaveCriticalSection(CS);
//
//        try
//          PlanSchemeTable.MoveFirst;
//          while not PlanSchemeTable.EOF do
//          begin
//            VarHint := rbStart.Caption;
//            rbStart.Caption := '';
//            with THandleWaitings.create(100) do
//            try
//                iniWaiting(rbstart, 7, 7);
//
//                    if RzCheckBoxSamePlan.Checked and (not PlanSchemeTable.BOF) then
//                    begin
//    //                  Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
//    //                  Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
//    //                  Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
//    //                  Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
//    //                  Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
//    //                  Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
//    //                  Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
//    //                  Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
//    //                  Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
//    //                  Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
//    //                  Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
//    //                  Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
//    //                  Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
//    //                  Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);
//    //
//    //
//    //                  Temp_add := PlanSchemeTable.FieldAsString(15);
//    //                  Temp_substract := PlanSchemeTable.FieldAsString(16);
//                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);
//
//                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
//                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
//                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
//
//                      if b_Debug then
//                      begin
//                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
//                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
//                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
//                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
//                      end;
//
//    //                  Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
//    //                  Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
//                    end
//                    else
//                    //if PlanSchemeTable.BOF then
//                    begin
//                      Temp_PlanScheme_BarName := PlanSchemeTable.FieldAsString(0);
//                      Temp_PlanScheme_Topic := PlanSchemeTable.FieldAsString(1);
//                      Temp_PlanScheme_Content := PlanSchemeTable.FieldAsString(2);
//                      Temp_PlanScheme_TopicContent := PlanSchemeTable.FieldAsString(3);
//                      Temp_Control2FloorVacancy := PlanSchemeTable.FieldAsString(4);
//                      Temp_LastHowManyDays := PlanSchemeTable.FieldAsString(5);
//                      Temp_ReplyCountBegin := PlanSchemeTable.FieldAsString(6);
//                      Temp_ReplyCountEnd := PlanSchemeTable.FieldAsString(7);
//                      Temp_FollowPopulationBegin := PlanSchemeTable.FieldAsString(8);
//                      Temp_FollowPopulationEnd := PlanSchemeTable.FieldAsString(9);
//                      Temp_TieBaPostTotalBegin := PlanSchemeTable.FieldAsString(10);
//                      Temp_TieBaPostTotalEnd := PlanSchemeTable.FieldAsString(11);
//                      Temp_dingtie_type := PlanSchemeTable.FieldAsString(12);
//                      Temp_dingtie_content := PlanSchemeTable.FieldAsString(13);
//
//
//                      Temp_add := PlanSchemeTable.FieldAsString(15);
//                      Temp_substract := PlanSchemeTable.FieldAsString(16);
//                      Temp_usedAcc := PlanSchemeTable.FieldAsString(17);
//
//                      TempPlanScheme_index := PlanSchemeTable.FieldAsString(14);
//                      //TempPlanScheme_PlanName := GetPlanScName(TempPlanScheme_index);
//                      TempPlanScheme_PlanName := RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
//
//                      if b_Debug then
//                      begin
//                        RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
//                        RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
//                        RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
//                        RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
//                      end;
//
//                      //Temp_onlyForwechat := PlanSchemeTable.FieldAsString(18);
//                      SpinEditStartPostIdText := PlanSchemeTable.FieldAsString(18);
//                      Temp_onlyForMainFloor := PlanSchemeTable.FieldAsString(19);
//                    end;
//
//
//    //                if Temp_onlyForwechat = '1' then
//    //                begin
//    //                  PlanSchemeTable.Next;
//    //                  Continue;
//    //                end;
//
//                    if (ParamCount>=1) then
//                    begin
//                      if not UsedOrNot_PlanindexForRestart then
//                      begin
//                        if StrToInt(TempPlanScheme_index) < StrToInt(ParamStr(1)) then
//                        begin
//                          PlanSchemeTable.Next;
//                          Continue;
//                        end
//                        else
//                        begin
//                          UsedOrNot_PlanindexForRestart := True;
//                        end;
//                      end;
//                    end;
//
////                    if RzCheckBoxCheckLoginedAcc.Checked then
////                    begin
////                      LoginedAcc := GetLoginedAccount;
////                      if (LoginedAcc = '') or (LoginedAcc <> SetCacheDirectoryNa) then
////                      begin
////                        ShowMessageEX('当前没有登录任何账号或登录的账号不对');
////                        Abort;
////                      end;
////
////                    end
////                    else
////                    begin
////                      LoginedAcc := SetCacheDirectoryNa;
////                    end;
//
//                    LoginedAcc := SetCacheDirectoryNa;
//
//
//                    if LoginedAcc <> Temp_usedAcc then
//                    begin
//                      SaveTempFileOrNot := False;
//                      CnTrayIcon1.Tag := 1;
//                      Restart_Flag := True;
//                      PlanindexForRestart := TempPlanScheme_index;
//                      i_CirculationsForRestart := IntToStr(i_Circulations);
//                      Pri_TieziIDForRestart := Pri_TieziID;
//                      Action1_TagForRestart := IntToStr(Action1_Tag);
//                      Action1_TagForRestart1 := IntToStr(Action1_Tag1);
//
//                      RzComboBoxWillLoginAcc.ItemIndex := RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc);
//                      self.Close;
//                      Abort;
//
//                      {strfileName := ExtractFilePath(Application.ExeName) + 'Save\CacheNameConfig.txt';
//                      if fileexists(strfileName) then
//                        DeleteFile(strfileName);
//
//                      AssignFile(F, strfileName);
//                      try
//                        if fileexists(strfileName) then
//                          append(F)
//                        else
//                          rewrite(F);
//
//                        inputtext := '0';
//                        Writeln(F, inputtext);                 //写日志里
//
//
//                      finally
//                        CloseFile(F);                        //关闭文件流
//                      end;
//
//
//                      AssignFile(F, strfileName);
//                      try
//                        if fileexists(strfileName) then
//                          append(F)
//                        else
//                          rewrite(F);
//
//                        inputtext := IntToStr(RzComboBoxWillLoginAcc.Items.IndexOf(Temp_usedAcc));
//                        Writeln(F, inputtext);                 //写日志里
//
//
//                      finally
//                        CloseFile(F);                        //关闭文件流
//                      end;
//
//                      if RzComboBoxWillLoginAcc.Items.Count > 0 then
//                      for ii := 0 to RzComboBoxWillLoginAcc.Items.Count - 1 do
//                      begin
//                        AssignFile(F, strfileName);
//                        try
//                          if fileexists(strfileName) then
//                            append(F)
//                          else
//                            rewrite(F);
//
//                          inputtext := RzComboBoxWillLoginAcc.Items.Strings[ii];
//                          Writeln(F, inputtext);                 //写日志里
//
//
//                        finally
//                          CloseFile(F);                        //关闭文件流
//                        end;
//                      end; }
//                    end;
//
//
//
//
//                    //if not (b_Debug and (StrToInt64Def(Trim(RzEditTestTieZiID.Text), 0) > 0)) then
//
//                    TemptDirectory := APPCommonPath + 'temp.temp';
//                    if FileExists(TemptDirectory) then DeleteFile(TemptDirectory);
//                    slDataBase := TSQLiteDatabase.Create(TemptDirectory);
//                    try
//                      sSQL :=
//                          'CREATE TABLE IF NOT EXISTS SaveSomeTieziID (' +
//                          '[TieziID] integer NOT NULL,' +
//                          '[FileMing] TEXT NOT NULL,' +
//                          'PRIMARY KEY ([TieziID],[FileMing]));';
//
//      //                      sSQL :=
//      //                      //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//      //                      //'CREATE TABLE SeeLiangTieziList (' +
//      //                      'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//      //                      '[FloorDetails] TEXT,' +
//      //                      '[TieziID] INTEGER NOT NULL,' +
//      //                      '[TieBaName] TEXT,' +
//      //                      '[TitleName] TEXT,' +
//      //                      '[TieZiContent] TEXT,' +
//      //                      '[DeleteOrNot] integer NOT NULL,' +
//      //                      '[CanReplyOrNot] integer,' +
//      //                      '[FloorCount] integer,' +
//      //                      '[Createtime] TEXT,' +
//      //                      '[FollowCountForOneTieBa] integer,' +
//      //                      '[TotalPostForOneTieBa] integer,' +
//      //                      '[LastUpdateTime] TEXT,' +
//      //                      'PRIMARY KEY ([TieziID]));';
//      //
//      //                      //'[LastUpdateTime] TEXT);';
//
//                      slDataBase.ExecSQL(sSQL);
//                    finally
//                      slDataBase.Free;
//                    end;
//
//                    if RzCheckBoxSamePlan.Checked and ((not PlanSchemeTable.BOF) or (Action1_Tag1 > 1)) then
//                    begin
//                      //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_index + '.temp';
//                      //TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
//                      //RealPlanNameList.Strings[StrToInt(TempPlanScheme_index)];
//                      TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
//                      if not FileExists(TemptDirectory2) then
//                      begin
//                        SaveTempFileOrNot := False;
//                        ShowMessageEX('关键词所搜出的贴所在的临时文件被删除');
//                        Abort;
//                      end;
//
//                      slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
//                      try
//                        if not slDataBase.TableExists('SeeLiangTieziList') then
//                        begin
//                          SaveTempFileOrNot := False;
//                          ShowMessageEX('关键词所搜出的贴所在的临时文件被修改');
//                          Abort;
//                        end;
//                      finally
//                        slDataBase.Free;
//                      end;
//
//                      AATProxyEX := TInstActionProxy.create;
//                      AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
//                      AATProxyEX.StartWork; //开始工作
//                      try
//                      //TheCopyTableAct3: TGetAddedPostToTempTable;
//                          CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
//                          with CarryKeySearchedPostToTempTable do
//                          begin
//                                                        WenJianMingPath := TemptDirectory2;   //
//                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                          //CarryKeySearchedPostToTempTable.Ba_add := Temp_add;
//                          //CarryKeySearchedPostToTempTable.WenJianMing := 'onlinesearch0.temp';   //'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
//                                                        WenJianMing := 'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';   //'onlinesearch' + RealPlanNameList.Strings[0] + '.temp';
//                          end;
//                          AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
//                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//                          //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//                          TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//
//                          if (ParamCount>=1) then
//                          begin
//                            if Trim(ParamStr(5)) <> '' then
//                            begin
//                              if not UsedOrNot_Pri_TieziIDForRestart then
//                              begin
//                                Pri_TieziID := ParamStr(5);
//                                UsedOrNot_Pri_TieziIDForRestart := True;
//                              end;
//                            end;
//                          end;
//
//                          TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
//                          AATProxyEX.AddAction(TheCopyTableAct1);
//                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                      finally
//                          AATProxyEX.Free;
//                      end;
//
////                      if not FileExists(TemptDirectory) then
////                      begin
////                        ShowMessageEX('符合条件的上一方案对应贴子临时文件不存在');
////                        Abort;
////                      end;
//
////                      AATProxyEX := TInstActionProxy.create;
////                      AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
////                      AATProxyEX.StartWork; //开始工作
////                      try
////                          TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
////
////                          if (ParamCount>=1) then
////                          begin
////                            if Trim(ParamStr(4)) <> '' then
////                            begin
////                              if not UsedOrNot_Pri_TieziIDForRestart then
////                              begin
////                                Pri_TieziID := ParamStr(4);
////                                UsedOrNot_Pri_TieziIDForRestart := True;
////                              end;
////                            end;
////                          end;
////
////                          TheCopyTableAct1.Ba_TieziID := Pri_TieziID;
////                          AATProxyEX.AddAction(TheCopyTableAct1);
////                          AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////                      finally
////                          AATProxyEX.Free;
////                      end;
//
//
//                    end
//                    else
//                    begin
//                        //add.temp
//                        //if Temp_add then
//                        //if Pos('%%%%%', Temp_add) > 0 then
////                        if Trim(Temp_add) <> '' then
////                        begin
////                          Temp_addlist := TStringList.Create;
////                          Temp_addlist.Delimiter := '|';
////                          Temp_addlist.DelimitedText := Temp_add;
////
////                          try
////                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) >= 0 then
////                              begin
////                                  TemptDirectory1 := APPCommonPath + relativePasth + 'add' + TempPlanScheme_index + '.temp';
////                                  if not FileExists(TemptDirectory1) then
////                                  begin
////                                    ShowMessageEX('额外新增贴所在的临时文件被删除');
////                                    Abort;
////                                  end;
////
////                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
////                                  try
////                                    if not slDataBase.TableExists('SeeLiangTieziList') then
////                                    begin
////                                      ShowMessageEX('额外新增贴所在的临时文件被修改');
////                                      Abort;
////                                    end;
////                                  finally
////                                    slDataBase.Free;
////                                  end;
////                              end
////                              else
////                              if resetAddedTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) < 0 then
////                              begin
////
////                                  TemptDirectory1 := APPCommonPath + relativePasth + 'add' + TempPlanScheme_index + '.temp';
////                                  if FileExists(TemptDirectory1) then DeleteFile(TemptDirectory1);
////                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
////                                  try
////        //                                sSQL :=
////        //                                'CREATE TABLE SaveSomeTieziID (' +
////        //                                '[TieziID] integer NOT NULL,' +
////        //                                '[FileMing] TEXT NOT NULL,' +
////        //                                'PRIMARY KEY ([TieziID]));';
////
////                                        sSQL :=
////                                        //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
////                                        'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
////                                        //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
////                                        '[FloorDetails] TEXT,' +
////                                        '[TieziID] INTEGER NOT NULL,' +
////                                        '[TieBaName] TEXT,' +
////                                        '[TitleName] TEXT,' +
////                                        '[TieZiContent] TEXT,' +
////                                        '[DeleteOrNot] integer NOT NULL,' +
////                                        '[CanReplyOrNot] integer,' +
////                                        '[FloorCount] integer,' +
////                                        '[Createtime] TEXT,' +
////                                        '[FollowCountForOneTieBa] integer,' +
////                                        '[TotalPostForOneTieBa] integer,' +
////                                        '[LastUpdateTime] TEXT,' +
////                                        'PRIMARY KEY ([TieziID]));';
////
////
////
////                                        slDataBase.ExecSQL(sSQL);
////
////                                  finally
////                                    slDataBase.Free;
////                                  end;
////
////
////                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory1);
////                                  try
////                                        slDataBase.BeginTransaction;
////
////                                        try
////                                          for ii := 0 to Temp_addlist.Count - 1 do
////                                          begin
////                                            Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
////                                            if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
////                                            begin
////                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
////                                              QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
////                                              slDataBase.ExecSQL(sSQL);
////                                            end;
////                                          end;
////                                        finally
////                                          slDataBase.Commit;
////                                        end;
////                                  finally
////                                    slDataBase.Free;
////                                  end;
////
////
////
////                                  resetAddedTieziDatabase_recordlist.Add(TempPlanScheme_index);
////                              end;
////
////
////
////
////
////                              if Temp_addlist.IndexOf('%%%%%') >= 0 then
////                              begin
////
////                                          AATProxyEX := TInstActionProxy.create;
////                                          AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
////                                          AATProxyEX.StartWork; //开始工作
////                                          try
////                                          //TheCopyTableAct3: TGetAddedPostToTempTable;
////                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
////                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
////                                              TheCopyTableAct3.Ba_add := Temp_add;
////                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
////                                              AATProxyEX.AddAction(TheCopyTableAct3);
////                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////
////                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
////                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
////
////                                              if RzCheckBoxSamePlan.Checked then
////                                              begin
////                                                if SpinEditStartPostId.Value > 0 then
////                                                  TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
////                                              end;
////
////                                              AATProxyEX.AddAction(TheCopyTableAct1);
////                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////                                          finally
////                                              AATProxyEX.Free;
////                                          end;
////                              end
////                              else
////                              begin
////                                  suDBNameList := TStringList.Create;
////
////                                  try
////                                           SourceFileDir := APPCommonPath + relativePasth;
////
////                                           found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);
////
////                                           while found=0 do
////                                           begin
////                                               if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
////                                               and (SearchRec.Attr<>faDirectory) and (Pos('temp', Trim(SearchRec.Name)) < 1)
////                                               then
////                                               begin
////                                                 suDBName := SearchRec.Name;
////                                                 suDBNameList.Add(suDBName);
////                                               end;
////                                               found:=FindNext(SearchRec);
////                                           end;
////                                           FindClose(SearchRec);
////
////
////                                           suDBNameListCount := suDBNameList.Count;
////
////                                           if suDBNameListCount < 1 then
////                                           begin
////                                              ShowMessageEX('数据源不存在');
////                                              Exit;
////                                           end;
////
////
////                                           SetLength(MaxCreatetimeList, suDBNameListCount);
////
////
////                                          AATProxyEX := TInstActionProxy.create;
////                                          AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
////                                          AATProxyEX.StartWork; //开始工作
////                                          try
////
////                                              if Temp_LastHowManyDays <> '0' then
////                                              begin
////
////                                                  for J := 0 to suDBNameListCount - 1 do
////                                                  begin
////                                                    Application.ProcessMessages;
////                                                    TheCopyTableAct2 := TGetMaxDateInDataBase.create;
////                                                    TheCopyTableAct2.iSerialNo := J;
////                                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
////                                                    AATProxyEX.AddAction(TheCopyTableAct2);
////                                                  end;
////                                                  AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////
////
////                                                  NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
////                                              end;
////                                              SetLength(MaxCreatetimeList, 0);
////
////
////
////                                              for J := 0 to suDBNameListCount - 1 do
////                                              begin
////                                                    Application.ProcessMessages;
////                                                    TheCopyTableAct := TGetFullfilledMemoryTable.create;
////                                                    with TheCopyTableAct do
////                                                    begin
////                                                        iSerialNo := J;
////                                                        WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
////                                                        WenJianMing := Trim(suDBNameList.Strings[J]);
////
////                                                        Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
////                                                        Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
////                                                        Ba_PlanScheme_Content := Temp_PlanScheme_Content;
////                                                        Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
////                                                        Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
////                                                        Ba_LastHowManyDays := Temp_LastHowManyDays;
////                                                        Ba_ReplyCountBegin := Temp_ReplyCountBegin;
////                                                        Ba_ReplyCountEnd := Temp_ReplyCountEnd;
////                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
////                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
////                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
////                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
////                                                        Ba_dingtie_type := Temp_dingtie_type;
////                                                        Ba_dingtie_content := Temp_dingtie_content;
////
////                                                        Ba_add := Temp_add;
////                                                        Ba_substract := Temp_substract;
////
////
////                                                        if b_Debug then
////                                                        begin
////                                                          RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
////                                                          RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
////                                                          RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
////                                                          RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
////                                                        end;
////
////                                                      //Ba_add, Ba_substract: string;
////                                                    end;
////                                                    AATProxyEX.AddAction(TheCopyTableAct);
////                                              end;
////                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////                                              TheCopyTableAct3 := TGetAddedPostToTempTable.create;
////                                              TheCopyTableAct3.WenJianMingPath := TemptDirectory1;
////                                              TheCopyTableAct3.Ba_add := Temp_add;
////                                              TheCopyTableAct3.WenJianMing := 'add' + TempPlanScheme_index + '.temp';
////                                              AATProxyEX.AddAction(TheCopyTableAct3);
////                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////
////                                              //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
////                                              TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
////                                              if RzCheckBoxSamePlan.Checked then
////                                              begin
////                                                if SpinEditStartPostId.Value > 0 then
////                                                  TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
////                                              end;
////                                              AATProxyEX.AddAction(TheCopyTableAct1);
////                                              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////                                          finally
////                                              AATProxyEX.Free;
////                                          end;
////                                  finally
////                                         suDBNameList.free;
////                                  end;
////                              end;
////                          finally
////                            Temp_addlist.Free;
////                          end;
////
////
////
////
////
////                        end
////                        else
////                        begin
//
//                            //suDBNameList := TStringList.Create;
//
//                            //try
////                                     SourceFileDir := APPCommonPath + relativePasth;
////
////                                     found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);
////
////                                     while found=0 do
////                                     begin
////                                         if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
////                                         and (SearchRec.Attr<>faDirectory) and (Pos('temp', Trim(SearchRec.Name)) < 1)
////                                         then
////                                         begin
////                                           suDBName := SearchRec.Name;
////                                           suDBNameList.Add(suDBName);
////                                         end;
////                                         found:=FindNext(SearchRec);
////                                     end;
////                                     FindClose(SearchRec);
////
////
////                                     suDBNameListCount := suDBNameList.Count;
////
////                                     if suDBNameListCount < 1 then
////                                     begin
////                                        ShowMessageEX('数据源不存在');
////                                        Exit;
////                                     end;
////
////
////                                     SetLength(MaxCreatetimeList, suDBNameListCount);
//
//                              TemptDirectory2 := APPCommonPath + relativePasth1 + 'onlinesearch' + TempPlanScheme_PlanName + '.temp';
////                              if resetOnlineSearchedofTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) >= 0 then
////                              begin
////                                  if not FileExists(TemptDirectory2) then
////                                  begin
////                                    ShowMessageEX('关键词所搜出的贴所在的临时文件被删除');
////                                    Abort;
////                                  end;
////
////                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
////                                  try
////                                    if not slDataBase.TableExists('SeeLiangTieziList') then
////                                    begin
////                                      ShowMessageEX('关键词所搜出的贴所在的临时文件被修改');
////                                      Abort;
////                                    end;
////                                  finally
////                                    slDataBase.Free;
////                                  end;
////                              end
////                              else
////                              if resetOnlineSearchedofTieziDatabase_recordlist.IndexOf(TempPlanScheme_index) < 0 then
////                              begin
//                                  //TemptDirectory2 := APPCommonPath + relativePasth + 'onlinesearch' + TempPlanScheme_index + '.temp';
//                                  if not FileExists(TemptDirectory2) then //DeleteFile(TemptDirectory2);
//                                  begin
//                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
//                                    try
//          //                                sSQL :=
//          //                                'CREATE TABLE SaveSomeTieziID (' +
//          //                                '[TieziID] integer NOT NULL,' +
//          //                                '[FileMing] TEXT NOT NULL,' +
//          //                                'PRIMARY KEY ([TieziID]));';
//
//                                          sSQL :=
//                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                          '[FloorDetails] TEXT,' +
//                                          '[TieziID] INTEGER NOT NULL,' +
//                                          '[TieBaName] TEXT,' +
//                                          '[TitleName] TEXT,' +
//                                          '[TieZiContent] TEXT,' +
//                                          '[DeleteOrNot] integer NOT NULL,' +
//                                          '[CanReplyOrNot] integer,' +
//                                          '[FloorCount] integer,' +
//                                          '[Createtime] TEXT,' +
//                                          '[FollowCountForOneTieBa] integer,' +
//                                          '[TotalPostForOneTieBa] integer,' +
//                                          '[LastUpdateTime] TEXT,' +
//                                          'PRIMARY KEY ([TieziID]));';
//
//
//
//                                          slDataBase.ExecSQL(sSQL);
//
//                                    finally
//                                      slDataBase.Free;
//                                    end;
//
//                                    AATProxyEX := TInstActionProxy.create;
//                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
//                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
//                                    AATProxyEX.StartWork; //开始工作
//                                    try
//                                        LinshiMemoryTableUniConnection := TUniConnection.Create(nil);
//                                        try
//                                            Linshi_String := 'Provider Name=SQLite;';
//                                            Linshi_String := Linshi_String + 'Database=' + ':memory:' + ';';
//                                            Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
//                                            Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
//                                            Linshi_String := Linshi_String + 'Use Unicode=false;';
//                                            Linshi_String := Linshi_String + 'Login Prompt=False';
//
//                                            LinshiMemoryTableUniConnection.ConnectString := Linshi_String;
//
//                                            LinshiMemoryTableUniConnection.Password := 'SYNCHRONOUSNORMAL';
//
//                                            LinshiMemoryTableUniConnection.Connected := True;
//                                            LinshiMemoryTableUniConnection.Connected := False;
//
//
//                                            sSQL :=
//                                            //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//                                            'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                            //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                            '[FloorDetails] TEXT,' +
//                                            '[TieziID] INTEGER NOT NULL,' +
//                                            '[TieBaName] TEXT,' +
//                                            '[TitleName] TEXT,' +
//                                            '[TieZiContent] TEXT,' +
//                                            '[DeleteOrNot] integer NOT NULL,' +
//                                            '[CanReplyOrNot] integer,' +
//                                            '[FloorCount] integer,' +
//                                            '[Createtime] TEXT,' +
//                                            '[FollowCountForOneTieBa] integer,' +
//                                            '[TotalPostForOneTieBa] integer,' +
//                                            '[LastUpdateTime] TEXT,' +
//                                            'PRIMARY KEY ([TieziID]));';
//
//
//
//                                            LinshiMemoryTableUniConnection.ExecSQL(sSQL);
//
//                                            SuccCo := 0;
//                                            FailCo := 0;
//
//                                            SaveSearchedofTieziOnline := TSaveSearchedofTieziOnline.create;
//                                            SaveSearchedofTieziOnline.HowManyPage := strtointdef(Temp_LastHowManyDays, 0);
//                                            SaveSearchedofTieziOnline.KeyWords := Temp_PlanScheme_TopicContent;
//                                            SaveSearchedofTieziOnline.WebNames := Temp_PlanScheme_BarName;
//                                            SaveSearchedofTieziOnline.MulThreadornot := true;
//                                            //SaveSearchedofTieziOnline.SavedPath := TemptDirectory2;
//        //                                    TheCopyTableAct2.iSerialNo := J;
//        //                                    TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                                            AATProxyEX.AddAction(SaveSearchedofTieziOnline);
//
//                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//                                            LinshiMemoryTableUniConnection.ExecSQL('ATTACH DATABASE "' + TemptDirectory2 + '" AS hr KEY ' + QuotedStr('SYNCHRONOUSNORMAL'));
//                                            LinshiMemoryTableUniConnection.ExecSQL('replace into [hr].SeeLiangTieziList select * from SeeLiangTieziList;');
//                                            LinshiMemoryTableUniConnection.ExecSQL('DETACH DATABASE "hr"');
//                                        finally
//                                            LinshiMemoryTableUniConnection.Free;
//                                        end;
//                                    finally
//                                      AATProxyEX.Free;
//                                    end;
//                                  end;
//
//                                    AATProxyEX := TInstActionProxy.create;
//                                    //AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
//                                    AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
//                                    AATProxyEX.StartWork; //开始工作
//                                    try
//
//                                        CarryKeySearchedPostToTempTable := TCarryKeySearchedPostToTempTable.create;
//                                        with CarryKeySearchedPostToTempTable do
//                                        begin
//                                                        WenJianMingPath := TemptDirectory2;
//                                                        Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
//                                                        Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
//                                                        Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
//                                                        Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
//                                        //CarryKeySearchedPostToTempTable.Ba_add := Temp_add;
//                                                        WenJianMing := 'onlinesearch' + TempPlanScheme_PlanName + '.temp';//'onlinesearch0.temp';
//                                        end;
//                                        AATProxyEX.AddAction(CarryKeySearchedPostToTempTable);
//                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
//                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
//
//                                        if RzCheckBoxSamePlan.Checked then
//                                        begin
//                                          if StrToInt64Def(Trim(SpinEditStartPostIdText),0) > 0 then
//                                            TheCopyTableAct1.Ba_TieziID := Trim(SpinEditStartPostIdText);
//                                        end;
//
//                                        AATProxyEX.AddAction(TheCopyTableAct1);
//                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//                                    finally
//                                        AATProxyEX.Free;
//                                    end;
//
//
//
//
////                                  slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
////                                  try
////                                        slDataBase.BeginTransaction;
////
////                                        try
////                                          for ii := 0 to Temp_addlist.Count - 1 do
////                                          begin
////                                            Temp_add_Pervalue := Trim(Temp_addlist.Strings[ii]);
////                                            if StrToInt64Def(Temp_add_Pervalue, 0) > 0 then
////                                            begin
////                                              sSQL := 'replace into SeeLiangTieziList (TieziID, DeleteOrNot, CanReplyOrNot) values (' +
////                                              QuotedStr(Temp_add_Pervalue) + ', 0, -1)';
////                                              slDataBase.ExecSQL(sSQL);
////                                            end;
////                                          end;
////                                        finally
////                                          slDataBase.Commit;
////                                        end;
////                                  finally
////                                    slDataBase.Free;
////                                  end;
////
////
////
////                                  //resetOnlineSearchedofTieziDatabase_recordlist.Add(TempPlanScheme_index);
////
////
////
////
////
////                                    AATProxyEX := TInstActionProxy.create;
////                                    AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
////                                    AATProxyEX.StartWork; //开始工作
////                                    try
////
////                                        if Temp_LastHowManyDays <> '0' then
////                                        begin
////
////                                            for J := 0 to suDBNameListCount - 1 do
////                                            begin
////                                              Application.ProcessMessages;
////                                              TheCopyTableAct2 := TGetMaxDateInDataBase.create;
////                                              TheCopyTableAct2.iSerialNo := J;
////                                              TheCopyTableAct2.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
////                                              AATProxyEX.AddAction(TheCopyTableAct2);
////                                            end;
////                                            AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////
////
////                                            NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
////                                        end;
////                                        SetLength(MaxCreatetimeList, 0);
////
////
////
////                                        for J := 0 to suDBNameListCount - 1 do
////                                        begin
////                                              Application.ProcessMessages;
////                                              TheCopyTableAct := TGetFullfilledMemoryTable.create;
////                                              with TheCopyTableAct do
////                                              begin
////                                                  iSerialNo := J;
////                                                  WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[J]);
////                                                  WenJianMing := Trim(suDBNameList.Strings[J]);
////
////                                                  Ba_PlanScheme_BarName := Temp_PlanScheme_BarName;
////                                                  Ba_PlanScheme_Topic := Temp_PlanScheme_Topic;
////                                                  Ba_PlanScheme_Content := Temp_PlanScheme_Content;
////                                                  Ba_PlanScheme_TopicContent := Temp_PlanScheme_TopicContent;
////                                                  Ba_Control2FloorVacancy := Temp_Control2FloorVacancy;
////                                                  Ba_LastHowManyDays := Temp_LastHowManyDays;
////                                                  Ba_ReplyCountBegin := Temp_ReplyCountBegin;
////                                                  Ba_ReplyCountEnd := Temp_ReplyCountEnd;
////                                                  Ba_FollowPopulationBegin := Temp_FollowPopulationBegin;
////                                                  Ba_FollowPopulationEnd := Temp_FollowPopulationEnd;
////                                                  Ba_TieBaPostTotalBegin := Temp_TieBaPostTotalBegin;
////                                                  Ba_TieBaPostTotalEnd := Temp_TieBaPostTotalEnd;
////                                                  Ba_dingtie_type := Temp_dingtie_type;
////                                                  Ba_dingtie_content := Temp_dingtie_content;
////
////                                                  Ba_add := Temp_add;
////                                                  Ba_substract := Temp_substract;
////
////                                                  if b_Debug then
////                                                  begin
////                                                    RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
////                                                    RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
////                                                    RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
////                                                    RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
////                                                  end;
////
////                                                //Ba_add, Ba_substract: string;
////                                              end;
////                                              AATProxyEX.AddAction(TheCopyTableAct);
////                                        end;
////                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////
////
////                                        //TheCopyTableAct1: TTransFerFromTempFileToMemoryTable;
////                                        TheCopyTableAct1 := TTransFerFromTempFileToMemoryTable.create;
////                                        if RzCheckBoxSamePlan.Checked then
////                                        begin
////                                          if SpinEditStartPostId.Value > 0 then
////                                            TheCopyTableAct1.Ba_TieziID := IntToStr(SpinEditStartPostId.Value);
////                                        end;
////                                        AATProxyEX.AddAction(TheCopyTableAct1);
////                                        AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
////                                    finally
////                                        AATProxyEX.Free;
////                                    end;
//
//                    end;
//
//
//
//            finally
//              finalWaiting;
//              rbStart.Caption := VarHint;
//            end;
//
//
//
//            DelayEX(10);
//
//            if MemorySqliteTable_InUniConnection.RecordCount = 0 then
//            begin
//              if b_Debug then
//              begin
//                RzMemoLogLinesAdd('方案索引为：' + TempPlanScheme_index + ' 方案名为：' + TempPlanScheme_PlanName + #13#10);
//                RzMemoLogLinesAdd('主题关键词为：' + Temp_PlanScheme_Topic + #13#10);
//                RzMemoLogLinesAdd('主题内容关键词为：' + Temp_PlanScheme_TopicContent + #13#10);
//                RzMemoLogLinesAdd('所需登录账号为：' + Temp_usedAcc + #13#10);
//                RzMemoLogLinesAdd('当前方案下没有任何符合条件的贴子' + #13#10);
//                RzMemoLogLinesAdd('上一方案是否提前终止的：' + ifthen(StopInAdvance, '是', '否') + #13#10);
//              end;
//              if rzcheckboxsameplan.Checked then
//                abort;
//            end;
//
//            StopInAdvance := false;
//
//            try    //MemorySqliteTable_InUniConnection
//              MemorySqliteTable_InUniConnection.First;
//
//              GetCoreContentForSequenceTimes := 1;
//              CurWhichRecord := 0;
//              SucRecordCount := 0;
//
//              while not MemorySqliteTable_InUniConnection.Eof do
//              begin
//                isNeedSaving := false;
//                UsuccessOrnot := False;
//
////                SearchOfRecordsCount: string;
////                CurWhichRecord: Integer;
////                SucRecordCount: Integer;
//                if RzComboBoxRoutine.ItemIndex = 0 then
//
//                Pri_TieziID := IntToStr(MemorySqliteTable_InUniConnection.Fields[0].AsInteger - 2079619440 + 6374586736)
//                else
//                if RzComboBoxRoutine.ItemIndex = 1 then
//                Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;
//
//                //Pri_TieziID := MemorySqliteTable_InUniConnection.Fields[0].AsString;
//
//                //if not b_Debug then
//                //begin
//                  if RzCheckBoxOnePostOneAccount.ItemIndex = 0 then
//                  begin
//
//                    //EnterCriticalSection(CS);
//                    if SpinEditDays.Value > 0 then
//                    begin
//{
//                  LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
//                  LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
//                  BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
//}
//   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID
//   + ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
//                    end
//                    else
//                    begin
//   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where BaiduHao=' + QuotedStr(SetCacheDirectoryNa) + ' and TieziID=' + Pri_TieziID);
//                    end;
//                    //LeaveCriticalSection(CS);
//
//                    if repeatedFatieCount <> '0' then
//                    begin
//                      RzMemoLogLinesAdd('当前百度账号已在此贴下发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
//                      MemorySqliteTable_InUniConnection.Next;
//                      Continue;
//                    end;
//                  end
//                  else
//                  if RzCheckBoxOnePostOneAccount.ItemIndex = 1 then
//                  begin
//
//                    //EnterCriticalSection(CS);
//                    if spineditdays.Value > 0 then
//                    begin
//                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
//+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
//                    end
//                    else
//                    begin
//                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID);
//                    end;
//                    //LeaveCriticalSection(CS);
//
//                    if repeatedFatieCount <> '0' then
//                    begin
//                      RzMemoLogLinesAdd('此贴下已发过贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
//                      MemorySqliteTable_InUniConnection.Next;
//                      Continue;
//                    end;
//                  end
//                  else
//                  if RzCheckBoxOnePostOneAccount.ItemIndex = 2 then
//                  begin
//
//                    //EnterCriticalSection(CS);
//                    if spineditdays.Value > 0 then
//                    begin
//                   repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
//                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName)
//+ ' and LastUpdateTime>=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm', incDay(TheRealTimeTime_Datetime, (0 - SpinEditDays.Value)))));
//                    end
//                    else
//                    begin
//                    repeatedFatieCount := QueryStringForPostRecord('select count(1) from FatieRecord where TieziID=' + Pri_TieziID
//                    + ' and PlanName=' + QuotedStr(TempPlanScheme_PlanName));
//                    end;
//                    //LeaveCriticalSection(CS);
//
//                    if repeatedFatieCount <> '0' then
//                    begin
//                      RzMemoLogLinesAdd('当前方案下已有在此贴下的回贴，跳过！' + '↑↑↑↑↑↑' + #13#10#13#10);
//                      MemorySqliteTable_InUniConnection.Next;
//                      Continue;
//                    end;
//                  end;
//                //end;
//
//                Pri_TieziIDFileNmae := MemorySqliteTable_InUniConnection.Fields[1].asstring;
//                //Pri_TieziID := '6361513183';     //无权回贴
//                //Pri_TieziID := '6184821068';     //被删除
//                //Pri_TieziID := '6374720646';
//                //Pri_TieziID := '6374670634';
//                Pri_BarName := '';
//                Pri_Topic := '';
//                Pri_Content := '';
//                Pri_DeleteOrNot := '-1';
//                //Pri_CanReplyOrNot := '-1';
//                Pri_CanReplyOrNot := '-1';
//
//                Pri_FloorCount := '';
//                Pri_FloorDetails := '';
//                Pri_FollowCountForOneTieBa := '';
//                Pri_TotalPostForOneTieBa := '';
//
//                PerTieziURL := Basic_PostLink + Pri_TieziID;
//                RzMemoLogLinesAddEX('●●●开始第' + Pri_TieziID + '个贴子链接处理，' + #13#10
//                + '方案名：' + TempPlanScheme_PlanName, PerTieziURL);
//
//                try
//                  RzMemoLogLinesAddEX('打开第' + Pri_TieziID + '个贴子链接', PerTieziURL);
//
////                  if PauseOrNot then
////                  begin
////                    while True do
////                    begin
////                      if PauseOrNot then
////                        DelayEx(1000)
////                      else
////                       Break;
////                    end;
////                  end;
//
//                  a:
//                  setproxyrightorwrong := true;
//                  if SetIdHttpType_IPProxy_count > 0 then  //whichProxy
//                  begin
//                    inc(whichProxy);
//                    whichProxyindex := whichProxy mod (SetIdHttpType_IPProxy_count + 1);
//
//                    if whichProxyindex = 0 then
//                    begin
//
//                    end
//                    else
//                    begin
//                      //SourceIdHttp.ProxyParams.ProxyServer := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempserverIP := ProxyIPlist.Names[whichProxyindex - 1];
//                      tempPortInfo := ProxyIPlist.Values[tempserverIP];
//                      tempPortInfoPos := Pos('|', tempPortInfo);
//                      if tempPortInfoPos > 0 then
//                      begin
//                        tempPortInfo_port := Copy(tempPortInfo, 1, tempPortInfoPos - 1);
//                        tempPortInfo_UsernamePass := Copy(tempPortInfo, tempPortInfoPos + 1, Length(tempPortInfo) - tempPortInfoPos);
//                        tempPortInfo_UsernamePassPos := Pos(SplitUsernamePass, tempPortInfo_UsernamePass);
//
//
//                        SetProxy(copy(tempPortInfo_UsernamePass, 1, tempPortInfo_UsernamePassPos - 1), copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos), tempserverIP + ':' + tempPortInfo);
//
//                        //这种情况还不知道怎么处理
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo_port);
//                        //SourceIdHttp.ProxyParams.ProxyUsername := Copy(tempPortInfo_UsernamePass, 1,  tempPortInfo_UsernamePassPos - 1);
//                        //SourceIdHttp.ProxyParams.ProxyPassword := Copy(tempPortInfo_UsernamePass, tempPortInfo_UsernamePassPos + 1, Length(tempPortInfo_UsernamePass) - tempPortInfo_UsernamePassPos);
//                      end
//                      else
//                      begin
//
//                        try
////                          if not SetProcessProxy(tempserverIP, strtoint(tempPortInfo)) then
////                          begin
////                            raise Exception.Create('代理设置失败');
////                          end
////                          else
////                          begin
////                            RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
////                          end;
//
//                          SetProxy('', '', tempserverIP + ':' + tempPortInfo);
//
//
//                          RzMemoLogLinesAdd('代理设置成功，索引值为：' + inttostr(whichProxyindex) + #13#10 + 'IP为：' + tempserverIP  + #13#10 + '端口为：' + tempPortInfo);
//                        except on E: exception do
//                        begin
//                          setproxyrightorwrong := false;
//                          setproxyrightorwrongsth := e.Message;
//                        end;
//                        end;
//                        //SourceIdHttp.ProxyParams.ProxyPort := StrToInt(tempPortInfo);
//                      end;
//                    end;
//                  end;
//
//                  if not setproxyrightorwrong then
//                  begin
//                    RzMemoLogLinesAdd(setproxyrightorwrongsth + #13#10 + '进入下一个设置' + #13#10 + #13#10);
//                    goto a;
//                  end;
//
//                  MainForm.Chromium1.LoadUrl(PerTieziURL);
//                  MainForm.Chromium1.LoadUrl(PerTieziURL);
//
//
//                  DelayEX(BasicParamConf.WaitingTimeBeforeLoad);
//
//                  if b_Debug then RzMemoLogLinesAdd('全局关闭判定为不关闭');
//
//                  gtc1 := GetTickCount;
//                  while MainForm.bLoading do
//                  begin
//                    gtc2 := GetTickCount;
//                    if (gtc2 - gtc1) >= 120000 then
//                    begin
//                      setproxyrightorwrong := true;
//                      goto a;
//                    end;
//                    DelayEX(500);
//                  end;
//
////                  if PauseOrNot then
////                  begin
////                    while True do
////                    begin
////                      if PauseOrNot then
////                        DelayEx(1000)
////                      else
////                       Break;
////                    end;
////                  end;
//
//                  if IsDeletedOrNoReplyTieZi(VarFeedbackIn) then
//                  begin
//                    RzMemoLogLinesAdd('无效的贴子链接，跳过！' + '↑↑↑↑↑↑' + #13#10 + VarFeedbackIn+ #13#10#13#10);
//                    Continue;
//                  end;
//
////                  if Not ConformToFloorCAndFollowCount then
////                  begin
////                    Continue;
////                  end;
//
//                  RzMemoLogLinesAddEX('第' + Pri_TieziID + '个贴子链接' + '为有效链接', PerTieziURL);
//                  DelayEX(10);
//                  if b_Debug then
//                    RzMemoLogLinesAdd('全局关闭判定为不关闭');
//
//                  if RzCheckBoxExploer.Checked then
//                    Continue;
//
//
//                    {
//
//                    PasteContent_total: string;
//                    PasteContent: string;
//                    PasteContent_Main: string;
//
//
//                    }
//
//
//                  if str_Version = '0' then
//                  begin
//                    PasteContent := '顶一下！';
//                    PasteContent_Main := '顶一下！';
//                  end
//                  else if (str_Version = '1') or (str_Version = '3') then
//                  begin
//                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
//                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
//                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
//                    raise Exception.Create('不支持的取顶贴内容方式');
//
//                    posPasteContenttotal := pos('|', PasteContent_total);
//                    if posPasteContenttotal > 1 then
//                    begin
//                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
//                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
//                    end
//                    else
//                    begin
//                      PasteContent := PasteContent_total;
//                      PasteContent_Main := PasteContent_total;
//                    end;
//                  end
//                  else if str_Version = '2' then
//                  begin
//                    if Temp_dingtie_type = '0' then PasteContent_total := Temp_dingtie_content else
//                    if Temp_dingtie_type = '1' then PasteContent_total := GetCoreContentForRandomize(Temp_dingtie_content) else
//                    if Temp_dingtie_type = '2' then PasteContent_total := GetCoreContentForSequence(Temp_dingtie_content) else
//                    raise Exception.Create('不支持的取顶贴内容方式');
//
//                    posPasteContenttotal := pos('|', PasteContent_total);
//                    if posPasteContenttotal > 1 then
//                    begin
//                      PasteContent := copy(PasteContent_total, 1, posPasteContenttotal - 1);
//                      PasteContent_Main := copy(PasteContent_total, posPasteContenttotal + 1, length(PasteContent_total) - posPasteContenttotal);
//                    end
//                    else
//                    begin
//                      PasteContent := PasteContent_total;
//                      PasteContent_Main := PasteContent_total;
//                    end;
//
//                    //PasteContent := PasteContent + '_________________________________________________________________________________________________________________________以上信息来自自动发送软件，欲获取，add wechat official account：花苍比'
//                    PasteContent := PasteContent + PropagandaSentence;
//                  end;
//
//                  //if RzComboBoxModeChoose.ItemIndex = 0 then Clipboard.SetTextBuf(PChar(PasteContent));
//
//
//                  if Temp_onlyForMainFloor = '1' then
//                  begin
//                    ScrolltoBottom;
//                    ScrolltoBottom;  //ScrolltoBottomEXE;
//                    RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
//                    DelayEx(1000);
////                    if RzComboBoxModeChoose.ItemIndex = 0 then
////                    begin
////                      GetInputPoint_JS(InputPlaceEx_JS);
////                      SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////
////                      if RzCheckBoxSet_input.Checked then
////                      begin
////                        RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
////
////                        while RzCheckBoxSet_input.Checked do
////                        begin
////                         DelayEx(1000);
////                        end;
////                        RzCheckBoxSet_input.Checked := True;
////
////                        GetInputPoint_JS(InputPlaceEx_JS);
////                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////
////                        hasbawo_set_input := False;
////                        while not hasbawo_set_input do
////                        begin
////                          while RzCheckBoxSet_input.Checked do
////                          begin
////                           DelayEx(1000);
////                          end;
////                          RzCheckBoxSet_input.Checked := True;
////
////                          GetInputPoint_JS(InputPlaceEx_JS);
////                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////                        end;
////                      end;
////
////
////
////
////                      DelayEx(500);
////
////
//////                      if PauseOrNot then
//////                      begin
//////                        RzMemoLogLinesAdd('已暂停！');
//////                        while True do
//////                        begin
//////                          if PauseOrNot then
//////                            DelayEx(1000)
//////                          else
//////                          begin
//////                            RzMemoLogLinesAdd('取消暂停！');
//////                            GetInputPoint_JS(InputPlaceEx_JS);
//////                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
//////                            Break;
//////                          end;
//////                        end;
//////                      end;
////
////                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                      DelayEx(500);
////                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                      DelayEx(500);
////                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////                      if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
////
////                      DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
////
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
////                      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
////                      DelayEx(500);
////
//////                      MainForm.CEFWindowParent1.SetFocus;
//////                      MainForm.CEFWindowParent1.SetFocus;
//////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//////                      Delay(50);
//////                      keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//////                      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
////
////
////
////                        //找到提交按扭位置
////                        GetSubmitButtonForMainFloor(linshiPoint);
////                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
////                        begin
////                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
////                          //Pri_DeleteOrNot := '1';
////                          Exit;
////                        end;
////
////                        SetCursorPos(linshiPoint.x, linshiPoint.y);
////                  //
////                        DelayEX(1000);
////
////
////                        CI.cbSize := SizeOf(CI);
////                        GetCursorInfo(CI);
////                        if CI.hCursor <> HICON(65567) then
////                        begin
////                          Pri_CanReplyOrNot := '100';
////                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
////                          continue;
////                        end;
////
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        Delay(50);
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////                        //Pri_FloorDetails := Pri_FloorDetailsNew;
////
////                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
////
////                      //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
////                      RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
////                    end
////                    else if RzComboBoxModeChoose.ItemIndex = 1 then
////                    begin
//
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(1000);
//////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
////                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
////                        delayex(1000);
//
//                    //PasteContent_Main        posPasteContent_Main
//                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
//                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
//                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
//                      begin
////  matchs: TMatchCollection;
////  match: TMatch;
////  matchCoun: Integer;
//                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
//                            matchCoun := matchs.Count;
//                            setlength(Stringarr, matchCoun);
//
////                            Memo1.Clear;
////                            for match in matchs do
////                            begin
////                              Memo1.Lines.Add(match.Value);
////                            end;
//
//                            //Memo1.Lines.Add('----------');
//                            for iii := 0 to matchCoun - 1 do
//                            begin
//                              matchvalue := matchs[iii].Value;
//                              Stringarr[iii].VType := 17;
////                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
////                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
////                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
////                              + ''' unselectable=''on'' pic_type=''0'' /><br />');
//
//                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''390'' width=''560'' /><br />');
//
//
//                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');
//
//                            end;
//
//
//
//                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
//                            formatori := format(formatori, Stringarr);
//                            setlength(Stringarr, 0);
//
//
//                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);
//
//                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);
//
//
//
//                            if str_Version = '2' then
//                            formatori :=
//                            formatori + PropagandaSentence +
//
////                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
////                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
////                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
////                              + ''' unselectable=''on'' pic_type=''0'' />';
//
//                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';
//
//
//                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';
//
//
////                            formatori :=
////                            '<img pic_type=''1'' src=''http://t8.baidu.com/it/u=1484500186,1503043093&amp;fm=79&amp;app=86&amp;f=JPEG?w=1280&amp;h=853.gif'' class' +
////                            '=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''373'' width=''560'' />';
//
//
//                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
//                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
//                            MainForm.ExeJs(JScript);
//                            DelayEx(1000);
//                      end
//                      else
//                      begin
//                        //posPasteContent_Main :
//                        if str_Version = '2' then
//                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
//                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
//                        DelayEx(100);
//                      end;
//
//
//                      //DelayEx(1000000);
//                      if IsWindowVisible(self.Handle) then
//                      begin
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
//
//                        MainForm.CEFWindowParent1.SetFocus;
//                        MainForm.CEFWindowParent1.SetFocus;
//                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                        delayex(500);
////                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
////                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                        'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                        delayex(500);
//
//
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                        Delay(50);
//                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                      end
//                      else
//                      begin
//                        MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
//                      end;
//
////                      mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
////                                     'for(i=0;i<paras.length;i++){' +
////                                     'if (paras[i] != null)' +
////                                     'paras[i].parentNode.removeChild( paras[i]);' +
////                                     '}');
//
//
//
//
//                      DelayEx(1000);
//
//
//
//
//                      Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//                      //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                      RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
//                    //end;
//                  end
//                  else
//                  begin
//                    isReplyinsubFloor := judgeMustReplyInSecondFloor(succsulFatie);
//                    if isReplyinsubFloor then   //如果需要在2楼黄金位回得
//                    begin
//                      if not succsulFatie then
//                        Continue;
//                    end
//                    else
//                    begin
//                      ScrolltoBottom;
//                      ScrolltoBottom;  //ScrolltoBottomEXE;
//                      RzMemoLogLinesAdd('即将输入回贴内容' + #13#10);
//                      DelayEx(1000);
//
//
////                      if RzComboBoxModeChoose.ItemIndex = 0 then
////                      begin
////                        GetInputPoint_JS(InputPlaceEx_JS);
////                        SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////
////                        if RzCheckBoxSet_input.Checked then
////                        begin
////                          RzMemoLogLinesAdd('等待主楼回复输入框位置是否正确功能已开启！#13#10');
////
////                          while RzCheckBoxSet_input.Checked do
////                          begin
////                           DelayEx(1000);
////                          end;
////                          RzCheckBoxSet_input.Checked := True;
////
////                          GetInputPoint_JS(InputPlaceEx_JS);
////                          SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////
////                          hasbawo_set_input := False;
////                          while not hasbawo_set_input do
////                          begin
////                            while RzCheckBoxSet_input.Checked do
////                            begin
////                             DelayEx(1000);
////                            end;
////                            RzCheckBoxSet_input.Checked := True;
////
////                            GetInputPoint_JS(InputPlaceEx_JS);
////                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////                          end;
////                        end;
////
////                        DelayEx(500);
////
////
////  //                      if PauseOrNot then
////  //                      begin
////  //                        RzMemoLogLinesAdd('已暂停！');
////  //                        while True do
////  //                        begin
////  //                          if PauseOrNot then
////  //                            DelayEx(1000)
////  //                          else
////  //                          begin
////  //                            RzMemoLogLinesAdd('取消暂停！');
////  //                            GetInputPoint_JS(InputPlaceEx_JS);
////  //                            SetCursorPos(InputPlaceEx_JS.x, InputPlaceEx_JS.y);
////  //                            Break;
////  //                          end;
////  //                        end;
////  //                      end;
////
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                        DelayEx(500);
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                        DelayEx(500);
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////                        if b_Debug then RzMemoLogLinesAdd('鼠标已成功进入所设置的输入区域，开始粘贴！');
////
////                        DelayEx(1000);  //Clipboard.GetTextBuf(arr, Length(arr));
////
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
////                        keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
////                        DelayEx(500);
////
////
////
////                        //找到提交按扭位置
////                        GetSubmitButtonForMainFloor(linshiPoint);
////                        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
////                        begin
////                          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
////                          //Pri_DeleteOrNot := '1';
////                          Exit;
////                        end;
////
////                        SetCursorPos(linshiPoint.x, linshiPoint.y);
////
////
////                        if RzCheckBoxSet_sub.Checked then
////                        begin
////                          RzMemoLogLinesAdd('等待主楼提交按扭位置是否正确功能已开启！#13#10');
////
////                          while RzCheckBoxSet_sub.Checked do
////                          begin
////                           DelayEx(1000);
////                          end;
////                          RzCheckBoxSet_sub.Checked := True;
////
////                          GetSubmitButtonForMainFloor(linshiPoint);
////                          if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
////                          begin
////                            if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
////                            Exit;
////                          end;
////                          SetCursorPos(linshiPoint.x, linshiPoint.y);
////
////                          hasbawo_set_sub := False;
////                          while not hasbawo_set_sub do
////                          begin
////                            while RzCheckBoxSet_sub.Checked do
////                            begin
////                             DelayEx(1000);
////                            end;
////                            RzCheckBoxSet_sub.Checked := True;
////
////                            GetSubmitButtonForMainFloor(linshiPoint);
////                            if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
////                            begin
////                              if b_Debug then RzMemoLogLinesAdd('因为找不到提交按扭而退出' + #13#10);
////                              Exit;
////                            end;
////                            SetCursorPos(linshiPoint.x, linshiPoint.y);
////                          end;
////                        end;
////                  //
////                        DelayEX(1000);
////
////
////                        CI.cbSize := SizeOf(CI);
////                        GetCursorInfo(CI);
////                        if CI.hCursor <> HICON(65567) then
////                        begin
////                          Pri_CanReplyOrNot := '100';
////                          RzMemoLogLinesAdd('前台模式主楼回贴因为权限问题失败' + #13#10);
////                          continue;
////                        end;
////
////                        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////                        Delay(50);
////                        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////
//////                        MainForm.CEFWindowParent1.SetFocus;
//////                        MainForm.CEFWindowParent1.SetFocus;
//////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//////                        Delay(50);
//////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
////
////                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
////
////                        //RzMemoLogLinesAdd('前台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
////                        RzMemoLogLinesAdd('前台模式主楼回贴完成' + #13#10);
////                      end
////                      else if RzComboBoxModeChoose.ItemIndex = 1 then
////                      begin
////                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerText=' + QuotedStr(PasteContent));
////                        DelayEx(100);
//                        //MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
//
//
////                        mainform.ExeJs('paras = document.getElementsByClassName("tb_poster_placeholder");' +
////                                       'for(i=0;i<paras.length;i++){' +
////                                       'if (paras[i] != null)' +
////                                       'paras[i].parentNode.removeChild( paras[i]);' +
////                                       '}');
//
//
//                      //PatternForHttps := '(https|http)\:\/\/tiebapic\.baidu\.com\/forum\/pic\/item\/\w+?\.jpg';
//                      //PatternForHttps := '(https|http)\:\/\/.+?\.jpg';
//                      PatternForHttps := '(https|http)\:\/\/.+?\.(jpg|png)';
//                      if TRegEx.IsMatch(PasteContent_Main, PatternForHttps) then
//                      begin
////  matchs: TMatchCollection;
////  match: TMatch;
////  matchCoun: Integer;
//                            matchs := TRegEx.Matches(PasteContent_Main, PatternForHttps);
//                            matchCoun := matchs.Count;
//                            setlength(Stringarr, matchCoun);
//
////                            Memo1.Clear;
////                            for match in matchs do
////                            begin
////                              Memo1.Lines.Add(match.Value);
////                            end;
//
//                            //Memo1.Lines.Add('----------');
//                            for iii := 0 to matchCoun - 1 do
//                            begin
//                              matchvalue := matchs[iii].Value;
//                              Stringarr[iii].VType := 17;
////                              Stringarr[iii].VAnsiString := pointer('<br /><img class=''BDE_Image'' src=''' + matchvalue
////                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
////                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
////                              + ''' unselectable=''on'' pic_type=''0'' /><br />');
//
//                              //Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' /><br />');
//
//
//                              Stringarr[iii].VAnsiString := pointer('<br /><img pic_type=''1'' src=''' + matchvalue +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' /><br />');
//
//                            end;
//
//
//
//                            formatori :=  TRegEx.Replace(PasteContent_Main, PatternForHttps, '%s');
//                            formatori := format(formatori, Stringarr);
//                            setlength(Stringarr, 0);
//
//
//                            if copy(formatori, 1, 6) = '<br />' then formatori := copy(formatori, 7, length(formatori) - 6);
//
//                            if rightstr(formatori, 6) = '<br />' then formatori := copy(formatori, 1, length(formatori) - 6);
//
//
//
//                            if str_Version = '2' then
//                            formatori :=
//                            formatori + PropagandaSentence +
//
////                            '<br /><img class=''BDE_Image'' src=''' + PropagandaSentenceHttpAddress
////                              //https://tiebapic.baidu.com/forum/pic/item/b812c8fcc3cec3fd49156d08c188d43f879427a0.jpg
////                              //+ '" unselectable="on" pic_type="0" width="560" height="1162" /><br />';
////                              + ''' unselectable=''on'' pic_type=''0'' />';
//
//                            //'<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                              //''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' height=''172'' width=''560'' />';
//
//                            '<br /><img pic_type=''1'' src=''' + PropagandaSentenceHttpAddress +  //http://tiebapic.baidu.com/forum/pic/item/c2cec3fdfc0392457088c4719094a4c27d1e258a.jpg
//                            ''' class=''BDE_Image'' onload=''EditorUI.resizeImage(this, 560)'' unselectable=''on'' />';
//
//
//                            //JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + QuotedStr(formatori);
//                            JScript := 'var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + formatori + '"';
//                            MainForm.ExeJs(JScript);
//                            DelayEx(1000);
//                      end
//                      else
//                      begin
//                        //posPasteContent_Main :
//                        if str_Version = '2' then
//                          PasteContent_Main := PasteContent_Main + PropagandaSentence;
//                        MainForm.ExeJs('var oP = document.getElementById("ueditor_replace");' + 'var first=oP.children[0];first.innerHTML="' + PasteContent_Main + '"');
//                        DelayEx(100);
//                      end;
//
//
//
//                        if IsWindowVisible(self.Handle) then
//                        begin
////                          MainForm.CEFWindowParent1.SetFocus;
////                          MainForm.CEFWindowParent1.SetFocus;
////                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                          delayex(500);
//
//
//                          MainForm.CEFWindowParent1.SetFocus;
//                          MainForm.CEFWindowParent1.SetFocus;
//                          mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
//                          delayex(500);
//  //                        mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body")[0];' +
//  //                        'edui.setAttribute(''style'',''height: 588px; overflow: hidden auto;'');');
//                          mainform.ExeJs('var edui=document.getElementsByClassName("edui-editor-body body-container-focus")[0];' +
//                          'edui.setAttribute(''style'',''height: auto; overflow: hidden auto;'');');
//                          delayex(500);
//
//
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
//                          Delay(50);
//                          keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
//                          keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        end
//                        else
//                        begin
//                          MainForm.ExeJs('document.getElementsByClassName("ui_btn ui_btn_m j_submit poster_submit")[0].click()');
//                        end;
//
////                        MainForm.CEFWindowParent1.SetFocus;
////                        MainForm.CEFWindowParent1.SetFocus;
////
////
////                        mainform.ExeJs('document.getElementById("ueditor_replace").focus()');
////                        delayex(500);
////
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), 0, 0); //按下R键。
////                        Delay(50);
////                        keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_KEYUP, 0); //放开R键。
////                        keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0); //放开SHIFT键。
//                        DelayEx(1000);
//
//                        Pri_FloorCount := IntToStr(StrToInt(Pri_FloorCount) + 1);
//                        //RzMemoLogLinesAdd('后台模式主楼为' + Pri_FloorCount + '楼的提交完成' + #13#10);
//                        RzMemoLogLinesAdd('后台模式主楼回贴完成' + #13#10);
//                      //end;
//                    end;
//                  end;
//
//
//                  UsuccessOrnot := True;
//                  DelayEx(1000);
//                finally
////              CurWhichRecord := 1;
////              SucRecordCount := 0;
//                  if UsuccessOrnot then
//                  begin
//                    Inc(SucRecordCount);
//
//                    //if not b_Debug then
//                    //begin
//                        //EnterCriticalSection(CS);
//                        sldb1.BeginTransaction;
//                        sldb1.ExecSQL('insert into FatieRecord (BaiduHao, TieziID, LastUpdateTime, PlanName) values (' +
//                        QuotedStr(SetCacheDirectoryNa) + ', ' + QuotedStr(Pri_TieziID) + ', '
//                        + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime))
//                        + ', ' + QuotedStr(TempPlanScheme_PlanName)
//                         + ')');
//                        //sldb.GetTable('SELECT ' + 'PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent,' + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,' + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,' + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type, dingtie_content, PlanScheme_index, ADDTiezi, SubstractTiezi ' + 'FROM PlanScheme_Config ORDER BY PlanScheme_index ASC limit ' + IntToStr(TotalPlansCheme));
//                        sldb1.Commit;
//                        //LeaveCriticalSection(CS);
//                    //end;
//                  end;
//
//                  Inc(CurWhichRecord);
//
//                  RzMemoLogLinesAdd('当前方案下总共搜索出：' + SearchOfRecordsCount + '条' + #13#10
//                  + '已处理'+ IntToStr(CurWhichRecord) + '条' + #13#10
//                  + '已发贴' + IntToStr(SucRecordCount) + '条' + #13#10#13#10);
//
//
//
//                  if isNeedSaving then
//                  begin
//                    if Pri_DeleteOrNot = '1' then
//                    begin
//                      if Pri_TieziIDFileNmae <> '' then
//                      begin
//                        initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
//                        //sldb_InUniConnection.ExecSQL('update SeeLiangTieziList set  DeleteOrNot=1 and ' +
//                        sldb_InUniConnection.ExecSQL('delete from SeeLiangTieziList where TieziID=' + Pri_TieziID);
//                        //' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) + ' where TieziID=' + QuotedStr(Pri_TieziID));
//                        finalizeSqliteHardwareTable;
//
//                        RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，删除保存，' + #13#10 +
//                        '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
//                      end;
//                    end
//                    else if Pri_DeleteOrNot = '0' then
//                    begin
//                      if Pri_TieziIDFileNmae <> '' then
//                      begin
//                      //try
//                          initializeSqliteHardwareTable(APPCommonPath + relativePasth1 +  Pri_TieziIDFileNmae);
//                          Updatesqll := 'update SeeLiangTieziList set' +
//                          ' FloorDetails=' + QuotedStr(Pri_FloorDetails) + ', ' +
//                          ' CanReplyOrNot=' + QuotedStr(Pri_CanReplyOrNot) + ', ' +
//                          ' FloorCount=' + QuotedStr(Pri_FloorCount) + ', ' +
//                          ' FollowCountForOneTieBa=' + QuotedStr(Pri_FollowCountForOneTieBa) + ', ' +
//                          ' TotalPostForOneTieBa=' + QuotedStr(Pri_TotalPostForOneTieBa) + ', ' +
//                          //2019-12-12 05:59:17
//                            ' LastUpdateTime=' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', TheRealTimeTime_Datetime)) +
//                            ' where TieziID=' + QuotedStr(Pri_TieziID);
//                          sldb_InUniConnection.ExecSQL(Updatesqll);
//                          finalizeSqliteHardwareTable;
//
//                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，更新保存，' + #13#10
//                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
////                      except
////                          RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，额外贴子，' + #13#10
////                          + '方案名：' + TempPlanScheme_PlanName + #13#10 + '，可否回复：' + Pri_CanReplyOrNot + #13#10#13#10#13#10);
////                      end;
//                      end;
//                    end;
//                  end
//                  else
//                  begin
//                    RzMemoLogLinesAdd('●●●结束贴子' + Pri_TieziID + '，不保存，' + #13#10
//                    + '方案名：' + TempPlanScheme_PlanName + #13#10#13#10#13#10);
//                  end;
//
//                  if not rzcheckboxexploer.Checked then
//                    DelayEx(G_TimerInterval);
//
//                  if PauseOrNot then
//                  begin
//                    RzMemoLogLinesAdd('已暂停！');
//                    while True do
//                    begin
//                      if PauseOrNot then
//                        DelayEx(1000)
//                      else
//                      begin
//                        RzMemoLogLinesAdd('取消暂停！');
//                        Break;
//                      end;
//                    end;
//                  end;
//
//                  if RzCheckBoxSamePlan.Checked then
//                  begin
//                    if SucRecordCount >= SpinEditPostCount.Value then
//                    begin
//                      MemorySqliteTable_InUniConnection.Last;
//                      StopInAdvance := true;
//                    end;
//                  end;
//                  MemorySqliteTable_InUniConnection.Next;
//                end;
//              end;
//            finally
//              FinalQuerySqlInuni(MemorySqliteTable_InUniConnection);
//              MemorySqliteTable_InUniConnection.Connection := nil;
//              MemorySqliteTable_InUniConnection.Free;
//              MemorySqlite_InUniConnection.Free;
//              if Trim(TemptDirectory) <> '' then
//              begin
//                if FileExists(TemptDirectory) then
//                begin
//                  DeleteFile(TemptDirectory);
//                end;
//              end;
//            end;
//            PlanSchemeTable.Next;
//          end;
//        finally
//          PlanSchemeTable.Free;
//        end;
//
//      finally
//
//        RzMemoLogLinesAdd('●●●●●●累积第' + IntToStr(Action1_Tag) + '次工作结束' + #13#10#13#10);
//        RzMemoLogLinesAdd('●●●●●●第' + IntToStr(Action1_Tag1) + '次工作结束' + #13#10#13#10);
//        inc(Action1_Tag);
//        inc(Action1_Tag1);
//
//        if Linshi_Circulations > 0 then
//          i_Circulations := i_Circulations - 1;
//      end;
//    until SatisfyRestrict;
//  finally
//    if SaveTempFileOrNot then      //保存整理新下载的文件，没有被update的记录就不保存整理了，然后删除
//    begin
//      RzMemoLogLinesAdd('开始整理下载的文件！');
//
//      suDBNameList := TStringList.Create;
//
//
//      AATProxyEX := TInstActionProxy.create;
//      AATProxyEX.BldThreadPool(2); //创建6个线程用来加载表   55    90    120
//      AATProxyEX.StartWork; //开始工作
//
//
//      VarHint := rbStart.Caption;
//      rbStart.Caption := '';
//      with THandleWaitings.create(100) do
//      try
//         iniWaiting(rbStart, 7, 7);
//
//         SourceFileDir := APPCommonPath + relativePasth1;
//
//         found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);
//
//         while found=0 do
//         begin
//           delay(10);
//           if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
//           and (SearchRec.Attr<>faDirectory) and
//           (
//           (Pos('temp', Trim(SearchRec.Name)) > 0) or
//           (Pos('db3', Trim(SearchRec.Name)) > 0)
//           )
//           then
//           begin
//             suDBName := SearchRec.Name;
//             suDBNameList.Add(suDBName);
//           end;
//           found:=FindNext(SearchRec);
//         end;
//         FindClose(SearchRec);
//
//
//         suDBNameListCount := suDBNameList.Count;
//
//         if suDBNameListCount > 0 then
//         begin
//           for J := 0 to suDBNameListCount - 1 do
//           begin
//             try
//                delay(10);
//
//                SplitDBFromSource := TSplitDBFromSource.create;
//                SplitDBFromSource.SplitDirectory := APPCommonPath + relativePasth;
//                SplitDBFromSource.SourceDBaseDire := SourceFileDir + Trim(suDBNameList.Strings[J]);
//                AATProxyEX.AddAction(SplitDBFromSource);
//                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;
//
//             finally
//               if RzCheckBoxDeleteDownloadedFiles.Checked then
//                 DeleteFile(SourceFileDir + Trim(suDBNameList.Strings[J]));
//             end;
//           end;
//         end;
//      finally
//
//
//
//        finalWaiting;
//        rbStart.Caption := VarHint;
//
//        AATProxyEX.Free;
//
//        suDBNameList.Free;
//        RzMemoLogLinesAdd('结束整理下载的文件！');
//      end;
//    end
//    else
//    begin
//      SaveTempFileOrNot := true;
//    end;
//    enableSomething;
//    b_isRuning := False;
//  end;
//
//  if RzCheckBoxshudown.Checked then shellexecute(0, 'open', 'shutdown.exe', ' -f -s -t 0', nil, SW_HIDE);
//
//end;
//    end;
//    2:
//    begin
//      ActionOnlineSearchPostID.Execute;
//    end;
//    end;
//end;

//procedure TFrmBaseForm1.RzCheckBoxDownloadClick(Sender: TObject);
//begin
//  inherited;
//  if RzCheckBoxDownload.Checked then
//  begin
//    RzComboBoxDownloadMode.Enabled := True;
//    SpinEditTotalThread.Enabled := True;
//  end
//  else
//  begin
//    RzComboBoxDownloadMode.Enabled := False;
//    SpinEditTotalThread.Enabled := False;
//  end;
//end;

procedure TFrmBaseForm1.RzCheckBoxSamePlanClick(Sender: TObject);
begin
  inherited;
  if RzCheckBoxSamePlan.Checked then
  begin
    SpinEditPostCount.Enabled := True;
    //SpinEditStartPostId.Enabled := True;
  end
  else
  begin
    SpinEditPostCount.Enabled := False;
    //SpinEditStartPostId.Enabled := False;
  end;
end;

procedure TFrmBaseForm1.RzMemoLogLinesAddEX(sourStr, conPerTieziURL: string);
var
  Linshistring: string;
begin
  Linshistring := sourStr;
  Linshistring := Linshistring + '，链接地址为：' + #13#10 + conPerTieziURL + #13#10#13#10;
  RzMemoLogLinesAdd(Linshistring);
end;

procedure TFrmBaseForm1.RzMemo_PlanSchemeExit(Sender: TObject);
var
  i: Integer;
  Linshi_PlanNameList: TStringList;
begin
  if RzMemo_PlanScheme.Lines.Count < 1 then
    Exit;

  Linshi_PlanNameList := TStringList.Create;
  try
    for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
    begin
      if Trim(RzMemo_PlanScheme.Lines.Strings[i]) <> '' then
      begin
        if Linshi_PlanNameList.IndexOf(Trim(RzMemo_PlanScheme.Lines.Strings[i])) < 0 then

        Linshi_PlanNameList.Add(Trim(RzMemo_PlanScheme.Lines.Strings[i]))
      end;
    end;
    if Linshi_PlanNameList.Count > 0 then
      RzMemo_PlanScheme.Text := Linshi_PlanNameList.Text;
  finally
    Linshi_PlanNameList.Free;
  end;


end;



procedure TFrmBaseForm1.SaveDataIntoDb;
var
  sltb: TSQLIteTable;
  sSQL: string;
begin
  try
  EnterCriticalSection(CS);
  sldb.BeginTransaction;
  try
    sSQL := 'UPDATE SystemInfo set TaskInterval_H=' + IntToStr(SpinEdit_hour.Value) +
    ', TaskInterval_M=' + IntToStr(SpinEdit_minute.Value) +
    ', TaskInterval_S=' + IntToStr(SpinEdit_second.Value);

    sldb.ExecSQL(sSQL);

    sSQL := 'UPDATE BasicParamConfig set WaitingTimeBeforeLoad=' + IntToStr(BasicParamConf.WaitingTimeBeforeLoad) +
    ', BGModeSubReplyTimeaScrol=' + IntToStr(BasicParamConf.BGModeSubReplyTimeaScrol) +
    //', ModeChoose=' + IntToStr(RzComboBoxModeChoose.ItemIndex) +
    ', OpenBrowserModeOrnot=' + ifthen(RzCheckBoxExploer.Checked,'1','0') +
    ', OnePostOneAccount=' + IntToStr(RzCheckBoxOnePostOneAccount.ItemIndex) +
    ', CheckLoginedAcc=' + ifthen(RzCheckBoxDeleteDownloadedFiles.Checked,'1','0') +  //CheckLoginedAcc改成RzCheckBoxDeleteDownloadedFiles
    ', CheckLoginedAcc=0' +
    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +

//
//
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +
//    ', ControlCirculationKind=' + IntToStr(RzComboBoxWorkTimesType.ItemIndex) +

//    ', x_wo=' + trim(RzEditX_wo.Text) +
//    ', y_wo=' + trim(RzEditY_wo.Text) +
//    ', x_wo_sub=' + trim(RzEditX_wo_Sub.Text) +
//    ', y_wo_sub=' + trim(RzEditY_wo_Sub.Text) +
//    ', x_hui=' + trim(RzEditX_hui.Text) +
//    ', y_hui=' + trim(RzEditY_hui.Text) +
//    ', x_hui_sub=' + trim(RzEditX_hui_Sub.Text) +
//    ', y_hui_sub=' + trim(RzEditY_hui_Sub.Text) +



//     RzEditX_wo_InputBox.Text := IntToStr(x_wo_inputbox);
//     RzEditY_wo_inputbox.Text := IntToStr(y_wo_inputbox);
//     RzEditx_hui_inputbox.Text := IntToStr(x_hui_inputbox);
//     RzEdity_hui_inputbox.Text := IntToStr(y_hui_inputbox);
//     RzEditX_input.Text := IntToStr(x_inputbox);
//     RzEditY_input.Text := IntToStr(y_inputbox);


//    ', x_wo_inputbox=' + trim(RzEditx_wo_inputbox.Text) +
//    ', y_wo_inputbox=' + trim(RzEdity_wo_inputbox.Text) +
//    ', x_hui_inputbox=' + trim(RzEditx_hui_inputbox.Text) +
//    ', y_hui_inputbox=' + trim(RzEdity_hui_inputbox.Text) +
//    ', x_inputbox=' + trim(RzEditX_input.Text) +
//    ', y_inputbox=' + trim(RzEditY_input.Text) +
//
//    ', x_inputbox_sub=' + trim(RzEditX_input_sub.Text) +
//    ', y_inputbox_sub=' + trim(RzEditY_input_sub.Text) +


//    RzEditX_input_sub.Text := IntToStr(x_inputbox_sub);
//    RzEditY_input_sub.Text := IntToStr(y_inputbox_sub);


//', set_inputbox=' + ifthen(RzCheckBoxset_input.Checked,'1','0') +
//', set_inputbox_sub=' + ifthen(RzCheckBoxset_sub.Checked,'1','0') +
   ', setwo=' + IntToStr(RzSplitter1.Percent) +
   ', setwo_inputbox=' + IntToStr(BasicParamConf.setwo_inputbox) +
   ', setwo_sub=' + IntToStr(RzSplitter2.Percent) +
//', sethui=' + ifthen(RzCheckBoxSet_hui.Checked,'1','0') +
//', sethui_inputbox=' + ifthen(RzCheckBoxset_hui_input.Checked,'1','0') +
//', sethui_sub=' + ifthen(RzCheckBoxset_hui_sub.Checked,'1','0') +


//  RzCheckBoxset_input.Checked := set_inputbox=1;
//  RzCheckBoxset_sub.Checked := set_inputbox_sub=1;


//  RzCheckBoxset_wo.Checked := setwo=1;
//  RzCheckBoxset_wo_input.Checked := setwo_inputbox=1;
//  RzCheckBoxset_wo_sub.Checked := setwo_sub=1;


//  RzCheckBoxSet_hui.Checked := sethui=1;;
//  RzCheckBoxset_hui_input.Checked := sethui_inputbox=1;
//  RzCheckBoxset_hui_sub.Checked := sethui_sub=1;


//     RzCheckBoxshudown.Checked := ShutDownorNot=1;
//     RzCheckBoxSamePlan.Checked := SamePlanorNot=1;
//     SpinEditPostCount.Value := PostCountPerPlan;
//     SpinEditStartPostId.Value := StartPostId;



   ', ShutDownorNot=' + ifthen(RzCheckBoxshudown.Checked,'1','0') +
   ', SamePlanorNot=' + ifthen(RzCheckBoxSamePlan.Checked,'1','0') +
   ', PostCountPerPlan=' + Trim(SpinEditPostCount.Text) +
   //', StartPostId=' + Trim(SpinEditStartPostId.Text) +



//  ', DownloadorNot=' +  ifthen(RzCheckBoxDownload.Checked,'1','0') +
//  ', DownloadMode=' +  IntToStr(RzComboBoxDownloadMode.ItemIndex) +
//  ', Totalthread=' +  Trim(SpinEditTotalThread.Text) +



    ', CirculationMaxNumber=' + Trim(RzEditWorkTimes.Text);
//
//
//     RzEditX_wo.Text := IntToStr(x_wo);
//      := IntToStr(y_wo);
//      := IntToStr(x_wo_sub);
//      := IntToStr(y_wo_sub);
//      := IntToStr(x_hui);
//      := IntToStr(y_hui);
//      := IntToStr(x_hui_sub);
//      := IntToStr(y_hui_sub);

    sldb.ExecSQL(sSQL);

  finally
    sldb.Commit;
  end;
  LeaveCriticalSection(CS);
  except
    ShowMessageEX('保存出错')
  end;
end;

procedure TFrmBaseForm1.SaveDataIntoFile;
var
  sysDir: string;
  logfile: string;
  mylog: TextFile;
  inputtext: WideString;
  i: Integer;
begin
  if GetValidCountOfList < 1 then
    Exit;

  if fileexists(strfileName_PlanList) then
    DeleteFile(strfileName_PlanList);

  for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
  begin
    AssignFile(mylog, strfileName_PlanList);
    try
      if fileexists(strfileName_PlanList) then
        append(mylog)
      else
        rewrite(mylog);

      inputtext := RzMemo_PlanScheme.Lines.Strings[i];
      Writeln(mylog, inputtext);                 //写日志里
    finally
      CloseFile(mylog);                        //关闭文件流
    end;
  end;

end;


procedure TFrmBaseForm1.ScrollToSpecifyFloor(iFloor: Integer);
var
  JsScriptstr: string;
begin
  G_InputP := '';

  JsScriptstr := 'var element = document.getElementsByClassName("d_author")[' + IntToStr(iFloor - 1) + '];' +
  //'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';

  'window.scrollTo(0,window.pageYOffset + element.getBoundingClientRect().top);';    //获得ID为"login_button"并点击

  MainForm.ExeJs(JsScriptstr);
  G_InputP := '';
end;

procedure TFrmBaseForm1.ScrollTospecifyLoca(iFloor, addv: Integer);
var
  JsScriptstr: string;
begin
  G_InputP := '';

  JsScriptstr := 'var element = document.getElementsByClassName("d_author")[' + IntToStr(iFloor - 1) + '];' +
  //'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';

  'window.scrollTo(0,window.pageYOffset + element.getBoundingClientRect().top + ' + IntToStr(addv) + ');';    //获得ID为"login_button"并点击

  MainForm.ExeJs(JsScriptstr);
  G_InputP := '';
end;

procedure TFrmBaseForm1.ShowProgressInmemo(var Msg: TMessage);
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

    Linshistrlist.Delimiter := '|';
    Linshistrlist.DelimitedText := Linshistr;

    Linkw := Linshistrlist.Strings[0];
    Linwp := Linshistrlist.Strings[1];

    Linerr := PChar(Msg.LParam);

    Inc(SuccCo);
    RzMemoLogLinesAdd('成功' + IntToStr(SuccCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  Linerr + ')');
  finally
    Linshistrlist.Free;
  end;

end;

procedure TFrmBaseForm1.Showerror(var Msg: TMessage);
var
  Linshistr: string;
  Linkw: string;
  Linwp: string;
  LinBn: string;
  Linerr: string;
  Linshistrlist, Linshistrlist1: TStringList;
  add1, add2: string;
begin
  Linshistrlist := TStringList.Create;
  Linshistrlist1 := TStringList.Create;
  try
    Linshistr := PChar(Msg.WParam);

    Linshistrlist.Delimiter := '|';
    Linshistrlist.DelimitedText := Linshistr;

    Linkw := Linshistrlist.Strings[0];
    Linwp := Linshistrlist.Strings[1];
    Linerr := Linshistrlist.Strings[2];
    Linshistrlist1.CommaText := Linerr;


    LinBn := PChar(Msg.LParam);
    Inc(FailCo);
    if Linshistrlist1.Count > 1 then
    begin
    add1 := '失败' + IntToStr(FailCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  LinBn + #13#10 + '原因:' + Linshistrlist1.Strings[0]
    + #13#10 + Linshistrlist1.Strings[1] + #13#10 + Linshistrlist1.Strings[2] + ')';
    add2 := '失败' + IntToStr(FailCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  LinBn + #13#10 + '原因:' + Linshistrlist1.Strings[0]
    + #13#10 + Linshistrlist1.Strings[1] + #13#10 + Glosbstr + ')';
    RzMemoLogLinesAddSeperated(add1, add2);
    end
    else
    begin
    add1 := '失败' + IntToStr(FailCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  LinBn + #13#10 + '原因:' + Linerr + ')';
    add2 := '失败' + IntToStr(FailCo) + '(关键词:' + Linkw + '第' + Linwp + '页吧名:' +  LinBn + #13#10 + '原因:' + Glosbstr + ')';
    RzMemoLogLinesAddSeperated(add1, add2);
    end;
  finally
    Linshistrlist1.Free;
    Linshistrlist.Free;
  end;

end;

procedure TFrmBaseForm1.SetProxy(username, password, proxy: ansistring);
var
    proxy_info : PInternetProxyInfo;
begin
    New(proxy_info);
    if (username <> '') and (password <> '') then
    begin
      UrlMkSetSessionOption(INTERNET_OPTION_PROXY_USERNAME, PAnsichar(username), Length(username)+1, 0);
      UrlMkSetSessionOption(INTERNET_OPTION_PROXY_PASSWORD, PAnsichar(password), Length(password)+1, 0);
    end;
    proxy_info^.dwAccessType := INTERNET_OPEN_TYPE_PROXY;
    proxy_info^.lpszProxy := PAnsiChar(proxy);
    proxy_info^.lpszProxyBypass := PAnsiChar('');
    UrlMkSetSessionOption(INTERNET_OPTION_PROXY, proxy_info, SizeOf(Internet_Proxy_Info), 0);
    Dispose(proxy_info);
end;

procedure TFrmBaseForm1.SpeedButtonRestartClick(Sender: TObject);
begin
  inherited;
  SpeedButtonRestartorNot := True;
  CnTrayIcon1.Tag := 1;
  Restart_Flag := True;
  self.Close;
end;

procedure TFrmBaseForm1.SpeedButtonDownClick(Sender: TObject);
var
  Linshi_pos: Integer;

  curLinePos: Integer;

  Changstr1,Changstr2: string;
  i: Integer;

  Linshi_PlanNameList: TStringList;
begin
  if RzMemo_PlanScheme.Lines.Count < 1 then
    Exit;

  Linshi_PlanNameList := TStringList.Create;
  try
    for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
    begin
      if Trim(RzMemo_PlanScheme.Lines.Strings[i]) <> '' then
      begin
        if Linshi_PlanNameList.IndexOf(Trim(RzMemo_PlanScheme.Lines.Strings[i])) < 0 then
          Linshi_PlanNameList.Add(Trim(RzMemo_PlanScheme.Lines.Strings[i]))
        else
          Exit;
      end;
    end;
  finally
    Linshi_PlanNameList.Free;
  end;

  Linshi_pos := GetPlanIndex;
  if Linshi_pos = -1 then
  begin
    Exit;
  end;
  if (RealPlanNameList.Count > 1) and (Linshi_pos < RealPlanNameList.Count - 1) then
  begin
    EnterCriticalSection(CS);
    sldb.BeginTransaction;

    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=1000 where PlanScheme_index=' + IntToStr(Linshi_pos));
    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=' + IntToStr(Linshi_pos) + ' where PlanScheme_index=' + IntToStr(Linshi_pos + 1));
    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=' + IntToStr(Linshi_pos + 1) + ' where PlanScheme_index=1000');

    sldb.Commit;
    LeaveCriticalSection(CS);


    curLinePos := RzMemo_PlanScheme.Line;
    Changstr1 := Trim(RzMemo_PlanScheme.Lines.Strings[curLinePos - 1]);

    for I := curLinePos + 1 to RzMemo_PlanScheme.Lines.Count do
    begin
      Changstr2 := Trim(RzMemo_PlanScheme.Lines.Strings[I - 1]);
      if Changstr2 <> '' then
      begin
        RzMemo_PlanScheme.Lines.Strings[curLinePos - 1] := Changstr2;
        RzMemo_PlanScheme.Lines.Strings[I - 1] := Changstr1;
        break;
      end;
    end;
  end;
end;
procedure TFrmBaseForm1.SpeedButtonUpClick(Sender: TObject);
var
  Linshi_pos: Integer;

  curLinePos: Integer;

  Changstr1,Changstr2: string;
  i: Integer;


  Linshi_PlanNameList: TStringList;
begin
  if RzMemo_PlanScheme.Lines.Count < 1 then
    Exit;

  Linshi_PlanNameList := TStringList.Create;
  try
    for i := 0 to RzMemo_PlanScheme.Lines.Count - 1 do
    begin
      if Trim(RzMemo_PlanScheme.Lines.Strings[i]) <> '' then
      begin
        if Linshi_PlanNameList.IndexOf(Trim(RzMemo_PlanScheme.Lines.Strings[i])) < 0 then
          Linshi_PlanNameList.Add(Trim(RzMemo_PlanScheme.Lines.Strings[i]))
        else
          Exit;
      end;
    end;
  finally
    Linshi_PlanNameList.Free;
  end;


  Linshi_pos := GetPlanIndex;
  if Linshi_pos = -1 then
  begin
    Exit;
  end;
  if Linshi_pos > 0 then
  begin
    EnterCriticalSection(CS);
    sldb.BeginTransaction;

    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=1000 where PlanScheme_index=' + IntToStr(Linshi_pos));
    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=' + IntToStr(Linshi_pos) + ' where PlanScheme_index=' + IntToStr(Linshi_pos - 1));
    sldb.ExecSQL('update PlanScheme_Config set PlanScheme_index=' + IntToStr(Linshi_pos - 1) + ' where PlanScheme_index=1000');

    sldb.Commit;
    LeaveCriticalSection(CS);


    curLinePos := RzMemo_PlanScheme.Line;
    Changstr1 := Trim(RzMemo_PlanScheme.Lines.Strings[curLinePos - 1]);

    for I := curLinePos - 1 downto 1 do
    begin
      Changstr2 := Trim(RzMemo_PlanScheme.Lines.Strings[I - 1]);
      if Changstr2 <> '' then
      begin
        RzMemo_PlanScheme.Lines.Strings[curLinePos - 1] := Changstr2;
        RzMemo_PlanScheme.Lines.Strings[I - 1] := Changstr1;
        break
      end;
    end;
  end;
end;

//procedure TFrmBaseForm1.SpinEditTotalThreadChange(Sender: TObject);
//begin
//  ThreadCForOnlineSearch := SpinEditTotalThread.Value;
//end;

function TFrmBaseForm1.SubFloorReply(RealWhichFloor: string; WhichFloor, WhichReplyPoint: Integer;
  WHichPasteContent: string): Boolean;
var
  linshiPoint: TPoint;
  addva: Integer;
begin
//  if RzComboBoxModeChoose.ItemIndex = 0 then
//  begin
//    if WhichReplyPoint = 0 then
//    begin
//      Result := False;
//      ScrollToSpecifyFloor(WhichFloor);
//      DelayEx(1000);
//      addva := 50;
//      while not GetHuiFuButtonPoint_JS(WhichFloor, linshiPoint) do
//      begin
//        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetHuiFuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//        //MainForm.ExeJs('document.body.scrollTop+=50')('window.scrollTo(0,document.body.scrollTop+50)';
//        //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//        ScrollTospecifyLoca(WhichFloor, addva);
//        addva := addva + 50;
//        DelayEx(1000);
//      end;
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//      if RzCheckBoxSet_hui.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认回复按扭位置是否正确功能已开启！#13#10');
//
//        while RzCheckBoxSet_hui.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxSet_hui.Checked := True;
//
//        addva := 50;
//        while not GetHuiFuButtonPoint_JS(WhichFloor, linshiPoint) do
//        begin
//          if b_Debug then RzMemoLogLinesAdd('正在循环中：GetHuiFuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//          //MainForm.ExeJs('document.body.scrollTop+=50')('window.scrollTo(0,document.body.scrollTop+50)';
//          //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//          ScrollTospecifyLoca(WhichFloor, addva);
//          addva := addva + 50;
//          DelayEx(1000);
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_hui := False;
//        while not hasbawo_set_hui do
//        begin
//          while RzCheckBoxSet_hui.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxSet_hui.Checked := True;
//
//
//          addva := 50;
//          while not GetHuiFuButtonPoint_JS(WhichFloor, linshiPoint) do
//          begin
//            if b_Debug then RzMemoLogLinesAdd('正在循环中：GetHuiFuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//            //MainForm.ExeJs('document.body.scrollTop+=50')('window.scrollTo(0,document.body.scrollTop+50)';
//            //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//            ScrollTospecifyLoca(WhichFloor, addva);
//            addva := addva + 50;
//            DelayEx(1000);
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//
//
//
//
////      if b_Debug then RzMemoLogLinesAdd('已到回复点？');
////      DelayEx(1000000);
//
////      DelayEX(50);
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      Delay(50);
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//      DelayEx(500);
//      //找到输入框的点
//      if not GetInputContentKuangPoint_JS(WhichFloor, 0, linshiPoint) then
//      begin
//        if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//        //Pri_DeleteOrNot := '1';
//        Exit;
//      end;
//
////      while not GetInputContentKuangPoint_JS(WhichFloor, linshiPoint) do
////      begin
////        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetInputContentKuangPoint_JS');
////
////        MainForm.ExeJs('document.body.scrollTop+=50');
////        DelayEx(1000);
////
////        while not GetHuiFuButtonPoint_JS(WhichFloor, linshiPoint) do
////        begin
////          if b_Debug then RzMemoLogLinesAdd('2正在循环中：GetHuiFuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
////          MainForm.ExeJs('document.body.scrollTop+=50');
////          DelayEx(1000);
////        end;
////        SetCursorPos(linshiPoint.x, linshiPoint.y);
////
////        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////        Delay(50);
////        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////        DelayEx(500);
////      end;
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//      if RzCheckBoxset_hui_input.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认回复按扭弹出输入框位置是否正确功能已开启！#13#10');
//
//        while RzCheckBoxset_hui_input.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxset_hui_input.Checked := True;
//
//        if not GetInputContentKuangPoint_JS(WhichFloor, 0, linshiPoint) then
//        begin
//          if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//          Exit;
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_hui_input := False;
//        while not hasbawo_set_hui_input do
//        begin
//          while RzCheckBoxset_hui_input.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxset_hui_input.Checked := True;
//
//          if not GetInputContentKuangPoint_JS(WhichFloor, 0, linshiPoint) then
//          begin
//            if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//            Exit;
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//
//
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      Delayex(50);
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      Delayex(50);
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      Delayex(100);
//
//      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//
//      Delayex(500);
//
//      //找到提交按扭位置
//      GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 0, linshiPoint);
//      if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//      begin
//        if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//        Exit;
//      end;
//
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//
//
//      if RzCheckBoxset_hui_sub.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认回复按扭弹出输入框提交按扭位置是否正确功能已开启！#13#10');
//
//        while RzCheckBoxset_hui_sub.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxset_hui_sub.Checked := True;
//
//        GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 0, linshiPoint);
//        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//        begin
//          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//          Exit;
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_hui_sub := False;
//        while not hasbawo_set_hui_sub do
//        begin
//          while RzCheckBoxset_hui_sub.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxset_hui_sub.Checked := True;
//
//          GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 0, linshiPoint);
//          if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//          begin
//            if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//            Exit;
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      Delay(50);
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      //Pri_FloorDetails := Pri_FloorDetailsNew;
//
//      RzMemoLogLinesAdd('子楼' + IntToStr(WhichFloor) + '楼回贴完成' + #13#10);
//    end
//    else if WhichReplyPoint = 1 then
//    begin
//      Result := False;
//      ScrollToSpecifyFloor(WhichFloor);
//      DelayEx(1000);
//      addva := 50;
//      while not GetWoYeShuoYiJuButtonPoint_JS(WhichFloor, linshiPoint) do
//      begin
//        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetWoYeShuoYiJuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//        //MainForm.ExeJs('document.body.scrollTop+=50');
//        //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//        ScrollTospecifyLoca(WhichFloor, addva);
//        addva := addva + 50;
//        DelayEx(1000);
//      end;
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//
//      if RzCheckBoxset_wo.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认我也说一句按扭位置是否正确功能已开启！#13#10');
//
//        while RzCheckBoxset_wo.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxset_wo.Checked := True;
//
//        addva := 50;
//        while not GetWoYeShuoYiJuButtonPoint_JS(WhichFloor, linshiPoint) do
//        begin
//          if b_Debug then RzMemoLogLinesAdd('正在循环中：GetWoYeShuoYiJuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//          //MainForm.ExeJs('document.body.scrollTop+=50');
//          //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//          ScrollTospecifyLoca(WhichFloor, addva);
//          addva := addva + 50;
//          DelayEx(1000);
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_wo := False;
//        while not hasbawo_set_wo do
//        begin
//          while RzCheckBoxset_wo.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxset_wo.Checked := True;
//
//          addva := 50;
//          while not GetWoYeShuoYiJuButtonPoint_JS(WhichFloor, linshiPoint) do
//          begin
//            if b_Debug then RzMemoLogLinesAdd('正在循环中：GetWoYeShuoYiJuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
//            //MainForm.ExeJs('document.body.scrollTop+=50');
//            //MainForm.ExeJs('window.scrollTo(0,document.body.scrollTop+50)');
//            ScrollTospecifyLoca(WhichFloor, addva);
//            addva := addva + 50;
//            DelayEx(1000);
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      Delay(50);
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//
//      Delayex(500);
//
//
//      if not GetInputContentKuangPoint_JS(WhichFloor, 1, linshiPoint) then
//      begin
//        //Pri_DeleteOrNot := '1';
//        if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//        Exit;
//      end;
////
////      while not GetInputContentKuangPoint_JS(WhichFloor, linshiPoint) do
////      begin
////        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetInputContentKuangPoint_JS');
////        MainForm.ExeJs('document.body.scrollTop+=50');
////        DelayEx(1000);
////
////        while not GetWoYeShuoYiJuButtonPoint_JS(WhichFloor, linshiPoint) do
////        begin
////          if b_Debug then RzMemoLogLinesAdd('2正在循环中：GetWoYeShuoYiJuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
////          MainForm.ExeJs('document.body.scrollTop+=50');
////          DelayEx(1000);
////        end;
////        SetCursorPos(linshiPoint.x, linshiPoint.y);
////
////        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
////        Delay(50);
////        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
////
////        Delayex(500);
////      end;
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//      if RzCheckBoxset_wo_input.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认我也说一句按扭弹出框位置是否正确功能已开启！#13#10');
//
//        while RzCheckBoxset_wo_input.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxset_wo_input.Checked := True;
//
//        if not GetInputContentKuangPoint_JS(WhichFloor, 1, linshiPoint) then
//        begin
//          if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//          Exit;
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_wo_input := False;
//        while not hasbawo_set_wo_input do
//        begin
//          while RzCheckBoxset_wo_input.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxset_wo_input.Checked := True;
//
//          if not GetInputContentKuangPoint_JS(WhichFloor, 1, linshiPoint) then
//          begin
//            if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
//            Exit;
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      DelayEX(50);
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      DelayEX(50);
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      DelayEX(100);
//
//      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0); //按下SHIFT键。
//      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), 0, 0); //按下R键。
//      keybd_event(Ord('V'), MapVirtualKey(Ord('V'), 0), KEYEVENTF_KEYUP, 0); //按下R键。
//      keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
//
//      DelayEX(500);
//
//      //找到提交按扭位置
//      GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 1,  linshiPoint);
//      if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//      begin
//        if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//        //Pri_DeleteOrNot := '1';
//        Exit;
//      end;
//      SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//
//
//
//      if RzCheckBoxset_wo_sub.Checked then
//      begin
//        RzMemoLogLinesAdd('等待确认我也说一句按扭弹出框提交按扭是否正确功能已开启！#13#10');
//
//        while RzCheckBoxset_wo_sub.Checked do
//        begin
//         DelayEx(1000);
//        end;
//        RzCheckBoxset_wo_sub.Checked := True;
//
//        GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 1,  linshiPoint);
//        if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//        begin
//          if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//          //Pri_DeleteOrNot := '1';
//          Exit;
//        end;
//        SetCursorPos(linshiPoint.x, linshiPoint.y);
//
//        hasbawo_set_wo_sub := False;
//        while not hasbawo_set_wo_sub do
//        begin
//          while RzCheckBoxset_wo_sub.Checked do
//          begin
//           DelayEx(1000);
//          end;
//          RzCheckBoxset_wo_sub.Checked := True;
//
//          GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 1,  linshiPoint);
//          if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
//          begin
//            if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
//            //Pri_DeleteOrNot := '1';
//            Exit;
//          end;
//          SetCursorPos(linshiPoint.x, linshiPoint.y);
//        end;
//
//      end;
//
//
//
//
////      if b_Debug then RzMemoLogLinesAdd('已到发表按钮点？');
////      DelayEx(1000000);
////
////      DelayEX(500);
//      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0); //模拟按下鼠标左键。
//      Delay(50);
//      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0); //模拟放开鼠标左键。
//      //Pri_FloorDetails := Pri_FloorDetailsNew;
//
//      RzMemoLogLinesAdd('子楼' + IntToStr(WhichFloor) + '楼回贴完成' + #13#10);
//    end
//  end
//  else if RzComboBoxModeChoose.ItemIndex = 1 then
//  begin
    if WhichReplyPoint = 0 then
    begin
      Result := False;
      ScrollToSpecifyFloor(WhichFloor);



      addva := 50;
      while not GetHuiFuButtonPoint_JS(WhichFloor, linshiPoint) do
      begin
        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetHuiFuButtonPoint_JS' + #13#10 + IntToStr(linshiPoint.X) + ':' + IntToStr(linshiPoint.y));
        ScrollTospecifyLoca(WhichFloor, addva);
        addva := addva + 50;
        DelayEx(500);
      end;


      DelayEX(BasicParamConf.BGModeSubReplyTimeaScrol);
      CLickHuiFuButton(WhichFloor);
      DelayEX(100);


      if not GetInputContentKuangPoint_JS(WhichFloor, 0, linshiPoint) then
      begin
        //Pri_DeleteOrNot := '1';
        if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
        Exit;
      end;
      InputContentToSpecifyFloor(WhichFloor, WHichPasteContent);



      //找到提交按扭位置
      GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 0, linshiPoint);
      if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
      begin
        Pri_CanReplyOrNot := '100';
        if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
        Exit;
      end;

      DelayEX(100);
      SubmitToSpecifyFloor(WhichFloor, WHichPasteContent);
//      Pri_FloorDetails := Pri_FloorDetailsNew;
//      DelayEX(100);
      RzMemoLogLinesAdd('子楼' + IntToStr(WhichFloor) + '楼后台模式回贴完成' + #13#10);
    end
    else if WhichReplyPoint = 1 then
    begin
      Result := False;
      ScrollToSpecifyFloor(WhichFloor);


      addva := 50;
      while not GetWoYeShuoYiJuButtonPoint_JS(WhichFloor, linshiPoint) do
      begin
        if b_Debug then RzMemoLogLinesAdd('正在循环中：GetWoYeShuoYiJuButtonPoint_JS'
        + #13#10
        + IntToStr(linshiPoint.X)
        + ':' + IntToStr(linshiPoint.y));
        ScrollTospecifyLoca(WhichFloor, addva);
        addva := addva + 50;
        DelayEx(500);
      end;


      DelayEX(BasicParamConf.BGModeSubReplyTimeaScrol);
      CLickWoYeShuoYiJuButton(StrToInt(RealWhichFloor));
      DelayEX(100);


      if not GetInputContentKuangPoint_JS(WhichFloor, 1, linshiPoint) then
      begin
        //Pri_DeleteOrNot := '1';
        if b_Debug then RzMemoLogLinesAdd('因为找不到输入框而退出' + #13#10);
        Exit;
      end;
      InputContentToSpecifyFloor(WhichFloor, WHichPasteContent);


      GetSubmitButtonForOneFloorPoint_JS(WhichFloor, 1,  linshiPoint);
      if (linshiPoint.X = 0) and (linshiPoint.Y = 0) then
      begin
        if b_Debug then RzMemoLogLinesAdd('因为找不到提交按钮而退出' + #13#10);
        Pri_CanReplyOrNot := '100';
        Exit;
      end;



      DelayEX(100);
      SubmitToSpecifyFloor(WhichFloor, WHichPasteContent);
//      Pri_FloorDetails := Pri_FloorDetailsNew;
//      DelayEX(100);
      RzMemoLogLinesAdd('子楼' + IntToStr(WhichFloor) + '楼后台模式回贴完成' + #13#10);
    end;
//  end;
  Result := True;
end;

procedure TFrmBaseForm1.SubmitToSpecifyFloor(iFloor: Integer;
  sPasteContent: string);
var
  LinshiJS: string;
  LinshiX, LinshY: string;
  iLinshiX, iLinshY: Integer;
  JsScriptstr: string;
begin
//  G_InputP := '';
//
//  JsScriptstr :=
////  'var element = document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];' +
////  'document.body.scrollTop=window.pageYOffset + element.getBoundingClientRect().top';
//    'document.body.scrollTop+=50';
//  MainForm.ExeJs(JsScriptstr);
//  Delay(10000);
//
//  RzMemoLogLinesAdd('提交前移动后的10秒后');

  G_InputP := '';
  //document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0]
  LinshiJS := 'var element=document.getElementsByClassName("lzl_panel_submit j_lzl_p_sb")[0];element.click()';
//  //LnshiJS := 'var element=document.getElementById("ueditor_replace");var X = 10;var Y = 10;var Z = X;Z+="|";Z+=Y;alert(Z)';
  MainForm.ExeJs(LinshiJS);
//  while G_InputP = '' do
//  begin
 // Delay(5000);

  G_InputP := '';
end;

procedure TFrmBaseForm1.Timer1Timer(Sender: TObject);
var
  RzURLLabe: TRzURLLabel;
  RzURLLabeurl: string;
begin
    Timer1.Enabled := False;
    Timer2.Enabled := True;

    if str_Version = '3' then
    begin
      RzURLLabe := TRzURLLabel.Create(nil);
      try
        if LoadBanKeyList then
        begin
          if BanKeyList.Count > 0 then
          begin
            Randomize;
            RzURLLabeurl := BanKeyList.Strings[Random(BanKeyList.Count)];
            if Pos('不显示', RzURLLabeurl) > 0 then //(https|http)\:\/\/.+?
            begin

            end
            else
            begin
              if TRegEx.Match(RzURLLabeurl, '(http|https)\:\/\/').Success then //(https|http)\:\/\/.+?
              begin
                RzURLLabe.URL := RzURLLabeurl;
                RzURLLabe.Click;
              end;
            end;
          end;
        end;
      finally
        RzURLLabe.Free;
      end;
    end;





end;

procedure TFrmBaseForm1.Timer2Timer(Sender: TObject);
var
  RzURLLabe: TRzURLLabel;
  RzURLLabeurl: string;
begin

    if str_Version = '3' then
    begin
      RzURLLabe := TRzURLLabel.Create(nil);
      try
        if LoadBanKeyList then
        begin
          if BanKeyList.Count > 0 then
          begin
            Randomize;
            RzURLLabeurl := BanKeyList.Strings[Random(BanKeyList.Count)];
            if Pos('不显示', RzURLLabeurl) > 0 then //(https|http)\:\/\/.+?
            begin

            end
            else
            begin
              if TRegEx.Match(RzURLLabeurl, '(http|https)\:\/\/').Success then //(https|http)\:\/\/.+?
              begin
                RzURLLabe.URL := RzURLLabeurl;
                RzURLLabe.Click;
              end;
            end;
          end;
        end;
      finally
        RzURLLabe.Free;
      end;
    end;





end;

procedure TFrmBaseForm1.Timer4Timer(Sender: TObject);
begin
  inherited;
  if (Timer4.Tag = 0) and (ParamCount > 0) then
  begin
    rbStart.Click;
    Timer4.Tag := 1
  end;
end;

end.

