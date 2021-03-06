unit Controller;

interface

uses
  Model.Entidade.Factory;

type
  TController = class
  private
    FEntidades: TModelEntidadeFactory;
  public
    constructor Create;
    destructor Destroy; override;
    function Entidades: TModelEntidadeFactory;
  end;

implementation

uses
  System.SysUtils;

{ TController }

constructor TController.Create;
begin
  FEntidades := TModelEntidadeFactory.Create;
end;

destructor TController.Destroy;
begin
  FreeAndNil(FEntidades);
  inherited;
end;

function TController.Entidades: TModelEntidadeFactory;
begin
  Result := FEntidades;
end;

end.
