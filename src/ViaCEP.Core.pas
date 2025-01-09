unit ViaCEP.Core;

interface

uses IdHTTP, IdSSLOpenSSL, ViaCEP.Intf, ViaCEP.Model;

type
  TViaCEP = class(TInterfacedObject, IViaCEP)
  private
    FIdHTTP: TIdHTTP;
    FIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    /// <summary>
    ///   Consuma a API do viacep.com.br para obter os dados referentes a um determinado CEP.
    /// </summary>
    /// <param name="ACep">
    ///   Refers to the CEP that will be consulted.
    /// </param>
    /// <returns>
    ///   Returns an instance of the TCEPClass class or raises an exception if not found.
    /// </returns>
    function Get(const ACep: string): TViaCEPClass;
    /// <summary>
    ///   Checks if CEP is valid.
    /// </summary>
    /// <param name="ACep">
    ///   Refers to the CEP that will be consulted.
    /// </param>
    /// <returns>
    ///   Returns True if successful.
    /// </returns>
    function Validate(const ACep: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TViaCEP }

uses System.Classes, REST.Json, System.SysUtils;

constructor TViaCEP.Create;
begin
  FIdHTTP := TIdHTTP.Create;
  FIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  FIdHTTP.IOHandler := FIdSSLIOHandlerSocketOpenSSL;
  FIdSSLIOHandlerSocketOpenSSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
end;

function TViaCEP.Get(const ACep: string): TViaCEPClass;
const
  URL = 'https://viacep.com.br/ws/%s/json';
var
  LResponse: TStringStream;
begin
  Result := nil;
  LResponse := TStringStream.Create;
  try
    FIdHTTP.Get(Format(URL, [ACep.Trim]), LResponse);
    if FIdHTTP.ResponseCode = 200 then
    begin
      if LResponse.DataString.Contains('"erro": true') then
        raise Exception.Create('O CEP informado não foi encontrado.')
      else
        Result := TJson.JsonToObject<TViaCEPClass>(UTF8ToString(PAnsiChar(AnsiString(LResponse.DataString))));
    end
    else
      raise Exception.Create('Erro ao consultar o CEP. Código HTTP: ' + FIdHTTP.ResponseCode.ToString);
  finally
    LResponse.Free;
  end;
end;

function TViaCEP.Validate(const ACep: string): Boolean;
const
  INVALID_CHARACTER = -1;
begin
  Result := True;
  if ACep.Trim.Length <> 8 then
    Exit(False);
  if StrToIntDef(ACep, INVALID_CHARACTER) = INVALID_CHARACTER then
    Exit(False);
end;

destructor TViaCEP.Destroy;
begin
  FIdSSLIOHandlerSocketOpenSSL.Free;
  FIdHTTP.Free;
  inherited;
end;

end.
