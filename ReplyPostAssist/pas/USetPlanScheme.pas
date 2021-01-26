unit USetPlanScheme;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, RzGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, SQLiteTable3, UPublic, Vcl.Mask, RzEdit, RzPanel, UPublicEX,
  RzButton, RzRadChk, uThrdPoolClass, DateUtils, Uni, RzCmboBx, RzLabel, UGlobalPublic_IE,
  UinstanceHua, UGlobalPublic_Function, Vcl.AppEvnts, Vcl.Samples.Spin, UGlobalPublic_VersionControl;

type
  TGetMaxDateInDataBase = class(TBusiaction)
  public
    iSerialNo: Integer;
    WenJianMingPath: string;
    procedure Operate; override;
  end;

  TGetQualifiedRecordCount = class(TBusiaction)
  public
    iSerialNo: Integer;
    WenJianMingPath: string;
    procedure Operate; override;
  end;

type
  TFormSetPlanScheme = class(TForm)
    RzPanel1: TRzPanel;
    RzEdit_BarName: TRzEdit;
    RzEdit_Topic: TRzEdit;
    RzEdit_Content: TRzEdit;
    RzEdit_TopicContent: TRzEdit;
    RzMemo_BarName: TRzMemo;
    RzMemo_Topic: TRzMemo;
    RzMemo_Content: TRzMemo;
    RzMemo_TopicCotent: TRzMemo;
    RzPanel2: TRzPanel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Memo_FixeOne: TMemo;
    TabSheet1: TTabSheet;
    Memo_Random: TMemo;
    TabSheet4: TTabSheet;
    Memo_Sequence: TMemo;
    RadioGroup1: TRadioGroup;
    RzCheckBox_2FloorVacancy: TRzCheckBox;
    RzNumericEdit_RecentDayNum: TRzNumericEdit;
    RzNumericEdit_ReplyCount_Begin: TRzNumericEdit;
    RzNumericEdit_ReplyCount_End: TRzNumericEdit;
    RzNumericEdit_FollowPersonCount_Begin: TRzNumericEdit;
    RzNumericEdit_FollowPersonCount_End: TRzNumericEdit;
    RzNumericEdit_TieBaPostTotalCount_Begin: TRzNumericEdit;
    RzNumericEdit_TieBaPostTotalCount_End: TRzNumericEdit;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    RzEditADD: TRzEdit;
    RzEditsubstract: TRzEdit;
    RzMemoAdd: TRzMemo;
    RzMemoSubtract: TRzMemo;
    RzComboBoxLoginAccount: TRzComboBox;
    RzCheckBoxOnlyMainFloor: TRzCheckBox;
    RzNumericEditMinTieziID: TRzNumericEdit;
    RzNumericEditMaxTieziID: TRzNumericEdit;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    RzButtonHandle13And10: TRzButton;
    RzLabel2: TRzLabel;
    RzButtonHandleMessyCode: TRzButton;
    RzLabel3: TRzLabel;
    RzButtonReplaceSpace: TRzButton;
    RzLabel4: TRzLabel;
    RzCheckBoxSaved: TRzCheckBox;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzButtonChooseBaname: TRzButton;
    SpinEditStartPostId: TRzEdit;
    RzLabel9: TRzLabel;
    RzCheckBoxDownload: TRzCheckBox;
    RzComboBoxDownloadMode: TRzComboBox;
    SpinEditTotalThread: TSpinEdit;
    RzEdit_ValidCount: TRzEdit;
    RzLabel13: TRzLabel;
    RzEdit_ValidCount1: TRzEdit;
    RzLabel14: TRzLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RzEdit_BarNameChange(Sender: TObject);
    procedure RzEdit_TopicChange(Sender: TObject);
    procedure RzEdit_ContentChange(Sender: TObject);
    procedure RzEdit_TopicContentChange(Sender: TObject);
    procedure RzMemo_BarNameChange(Sender: TObject);
    procedure RzMemo_TopicChange(Sender: TObject);
    procedure RzMemo_ContentChange(Sender: TObject);
    procedure RzMemo_TopicCotentChange(Sender: TObject);
    procedure RzEdit1DblClick(Sender: TObject);
    procedure RzEdit2DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RzNumericEdit_RecentDayNumKeyPress(Sender: TObject;
      var Key: Char);
    procedure RzEditADDChange(Sender: TObject);
    procedure RzEditsubstractChange(Sender: TObject);
    procedure RzMemoAddChange(Sender: TObject);
    procedure RzMemoSubtractChange(Sender: TObject);
    procedure RzComboBoxLoginAccountChange(Sender: TObject);
    procedure RzButtonHandle13And10Click(Sender: TObject);
    procedure RzButtonHandleMessyCodeClick(Sender: TObject);
    procedure RzButtonReplaceSpaceClick(Sender: TObject);
    procedure Memo_FixeOneChange(Sender: TObject);
    procedure RzMemoAddKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButtonChooseBanameClick(Sender: TObject);
    //procedure SpinEditStartPostIdChange(Sender: TObject);
//    procedure SpinEditStartPostIdKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure RzCheckBoxDownloadClick(Sender: TObject);
    procedure SpinEditTotalThreadChange(Sender: TObject);
    procedure RzComboBoxDownloadModeChange(Sender: TObject);
    procedure RzEdit_ValidCount1Change(Sender: TObject);
    procedure RzEdit3Change(Sender: TObject);
    procedure SpinEditStartPostIdChange(Sender: TObject);
  private
    { Private declarations }
    G_DingTie_Content: string;
    G_DingTie_Content_Type: Integer;
    Linsh_PlanScheme_ValidCount: string;
    Linsh_PlanScheme_StartPostId: string;
    Linsh_PlanScheme_ThreadCForOnlineSearch: string;
    Linsh_PlanScheme_DownloadorOffline: string;
    Linsh_PlanScheme_BarName: string;
    Linsh_PlanScheme_Topic: string;
    Linsh_PlanScheme_Content: string;
    Linsh_PlanScheme_TopicContent: string;
    Linsh_ChoosedAccount: string;

    Linsh_PlanScheme_Add: string;
    Linsh_PlanScheme_Substract: string;

    procedure RzEditEventChange(Sender: TObject; var MapMemo: TRzMemo; var MapString: string);
    procedure RzMemoEventChange(Sender: TObject; var MapEdit: TRzEdit; var MapString: string);
    procedure SaveDingTieContentConfig;
    procedure SaveOneConfig(tiezi_index: Integer);
    procedure JudgeWordCount;
  public
    { Public declarations }
    applicationh: THandle;

    str_huichehuanhangOri: string;
    str_insertMessycodeOri: string;
    str_insertMessycodeOri_onlySpace: string;
  end;

var
  FormSetPlanScheme: TFormSetPlanScheme;

  QualifiedRecordCount: Integer;



implementation

{$R *.dfm}

uses
  UnitChooseBaname;

