unit ViaCEP.Intf;

interface

uses ViaCEP.Model;

type
  IViaCEP = interface
    ['{202D4AB9-6B89-4CFF-A080-9DBC09D66737}']
    /// <summary>
    ///   Consuma a API do viacep.com.br para obter os dados referentes a um determinado CEP.
    /// </summary>
    /// <param name="ACep">
    ///   Refers to the CEP that will be consulted.
    /// </param>
    /// <returns>
    ///   Returns an instance of the TCEPClass class.
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
  end;

implementation

end.
