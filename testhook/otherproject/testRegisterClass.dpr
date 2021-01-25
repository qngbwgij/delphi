program testRegisterClass;

uses
  Vcl.Forms,
  Unittestregisterclass in 'Unittestregisterclass.pas' {FormTestRegisterClass};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTestRegisterClass, FormTestRegisterClass);
  Application.Run;
end.