procedure TFormSetPlanScheme.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  function ModifyPostContent(sourstr: string): string;
  begin
    Result := StringReplace(sourstr,#$A,'',[rfReplaceAll,rfIgnoreCase]);
    Result := StringReplace(Result,#$D,'',[rfReplaceAll,rfIgnoreCase]);
  end;
var
  i: Integer;
  linshiList: TStringList;
begin
  G_DingTie_Content := '';
  CanClose := False;


  try
    G_DingTie_Content_Type := RadioGroup1.ItemIndex;
  except
    finalizeSqliteHardwareTable;
    Exit;
  end;


  linshiList := TStringList.Create;
  try

    case G_DingTie_Content_Type of
      0:
        begin
          G_DingTie_Content := ModifyPostContent(Trim(Memo_FixeOne.Text));
        end;
      1:
        begin
          if Memo_Random.Lines.Count > 0 then
          begin
            linshiList.Clear;
            for i := 0 to Memo_Random.Lines.Count - 1 do
            begin
              if Trim(Memo_Random.Lines[i]) <> '' then
              begin
                linshiList.Add(ModifyPostContent(Trim(Memo_Random.Lines[i])));
              end;
            end;
            G_DingTie_Content := Trim(linshiList.Text);
          end;
        end;
      2:   //Memo_Sequence
        begin
          if Memo_Sequence.Lines.Count > 0 then
          begin
            linshiList.Clear;
            for i := 0 to Memo_Sequence.Lines.Count - 1 do
            begin
              if Trim(Memo_Sequence.Lines[i]) <> '' then
              begin
                linshiList.Add(ModifyPostContent(Trim(Memo_Sequence.Lines[i])));
              end;
            end;
            G_DingTie_Content := Trim(linshiList.Text);
          end;
        end;
    end;

    RzComboBoxLoginAccountChange(nil);

    if Linsh_ChoosedAccount = '' then
    begin
      ShowMessageEX('请选择一个使用的登录账号！');
      Exit;
    end;

    if G_DingTie_Content = '' then
    begin
      ShowMessageEX('顶贴内容为空！');
      Exit;
    end;

//    if str_Version = '3' then
//    begin
//    if (Linsh_PlanScheme_DownloadorOffline = '1') or
//    (Linsh_PlanScheme_DownloadorOffline = '2')
//    then
//    begin
//      //ShowMessageEX('关键字下载模式和贴吧名下载模式暂未开发完成！');
//      ShowMessageEX('该模式暂未开发完成！');
//      Exit;
//    end;
//    end;


//    if LoadBanKeyList then
//    begin
//      if BanKeyList.Count > 0 then
//      begin
//        if Trim(Linsh_PlanScheme_Topic) <> '' then
//        begin
//          linshiList.Clear;
//          linshiList.Delimiter := '|';
//          linshiList.DelimitedText := Trim(Linsh_PlanScheme_Topic);
//          for I := 0 to linshiList.Count - 1 do
//          begin
//            if BanKeyList.IndexOf(linshiList.Strings[I]) >= 0 then
//            begin
//              ShowMessageEX('请不要使用：' + linshiList.Strings[I]);
//              Exit;
//            end;
//          end;
//        end;
//        if Trim(Linsh_PlanScheme_Content) <> '' then
//        begin
//          linshiList.Clear;
//          linshiList.Delimiter := '|';
//          linshiList.DelimitedText := Trim(Linsh_PlanScheme_Content);
//          for I := 0 to linshiList.Count - 1 do
//          begin
//            if BanKeyList.IndexOf(linshiList.Strings[I]) >= 0 then
//            begin
//              ShowMessageEX('请不要使用：' + linshiList.Strings[I]);
//              Exit;
//            end;
//          end;
//        end;
//        if Trim(Linsh_PlanScheme_TopicContent) <> '' then
//        begin
//          linshiList.Clear;
//          linshiList.Delimiter := '|';
//          linshiList.DelimitedText := Trim(Linsh_PlanScheme_TopicContent);
//          for I := 0 to linshiList.Count - 1 do
//          begin
//            if BanKeyList.IndexOf(linshiList.Strings[I]) >= 0 then
//            begin
//              ShowMessageEX('请不要使用：' + linshiList.Strings[I]);
//              Exit;
//            end;
//          end;
//        end;
//
//      end;
//    end;




    if RzCheckBoxSaved.Checked then
      SaveDingTieContentConfig
    else
    begin
      case MessageBox(Handle, '是否保存该方案配置？', '', MB_ICONWARNING + MB_YESNOCANCEL) of
      IDYES:
        begin
          SaveDingTieContentConfig;
        end;
      IDNO:
        begin

        end;
      IDCANCEL:
        begin
          Exit;
        end;
      end;

    end;

    CanClose := True;
  finally
    linshiList.Free;

  end;
end;


procedure TFormSetPlanScheme.FormShow(Sender: TObject);
var
  RzComboBoxDownloadModeIndex: Integer;
  ChoosedContentType_index: string;
  DingTie_ContentList: string;
  sSQL: string;
  Linshi_Stringlist: TStringList;
  i: Integer;
  P1, P2, P3, P4, P5, P6, P7, P8, P9: TNotifyEvent;
  P10, P11, P12, P13, P14, P15: TNotifyEvent;
  sltb: TSQLIteTable;

//  Linshi_Control2FloorVacancy, Linshi_LastHowManyDays, Linshi_ReplyCountBegin: string;
//  Linshi_ReplyCountEnd, Linshi_FollowPopulationBegin, Linshi_FollowPopulationEnd: string;
//  Linshi_TieBaPostTotalBegin, Linshi_TieBaPostTotalEnd, Linshi_dingtie_type, Linshi_dingtie_content: string;

  procedure ShowInMemo(Linsh_strlist: string; RzMemoSour: TRzMemo);
  begin
    Linshi_Stringlist.Clear;
    Linshi_Stringlist.Delimiter := '|';
    Linshi_Stringlist.DelimitedText := Linsh_strlist;
    RzMemoSour.Lines := Linshi_Stringlist;
  end;




begin
  P1 := RzEdit_Topic.OnChange;
  RzEdit_Topic.OnChange := nil;

  P2 := RzEdit_BarName.OnChange;
  RzEdit_BarName.OnChange := nil;

  P3 := RzEdit_Content.OnChange;
  RzEdit_Content.OnChange := nil;

  P4 := RzEdit_TopicContent.OnChange;
  RzEdit_TopicContent.OnChange := nil;


  P10 := RzEditADD.OnChange;
  RzEditADD.OnChange := nil;

  P11 := RzEditsubstract.OnChange;
  RzEditsubstract.OnChange := nil;

  P15 := RzEdit_ValidCount1.OnChange;
  RzEdit_ValidCount1.OnChange := nil;

  P5 := SpinEditStartPostId.OnChange;
  SpinEditStartPostId.OnChange := nil;

  P6 := RzMemo_BarName.OnChange;
  RzMemo_BarName.OnChange := nil;

  P7 := RzMemo_Topic.OnChange;
  RzMemo_Topic.OnChange := nil;

  P8 := RzMemo_Content.OnChange;
  RzMemo_Content.OnChange := nil;

  P9 := RzMemo_TopicCotent.OnChange;
  RzMemo_TopicCotent.OnChange := nil;

  P12 := RzMemoSubtract.OnChange;
  RzMemoSubtract.OnChange := nil;

  P13 := RzMemoAdd.OnChange;
  RzMemoAdd.OnChange := nil;

  P14 := RzComboBoxLoginAccount.OnChange;//Linsh_ChoosedAccount
  RzComboBoxLoginAccount.OnChange := nil;


  RzComboBoxLoginAccount.Items.Clear;
  RzComboBoxLoginAccount.Items := fileStrList;
  RzComboBoxLoginAccount.ItemIndex := RzComboBoxLoginAccount.Items.IndexOf(SetCacheDirectoryNa);
  if RzComboBoxLoginAccount.ItemIndex = -1 then
  begin
    RzComboBoxLoginAccount.Items.Add(SetCacheDirectoryNa);
    RzComboBoxLoginAccount.ItemIndex := fileStrList.Count - 1;
  end;


  try
    //RadioGroup1Click(nil);
    if i_PlanScheme_index <> -1 then
    begin

      {



'Control2FloorVacancy=' + BoolToStr(RzCheckBox_2FloorVacancy.Checked) +
  'LastHowManyDays=' + FloatToStr(RzNumericEdit_RecentDayNum.Value) +
  'ReplyCountBegin=' + FloatToStr(RzNumericEdit_ReplyCount_Begin.Value) +
  'ReplyCountEnd=' + FloatToStr(RzNumericEdit_ReplyCount_End.Value) +
  'FollowPopulationBegin=' + FloatToStr(RzNumericEdit_FollowPersonCount_Begin.Value) +
  'FollowPopulationEnd=' + FloatToStr(RzNumericEdit_FollowPersonCount_End.Value) +
  'TieBaPostTotalBegin=' + FloatToStr(RzNumericEdit_TieBaPostTotalCount_Begin.Value) +
  'TieBaPostTotalEnd=' + FloatToStr(RzNumericEdit_TieBaPostTotalCount_End.Value) +
  'dingtie_type=' + IntToStr(G_DingTie_Content_Type) +
  'dingtie_content=' + QuotedStr(G_DingTie_Content) +
      }
        //sSQL := 'SELECT PlanScheme_ValidCount, PlanScheme_BarName, PlanScheme_Topic,' + 'PlanScheme_Content, PlanScheme_TopicContent FROM PlanScheme_Config  where PlanScheme_index=' + IntToStr(i_PlanScheme_index);
        sSQL := 'SELECT PlanScheme_BarName, PlanScheme_Topic,'
        + 'PlanScheme_Content, PlanScheme_TopicContent,'
        + 'Control2FloorVacancy, LastHowManyDays, ReplyCountBegin,'
        + 'ReplyCountEnd, FollowPopulationBegin, FollowPopulationEnd,'
        + 'TieBaPostTotalBegin, TieBaPostTotalEnd, dingtie_type,'
        + ' dingtie_content, ADDTiezi, SubstractTiezi, ChoosedAccount,  '
        + ' OnlyForWechat, OnlyMainFloor, DownloadorOffline, TotalThreadForDownloadMode, PlanScheme_ValidCount  '
        + 'FROM PlanScheme_Config  where PlanScheme_index=' + IntToStr(i_PlanScheme_index);
        //QueryStringEXEXEXEX(sSQL, Linsh_PlanScheme_ValidCount, Linsh_PlanScheme_BarName, Linsh_PlanScheme_Topic, Linsh_PlanScheme_Content, Linsh_PlanScheme_TopicContent);
        //QueryStringEXEXEX(sSQL, Linsh_PlanScheme_BarName, Linsh_PlanScheme_Topic, Linsh_PlanScheme_Content, Linsh_PlanScheme_TopicContent);





        EnterCriticalSection(CS);
        sltb := sldb.GetTable(sSQL);
        LeaveCriticalSection(CS);
        try
          case StrToIntDef(Trim(sltb.FieldAsString(19)), 0) of
          0:
          begin
            RzCheckBoxDownload.Checked := False;
            RzComboBoxDownloadMode.ItemIndex := 0;
            SpinEditTotalThread.Value := 1;
            RzCheckBoxDownloadClick(nil);
          end;
//          1:
//          begin
//            RzCheckBoxDownload.Checked := True;
//            RzComboBoxDownloadMode.ItemIndex := 0;
//            SpinEditTotalThread.Text := Trim(sltb.FieldAsString(20));
//            RzCheckBoxDownloadClick(nil);
//          end;
          2:
          begin
            RzCheckBoxDownload.Checked := True;
            RzComboBoxDownloadMode.ItemIndex := 1;
            SpinEditTotalThread.Text := Trim(sltb.FieldAsString(20));
            RzCheckBoxDownloadClick(nil);
          end;
          1:
          begin
            RzCheckBoxDownload.Checked := True;
            RzComboBoxDownloadMode.ItemIndex := 2;
            SpinEditTotalThread.Text := Trim(sltb.FieldAsString(20));
            RzCheckBoxDownloadClick(nil);
          end;
          end;
          SpinEditTotalThreadChange(nil);
          Linsh_PlanScheme_DownloadorOffline := Trim(sltb.FieldAsString(19));


          Linsh_PlanScheme_ValidCount := Trim(sltb.FieldAsString(21));

          RzCheckBoxOnlyMainFloor.Checked := Trim(sltb.FieldAsString(18)) = '1';
          //RzCheckBoxOnlyForWechat.Checked := Trim(sltb.FieldAsString(17)) = '1';
          SpinEditStartPostId.Text := Trim(sltb.FieldAsString(17));
          //SpinEditStartPostIdKeyDown(nil);
          Linsh_PlanScheme_StartPostId := IntToStr(StrToInt64Def(Trim(SpinEditStartPostId.Text), 0));


          Linsh_ChoosedAccount := Trim(sltb.FieldAsString(16));
          RzComboBoxLoginAccount.Text :=  Linsh_ChoosedAccount;
          RzComboBoxLoginAccount.ItemIndex := RzComboBoxLoginAccount.Items.IndexOf(Linsh_ChoosedAccount);


          Linsh_PlanScheme_BarName := sltb.FieldAsString(0);
          Linsh_PlanScheme_Topic := sltb.FieldAsString(1);
          Linsh_PlanScheme_Content := sltb.FieldAsString(2);
          Linsh_PlanScheme_TopicContent := sltb.FieldAsString(3);

          Linsh_PlanScheme_Add := sltb.FieldAsString(14);
          Linsh_PlanScheme_Substract := sltb.FieldAsString(15);


//          Linshi_Control2FloorVacancy := sltb.FieldAsString(4);
//          Linshi_LastHowManyDays := sltb.FieldAsString(5);
//          Linshi_ReplyCountBegin := sltb.FieldAsString(6);
//          Linshi_ReplyCountEnd := sltb.FieldAsString(7);
//          Linshi_FollowPopulationBegin := sltb.FieldAsString(8);
//          Linshi_FollowPopulationEnd := sltb.FieldAsString(9);
//          Linshi_TieBaPostTotalBegin := sltb.FieldAsString(10);
//          Linshi_TieBaPostTotalEnd := sltb.FieldAsString(11);
//          Linshi_dingtie_type := sltb.FieldAsString(12);
//          Linshi_dingtie_content := sltb.FieldAsString(13);

          RzCheckBox_2FloorVacancy.Checked := StrToBool(sltb.FieldAsString(4));
          RzNumericEdit_RecentDayNum.Text := sltb.FieldAsString(5);  //测试一下

          RzNumericEdit_ReplyCount_Begin.Text := sltb.FieldAsString(6);
          RzNumericEdit_ReplyCount_End.Text := sltb.FieldAsString(7);
          RzNumericEdit_FollowPersonCount_Begin.Text := sltb.FieldAsString(8);
          RzNumericEdit_FollowPersonCount_End.Text := sltb.FieldAsString(9);
          RzNumericEdit_TieBaPostTotalCount_Begin.Text := sltb.FieldAsString(10);
          RzNumericEdit_TieBaPostTotalCount_End.Text := sltb.FieldAsString(11);

          RadioGroup1.ItemIndex := StrToInt(sltb.FieldAsString(12));
          //Linshi_dingtie_type := sltb.FieldAsString(12);
          //Linshi_dingtie_content := sltb.FieldAsString(13);

          RzEdit_ValidCount1.Text := Linsh_PlanScheme_ValidCount;

          case RadioGroup1.ItemIndex of
            0:
              begin
                Memo_FixeOne.Text := sltb.FieldAsString(13);
              end;
            1:
              begin
                Memo_Random.Text := sltb.FieldAsString(13);
              end;
            2:
              begin
                Memo_Sequence.Text := sltb.FieldAsString(13);
              end;
          end;

        finally
          sltb.Free;
        end;



        Linshi_Stringlist := TStringList.Create;
        try
          RzEdit_BarName.Text := Linsh_PlanScheme_BarName;
          ShowInMemo(Linsh_PlanScheme_BarName, RzMemo_BarName);
          RzEdit_Topic.Text := Linsh_PlanScheme_Topic;
          ShowInMemo(Linsh_PlanScheme_Topic, RzMemo_Topic);
          RzEdit_Content.Text := Linsh_PlanScheme_Content;
          ShowInMemo(Linsh_PlanScheme_Content, RzMemo_Content);
          RzEdit_TopicContent.Text := Linsh_PlanScheme_TopicContent;
          ShowInMemo(Linsh_PlanScheme_TopicContent, RzMemo_TopicCotent);

          RzEditADD.Text := Linsh_PlanScheme_Add;
          ShowInMemo(Linsh_PlanScheme_Add, RzMemoAdd);



          RzEditsubstract.Text := Linsh_PlanScheme_Substract;
          ShowInMemo(Linsh_PlanScheme_Substract, RzMemoSubtract);
        finally
          Linshi_Stringlist.Free;
        end;


    end;
  finally

    //P1 := RzEdit_Topic.OnChange;
    RzEdit_Topic.OnChange := P1;

    //P2 := RzEdit_BarName.OnChange;
    RzEdit_BarName.OnChange := P2;

    //P3 := RzEdit_Content.OnChange;
    RzEdit_Content.OnChange := p3;

    //P4 := RzEdit_TopicContent.OnChange;
    RzEdit_TopicContent.OnChange := p4;

    //P5 := RzEdit_ValidCount.OnChange;
    RzEdit_ValidCount1.OnChange := P15;

    //P5 := SpinEditStartPostId.OnChange;
    SpinEditStartPostId.OnChange := p5;



    RzMemoSubtract.OnChange := P12;


    RzMemoAdd.OnChange := P13;


    RzEditADD.OnChange := P10;

    RzEditsubstract.OnChange := P11;


    //P6 := RzMemo_BarName.OnChange;
    RzMemo_BarName.OnChange := p6;

    //P7 := RzMemo_Topic.OnChange;
    RzMemo_Topic.OnChange := p7;

    //P8 := RzMemo_Content.OnChange;
    RzMemo_Content.OnChange := p8;

    //P9 := RzMemo_TopicCotent.OnChange;
    RzMemo_TopicCotent.OnChange := p9;

    RzComboBoxLoginAccount.OnChange := P14;
  end;

  RzEdit1.Text := '';
  RzEdit2.Text := '';
  RzEdit_ValidCount.Text := '';




  Memo_FixeOne.ReadOnly := False;
  Memo_Random.ReadOnly := False;
  Memo_Sequence.ReadOnly := False;

  Application.Handle := applicationh;
  SetWindowPos(Self.Handle,HWND_TOPMOST,0,0,0,0,SWP_NOMOVE or SWP_NOSIZE);
  SetWindowPos(Self.Handle,HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
  //Self.FormStyle := fsStayOnTop;


  str_huichehuanhangOri := '';
  str_insertMessycodeOri := '';
  str_insertMessycodeOri_onlySpace := '';

  JudgeWordCount;








    RzCheckBoxDownload.Visible := True;
    RzComboBoxDownloadMode.Visible := True;
//    if str_Version = '3' then
//    begin
//      RzComboBoxDownloadModeIndex := RzComboBoxDownloadMode.ItemIndex;
//      RzComboBoxDownloadMode.Items.Clear;
//      RzComboBoxDownloadMode.Items.Add('正在开发的模式1');
//      RzComboBoxDownloadMode.Items.Add('正在开发的模式2');
//      RzComboBoxDownloadMode.Items.Add('大面积撒网法');
//      RzComboBoxDownloadMode.ItemIndex := RzComboBoxDownloadModeIndex;
//    end;
    //SpinEditTotalThread.Visible := True;

    RzEdit_ValidCount1.Visible := True;
    RzLabel13.Visible := True;

    RzLabel9.Visible := True;
    SpinEditStartPostId.Visible := True;




  if (str_Version = '3') or
  (str_Version = '0') or
  (str_Version = '2')
  then
  begin
    RzButtonChooseBaname.Visible := False;











//    RzEdit_BarName.Visible := False;
//    RzMemo_BarName.Visible := False;
//
//    RzEdit_Topic.Visible := False;
//    RzMemo_Topic.Visible := False;
//
//    RzEdit_Content.Visible := False;
//    RzMemo_Content.Visible := False;
//
//    RzEditADD.Visible := False;
//    RzMemoAdd.Visible := False;
//
//    RzEditsubstract.Visible := False;
//    RzMemoSubtract.Visible := False;
//
//    RzCheckBox_2FloorVacancy.Visible := False;
//
//
//    RzLabel5.Visible := False;
//    RzLabel6.Visible := False;
//    RzNumericEdit_ReplyCount_Begin.Visible := False;
//    RzNumericEdit_ReplyCount_End.Visible := False;
  end
  else
  begin
    RzButtonChooseBaname.Visible := True;

















//    RzEdit_BarName.Visible := True;
//    RzMemo_BarName.Visible := True;
//
//    RzEdit_Topic.Visible := True;
//    RzMemo_Topic.Visible := True;
//
//    RzEdit_Content.Visible := True;
//    RzMemo_Content.Visible := True;
//
//    RzEditADD.Visible := True;
//    RzMemoAdd.Visible := True;
//
//    RzEditsubstract.Visible := True;
//    RzMemoSubtract.Visible := True;
//
//    RzCheckBox_2FloorVacancy.Visible := True;
//
//
//    RzLabel5.Visible := True;
//    RzLabel6.Visible := True;
//    RzNumericEdit_ReplyCount_Begin.Visible := True;
//    RzNumericEdit_ReplyCount_End.Visible := True;
  end;
end;

procedure TFormSetPlanScheme.JudgeWordCount;
var
  zishu: Integer;
begin
  zishu := Length(Trim(Memo_FixeOne.Text));
  if zishu >= 140 then
  begin
    RzLabel4.Caption := '中间楼层回复最多140个字符，已超，当前字数：' + inttostr(zishu);
    RzLabel4.Font.Color := clRed;
  end
  else
  begin
    RzLabel4.Caption := '中间楼层回复最多140个字符，未超，当前字数：' + inttostr(zishu);
    RzLabel4.Font.Color := clBlack;
  end;
end;

procedure TFormSetPlanScheme.Memo_FixeOneChange(Sender: TObject);
begin
  JudgeWordCount;
end;

procedure TFormSetPlanScheme.PageControl1Change(Sender: TObject);
begin
  RadioGroup1.ItemIndex := PageControl1.TabIndex;
end;

procedure TFormSetPlanScheme.RadioGroup1Click(Sender: TObject);
begin
  PageControl1.TabIndex := RadioGroup1.ItemIndex;
//  case RadioGroup1.ItemIndex of
//  0:
//  begin
//    PageControl1.TabIndex := 0;
//    //ChoosedContentType := cctRandomOne;
//  end;
//  1:
//  begin
//    PageControl1.TabIndex := 0;
//    ChoosedContentType := cctQuenceOne;
//  end;
//  2:
//  begin
//    ChoosedContentType := cctFixTime;
//  end;
//  3:
//  begin
//    ChoosedContentType := cctOther;
//  end;
//  4:
//  begin
//    ChoosedContentType := cctFixOne;
//  end;
//
//  end;

end;

procedure TFormSetPlanScheme.RzButtonChooseBanameClick(Sender: TObject);
var
  LinshiList: TStringList;
begin
//  FormSetPlanScheme := TFormSetPlanScheme.Create(Application);
//  try
//    FormSetPlanScheme.Position := poMainFormCenter;
//    FormSetPlanScheme.applicationh := Application.Handle;
//    FormSetPlanScheme.Caption := FormSetPlanScheme.Caption + '（第' + IntToStr(i_PlanScheme_index + 1) + '个方案)';
//    FormSetPlanScheme.ShowModal;
//  finally
//    FormSetPlanScheme.Free;
//  end;
  LinshiList := TStringList.Create;
  with TFormChooseBaname.Create(nil) do
  try
    Position := poMainFormCenter;
    applicationha := applicationh;
    Caption := '查询选择贴吧名';
    if ShowModal = mrOk then
    begin
      //LinshiList.CommaText := TiebaList;
      RzEdit_BarName.Text := TiebaList;
    end;
  finally
    Free;
    LinshiList.Free;
  end;
end;

procedure TFormSetPlanScheme.RzButtonHandle13And10Click(Sender: TObject);
var
  tempst: string;
begin
//    str_huichehuanhangOri: string;
//    str_insertMessycodeOri: string;
  if RzButtonHandle13And10.Caption = '生成' then
  begin
    tempst := Trim(Memo_FixeOne.Text);
    if tempst = '' then Exit;

    str_huichehuanhangOri := tempst;
    Memo_FixeOne.Text := StringReplace(tempst, chr(13) + chr(10), '<br/>', [rfReplaceAll]);

    if Memo_FixeOne.Text = str_huichehuanhangOri then
    begin
      str_huichehuanhangOri := '';
      Exit;
    end;

    RzButtonHandle13And10.Caption := '还原';
  end
  else if RzButtonHandle13And10.Caption = '还原' then
  begin
    if str_huichehuanhangOri = '' then Exit;
    Memo_FixeOne.Text := str_huichehuanhangOri;
    RzButtonHandle13And10.Caption := '生成';
  end;
  JudgeWordCount;
end;

procedure TFormSetPlanScheme.RzButtonHandleMessyCodeClick(Sender: TObject);
var
  tempst: string;
  temstr: string;
  radomintt: Integer;
  strlen: Integer;
  i: Integer;
  tempstchar: Char;
  randstr: string;
begin
//    str_huichehuanhangOri: string;
//    str_insertMessycodeOri: string;
//    str_insertMessycodeOri_onlySpace
  if RzButtonHandleMessyCode.Caption = '生成' then
  begin
    tempst := Trim(Memo_FixeOne.Text);
    if tempst = '' then Exit;

    str_insertMessycodeOri := tempst;


      temstr := '';
      strlen := Length(tempst);
      for I := 1 to strlen do
      begin
        tempstchar := tempst[I];
        if (tempstchar <> chr(13)) and (tempstchar <> chr(10)) and (tempstchar <> chr(32)) and (tempstchar <> chr(9)) then
        begin
          Randomize;
          radomintt := Random(65536);
          randstr := UTF8encode(Chr(radomintt));
          temstr := temstr + tempstchar + randstr;
        end
        else
        begin
          temstr := temstr + tempstchar;
        end;
      end;



    Memo_FixeOne.Text := temstr; //StringReplace(tempst, chr(13) + chr(10), '<br/>', [rfReplaceAll]);

    if Memo_FixeOne.Text = str_insertMessycodeOri then
    begin
      str_insertMessycodeOri := '';
      Exit;
    end;

    RzButtonHandleMessyCode.Caption := '还原';
  end
  else if RzButtonHandleMessyCode.Caption = '还原' then
  begin
    if str_insertMessycodeOri = '' then Exit;
    Memo_FixeOne.Text := str_insertMessycodeOri;
    RzButtonHandleMessyCode.Caption := '生成';
  end;
  JudgeWordCount;
end;

procedure TFormSetPlanScheme.RzButtonReplaceSpaceClick(Sender: TObject);
var
  tempst: string;
  temstr: string;
  radomintt: Integer;
  strlen: Integer;
  i: Integer;
  tempstchar: Char;
  randstr: string;
begin
//    str_huichehuanhangOri: string;
//    str_insertMessycodeOri: string;
//    str_insertMessycodeOri_onlySpace
  if RzButtonReplaceSpace.Caption = '生成' then
  begin
    tempst := Trim(Memo_FixeOne.Text);
    if tempst = '' then Exit;

    str_insertMessycodeOri_onlySpace := tempst;


      temstr := '';
      strlen := Length(tempst);
      for I := 1 to strlen do
      begin
        tempstchar := tempst[I];
        if (tempstchar = chr(32)) or (tempstchar = chr(9)) then
        begin
          Randomize;
          radomintt := Random(65536);
          randstr := UTF8encode(Chr(radomintt));
          temstr := temstr + randstr;
        end
        else
        begin
          temstr := temstr + tempstchar;
        end;
      end;

    Memo_FixeOne.Text := temstr;//StringReplace(tempst, chr(13) + chr(10), '<br/>', [rfReplaceAll]);

    if Memo_FixeOne.Text = str_insertMessycodeOri_onlySpace then
    begin
      str_insertMessycodeOri_onlySpace := '';
      Exit;
    end;

    RzButtonReplaceSpace.Caption := '还原';
  end
  else if RzButtonReplaceSpace.Caption = '还原' then
  begin
    if str_insertMessycodeOri_onlySpace = '' then Exit;
    Memo_FixeOne.Text := str_insertMessycodeOri_onlySpace;
    RzButtonReplaceSpace.Caption := '生成';
  end;
  JudgeWordCount;
end;

procedure TFormSetPlanScheme.RzCheckBoxDownloadClick(Sender: TObject);
begin
  if RzCheckBoxDownload.Checked then
  begin
    RzComboBoxDownloadMode.Enabled := True;
    SpinEditTotalThread.Enabled := True;
  end
  else
  begin
    RzComboBoxDownloadMode.Enabled := False;
    SpinEditTotalThread.Enabled := False;
  end;

  if not RzCheckBoxDownload.Checked then
    Linsh_PlanScheme_DownloadorOffline := '0'
  else
    Linsh_PlanScheme_DownloadorOffline := IntToStr(RzComboBoxDownloadMode.ItemIndex + 1);





  case StrToIntDef(Linsh_PlanScheme_DownloadorOffline, 0) of
  0: //离线模式
  begin
    SpinEditTotalThread.Visible := False;

    RzEdit1.Visible := true;
    RzEdit_BarName.Visible := True;
    RzMemo_BarName.Visible := True;

    RzEdit_Topic.Visible := True;
    RzMemo_Topic.Visible := True;

    RzEdit_Content.Visible := True;
    RzMemo_Content.Visible := True;

    RzEdit_TopicContent.Visible := True;
    RzMemo_TopicCotent.Visible := True;

    RzEditADD.Visible := True;
    RzMemoAdd.Visible := True;

    RzEditsubstract.Visible := True;
    RzMemoSubtract.Visible := True;


    RzEdit2.Visible := True;
    RzEdit_ValidCount.Visible := True;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clWindowText;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clWindowText;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clRed;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clWindowText;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clWindowText;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;

  end;
//  1:   //贴吧名
//  begin
//    SpinEditTotalThread.Visible := True;
//
//    RzEdit1.Visible := False;
//    RzEdit_BarName.Visible := True;
//    RzMemo_BarName.Visible := True;
//
//    RzEdit_Topic.Visible := False;
//    RzMemo_Topic.Visible := False;
//
//    RzEdit_Content.Visible := False;
//    RzMemo_Content.Visible := False;
//
//    RzEdit_TopicContent.Visible := False;
//    RzMemo_TopicCotent.Visible := False;
//
//    RzEditADD.Visible := False;
//    RzMemoAdd.Visible := False;
//
//    RzEditsubstract.Visible := False;
//    RzMemoSubtract.Visible := False;
//
//
//    RzEdit2.Visible := False;
//    RzEdit_ValidCount.Visible := False;
//
//    RzCheckBox_2FloorVacancy.Visible := True;
//    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText
//
//
//    RzLabel5.Visible := True;
//    RzLabel5.Font.Color := clRed;   //clWindowText
//    RzLabel6.Visible := True;
//    RzLabel6.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_ReplyCount_Begin.Visible := True;
//    RzNumericEdit_ReplyCount_End.Visible := True;
//
//
//    RzLabel12.Visible := True;
//    RzLabel12.Font.Color := clWindowText;   //clWindowText
//    RzNumericEdit_RecentDayNum.Visible := True;
//
//
//    RzLabel10.Visible := True;
//    RzLabel10.Font.Color := clRed;   //clWindowText
//    RzLabel7.Visible := True;
//    RzLabel7.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
//    RzNumericEdit_FollowPersonCount_End.Visible := true;
//
//
//    RzLabel11.Visible := True;
//    RzLabel11.Font.Color := clRed;   //clWindowText
//    RzLabel8.Visible := True;
//    RzLabel8.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
//    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
//  end;
  2:  //关键字
  begin
    SpinEditTotalThread.Visible := True;
    RzEdit1.Visible := False;
    RzEdit_BarName.Visible := True;
    RzMemo_BarName.Visible := True;

    RzEdit_Topic.Visible := False;
    RzMemo_Topic.Visible := False;

    RzEdit_Content.Visible := False;
    RzMemo_Content.Visible := False;

    RzEdit_TopicContent.Visible := True;
    RzMemo_TopicCotent.Visible := True;

    RzEditADD.Visible := False;
    RzMemoAdd.Visible := False;

    RzEditsubstract.Visible := False;
    RzMemoSubtract.Visible := False;


    RzEdit2.Visible := False;
    RzEdit_ValidCount.Visible := False;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clRed;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clRed;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clWindowText;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clWindowText;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
  end;
  1:   //贴子ID
  begin
    SpinEditTotalThread.Visible := False;
    RzEdit1.Visible := False;
    RzEdit_BarName.Visible := False;
    RzMemo_BarName.Visible := False;

    RzEdit_Topic.Visible := False;
    RzMemo_Topic.Visible := False;

    RzEdit_Content.Visible := False;
    RzMemo_Content.Visible := False;

    RzEdit_TopicContent.Visible := False;
    RzMemo_TopicCotent.Visible := False;

    RzEditADD.Visible := True;
    RzMemoAdd.Visible := True;

    RzEditsubstract.Visible := False;
    RzMemoSubtract.Visible := False;


    RzEdit2.Visible := False;
    RzEdit_ValidCount.Visible := False;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clRed;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clRed;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clRed;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clRed;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clRed;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clRed;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clRed;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
  end;

  end;




end;

procedure TFormSetPlanScheme.RzComboBoxDownloadModeChange(Sender: TObject);
begin
  if not RzCheckBoxDownload.Checked then
    Linsh_PlanScheme_DownloadorOffline := '0'
  else
    Linsh_PlanScheme_DownloadorOffline := IntToStr(RzComboBoxDownloadMode.ItemIndex + 1);




  case StrToIntDef(Linsh_PlanScheme_DownloadorOffline, 0) of
  0: //离线模式
  begin
    SpinEditTotalThread.Visible := False;
    RzEdit1.Visible := True;

    RzEdit_BarName.Visible := True;
    RzMemo_BarName.Visible := True;

    RzEdit_Topic.Visible := True;
    RzMemo_Topic.Visible := True;

    RzEdit_Content.Visible := True;
    RzMemo_Content.Visible := True;

    RzEdit_TopicContent.Visible := True;
    RzMemo_TopicCotent.Visible := True;

    RzEditADD.Visible := True;
    RzMemoAdd.Visible := True;

    RzEditsubstract.Visible := True;
    RzMemoSubtract.Visible := True;


    RzEdit2.Visible := True;
    RzEdit_ValidCount.Visible := True;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clWindowText;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clWindowText;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clRed;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clWindowText;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clWindowText;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;

  end;
//  1:   //贴吧名
//  begin
//    SpinEditTotalThread.Visible := True;
//    RzEdit1.Visible := False;
//
//    RzEdit_BarName.Visible := True;
//    RzMemo_BarName.Visible := True;
//
//    RzEdit_Topic.Visible := False;
//    RzMemo_Topic.Visible := False;
//
//    RzEdit_Content.Visible := False;
//    RzMemo_Content.Visible := False;
//
//    RzEdit_TopicContent.Visible := False;
//    RzMemo_TopicCotent.Visible := False;
//
//    RzEditADD.Visible := False;
//    RzMemoAdd.Visible := False;
//
//    RzEditsubstract.Visible := False;
//    RzMemoSubtract.Visible := False;
//
//
//    RzEdit2.Visible := False;
//    RzEdit_ValidCount.Visible := False;
//
//    RzCheckBox_2FloorVacancy.Visible := True;
//    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText
//
//
//    RzLabel5.Visible := True;
//    RzLabel5.Font.Color := clRed;   //clWindowText
//    RzLabel6.Visible := True;
//    RzLabel6.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_ReplyCount_Begin.Visible := True;
//    RzNumericEdit_ReplyCount_End.Visible := True;
//
//
//    RzLabel12.Visible := True;
//    RzLabel12.Font.Color := clWindowText;   //clWindowText
//    RzNumericEdit_RecentDayNum.Visible := True;
//
//
//    RzLabel10.Visible := True;
//    RzLabel10.Font.Color := clRed;   //clWindowText
//    RzLabel7.Visible := True;
//    RzLabel7.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
//    RzNumericEdit_FollowPersonCount_End.Visible := true;
//
//
//    RzLabel11.Visible := True;
//    RzLabel11.Font.Color := clRed;   //clWindowText
//    RzLabel8.Visible := True;
//    RzLabel8.Font.Color := clRed;   //clWindowText
//    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
//    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
//  end;
  2:  //关键字
  begin
    SpinEditTotalThread.Visible := True;
    RzEdit1.Visible := False;
    RzEdit_BarName.Visible := True;
    RzMemo_BarName.Visible := True;

    RzEdit_Topic.Visible := False;
    RzMemo_Topic.Visible := False;

    RzEdit_Content.Visible := False;
    RzMemo_Content.Visible := False;

    RzEdit_TopicContent.Visible := True;
    RzMemo_TopicCotent.Visible := True;

    RzEditADD.Visible := False;
    RzMemoAdd.Visible := False;

    RzEditsubstract.Visible := False;
    RzMemoSubtract.Visible := False;


    RzEdit2.Visible := False;
    RzEdit_ValidCount.Visible := False;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clRed;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clRed;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clWindowText;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clWindowText;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clWindowText;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
  end;
  1:   //贴子ID
  begin
    SpinEditTotalThread.Visible := False;
    RzEdit1.Visible := False;
    RzEdit_BarName.Visible := False;
    RzMemo_BarName.Visible := False;

    RzEdit_Topic.Visible := False;
    RzMemo_Topic.Visible := False;

    RzEdit_Content.Visible := False;
    RzMemo_Content.Visible := False;

    RzEdit_TopicContent.Visible := False;
    RzMemo_TopicCotent.Visible := False;

    RzEditADD.Visible := True;
    RzMemoAdd.Visible := True;

    RzEditsubstract.Visible := False;
    RzMemoSubtract.Visible := False;


    RzEdit2.Visible := False;
    RzEdit_ValidCount.Visible := False;

    RzCheckBox_2FloorVacancy.Visible := True;
    RzCheckBox_2FloorVacancy.Font.Color := clRed;   //clWindowText


    RzLabel5.Visible := True;
    RzLabel5.Font.Color := clRed;   //clWindowText
    RzLabel6.Visible := True;
    RzLabel6.Font.Color := clRed;   //clWindowText
    RzNumericEdit_ReplyCount_Begin.Visible := True;
    RzNumericEdit_ReplyCount_End.Visible := True;


    RzLabel12.Visible := True;
    RzLabel12.Font.Color := clRed;   //clWindowText
    RzNumericEdit_RecentDayNum.Visible := True;


    RzLabel10.Visible := True;
    RzLabel10.Font.Color := clRed;   //clWindowText
    RzLabel7.Visible := True;
    RzLabel7.Font.Color := clRed;   //clWindowText
    RzNumericEdit_FollowPersonCount_Begin.Visible := True;
    RzNumericEdit_FollowPersonCount_End.Visible := true;


    RzLabel11.Visible := True;
    RzLabel11.Font.Color := clRed;   //clWindowText
    RzLabel8.Visible := True;
    RzLabel8.Font.Color := clRed;   //clWindowText
    RzNumericEdit_TieBaPostTotalCount_Begin.Visible := True;
    RzNumericEdit_TieBaPostTotalCount_End.Visible := true;
  end;

  end;
end;

procedure TFormSetPlanScheme.RzComboBoxLoginAccountChange(Sender: TObject);
begin
  if RzComboBoxLoginAccount.ItemIndex >= 0 then
    Linsh_ChoosedAccount := Trim(RzComboBoxLoginAccount.Items[RzComboBoxLoginAccount.ItemIndex])
  else
    Linsh_ChoosedAccount := '';
end;

procedure TFormSetPlanScheme.RzEdit1DblClick(Sender: TObject);
var
  TheCopyTableAct: TGetMaxDateInDataBase;
  VarHint: string;
  AATProxyEX: TInstActionProxy;

 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 I: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;
begin
  //initializeSqliteHardwareTable;

       suDBNameList := TStringList.Create;

       try
             SourceFileDir := APPCommonPath + relativePasth;

             found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

             while found=0 do
             begin
                 if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                 and (SearchRec.Attr<>faDirectory)
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


            VarHint := RzEdit1.Hint;
            RzEdit1.Text := '';
            RzEdit1.Hint := '';
            RzEdit1.TextHint := '';
            //HandleWaitings.iniWaiting(sender);

            AATProxyEX := TInstActionProxy.create;
            AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
            AATProxyEX.StartWork; //开始工作
            with THandleWaitings.create(100) do
            try
              iniWaiting(sender);

              for I := 0 to suDBNameListCount - 1 do
              begin
                Application.ProcessMessages;
                TheCopyTableAct := TGetMaxDateInDataBase.create;
                TheCopyTableAct.iSerialNo := I;
                TheCopyTableAct.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[I]);
                AATProxyEX.AddAction(TheCopyTableAct);
              end;
              AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



              NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
              SetLength(MaxCreatetimeList, 0);
              RzEdit1.Text := FormatDateTime('YYYY-MM-DD hh:mm', NewestDateTimeInDB);



            finally
              finalWaiting;
              //HandleWaitings.Free;

              RzEdit1.Hint := VarHint;
              RzEdit1.TextHint := VarHint;
              AATProxyEX.Free;
            end;
       finally
            suDBNameList.Free;
       end;


       //finalizeSqliteHardwareTable;
end;

procedure TFormSetPlanScheme.RzEdit2DblClick(Sender: TObject);
var
  TheCopyTableAct1: TGetMaxDateInDataBase;
  TheCopyTableAct: TGetQualifiedRecordCount;
  VarHint: string;
  AATProxyEX: TInstActionProxy;
 SearchRec:TSearchRec;
 found:integer;
 suDBName: string;
 suDBNameListCount: Integer;
 I: Integer;

  suDBNameList: TStringList;
  SourceFileDir: string;
begin
  //initializeSqliteHardwareTable;

    suDBNameList := TStringList.Create;


            FormSetPlanScheme.RzMemoAdd.Enabled := False;
            FormSetPlanScheme.RzEditADD.Enabled := False;

            FormSetPlanScheme.RzMemoSubtract.Enabled := False;
            FormSetPlanScheme.RzEditsubstract.Enabled := False;


            FormSetPlanScheme.RzMemo_BarName.Enabled := False;
            FormSetPlanScheme.RzEdit_BarName.Enabled := False;


            FormSetPlanScheme.RzMemo_Topic.Enabled := False;
            FormSetPlanScheme.RzEdit_Topic.Enabled := False;


            FormSetPlanScheme.RzMemo_Content.Enabled := False;
            FormSetPlanScheme.RzEdit_Content.Enabled := False;


            FormSetPlanScheme.RzMemo_TopicCotent.Enabled := False;
            FormSetPlanScheme.RzEdit_TopicContent.Enabled := False;


            FormSetPlanScheme.RzCheckBox_2FloorVacancy.Enabled := False;
            FormSetPlanScheme.RzNumericEdit_RecentDayNum.Enabled := False;


            FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Enabled := False;
            FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Enabled := False;

            FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Enabled := False;
            FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Enabled := False;


            FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Enabled := False;
            FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Enabled := False;

    try
             SourceFileDir := APPCommonPath + relativePasth;

             found:=FindFirst(SourceFileDir+'*.*',faAnyFile,SearchRec);

             while found=0 do
             begin
                 if (SearchRec.Name<>'.')  and (SearchRec.Name<>'..')
                 and (SearchRec.Attr<>faDirectory)
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



            VarHint := RzEdit2.Hint;
            RzEdit_ValidCount.Text := RzEdit2.Text;
            RzEdit2.Text := '';
            RzEdit2.Hint := '';
            RzEdit2.TextHint := '';



            AATProxyEX := TInstActionProxy.create;
            AATProxyEX.BldThreadPool(suDBNameListCount); //创建6个线程用来加载表   55    90    120
            AATProxyEX.StartWork; //开始工作
            with THandleWaitings.create(100) do
            try
                iniWaiting(sender);

                for I := 0 to suDBNameListCount - 1 do
                begin
                  Application.ProcessMessages;
                  TheCopyTableAct1 := TGetMaxDateInDataBase.create;
                  TheCopyTableAct1.iSerialNo := I;
                  TheCopyTableAct1.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[I]);
                  AATProxyEX.AddAction(TheCopyTableAct1);
                end;
                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;



                NewestDateTimeInDB :=  GetMaxValueFromArray(MaxCreatetimeList);
                SetLength(MaxCreatetimeList, 0);







            //  //HandleWaitings.
            //
            //  AATProxyEX := TInstActionProxy.create;
            //  AATProxyEX.BldThreadPool(1); //创建6个线程用来加载表   55    90    120
            //  AATProxyEX.StartWork; //开始工作
            //  with THandleWaitings.create(100) do
            //  try
            //    iniWaiting(sender);

               SetLength(FullFilledRecordCountsList, suDBNameListCount);


                for I := 0 to suDBNameListCount - 1 do
                begin
                  Application.ProcessMessages;
                  TheCopyTableAct := TGetQualifiedRecordCount.create;
                  TheCopyTableAct.iSerialNo := I;
                  TheCopyTableAct.WenJianMingPath := SourceFileDir + Trim(suDBNameList.Strings[I]);
                  AATProxyEX.AddAction(TheCopyTableAct);
                end;

                AATProxyEX.WaitforThreadsFinishedWithProcessMsg;

                QualifiedRecordCount := GetSumValueFromArray(FullFilledRecordCountsList);
                SetLength(FullFilledRecordCountsList, 0);

                RzEdit2.Text := IntToStr(QualifiedRecordCount);
            finally
                finalWaiting;
                //HandleWaitings.Free;

                RzEdit2.Hint := VarHint;
                RzEdit2.TextHint := VarHint;
                AATProxyEX.Free;
            end;
    finally

            suDBNameList.Free;












              FormSetPlanScheme.RzMemo_BarName.Enabled := True;
              FormSetPlanScheme.RzEdit_BarName.Enabled := True;


              FormSetPlanScheme.RzMemo_Topic.Enabled := True;
              FormSetPlanScheme.RzEdit_Topic.Enabled := True;


              FormSetPlanScheme.RzMemo_Content.Enabled := True;
              FormSetPlanScheme.RzEdit_Content.Enabled := True;


              FormSetPlanScheme.RzMemo_TopicCotent.Enabled := True;
              FormSetPlanScheme.RzEdit_TopicContent.Enabled := True;


              FormSetPlanScheme.RzCheckBox_2FloorVacancy.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_RecentDayNum.Enabled := True;


              FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Enabled := True;

              FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Enabled := True;


              FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Enabled := True;


              FormSetPlanScheme.RzMemoAdd.Enabled := True;
              FormSetPlanScheme.RzEditADD.Enabled := True;

              FormSetPlanScheme.RzMemoSubtract.Enabled := True;
              FormSetPlanScheme.RzEditsubstract.Enabled := True;
    end;
end;

procedure TFormSetPlanScheme.RzEdit3Change(Sender: TObject);
begin
  Linsh_PlanScheme_ValidCount := IntToStr(strtointdef(Trim((Sender as TRzEdit).Text), 0));
end;

procedure TFormSetPlanScheme.RzEditADDChange(Sender: TObject);
begin
//    Linsh_PlanScheme_Add: string;
//    Linsh_PlanScheme_Substract: string;
  RzEditEventChange(Sender, RzMemoadd, Linsh_PlanScheme_Add);
end;

procedure TFormSetPlanScheme.RzEditEventChange(Sender: TObject; var MapMemo: TRzMemo; var MapString: string);
var
  Linshi_Stringlist: TStringList;
  P: TNotifyEvent;
  i: Integer;
begin

  P := MapMemo.OnChange;
  MapMemo.OnChange := nil;
  try
    MapString := Trim((Sender as TRzEdit).Text);
    Linshi_Stringlist := TStringList.Create;
    try
      MapMemo.Clear;
      if MapString <> '' then
      begin
        Linshi_Stringlist.Delimiter := '|';
        Linshi_Stringlist.DelimitedText := MapString;

        for I := 0 to Linshi_Stringlist.Count - 1 do
        begin
          MapMemo.Lines.Add(Linshi_Stringlist.Strings[I]);
        end;
      end;
    finally
      Linshi_Stringlist.Free;
    end;
  finally
    MapMemo.OnChange := P;
  end;

end;

procedure TFormSetPlanScheme.RzEditsubstractChange(Sender: TObject);
begin
//    Linsh_PlanScheme_Add: string;
//    Linsh_PlanScheme_Substract: string;
  RzEditEventChange(Sender, RzMemoSubtract, Linsh_PlanScheme_Substract);
end;

procedure TFormSetPlanScheme.RzEdit_BarNameChange(Sender: TObject);
begin
  RzEditEventChange(Sender, RzMemo_BarName, Linsh_PlanScheme_BarName);
end;

procedure TFormSetPlanScheme.RzEdit_ContentChange(Sender: TObject);
begin
  RzEditEventChange(Sender, RzMemo_Content, Linsh_PlanScheme_Content);
end;

procedure TFormSetPlanScheme.RzEdit_TopicChange(Sender: TObject);
begin
  RzEditEventChange(Sender, RzMemo_Topic, Linsh_PlanScheme_Topic);
end;

procedure TFormSetPlanScheme.RzEdit_TopicContentChange(Sender: TObject);
begin
  RzEditEventChange(Sender, RzMemo_TopicCotent, Linsh_PlanScheme_TopicContent);
end;

procedure TFormSetPlanScheme.RzEdit_ValidCount1Change(Sender: TObject);
begin
  Linsh_PlanScheme_ValidCount := IntToStr(strtointdef(Trim(RzEdit_ValidCount1.Text), 0));
end;

procedure TFormSetPlanScheme.RzMemoAddChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEditADD, Linsh_PlanScheme_Add);
end;

