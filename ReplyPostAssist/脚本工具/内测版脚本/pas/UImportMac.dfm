object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #27491#24335#29256#35746#21333#22635#20805
  ClientHeight = 428
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 8
    Top = 258
    Width = 84
    Height = 13
    Caption = #38144#21806#31649#29702#36335#24452#65306
  end
  object RzLabel2: TRzLabel
    Left = 8
    Top = 290
    Width = 48
    Height = 13
    Caption = #29992#25143#21517#65306
  end
  object RzLabel3: TRzLabel
    Left = 281
    Top = 290
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object RzButton1: TRzButton
    Left = 8
    Top = 56
    Width = 417
    Caption = #31532#19968#27493#65306#28155#21152#32852#31995#26041#24335#21644#21644#31532#19968#27425#30721
    TabOrder = 0
    OnClick = RzButton1Click
  end
  object RzButton2: TRzButton
    Left = 8
    Top = 211
    Width = 361
    Caption = #31532#19977#27493#65306#28155#21152#29289#29702#22320#22336#21644#36807#26399#26085#26399
    TabOrder = 1
    OnClick = RzButton2Click
  end
  object RzButton3: TRzButton
    Left = 8
    Top = 112
    Width = 417
    Caption = #31532#20108#27493#65306#32500#25252#31532#19968#27425#27491#30830#20449#24687'(LoginTimes)'
    TabOrder = 2
    OnClick = RzButton3Click
  end
  object RzButton4: TRzButton
    Left = 8
    Top = 380
    Width = 185
    Caption = #25152#26377#36148#23376#37197#32622#21021#22987#21270#33050#26412'('#20316#24223')'
    Enabled = False
    TabOrder = 3
    Visible = False
    OnClick = RzButton4Click
  end
  object RzButton5: TRzButton
    Left = 224
    Top = 380
    Width = 185
    Caption = #25152#26377#26041#26696#37197#32622#21021#22987#21270#33050#26412
    TabOrder = 4
    Visible = False
    OnClick = RzButton5Click
  end
  object RzEditFirstCode: TRzEdit
    Left = 224
    Top = 16
    Width = 201
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 5
  end
  object RzEditExpiredate: TRzEdit
    Left = 208
    Top = 168
    Width = 161
    Height = 21
    Text = ''
    TabOrder = 6
    OnDblClick = RzEditExpiredateDblClick
  end
  object RzButtonnext: TRzButton
    Left = 448
    Top = 16
    Caption = 'next'
    TabOrder = 7
    OnClick = RzButtonnextClick
  end
  object RzButtonSave: TRzButton
    Left = 8
    Top = 331
    Width = 113
    Caption = #20445#23384#35813#31508#35746#21333
    TabOrder = 8
    OnClick = RzButtonSaveClick
  end
  object RzEditUsername: TRzEdit
    Left = 98
    Top = 287
    Width = 177
    Height = 21
    Text = ''
    TabOrder = 9
  end
  object RzEditRemark: TRzEdit
    Left = 323
    Top = 287
    Width = 372
    Height = 21
    Text = ''
    TabOrder = 10
  end
  object RzEdit1: TRzComboBox
    Left = 8
    Top = 16
    Width = 161
    Height = 21
    TabOrder = 11
  end
  object RzEditSalesManagePath: TRzComboBox
    Left = 98
    Top = 260
    Width = 271
    Height = 21
    TabOrder = 12
  end
  object RzDateTimePicker1: TRzDateTimePicker
    Left = 393
    Top = 168
    Width = 120
    Height = 21
    Date = 43839.872839814820000000
    Format = ''
    Time = 43839.872839814820000000
    DateFormat = dfLong
    ParseInput = True
    TabOrder = 13
    OnChange = RzDateTimePicker1Change
  end
  object RzTimePicker1: TRzDateTimePicker
    Left = 519
    Top = 168
    Width = 80
    Height = 21
    Date = 43839.872839814820000000
    Format = ''
    Time = 43839.872839814820000000
    DateFormat = dfLong
    Kind = dtkTime
    TabOrder = 14
    OnChange = RzDateTimePicker1Change
  end
  object RzEditMacaddr: TRzComboBox
    Left = 8
    Top = 168
    Width = 161
    Height = 21
    TabOrder = 15
  end
  object SQLiteUniProvider1: TSQLiteUniProvider
    Left = 512
    Top = 104
  end
end
