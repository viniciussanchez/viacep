unit ViaCEP.Default;

interface

uses ViaCEP.Models, ViaCEP.Intf;

type
  TViaCEP = class(TInterfacedObject, IViaCEP)
  private
    function Get(const ACep: string): TCEPClass;
  public
    constructor Create;
  end;

implementation

{ TViaCEP }

uses idHTTP, IdSSLOpenSSL, System.Classes, REST.Json;

constructor TViaCEP.Create;
begin
  { TODO -ovinicius -cvalidate : Validar dlls }
end;

function TViaCEP.Get(const ACep: string): TCEPClass;
var
  LIdHTTP: TIdHTTP;
  LIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
  LResponse: TStringStream;
begin
  Result := nil;
  LIdHTTP := TIdHTTP.Create;
  LIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    LIdHTTP.IOHandler := LIdSSLIOHandlerSocketOpenSSL;
    LResponse := TStringStream.Create;
    try
      LIdHTTP.Get('https://viacep.com.br/ws/' + ACep + '/json', LResponse);
      if LIdHTTP.ResponseCode = 200 then
        Result := TJson.JsonToObject<TCEPClass>(LResponse.DataString);
    finally
      LResponse.Free;
    end;
  finally
    LIdSSLIOHandlerSocketOpenSSL.Free;
    LIdHTTP.Free;
  end;
end;

end.