procedure TFormSetPlanScheme.RzMemoAddKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  A, B: Int64;
  procedure AddContent(smallo, bigo: Int64);
  var
    j: Int64;
  begin
    RzMemoAdd.Clear;
    RzEditADD.Text := '';
    for j := smallo to bigo do
    begin
      RzMemoAdd.Lines.Add(IntToStr(j));
    end;
  end;
begin
  if (Key = 65) and (ssCtrl in Shift) then
  begin
    if RzMemoAdd.Lines.Count = 2 then
    begin
      A := StrToInt64Def(RzMemoAdd.Lines[0], 0);
      B := StrToInt64Def(RzMemoAdd.Lines[1], 0);
      if (A > 100000000) and (B > 100000000) then
      begin
        if A > B then
        begin
          AddContent(B, A);
        end
        else
        if A < B then
        begin
          AddContent(A, B);
        end;
      end;

    end;
  end
  else
  if (Key = 66) and (ssCtrl in Shift) then
  begin
    RzMemoAdd.Clear;
    RzEditADD.Text := '';
  end;

end;

procedure TFormSetPlanScheme.RzMemoEventChange(Sender: TObject; var MapEdit: TRzEdit; var MapString: string);
var
  Linshi_Stringlist: TStringList;
  P: TNotifyEvent;
  Linshi_Memo: TRzMemo;
  Linshi_Memostr: string;
