object FormSetDingTie: TFormSetDingTie
  Left = 0
  Top = 0
  Caption = #39030#36148#20869#23481#35774#32622
  ClientHeight = 430
  ClientWidth = 714
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 714
    Height = 45
    Align = alTop
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #22266#23450#19968#26465
      #38543#26426#25277#21462#19968#34892
      #25353#39034#24207#21462#19968#26465)
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 45
    Width = 714
    Height = 385
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet2: TTabSheet
      Caption = #22266#23450#19968#26465
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo_FixeOne: TMemo
        Left = 0
        Top = 0
        Width = 706
        Height = 357
        Align = alClient
        TabOrder = 0
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
        Width = 706
        Height = 357
        Align = alClient
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
        Width = 706
        Height = 357
        Align = alClient
        TabOrder = 0
      end
    end
  end
end