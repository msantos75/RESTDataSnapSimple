unit Model.Entidade.Factory;

interface

uses
  Model.Entidade.Exemplo;

type
  TModelEntidadeFactory = class
  private
  public
    function Exemplo: TModelEntidadeExemplo;
  end;

implementation

{ TModelEntidadeFactory }

function TModelEntidadeFactory.Exemplo: TModelEntidadeExemplo;
begin
  Result := ModelEntidadeExemplo;
end;

end.
