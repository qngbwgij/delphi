unit USetDingTie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, RzGrids, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, SQLiteTable3, UPublic;

type
  TFormSetDingTie = class(TForm)
    RadioGroup1: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo_Random: TMemo;
    Memo_FixeOne: TMemo;
    TabSheet4: TTabSheet;
    Memo_Sequence: TMemo;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    G_DingTie_Content: string;
    procedure SaveDingTieContentConfig;
    procedure SaveOneConfig(tiezi_index: Integer; dingtie_type: Integer; dingtie_content: string);
  public
    { Public declarations }
  end;

var
  FormSetDingTie: TFormSetDingTie;

implementation

{$R *.dfm}

procedure TFormSetDingTie.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
//  if Trim(Memo1.Text) <> '' then
//  begin
//    ListForRandomize.Clear;
//    for I := 0 to Memo1.Lines.Count - 1 do
//    begin
//      if Trim(Memo1.Lines[i]) <> '' then
//
//      ListForRandomize.Add(Trim(Memo1.Lines[i]));
//    end;
//  end;
//
//  if Trim(Memo2.Text) <> '' then
//  begin
//    ListForQuence.Clear;
//    for I := 0 to Memo2.Lines.Count - 1 do
//    begin
//     if Trim(Memo2.Lines[i]) <> '' then
//
//      ListForQuence.Add(Trim(Memo2.Lines[i]));
//    end;
//  end;
//
//  FixOne := Trim(Memo3.Text);

  if G_DingTie_Content = '' then
    Exit;
  SaveDingTieContentConfig;
end;

procedure TFormSetDingTie.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
  linshiList: TStringList;
begin
  G_DingTie_Content := '';

  linshiList := TStringList.Create;

  try

    case RadioGroup1.ItemIndex of
      0:
        begin
          G_DingTie_Content := Trim(Memo_FixeOne.Text);
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
                linshiList.Add(Trim(Memo_Random.Lines[i]));
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
                linshiList.Add(Trim(Memo_Sequence.Lines[i]));
              end;
            end;
            G_DingTie_Content := Trim(linshiList.Text);
          end;
        end;
    else
      begin
        ShowMessageEX('还未选择顶贴类别！');
        CanClose := False;
      end;

    end;

    if G_DingTie_Content = '' then
    begin
      if i_tiezi_index = -1 then
      begin
        ShowMessageEX('全局顶贴内容无法设置生效，因为顶贴内容为空！');
        CanClose := True;
      end
      else
      begin
        ShowMessageEX('顶贴内容为空！');
        CanClose := False;
      end;
    end
    else
      CanClose := True;

  finally
    linshiList.Free;
  end;
end;

procedure TFormSetDingTie.FormShow(Sender: TObject);
var
  ChoosedContentType_index: string;
  DingTie_ContentList: string;
  sSQL: string;
begin
  //RadioGroup1Click(nil);
  if i_tiezi_index <> -1 then
  begin
    begin
      sSQL := 'SELECT dingtie_type, dingtie_content FROM DingTie_Config  where tiezi_index=' + IntToStr(i_tiezi_index);

      QueryStringEX(sSQL, ChoosedContentType_index, DingTie_ContentList);
      RadioGroup1.ItemIndex := StrToInt(ChoosedContentType_index);
      PageControl1.ActivePageIndex := StrToInt(ChoosedContentType_index);
      case PageControl1.ActivePageIndex of
        0:
          begin
            Memo_FixeOne.Text := DingTie_ContentList;
          end;
        1:
          begin
            Memo_Random.Text := DingTie_ContentList;
          end;
        2:
          begin
            Memo_Sequence.Text := DingTie_ContentList;
          end;
      else
        raise Exception.Create('无法识别的顶贴类型！');
      end;
    end;
  end;
end;

procedure TFormSetDingTie.RadioGroup1Click(Sender: TObject);
begin
//  case RadioGroup1.ItemIndex of
//  0:
//  begin
//    ChoosedContentType := cctRandomOne;
//  end;
//  1:
//  begin
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

procedure TFormSetDingTie.SaveDingTieContentConfig;
var
  sSQL: string;
  i: Integer;
begin
  EnterCriticalSection(CS);
  sldb.BeginTransaction;
  try
    if i_tiezi_index = -1 then
    begin
      for i := 0 to TieZi_MaxCount - 1 do
      begin
        SaveOneConfig(i, RadioGroup1.ItemIndex, G_DingTie_Content)
      end;
    end
    else
    begin
      SaveOneConfig(i_tiezi_index, RadioGroup1.ItemIndex, G_DingTie_Content)
    end;

  finally
    sldb.Commit;
  end;
  LeaveCriticalSection(CS);
end;

procedure TFormSetDingTie.SaveOneConfig(tiezi_index, dingtie_type: Integer; dingtie_content: string);
var
  sSQL: AnsiString;
  P_sSQL: PAnsiChar;
begin
  sSQL := 'update DingTie_Config set dingtie_type=' + IntToStr(dingtie_type) + ', dingtie_content=' + QuotedStr(dingtie_content) + ' where tiezi_index=' + IntToStr(tiezi_index);
  P_sSQL := PAnsiChar(sSQL);
  sldb.ExecSQL(P_sSQL);
end;

end.

