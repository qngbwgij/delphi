program DingTie;

uses
  sysutils,
  ceflib,
  Windows,
  Vcl.Forms,
  UPublic in 'pas\UPublic.pas',
  USetPlanScheme in 'pas\USetPlanScheme.pas' {FormSetPlanScheme},
  UPublicEX in 'pas\UPublicEX.pas',
  uCEFApplication,
  uCEFConstants,
  UMainForm in 'pas\UMainForm.pas' {FrmBaseForm1},
  UnitChooseBaname in 'pas\UnitChooseBaname.pas' {FormChooseBaname},
  UnitModifyTiebaData in 'pas\UnitModifyTiebaData.pas' {FormModifyTiebaData},
  BaseForm in '..\..\..\..\..\..\..\..\Public\BaseForm.pas' {FrmBaseForm},
  ExeStr in '..\..\..\..\..\..\..\..\Public\ExeStr.pas',
  main in '..\..\..\..\..\..\..\..\Public\main.pas' {MainForm},
  UEncrpt in '..\..\..\..\..\..\..\..\Public\UEncrpt.pas',
  UGetMacAddress in '..\..\..\..\..\..\..\..\Public\UGetMacAddress.pas',
  UGlobalPublic_Function in '..\..\..\..\..\..\..\..\Public\UGlobalPublic_Function.pas',
  UGlobalPublic_IE in '..\..\..\..\..\..\..\..\Public\UGlobalPublic_IE.pas',
  UGlobalPublic_VersionControl in '..\..\..\..\..\..\..\..\Public\UGlobalPublic_VersionControl.pas',
  UinstanceHua in '..\..\..\..\..\..\..\..\Public\UinstanceHua.pas',
  uThrdPoolClass in '..\..\..\..\..\..\..\..\Public\uThrdPoolClass.pas',
  UGlobalPublic_MulRun in '..\..\..\..\..\..\..\..\Public\UGlobalPublic_MulRun.pas';

{$R *.res}

////procedure RegisterSchemes(const registrar: ICefSchemeRegistrar);
////begin
////  registrar.AddCustomScheme('local', True, True, False);
////end;
//
//begin
////  CefCache := 'cache';
////  CefOnRegisterCustomSchemes := RegisterSchemes;
////  CefSingleProcess := False;
////  if not CefLoadLibDefault then
////    Exit;
////
////  CefRegisterSchemeHandlerFactory('local', '', TFileScheme);
//
//
//  Application.Initialize;
//  Application.CreateForm(TFormMain, FormMain);
//  Application.CreateForm(TMainForm, MainForm);
//  Application.Run;
//end.


// CEF3 needs to set the LARGEADDRESSAWARE flag which allows 32-bit processes to use up to 3GB of RAM.
// If you don't add this flag the rederer process will crash when you try to load large images.
{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}

begin
  SetCacheDirectoryNa :=  GetCacheDiretoryName;

  if SetCacheDirectoryNa = '' then
  begin
    if Assigned(fileStrList) then
       fileStrList.Free;
    ExitProcess(0);
  end;

  GlobalCEFApp := TCefApplication.Create;

  // In case you want to use custom directories for the CEF3 binaries, cache and user data.
  // If you don't set a cache directory the browser will use in-memory cache.

//  GlobalCEFApp.FrameworkDirPath     := 'cef';
//  GlobalCEFApp.ResourcesDirPath     := 'cef';
//  GlobalCEFApp.LocalesDirPath       := 'cef\locales';
//  GlobalCEFApp.EnableGPU            := True;      // Enable hardware acceleration
  GlobalCEFApp.cache                := 'cache\' + SetCacheDirectoryNa;
//  GlobalCEFApp.UserDataPath         := 'cef\User Data';


  // You *MUST* call GlobalCEFApp.StartMainProcess in a if..then clause
  // with the Application initialization inside the begin..end.
  // Read this https://www.briskbard.com/index.php?lang=en&pageid=cef
  if GlobalCEFApp.StartMainProcess then
    begin
      //CefOnBeforeCommandLineProcessing :=AppendCefCmdline; //指定dcef启动命令行
      Application.Initialize;
      {$IFDEF DELPHI11_UP}
      Application.MainFormOnTaskbar := True;
      {$ENDIF}

      if not AppHasRun(Application.Handle) then
      begin
        ReadExe_Boolean := ReadEXE(ReadExe_ReadOut);

        Application.CreateForm(TFrmBaseForm1, FrmBaseForm1);
        //Application.CreateForm(TFrmBaseForm, FrmBaseForm);
        Application.CreateForm(TMainForm, MainForm);
        //Application.CreateForm(TFrmBaseForm, FrmBaseForm);
        //Application.CreateForm(TMainForm, MainForm);
        //Application.CreateForm(TFrmBaseForm, FrmBaseForm);
        //Application.CreateForm(TMainForm, MainForm);
      end;



      Application.Run;
    end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.
