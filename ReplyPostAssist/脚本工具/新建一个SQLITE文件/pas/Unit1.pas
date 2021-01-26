unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, SQLiteTable3;

type
  TForm1 = class(TForm)
    RzButton1: TRzButton;
    RzEdit1: TRzEdit;
    RzMemo1: TRzMemo;
    procedure RzButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.RzButton1Click(Sender: TObject);
var
  TemptDirectory2: string;
  slDataBase: TSQLiteDatabase;
  sSQL: string;
begin
  sSQL := Trim(RzMemo1.Text);
  TemptDirectory2 := Trim(RzEdit1.Text);

                                  if not FileExists(TemptDirectory2) then //DeleteFile(TemptDirectory2);
                                  begin
                                    slDataBase := TSQLiteDatabase.Create(TemptDirectory2);
                                    try
          //                                sSQL :=
          //                                'CREATE TABLE SaveSomeTieziID (' +
          //                                '[TieziID] integer NOT NULL,' +
          //                                '[FileMing] TEXT NOT NULL,' +
          //                                'PRIMARY KEY ([TieziID]));';
//
//                                          sSQL :=
//                                          //'DROP TABLE IF EXISTS SeeLiangTieziList;' +
//                                          'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                          //'CREATE TABLE IF NOT EXISTS SeeLiangTieziList (' +
//                                          '[FloorDetails] TEXT,' +
//                                          '[TieziID] INTEGER NOT NULL,' +
//                                          '[TieBaName] TEXT,' +
//                                          '[TitleName] TEXT,' +
//                                          '[TieZiContent] TEXT,' +
//                                          '[DeleteOrNot] integer NOT NULL,' +
//                                          '[CanReplyOrNot] integer,' +
//                                          '[FloorCount] integer,' +
//                                          '[Createtime] TEXT,' +
//                                          '[FollowCountForOneTieBa] integer,' +
//                                          '[TotalPostForOneTieBa] integer,' +
//                                          '[LastUpdateTime] TEXT,' +
//                                          'PRIMARY KEY ([TieziID]));';



                                          slDataBase.ExecSQL(sSQL);

                                    finally
                                      slDataBase.Free;
                                    end;
                                  end;
end;

end.
