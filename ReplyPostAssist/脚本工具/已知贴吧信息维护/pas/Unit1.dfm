object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 432
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 16
    Top = 51
    Width = 72
    Height = 13
    Caption = #28304#25991#20214#30446#24405#65306
  end
  object RzLabel2: TRzLabel
    Left = 16
    Top = 91
    Width = 84
    Height = 13
    Caption = #30446#26631#25991#20214#36335#24452#65306
  end
  object RzStatusPane1: TRzStatusPane
    Left = 0
    Top = 400
    Width = 695
    Height = 32
    Align = alBottom
    Caption = ''
  end
  object rbStart: TRzButton
    Left = 8
    Top = 8
    Width = 185
    Caption = #24320#22987#26356#26032#32500#25252#36148#21543#22522#30784#20449#24687
    TabOrder = 0
    OnClick = rbStartClick
  end
  object RzEditSourceDir: TRzEdit
    Left = 94
    Top = 48
    Width = 499
    Height = 21
    Text = 'D:\'#25968#25454#25991#20214
    TabOrder = 1
  end
  object RzEditObjectPath: TRzEdit
    Left = 94
    Top = 88
    Width = 499
    Height = 21
    Text = 
      'D:\AllProjects\ReplyPostAssitProjectGroup\'#20813#36153#29256'\bin - '#21103#26412'\helloworl' +
      'd.swff'
    TabOrder = 2
  end
  object RzMemo1: TRzMemo
    Left = 0
    Top = 216
    Width = 695
    Height = 184
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object SQLiteUniProvider1: TSQLiteUniProvider
    Left = 288
    Top = 136
  end
end
