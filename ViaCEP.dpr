program ViaCEP;

uses
  Vcl.Forms,
  ViaCEP.Core in 'src\ViaCEP.Core.pas',
  ViaCEP.Intf in 'src\ViaCEP.Intf.pas',
  ViaCEP.Model in 'src\ViaCEP.Model.pas',
  ViaCEP.Sample in 'src\ViaCEP.Sample.pas' {FrmMain};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
