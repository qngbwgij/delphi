program Project1;

uses
  Vcl.Forms,
  Unit1 in 'pas\Unit1.pas' {Form1},
  UGlobalPublic_Function in '..\..\..\..\..\..\..\..\..\Public\UGlobalPublic_Function.pas',
  uThrdPoolClass in '..\..\..\..\..\..\..\..\..\Public\uThrdPoolClass.pas',
  UPublic in '..\..\pas\UPublic.pas',
  UPublicEX in '..\..\pas\UPublicEX.pas',
  ExeStr in '..\..\..\..\..\..\..\..\..\Public\ExeStr.pas',
  main in '..\..\..\..\..\..\..\..\..\Public\main.pas' {MainForm},
  UEncrpt in '..\..\..\..\..\..\..\..\..\Public\UEncrpt.pas',
  UGetMacAddress in '..\..\..\..\..\..\..\..\..\Public\UGetMacAddress.pas',
  UGlobalPublic_IE in '..\..\..\..\..\..\..\..\..\Public\UGlobalPublic_IE.pas',
  UGlobalPublic_VersionControl in '..\..\..\..\..\..\..\..\..\Public\UGlobalPublic_VersionControl.pas',
  UinstanceHua in '..\..\..\..\..\..\..\..\..\Public\UinstanceHua.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