begin

  P := MapEdit.OnChange;
  MapEdit.OnChange := nil;
  try
    Linshi_Stringlist := TStringList.Create;
    try
      Linshi_Memo := Sender as TRzMemo;
      Linshi_Memostr := Trim(Linshi_Memo.Text);

      if Linshi_Memostr = '' then
      begin
        MapEdit.Text := '';
        MapString := '';
      end
      else
      begin
        Linshi_Stringlist.Text := Linshi_Memostr;
        Linshi_Stringlist.Delimiter := '|';
        MapEdit.Text := Linshi_Stringlist.DelimitedText;
        MapString := Trim(MapEdit.Text);
      end;
    finally
      Linshi_Stringlist.Free;
    end;
  finally
    MapEdit.OnChange := P;
  end;

end;

procedure TFormSetPlanScheme.RzMemoSubtractChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEditsubstract, Linsh_PlanScheme_Substract);
end;

procedure TFormSetPlanScheme.RzMemo_BarNameChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEdit_BarName, Linsh_PlanScheme_BarName);
end;

procedure TFormSetPlanScheme.RzMemo_ContentChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEdit_Content, Linsh_PlanScheme_Content);
end;

procedure TFormSetPlanScheme.RzMemo_TopicChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEdit_Topic, Linsh_PlanScheme_Topic);
end;

