unit ViaCEP.Models;

interface

uses REST.JSON.Types;

type
  TCEPClass = class
  private
    FLogradouro: string;
    [JSONNameAttribute('ibge')]
    FIBGE: string;
    FBairro: string;
    [JSONNameAttribute('uf')]
    FUF: string;
    [JSONNameAttribute('cep')]
    FCEP: string;
    FLocalidade: string;
    FUnidade: string;
    FComplemento: string;
    [JSONNameAttribute('gia')]
    FGIA: string;
    procedure SetBairro(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetGIA(const Value: string);
    procedure SetIBGE(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetUF(const Value: string);
    procedure SetUnidade(const Value: string);
  public
    property CEP: string read FCEP write SetCEP;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Complemento: string read FComplemento write SetComplemento;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property UF: string read FUF write SetUF;
    property Unidade: string read FUnidade write SetUnidade;
    property IBGE: string read FIBGE write SetIBGE;
    property GIA: string read FGIA write SetGIA;
    /// <summary>
    ///   Converts the current instance of the TCEPClass class to a JSON in the string format.
    /// </summary>
    /// <returns>
    ///   Returns a JSONObject in string format.
    /// </returns>
    function ToJSONString: string;
    /// <summary>
    ///   Instance an object of class TCEPClass with the data of a JSON in the string format.
    /// </summary>
    /// <param name="AJSONString">
    ///   JSON containing the data of class TCEPClass in the string format.
    /// </param>
    /// <returns>
    ///   Returns an instance of the TCEPClass class.
    /// </returns>
    class function FromJSONString(const AJSONString: string): TCEPClass;
  end;

implementation

{ TCEPClass }

uses REST.Json;

class function TCEPClass.FromJSONString(const AJSONString: string): TCEPClass;
begin
  Result := TJson.JsonToObject<TCEPClass>(AJSONString);
end;

procedure TCEPClass.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TCEPClass.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TCEPClass.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TCEPClass.SetGIA(const Value: string);
begin
  FGIA := Value;
end;

procedure TCEPClass.SetIBGE(const Value: string);
begin
  FIBGE := Value;
end;

procedure TCEPClass.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TCEPClass.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TCEPClass.SetUF(const Value: string);
begin
  FUF := Value;
end;

procedure TCEPClass.SetUnidade(const Value: string);
begin
  FUnidade := Value;
end;

function TCEPClass.ToJSONString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

end.
