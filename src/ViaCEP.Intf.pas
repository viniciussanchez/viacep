unit ViaCEP.Intf;

interface

uses ViaCEP.Models;

type
  IViaCEP = interface
    ['{6BECFFCB-6A9B-46C0-9A46-B13FF67D62E5}']
    /// <summary>
    ///   Consuma a API do viacep.com.br para obter os dados referentes a um determinado CEP.
    /// </summary>
    /// <param name="ACep">
    ///   Refers to the CEP that will be consulted.
    /// </param>
    /// <returns>
    ///   Returns an instance of the TCEPClass class.
    /// </returns>
    function Get(const ACep: string): TCEPClass;
  end;

implementation

end.