procedure TFormSetPlanScheme.RzMemo_TopicCotentChange(Sender: TObject);
begin
  RzMemoEventChange(Sender, RzEdit_TopicContent, Linsh_PlanScheme_TopicContent);
end;

procedure TFormSetPlanScheme.RzNumericEdit_RecentDayNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['-'] then
    Key := #0;
end;

procedure TFormSetPlanScheme.SaveDingTieContentConfig;
var
  sSQL: string;
  i: Integer;
begin
  EnterCriticalSection(CS);
  sldb.BeginTransaction;
  try
    SaveOneConfig(i_PlanScheme_index);
  finally
    sldb.Commit;
  end;
  LeaveCriticalSection(CS);
end;

procedure TFormSetPlanScheme.SaveOneConfig(tiezi_index: Integer);
var
  sSQL: AnsiString;
  P_sSQL: PAnsiChar;
begin
  sSQL := 'update PlanScheme_Config set ' +
  'PlanScheme_ValidCount=' + QuotedStr(Linsh_PlanScheme_ValidCount) + ', ' +
  'PlanScheme_BarName=' + QuotedStr(Linsh_PlanScheme_BarName) + ', ' +
  'PlanScheme_Topic=' + QuotedStr(Linsh_PlanScheme_Topic) + ', ' +
  'PlanScheme_Content=' + QuotedStr(Linsh_PlanScheme_Content) + ', ' +
  'PlanScheme_TopicContent=' + QuotedStr(Linsh_PlanScheme_TopicContent) +  ', ' +
  'Control2FloorVacancy=' + BoolToStr(RzCheckBox_2FloorVacancy.Checked) +  ', ' +
  'LastHowManyDays=' + FloatToStr(RzNumericEdit_RecentDayNum.Value) +  ', ' +
  'ReplyCountBegin=' + FloatToStr(RzNumericEdit_ReplyCount_Begin.Value) +  ', ' +
  'ReplyCountEnd=' + FloatToStr(RzNumericEdit_ReplyCount_End.Value) +  ', ' +
  'FollowPopulationBegin=' + FloatToStr(RzNumericEdit_FollowPersonCount_Begin.Value) + ', ' +
  'FollowPopulationEnd=' + FloatToStr(RzNumericEdit_FollowPersonCount_End.Value) +   ', ' +
  'TieBaPostTotalBegin=' + FloatToStr(RzNumericEdit_TieBaPostTotalCount_Begin.Value) +  ', ' +
  'TieBaPostTotalEnd=' + FloatToStr(RzNumericEdit_TieBaPostTotalCount_End.Value) +  ', ' +
  'dingtie_type=' + IntToStr(G_DingTie_Content_Type) +  ', ' +
  'dingtie_content=' + QuotedStr(G_DingTie_Content) +  ', ' +
  'ADDTiezi=' + QuotedStr(Linsh_PlanScheme_Add) +  ', ' +
  'SubstractTiezi=' + QuotedStr(Linsh_PlanScheme_Substract) +  ', ' +

  //'OnlyForWechat=' + ifthen(RzCheckBoxOnlyForWechat.Checked, '1', '0') +  ', ' +

  'OnlyForWechat=' + Linsh_PlanScheme_StartPostId +  ', ' +
  'DownloadorOffline=' + Linsh_PlanScheme_DownloadorOffline +  ', ' +
  'TotalThreadForDownloadMode=' + Linsh_PlanScheme_ThreadCForOnlineSearch +  ', ' +
  //'OnlyForWechat=' +  IntToStr(StrToInt64Def(Trim(SpinEditStartPostId.Text), 0)) +  ', ' +
  //Trim(SpinEditStartPostId.Text) +  ', ' +

  'OnlyMainFloor=' + ifthen(RzCheckBoxOnlyMainFloor.Checked, '1', '0') +  ', ' +

