program Project2;

uses
  Vcl.Forms,
  TestMain in 'pas\TestMain.pas' {frmTestMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestMain, frmTestMain);
  Application.Run;
end.
