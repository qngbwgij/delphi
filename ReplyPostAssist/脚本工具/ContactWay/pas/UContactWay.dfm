object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 452
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 231
    Align = alClient
    TabOrder = 0
    OnMouseDown = RzPanel1MouseDown
    OnPaint = RzPanel1Paint
    ExplicitWidth = 292
    object RzButton1: TRzButton
      Left = 48
      Top = 103
      Width = 161
      Caption = #35797#29992#29256#28155#21152#32852#31995#26041#24335
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 88
      Top = 192
      ModalResult = 8
      Caption = #20851#38381
      TabOrder = 1
      OnClick = RzButton2Click
    end
    object RzEdit1: TRzEdit
      Left = 48
      Top = 53
      Width = 161
      Height = 21
      Text = ''
      TabOrder = 2
    end
    object RzEditFirstCode: TRzEdit
      Left = 256
      Top = 53
      Width = 161
      Height = 21
      Text = '0000000001'
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 3
    end
  end
end
