program FindAndReplace;

uses
  Vcl.Forms,
  MainU in 'MainU.pas' {MainF};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainF, MainF);
  Application.Run;
end.
