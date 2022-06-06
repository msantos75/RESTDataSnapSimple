unit Model.Entidade.Exemplo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.JSON;

type
  TModelEntidadeExemplo = class(TDataModule)
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Get(const Key: String = ''): TJSONArray;
  end;

var
  ModelEntidadeExemplo: TModelEntidadeExemplo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Model.Conexao.Firedac,
     DataSetConverter4D.Helper,
     DataSetConverter4D.Impl;

{$R *.dfm}

{ TModelEntidadeExemplo }

function TModelEntidadeExemplo.Get(const Key: String = ''): TJSONArray;
begin
  With FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT CODIGO, NOME FROM SFPFUNCIONARIOS');
    SQL.Add('WHERE EMPRESA=4');
    If Key <> '' then
    begin
      SQL.Add('AND CODIGO=:C');
      ParamByName('C').AsString := Key;
    end;
    Open;
  end;

  Result := FDQuery1.AsJSONArray;
end;

end.