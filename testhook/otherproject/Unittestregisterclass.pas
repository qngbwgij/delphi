unit Unittestregisterclass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormTestRegisterClass = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  ILog = interface(IUnknown)
  ['{A65044FC-644C-482A-BBFF-50A618835FC6}']
  procedure WriteMessage;
  end;

  TLog = class(TInterfacedPersistent, ILog)
  public
    class function CreateInstance(Name: string): TLog; overload;
    procedure WriteMessage; virtual; abstract;
  end;

  TTextLog = class(TLog)
  public
    procedure WriteMessage; override;
  end;

  TXMLLog = class(TLog)
  public
    procedure WriteMessage; override;
  end;

  TNullLog = class(TLog)
  public
    procedure WriteMessage; override;
  end;

   THelperClass = class of TLog;

var
  FormTestRegisterClass: TFormTestRegisterClass;

implementation

{$R *.dfm}

var
  Log: TLog;
{ TNullLog }

procedure TNullLog.WriteMessage;
begin

end;

{ TLog }

class function TLog.CreateInstance(Name: string): TLog;
var
  AClass: TPersistentClass;

  //testA: TXMLLog;

  testA: TObject;

  testB: TObject;

  testC: TLog;

  HelperClass: THelperClass;
begin
  //testA := TButton.cre

  Result := nil;

  AClass := FindClass(Name);

  AClass := GetClass(Name);

  Result := TLog(AClass.Create);

//  if Assigned(AClass) then
//  begin
//    testA := AClass.NewInstance;
//
////    testB := testA.Create;
////    TLog(testB).WriteMessage;
//
//    //testB := testA.NewInstance;
//
////    testC := TLog(testA);
////
////    testC.WriteMessage;
//
//    Result := testA as TLog;
//
//    //Result := TLog(testA.Create);
//
//
//
//    //Result := (testA as TLog).Create;
//    //Result.Create;
//  end;



//  if Assigned(AClass) then
//  begin
////    Result := TLog(AClass);
////    Result.Create;
//
//    HelperClass := THelperClass(AClass);
//    Result :=HelperClass.create;
//  end;
end;

{ TTextLog }

procedure TTextLog.WriteMessage;
begin
  ShowMessage('TTextLog');
end;

{ TXMLLog }

procedure TXMLLog.WriteMessage;
begin
  ShowMessage('TXMLLog');
end;

{ TForm1 }

procedure TFormTestRegisterClass.Button1Click(Sender: TObject);
begin
  { 实际应用中可以从配置中读取字符串来决定实例化具体的子类 }
  Log := TLog.CreateInstance('TXMLLog');
  if Assigned(Log) then
  begin
    Log.WriteMessage;
    Log.Free;
  end;
end;

initialization
  RegisterClass(TTextLog);
  RegisterClass(TXMLLog);
  RegisterClass(TNullLog);

finalization
//  UnRegisterClass(TTextLog);
//  UnRegisterClass(TXMLLog);
//  UnRegisterClass(TNullLog);

end.
