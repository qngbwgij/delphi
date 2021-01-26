object FormModifyTiebaData: TFormModifyTiebaData
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormModifyTiebaData'
  ClientHeight = 228
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 56
    Top = 11
    Width = 48
    Height = 13
    Caption = #36148#21543#21517#65306
  end
  object RzLabel2: TRzLabel
    Left = 56
    Top = 38
    Width = 48
    Height = 13
    Caption = #20851#27880#25968#65306
  end
  object RzLabel3: TRzLabel
    Left = 56
    Top = 65
    Width = 48
    Height = 13
    Caption = #36148#23376#25968#65306
  end
  object RzLabel4: TRzLabel
    Left = 56
    Top = 92
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object RzEdit1: TRzEdit
    Left = 110
    Top = 8
    Width = 121
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 0
    OnDblClick = RzEdit1DblClick
  end
  object RzEdit2: TRzEdit
    Left = 110
    Top = 35
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 1
  end
  object RzEdit3: TRzEdit
    Left = 110
    Top = 62
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 2
  end
  object RzButton1: TRzButton
    Left = 110
    Top = 195
    Caption = #30830#23450
    TabOrder = 3
    OnClick = RzButton1Click
  end
  object RzMemo1: TRzMemo
    Left = 110
    Top = 89
    Width = 185
    Height = 89
    ScrollBars = ssBoth
    TabOrder = 4
  end
end
