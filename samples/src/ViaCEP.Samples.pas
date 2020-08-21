unit ViaCEP.Samples;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    edtCEPValidate: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    edtCEPConsultar: TEdit;
    Button2: TButton;
    edtCEP: TEdit;
    Label1: TLabel;
    edtLogradouro: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    Label4: TLabel;
    edtLocalidade: TEdit;
    Label5: TLabel;
    edtUF: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtDDD: TEdit;
    edtIBGE: TEdit;
    Label8: TLabel;
    edtGIA: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtJSON: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  end;

var
  FrmMain: TFrmMain;

implementation

uses ViaCEP.Intf, ViaCEP.Core, ViaCEP.Model;

{$R *.dfm}

procedure TFrmMain.Button1Click(Sender: TObject);
var
  ViaCEP: IViaCEP;
begin
  ViaCEP := TViaCEP.Create;
  if ViaCEP.Validate(edtCEPValidate.Text) then
    ShowMessage('CEP válido')
  else
    ShowMessage('CEP inválido');
end;

procedure TFrmMain.Button2Click(Sender: TObject);
var
  ViaCEP: IViaCEP;
  CEP: TViaCEPClass;
begin
  ViaCEP := TViaCEP.Create;
  CEP := ViaCEP.Get(edtCEPConsultar.Text);
  if not Assigned(CEP) then
    Exit;
  try
    edtJSON.Lines.Text := CEP.ToJSONString;
    edtCEP.Text := CEP.CEP;
    edtLogradouro.Text := CEP.Logradouro;
    edtComplemento.Text := CEP.Complemento;
    edtBairro.Text := CEP.Bairro;
    edtLocalidade.Text := CEP.Localidade;
    edtUF.Text := CEP.UF;
    edtDDD.Text := CEP.DDD;
    edtIBGE.Text := CEP.IBGE;
    edtGIA.Text := CEP.GIA;
  finally
    CEP.Free;
  end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
