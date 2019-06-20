unit ViaCEP.Providers.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  ViaCEP.Intf, ViaCEP.Default;

{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);
var
  ViaCEP: IViaCEP;
begin
  ViaCEP := TViaCEP.Create;
  Memo1.Lines.Text := ViaCEP.Get(Edit1.Text).ToJSONString;
end;

end.
