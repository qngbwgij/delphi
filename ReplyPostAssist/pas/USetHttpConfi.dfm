object FormSetHttpConfi: TFormSetHttpConfi
  Left = 0
  Top = 0
  Caption = 'FormSetHttpConfi'
  ClientHeight = 452
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 452
    Align = alClient
    TabOrder = 0
    object RzPanel2: TRzPanel
      Left = 2
      Top = 2
      Width = 915
      Height = 41
      Align = alTop
      TabOrder = 0
      ExplicitTop = -2
      object RzComboBoxCookieSource: TRzComboBox
        Left = 152
        Top = 14
        Width = 265
        Height = 21
        TabOrder = 0
        OnChange = RzComboBoxCookieSourceChange
        Items.Strings = (
          #26694#26550#21644#20869#23481#26469#28304#20110#19979#38754#30340#25991#26412
          #26694#26550#26469#28304#20110#19979#38754#30340#25991#26412#65292#20869#23481#26469#28304#20110#26412#22320
          #26694#26550#21644#20869#23481#26469#28304#20110#33050#26412)
      end
    end
    object RzPanelBot: TRzPanel
      Left = 2
      Top = 377
      Width = 915
      Height = 73
      Align = alBottom
      TabOrder = 1
      object RzButtonSave: TRzButton
        Left = 712
        Top = 24
        Caption = #20445#23384
        TabOrder = 0
        OnClick = RzButtonSaveClick
      end
    end
    object RzPanel4: TRzPanel
      Left = 2
      Top = 43
      Width = 915
      Height = 334
      Align = alClient
      TabOrder = 2
      object RzMemoCookieForReplyinMain: TRzMemo
        Left = 2
        Top = 2
        Width = 911
        Height = 311
        Align = alTop
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
