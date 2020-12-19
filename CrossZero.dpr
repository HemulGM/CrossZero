program CrossZero;

uses
  System.StartUpCopy,
  FMX.Forms,
  CrossZero.Main in 'CrossZero.Main.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
