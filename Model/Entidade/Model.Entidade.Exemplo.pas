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
    function Put(const Key: String; jObject: TJSONObject): TModelEntidadeExemplo;
    function Post(const Key: String; jObject: TJSONObject): TModelEntidadeExemplo;
    function Delete(const Key: String): TModelEntidadeExemplo;
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

function TModelEntidadeExemplo.Delete(const Key: String): TModelEntidadeExemplo;
begin
  // http://localhost:8080/datasnap/rest/texemplo/exemplo/Key
  // informar no body um elemento JSON

  Result := Self;

  With FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM SFPFUNCIONARIOS');
    SQL.Add('WHERE EMPRESA=:EMPRESA AND CODIGO=:CODIGO');
    ParamByName('EMPRESA').Value := 4;
    ParamByName('CODIGO').Value := Key;
    ExecSQL;
  end;
end;

function TModelEntidadeExemplo.Get(const Key: String = ''): TJSONArray;
begin
  // http://localhost:8080/datasnap/rest/texemplo/exemplo

  With FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT EMPRESA, CODIGO, NOME FROM SFPFUNCIONARIOS');
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

function TModelEntidadeExemplo.Post(const Key: String;
  jObject: TJSONObject): TModelEntidadeExemplo;
begin
  // http://localhost:8080/datasnap/rest/texemplo/exemplo/Key
  // informar no body um elemento JSON

  Result := Self;

  With FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM SFPFUNCIONARIOS');
    SQL.Add('WHERE EMPRESA=:EMPRESA AND CODIGO=:CODIGO');
    ParamByName('EMPRESA').Value := 4;
    ParamByName('CODIGO').Value := Key;
    Open;
  end;

  FDQuery1.RecordFromJSONObject(jObject);
  FDQuery1.ApplyUpdates(-1);
end;

function TModelEntidadeExemplo.Put(const Key: String;
  jObject: TJSONObject): TModelEntidadeExemplo;
begin
  // http://localhost:8080/datasnap/rest/texemplo/exemplo/-1
  // informar no body um elemento JSON

  Result := Self;

  With FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM SFPFUNCIONARIOS');
    SQL.Add('WHERE 1=2'); // Condi??o for?ada para n?o retornar nenhum registro, obtendo apenas os campos da tabela
    Open;
  end;

  FDQuery1.FromJSONObject(jObject);
  FDQuery1.ApplyUpdates(-1);
end;

end.