//Linsh_PlanScheme_DownloadorOffline

  'ChoosedAccount=' + QuotedStr(Linsh_ChoosedAccount) +
  ' where PlanScheme_index=' + IntToStr(tiezi_index);
  P_sSQL := PAnsiChar(sSQL);
  sldb.ExecSQL(P_sSQL);
end;



procedure TFormSetPlanScheme.SpinEditStartPostIdChange(Sender: TObject);
begin
  Linsh_PlanScheme_StartPostId := IntToStr(StrToInt64Def(Trim(SpinEditStartPostId.Text), 0));
end;

procedure TFormSetPlanScheme.SpinEditTotalThreadChange(Sender: TObject);
begin
Linsh_PlanScheme_ThreadCForOnlineSearch := IntToStr(strtointdef(Trim(SpinEditTotalThread.Text), 1));
end;

{ TGetMaxDateInDataBase }

procedure TGetMaxDateInDataBase.Operate;
var
  slDBpath: string;
  Linshi_String: string;


  UniConnectionsubdb: TUniConnection;
  UniQuerysubdb: TUniQuery;
begin
  inherited;
//       iSerialNo: Integer;
//      WenJianMingPath: string;

    //slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
    slDBpath := WenJianMingPath;
    UniConnectionsubdb := TUniConnection.Create(nil);

    Linshi_String := 'Provider Name=SQLite;';
    Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
    Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
    Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
    Linshi_String := Linshi_String + 'Use Unicode=false;';
    Linshi_String := Linshi_String + 'Login Prompt=False';

    UniConnectionsubdb.ConnectString := Linshi_String;

    UniConnectionsubdb.Password := 'SYNCHRONOUSNORMAL';

    UniConnectionsubdb.Connected := True;
    UniConnectionsubdb.Connected := False;

    UniQuerysubdb := TUniQuery.Create(nil);
    UniQuerysubdb.Connection := UniConnectionsubdb;

    MaxCreatetimeList[iSerialNo] := MyStringtoDateTime(Uniquerystring
    (UniQuerysubdb, 'select max(createtime) from SeeLiangTieziList'));

    UniQuerysubdb.Connection := nil;
    UniQuerysubdb.Free;

    UniConnectionsubdb.Free;
