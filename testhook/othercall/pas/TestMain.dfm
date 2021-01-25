object frmTestMain: TfrmTestMain
  Left = 0
  Top = 0
  Caption = 'frmTestMain'
  ClientHeight = 450
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 104
    Top = 64
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btn_SetHook: TButton
    Left = 104
    Top = 256
    Width = 75
    Height = 25
    Caption = 'btn_SetHook'
    TabOrder = 1
    OnClick = btn_SetHookClick
  end
  object btn_StopHook: TButton
    Left = 248
    Top = 256
    Width = 75
    Height = 25
    Caption = 'btn_StopHook'
    TabOrder = 2
    OnClick = btn_StopHookClick
  end
  object installKeyProcbutton: TButton
    Left = 416
    Top = 264
    Width = 105
    Height = 25
    Caption = 'installKeyProcbutton'
    TabOrder = 3
    OnClick = installKeyProcbuttonClick
  end
end
