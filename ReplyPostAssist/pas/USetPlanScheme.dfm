object FormSetPlanScheme: TFormSetPlanScheme
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #39030#36148#20869#23481#35774#32622
  ClientHeight = 557
  ClientWidth = 1337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1337
    Height = 557
    Align = alClient
    TabOrder = 0
    object RzLabel5: TRzLabel
      Left = 947
      Top = 123
      Width = 72
      Height = 13
      Caption = #22238#22797#25968#33539#22260#65306
    end
    object RzLabel6: TRzLabel
      Left = 1103
      Top = 123
      Width = 24
      Height = 13
      Caption = #33267#65306
    end
    object RzLabel7: TRzLabel
      Left = 1103
      Top = 163
      Width = 24
      Height = 13
      Caption = #33267#65306
    end
    object RzLabel8: TRzLabel
      Left = 1103
      Top = 211
      Width = 24
      Height = 13
      Caption = #33267#65306
    end
    object RzLabel10: TRzLabel
      Left = 947
      Top = 163
      Width = 72
      Height = 13
      Caption = #20851#27880#25968#33539#22260#65306
    end
    object RzLabel11: TRzLabel
      Left = 947
      Top = 211
      Width = 72
      Height = 13
      Caption = #36148#23376#25968#33539#22260#65306
    end
    object RzLabel12: TRzLabel
      Left = 809
      Top = 163
      Width = 72
      Height = 13
      Caption = #26368#36817#22810#23569#22825#65306
    end
    object RzLabel9: TRzLabel
      Left = 797
      Top = 253
      Width = 63
      Height = 13
      Caption = #36215#22987#36148#23376'ID:'
    end
    object RzLabel13: TRzLabel
      Left = 665
      Top = 89
      Width = 144
      Height = 13
      Caption = #39044#35745#25104#21151#22238#36148#26465#25968#26368#22810#20026#65306
    end
    object RzLabel14: TRzLabel
      Left = 230
      Top = 9
      Width = 456
      Height = 13
      Caption = #25552#37266#65306#32418#33394#39033#21487#33021#24433#21709#25972#20307#36816#34892#24615#33021#65292#19981#21246#36873#22312#32447#19979#36733#36148#23376#27169#24335#65292#21363#20026#39044#20808#19979#36733#25910#38598#27861
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzEdit_BarName: TRzEdit
      Left = 40
      Top = 46
      Width = 121
      Height = 21
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = #36148#21543#21517#20851#38190#23383
      TextHintVisibleOnFocus = True
      OnChange = RzEdit_BarNameChange
    end
    object RzEdit_Topic: TRzEdit
      Left = 167
      Top = 46
      Width = 121
      Height = 21
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TextHint = #36148#23376#20027#39064#20851#38190#23383
      TextHintVisibleOnFocus = True
      OnChange = RzEdit_TopicChange
    end
    object RzEdit_Content: TRzEdit
      Left = 294
      Top = 46
      Width = 121
      Height = 21
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TextHint = #36148#23376#20869#23481#20851#38190#23383
      TextHintVisibleOnFocus = True
      OnChange = RzEdit_ContentChange
    end
    object RzEdit_TopicContent: TRzEdit
      Left = 421
      Top = 46
      Width = 121
      Height = 21
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TextHint = #36148#23376#20027#39064#20869#23481#20851#38190#23383
      TextHintVisibleOnFocus = True
      OnChange = RzEdit_TopicContentChange
    end
    object RzMemo_BarName: TRzMemo
      Left = 40
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 4
      OnChange = RzMemo_BarNameChange
    end
    object RzMemo_Topic: TRzMemo
      Left = 167
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 5
      OnChange = RzMemo_TopicChange
    end
    object RzMemo_Content: TRzMemo
      Left = 294
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 6
      OnChange = RzMemo_ContentChange
    end
    object RzMemo_TopicCotent: TRzMemo
      Left = 421
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 7
      OnChange = RzMemo_TopicCotentChange
    end
    object RzPanel2: TRzPanel
      Left = 2
      Top = 298
      Width = 1333
      Height = 257
      Align = alBottom
      TabOrder = 8
      object PageControl1: TPageControl
        Left = 2
        Top = 47
        Width = 1329
        Height = 208
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet2: TTabSheet
          Caption = #22266#23450#19968#26465
          ImageIndex = 1
          object Memo_FixeOne: TMemo
            Left = 0
            Top = 41
            Width = 1321
            Height = 139
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
            OnChange = Memo_FixeOneChange
          end
          object RzPanel3: TRzPanel
            Left = 0
            Top = 0
            Width = 1321
            Height = 41
            Align = alTop
            BorderOuter = fsNone
            TabOrder = 1
            object RzLabel1: TRzLabel
              Left = 16
              Top = 14
              Width = 84
              Height = 13
              Caption = #22238#36710#25442#34892#22788#29702#65306
            end
            object RzLabel2: TRzLabel
              Left = 195
              Top = 14
              Width = 84
              Height = 13
              Caption = #20081#30721#25554#20837#22788#29702#65306
            end
            object RzLabel3: TRzLabel
              Left = 379
              Top = 14
              Width = 108
              Height = 13
              Caption = #20081#30721#31354#26684#26367#25442#22788#29702#65306
            end
            object RzLabel4: TRzLabel
              Left = 584
              Top = 16
              Width = 43
              Height = 13
              Caption = 'RzLabel4'
            end
            object RzButtonHandle13And10: TRzButton
              Left = 106
              Top = 10
              Caption = #29983#25104
              TabOrder = 0
              OnClick = RzButtonHandle13And10Click
            end
            object RzButtonHandleMessyCode: TRzButton
              Left = 285
              Top = 10
              Caption = #29983#25104
              TabOrder = 1
              OnClick = RzButtonHandleMessyCodeClick
            end
            object RzButtonReplaceSpace: TRzButton
              Left = 493
              Top = 10
              Caption = #29983#25104
              TabOrder = 2
              OnClick = RzButtonReplaceSpaceClick
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = #38543#26426#25277#21462#19968#34892' '
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Memo_Random: TMemo
            Left = 0
            Top = 0
            Width = 1321
            Height = 180
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheet4: TTabSheet
          Caption = #25353#39034#24207#21462#19968#26465
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Memo_Sequence: TMemo
            Left = 0
            Top = 0
            Width = 1321
            Height = 180
            Align = alClient
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 2
        Top = 2
        Width = 1329
        Height = 45
        Align = alTop
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          #22266#23450#19968#26465
          #38543#26426#25277#21462#19968#34892
          #25353#39034#24207#21462#19968#26465)
        TabOrder = 1
        OnClick = RadioGroup1Click
      end
    end
    object RzCheckBox_2FloorVacancy: TRzCheckBox
      Left = 832
      Top = 122
      Width = 109
      Height = 15
      Caption = #26377#26080#28909#36148'2'#27004#31354#20301
      State = cbUnchecked
      TabOrder = 9
    end
    object RzNumericEdit_RecentDayNum: TRzNumericEdit
      Left = 876
      Top = 160
      Width = 65
      Height = 21
      Hint = #26368#36817#22810#23569#22825
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_ReplyCount_Begin: TRzNumericEdit
      Left = 1016
      Top = 120
      Width = 65
      Height = 21
      Hint = #22238#22797#25968#36215#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_ReplyCount_End: TRzNumericEdit
      Left = 1144
      Top = 120
      Width = 65
      Height = 21
      Hint = #22238#22797#25968#32456#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_FollowPersonCount_Begin: TRzNumericEdit
      Left = 1016
      Top = 160
      Width = 65
      Height = 21
      Hint = #20851#27880#20154#25968#36215#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_FollowPersonCount_End: TRzNumericEdit
      Left = 1144
      Top = 160
      Width = 65
      Height = 21
      Hint = #20851#27880#20154#25968#32456#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_TieBaPostTotalCount_Begin: TRzNumericEdit
      Left = 1016
      Top = 208
      Width = 65
      Height = 21
      Hint = #36148#21543#36148#23376#25968#36215#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit_TieBaPostTotalCount_End: TRzNumericEdit
      Left = 1144
      Top = 208
      Width = 65
      Height = 21
      Hint = #36148#21543#36148#23376#25968#32456#28857
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzEdit1: TRzEdit
      Left = 802
      Top = 208
      Width = 139
      Height = 21
      Hint = #26368#26032#26085#26399#65292#21452#20987#33719#24471
      Text = ''
      Color = clInfoBk
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 17
      TextHint = #26368#26032#26085#26399#65292#21452#20987#33719#24471
      TextHintVisibleOnFocus = True
      OnDblClick = RzEdit1DblClick
    end
    object RzEdit2: TRzEdit
      Left = 1087
      Top = 46
      Width = 122
      Height = 21
      Hint = #31526#21512#26465#20214#30340#24635#25968#65292#21452#20987#33719#24471
      Text = ''
      Color = clInfoBk
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 18
      TextHint = #31526#21512#26465#20214#30340#24635#25968#65292#21452#20987#33719#24471
      TextHintVisibleOnFocus = True
      OnDblClick = RzEdit2DblClick
    end
    object RzEditADD: TRzEdit
      Left = 548
      Top = 46
      Width = 121
      Height = 21
      Hint = #39069#22806#21152#19978#30340#36148#23376
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      TextHint = #39069#22806#21152#19978#30340#36148#23376
      TextHintVisibleOnFocus = True
      OnChange = RzEditADDChange
    end
    object RzEditsubstract: TRzEdit
      Left = 675
      Top = 46
      Width = 121
      Height = 21
      Hint = #39069#22806#19981#35201#30340#36148#23376
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      TextHint = #39069#22806#19981#35201#30340#36148#23376
      TextHintVisibleOnFocus = True
      OnChange = RzEditsubstractChange
    end
    object RzMemoAdd: TRzMemo
      Left = 548
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 21
      OnChange = RzMemoAddChange
      OnKeyDown = RzMemoAddKeyDown
    end
    object RzMemoSubtract: TRzMemo
      Left = 675
      Top = 120
      Width = 121
      Height = 150
      ScrollBars = ssBoth
      TabOrder = 22
      OnChange = RzMemoSubtractChange
    end
    object RzComboBoxLoginAccount: TRzComboBox
      Left = 802
      Top = 46
      Width = 139
      Height = 21
      Hint = #36873#25321#30331#24405#30340#36134#21495
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      TextHint = #36873#25321#30331#24405#30340#36134#21495
      OnChange = RzComboBoxLoginAccountChange
    end
    object RzCheckBoxOnlyMainFloor: TRzCheckBox
      Left = 145
      Top = 8
      Width = 79
      Height = 15
      Caption = #20165#20027#27004#22238#36148
      State = cbUnchecked
      TabOrder = 24
    end
    object RzNumericEditMinTieziID: TRzNumericEdit
      Left = 904
      Top = 6
      Width = 65
      Height = 21
      Hint = #26368#23567#36148#23376'ID'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      TextHint = #26368#23567#36148#23376'ID'
      Visible = False
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEditMaxTieziID: TRzNumericEdit
      Left = 1008
      Top = 6
      Width = 65
      Height = 21
      Hint = #26368#22823#36148#23376'ID'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 26
      TextHint = #26368#22823#36148#23376'ID'
      Visible = False
      OnKeyPress = RzNumericEdit_RecentDayNumKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object RzCheckBoxSaved: TRzCheckBox
      Left = 24
      Top = 8
      Width = 115
      Height = 15
      Caption = #20851#38381#31383#21475#33258#21160#20445#23384
      Checked = True
      State = cbChecked
      TabOrder = 27
    end
    object RzButtonChooseBaname: TRzButton
      Left = 40
      Top = 82
      Caption = #36873#25321#36148#21543#21517
      Color = clYellow
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      HotTrack = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 28
      OnClick = RzButtonChooseBanameClick
    end
    object SpinEditStartPostId: TRzEdit
      Left = 858
      Top = 249
      Width = 83
      Height = 21
      Hint = #36215#22987#36148#23376'ID'
      Text = '100000'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 29
      TextHint = #36215#22987#36148#23376'ID'
      TextHintVisibleOnFocus = True
      OnChange = SpinEditStartPostIdChange
    end
    object RzCheckBoxDownload: TRzCheckBox
      Left = 947
      Top = 251
      Width = 115
      Height = 15
      Caption = #22312#32447#19979#36733#36148#23376#27169#24335
      State = cbUnchecked
      TabOrder = 30
      OnClick = RzCheckBoxDownloadClick
    end
    object RzComboBoxDownloadMode: TRzComboBox
      Left = 1070
      Top = 249
      Width = 106
      Height = 21
      Style = csDropDownList
      TabOrder = 31
      Text = #22823#38754#31215#25746#32593#27861
      OnChange = RzComboBoxDownloadModeChange
      Items.Strings = (
        #22823#38754#31215#25746#32593#27861
        #22312#32447#23454#26102#19979#36733#27861)
      ItemIndex = 0
    end
    object SpinEditTotalThread: TSpinEdit
      Left = 1176
      Top = 249
      Width = 65
      Height = 22
      Hint = #24635#32447#31243#25968
      MaxValue = 200
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
      Value = 1
      OnChange = SpinEditTotalThreadChange
    end
    object RzEdit_ValidCount: TRzEdit
      Left = 959
      Top = 46
      Width = 122
      Height = 21
      Text = ''
      Color = clInfoBk
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 33
      TextHintVisibleOnFocus = True
    end
    object RzEdit_ValidCount1: TRzEdit
      Left = 802
      Top = 85
      Width = 121
      Height = 21
      Text = ''
      ParentShowHint = False
      ShowHint = True
      TabOrder = 34
      TextHint = #39044#35745#21457#36148#26465#25968
      TextHintVisibleOnFocus = True
      OnChange = RzEdit_ValidCount1Change
    end
  end
end