end;

{ TGetQualifiedRecordCount }

procedure TGetQualifiedRecordCount.Operate;
var
  Linsh_str: string;
  i, strCount: Integer;
  LishiIdex: Integer;
  LogicSymbol: string;
  bHighVague: Boolean;
  LogicSymbolLeng: Integer;
  BasestrSQL: string;
  strSQL: string;     //sldbDugInfo
  strSQLSingle: string;
//  sldbDugInfotb: TSQLiteTable;
//  sldbDugInfotbEX: TSQLiteTable;


  linsh_content: string;
  linsh_content1, linsh_content2, linsh_content3, linsh_content4,linsh_content5: string;
  LinshiRiQi: TDateTime;
  LinshiRiQi_String: string;
  LinshiTianShu: Integer;



  slDBpath: string;
  Linshi_String: string;


  UniConnectionsubdb: TUniConnection;
  UniQuerysubdb: TUniQuery;
begin
  inherited;
//       iSerialNo: Integer;
//      WenJianMingPath: string;

    //slDBpath := ExtractFilepath(application.exename) + 'SaveDugInfo.db3';
    slDBpath := WenJianMingPath;
    UniConnectionsubdb := TUniConnection.Create(nil);

    Linshi_String := 'Provider Name=SQLite;';
    Linshi_String := Linshi_String + 'Database=' + slDBpath + ';';
    Linshi_String := Linshi_String + 'Encryption Key=SYNCHRONOUSNORMAL;';
    Linshi_String := Linshi_String + 'Client Library=' + sqlitedllpath + ';';
    Linshi_String := Linshi_String + 'Use Unicode=false;';
    Linshi_String := Linshi_String + 'Login Prompt=False';

    UniConnectionsubdb.ConnectString := Linshi_String;

    UniConnectionsubdb.Password := 'SYNCHRONOUSNORMAL';

    UniConnectionsubdb.Connected := True;
    UniConnectionsubdb.Connected := False;

    UniQuerysubdb := TUniQuery.Create(nil);
    UniQuerysubdb.Connection := UniConnectionsubdb;


    try






            try

                BasestrSQL := 'select count(1) from SeeLiangTieziList where 1=1 ';


                strSQL := '';
                strCount := FormSetPlanScheme.RzMemoSubtract.Lines.Count;
                if strCount > 0 then
                begin
                  for I := 0 to strCount - 1 do
                  begin
                    Linsh_str :=  Trim(FormSetPlanScheme.RzMemoSubtract.Lines[i]);
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
                strCount := FormSetPlanScheme.RzMemo_BarName.Lines.Count;
                if strCount > 0 then
                begin
                  LishiIdex := FormSetPlanScheme.RzMemo_BarName.Lines.IndexOf('%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    strSQL := strSQL + ' or (TieBaName<>'''')';
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end
                  else
                  begin
                    LishiIdex := FormSetPlanScheme.RzMemo_BarName.Lines.IndexOf('%%%%%%');
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

                    LishiIdex := FormSetPlanScheme.RzMemo_BarName.Lines.IndexOf('%%%%%%%');
                    if LishiIdex >= 0 then
                    begin
                      bHighVague := True;
                    end
                    else
                    begin
                      bHighVague := False;
                    end;


                    for I := 0 to strCount - 1 do
                    begin
                      Linsh_str :=  Trim(FormSetPlanScheme.RzMemo_BarName.Lines[i]);
                      if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                      begin
                        if bHighVague then
                          strSQLSingle := '(TieBaName like "' + TranslateIntoHighVague(Linsh_str) + '")'
                        else
                          strSQLSingle := '(TieBaName like "%' + Linsh_str + '%")';
                        strSQL := strSQL + LogicSymbol + strSQLSingle;
                      end;
                    end;
                  end;
                end;
                if strSQL <> '' then
                begin
                  strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
                  BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
                end;



                strSQL := '';
                strCount := FormSetPlanScheme.RzMemo_Topic.Lines.Count;
                if strCount > 0 then
                begin
                    LishiIdex := FormSetPlanScheme.RzMemo_Topic.Lines.IndexOf('%%%%%');
                    if LishiIdex >= 0 then
                    begin
                      strSQL := strSQL + ' or (TitleName<>'''')';
                      LogicSymbol := ' or ';
                      LogicSymbolLeng := 4;
                    end
                    else
                    begin
                      LishiIdex := FormSetPlanScheme.RzMemo_Topic.Lines.IndexOf('%%%%%%');
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

                      LishiIdex := FormSetPlanScheme.RzMemo_Topic.Lines.IndexOf('%%%%%%%');
                      if LishiIdex >= 0 then
                      begin
                        bHighVague := True;
                      end
                      else
                      begin
                        bHighVague := False;
                      end;

                      for I := 0 to strCount - 1 do
                      begin
                        Linsh_str :=  Trim(FormSetPlanScheme.RzMemo_Topic.Lines[i]);
                        if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                        begin
                          if bHighVague then
                            strSQLSingle := '(TitleName like "' + TranslateIntoHighVague(Linsh_str) + '")'
                          else
                            strSQLSingle := '(TitleName like "%' + Linsh_str + '%")';
                          strSQL := strSQL + LogicSymbol + strSQLSingle;
                        end;
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
                strCount := FormSetPlanScheme.RzMemo_Content.Lines.Count;
                if strCount > 0 then
                begin
                  LishiIdex := FormSetPlanScheme.RzMemo_Content.Lines.IndexOf('%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    strSQL := strSQL + ' or (TieZiContent<>'''')';
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end
                  else
                  begin
                    LishiIdex := FormSetPlanScheme.RzMemo_Content.Lines.IndexOf('%%%%%%');
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

                    LishiIdex := FormSetPlanScheme.RzMemo_Content.Lines.IndexOf('%%%%%%%');
                    if LishiIdex >= 0 then
                    begin
                      bHighVague := True;
                    end
                    else
                    begin
                      bHighVague := False;
                    end;
                    for I := 0 to strCount - 1 do
                    begin
                      Linsh_str :=  Trim(FormSetPlanScheme.RzMemo_Content.Lines[i]);
                      if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                      begin
                         if bHighVague then
                            strSQLSingle := '(TieZiContent like "' + TranslateIntoHighVague(Linsh_str) + '")'
                         else
                            strSQLSingle := '(TieZiContent like "%' + Linsh_str + '%")';
                          strSQL := strSQL + LogicSymbol + strSQLSingle;
                      end;
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
                strCount := FormSetPlanScheme.RzMemo_TopicCotent.Lines.Count;
                if strCount > 0 then
                begin
                  LishiIdex := FormSetPlanScheme.RzMemo_TopicCotent.Lines.IndexOf('%%%%%');
                  if LishiIdex >= 0 then
                  begin
                    strSQL := strSQL + ' or (TitleName||TieZiContent<>'''')';
                    LogicSymbol := ' or ';
                    LogicSymbolLeng := 4;
                  end
                  else
                  begin
                    LishiIdex := FormSetPlanScheme.RzMemo_TopicCotent.Lines.IndexOf('%%%%%%');
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

                    LishiIdex := FormSetPlanScheme.RzMemo_TopicCotent.Lines.IndexOf('%%%%%%%');
                    if LishiIdex >= 0 then
                    begin
                      bHighVague := True;
                    end
                    else
                    begin
                      bHighVague := False;
                    end;
                    for I := 0 to strCount - 1 do
                    begin
                      Linsh_str :=  Trim(FormSetPlanScheme.RzMemo_TopicCotent.Lines[i]);
                      if (Linsh_str <> '') and (Linsh_str <> '%%%%%%') and (Linsh_str <> '%%%%%%%') then
                      begin
                         if bHighVague then
                            strSQLSingle := '(TitleName||TieZiContent like "' + TranslateIntoHighVague(Linsh_str) + '")'
                         else
                            strSQLSingle := '(TitleName||TieZiContent like "%' + Linsh_str + '%")';
                          strSQL := strSQL + LogicSymbol + strSQLSingle;
                      end;
                    end;
                  end;
                end;
                if strSQL <> '' then
                begin
                  strSQL := Trim(Copy(strSQL, LogicSymbolLeng + 1, length(strSQL) - LogicSymbolLeng));
                  //strSQL := Trim(Copy(strSQL, 5, length(strSQL) - 4));
                  BasestrSQL := BasestrSQL + ' and (' + strSQL + ') ';
                end;



                if FormSetPlanScheme.RzCheckBox_2FloorVacancy.Checked then
                begin
                  BasestrSQL := BasestrSQL + ' and ((SUBSTR(FloorDetails, 7, 1)="0") or (SUBSTR(FloorDetails, 7, 1)="1")) ';
                end;


                LinshiTianShu := Trunc(FormSetPlanScheme.RzNumericEdit_RecentDayNum.Value);
                if FormSetPlanScheme.RzNumericEdit_RecentDayNum.Value <> 0 then
                begin
//                  NewestDateTimeInDB
//                  if NewestDateTimeInDB = 0 then
//                  begin
//                    NewestDateTimeInDB := MyStringtoDateTime(Uniquerystring(sltb_InUniConnection, 'select max(createtime) from SeeLiangTieziList'));
//                  end;

                  LinshiRiQi := incDay(NewestDateTimeInDB, (0 - LinshiTianShu));
                  LinshiRiQi_String := FormatDateTime('YYYY-MM-DD hh:mm', LinshiRiQi);
                  BasestrSQL := BasestrSQL + ' and (Createtime>=' + QuotedStr(LinshiRiQi_String) + ') ';
                end;


          {

               FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Enabled := True;

              FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Enabled := True;


              FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Enabled := True;
              FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Enabled := True;

          }
               if (FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Value <> 0)
                or (FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Value <> 0)
               then
               begin
                 if (FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (TotalPostForOneTieBa>=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_Begin.Value) + ') ';
                 if (FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (TotalPostForOneTieBa<=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_TieBaPostTotalCount_End.Value) + ') ';
               end;


               if (FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Value <> 0)
                or (FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Value <> 0)
               then
               begin
                 if (FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (FollowCountForOneTieBa>=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_FollowPersonCount_Begin.Value) + ') ';
                 if  (FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (FollowCountForOneTieBa<=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_FollowPersonCount_End.Value) + ') ';
               end;


               if (FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Value <> 0)
                or (FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Value <> 0)
               then
               begin
                 if (FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (FloorCount>=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_ReplyCount_Begin.Value) + ') ';
                 if (FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Value <> 0) then
                 BasestrSQL := BasestrSQL + ' and (FloorCount<=' + FloatToStr(FormSetPlanScheme.RzNumericEdit_ReplyCount_End.Value) + ') ';
               end;

               BasestrSQL := BasestrSQL + ' and (CanReplyOrNot<=0) and (DeleteOrNot<>1)';



          //      if strSQL = '' then
          //      begin
          //        strSQL := 'select count(1) from SeeLiangTieziList';
          //        //sldbDugInfotbEX := sldbDugInfo.GetTable(strSQL);
          //        //QuerySqlInuni(sltb_InUniConnection, strSQL);
          //      end
          //      else
          //      begin
          //        strSQL := Trim(Copy(strSQL, 7, length(strSQL) - 6));
          //        //sldbDugInfotbEX := sldbDugInfo.GetTable(strSQL);
          //        //QuerySqlInuni(sltb_InUniConnection, strSQL);
          //        strSQL := 'select count(1) from (' + strSQL + ')';
          //      end;

                //sltb_InUniConnection1 := sldbDugInfo.GetTable(strSQL);
              //  QuerySqlInuni(sltb_InUniConnection1, strSQL);
              //
                //ShowMessageEX('总共有' + sltb_InUniConnection1.Fields[0].AsString + '条符合条件：');
                //ShowMessageEX('总共有' + IntToStr(sltb_InUniConnection.RecordCount) + '条符合条件：');


              //  sldbDugInfotbEX.MoveFirst;
              //  while not sldbDugInfotbEX.EOF do
              //  begin
              //    linsh_content := sldbDugInfotbEX.FieldAsString(0);
              //    linsh_content1 := sldbDugInfotbEX.FieldAsString(1);
              //    linsh_content2:= sldbDugInfotbEX.FieldAsString(2);
              //    linsh_content3 := sldbDugInfotbEX.FieldAsString(3);
              //    linsh_content4 := sldbDugInfotbEX.FieldAsString(4);
              //    linsh_content5 := sldbDugInfotbEX.FieldAsString(5);
              //    sldbDugInfotbEX.Next;
              //  end;


          //      sltb_InUniConnection.First;
          //      while not sltb_InUniConnection.EOF do
          //      begin
          //        linsh_content := sltb_InUniConnection.Fields[0].AsString;
          //        linsh_content1 := sltb_InUniConnection.Fields[1].AsString;
          //        linsh_content2:= sltb_InUniConnection.Fields[2].AsString;
          //        linsh_content3 := sltb_InUniConnection.Fields[3].AsString;
          //        linsh_content4 := sltb_InUniConnection.Fields[4].AsString;
          //        linsh_content5 := sltb_InUniConnection.Fields[5].AsString;
          //
          //        sltb_InUniConnection.Next;
          //      end;

                //sldbDugInfotb.Free;
                //sldbDugInfotbEX.Free;

          //      QuerySqlInuni(sltb_InUniConnection, strSQL);
          //
          //      FinalQuerySqlInuni(sltb_InUniConnection);
                FullFilledRecordCountsList[iSerialNo] := StrToInt(UniQueryString(UniQuerysubdb, BasestrSQL));
                //QualifiedRecordCount := UniQueryString(sltb_InUniConnection, BasestrSQL);
                //FinalQuerySqlInuni(sltb_InUniConnection1);
            finally


            end;
    finally
            UniQuerysubdb.Connection := nil;
            UniQuerysubdb.Free;

            UniConnectionsubdb.Free;
    end;

end;



end.

