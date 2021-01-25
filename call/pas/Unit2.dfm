object Formoniterwindow: TFormoniterwindow
  Left = 0
  Top = 0
  Caption = 'Formoniterwindow'
  ClientHeight = 672
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 168
    Top = 88
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object bSetHook: TButton
    Left = 64
    Top = 296
    Width = 75
    Height = 25
    Caption = 'bSetHook'
    TabOrder = 1
    OnClick = bSetHookClick
  end
  object bCancelHook: TButton
    Left = 168
    Top = 296
    Width = 75
    Height = 25
    Caption = 'bCancelHook'
    TabOrder = 2
    OnClick = bCancelHookClick
  end
  object bReadKeys: TButton
    Left = 302
    Top = 296
    Width = 75
    Height = 25
    Caption = 'bReadKeys'
    TabOrder = 3
    OnClick = bReadKeysClick
  end
  object bClearKeys: TButton
    Left = 424
    Top = 296
    Width = 75
    Height = 25
    Caption = 'bClearKeys'
    TabOrder = 4
    OnClick = bClearKeysClick
  end
  object Panel2: TPanel
    Left = 472
    Top = 77
    Width = 385
    Height = 204
    Caption = 'Panel2'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 96
    Top = 384
    Width = 75
    Height = 25
    Caption = #26816#27979
    TabOrder = 6
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 96
    Top = 424
    Width = 417
    Height = 201
    Lines.Strings = (
      '')
    TabOrder = 7
  end
end
