program ViaCEP;

uses
  Vcl.Forms,
  ViaCEP.Providers.Main in 'src\providers\ViaCEP.Providers.Main.pas' {FrmMain},
  ViaCEP.Models in 'src\ViaCEP.Models.pas',
  ViaCEP.Intf in 'src\ViaCEP.Intf.pas',
  ViaCEP.Default in 'src\ViaCEP.Default.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
