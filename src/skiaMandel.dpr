program skiaMandel;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {frmMain},
  HSLUtils in 'HSLUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
