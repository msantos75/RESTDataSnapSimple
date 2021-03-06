unit View.Entidade.Exemplo;

interface

uses
  System.SysUtils, System.Classes, System.JSON, Controller;

{$METHODINFO ON}

type
  TExemplo = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FController : TController;
  public
    { Public declarations }
    function Exemplo(const Key: String): TJSONArray;
    procedure acceptExemplo(const Key: String; jObject: TJSONObject);
    procedure updateExemplo(const Key: String; jObject: TJSONObject);
    procedure cancelExemplo(const Key: String);
  end;

{$METHODINFO OFF}

var
  Exemplo: TExemplo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TExemplo }

procedure TExemplo.acceptExemplo(const Key: String; jObject: TJSONObject);
begin
  FController.Entidades.Exemplo.Put(Key, jObject);
end;

procedure TExemplo.cancelExemplo(const Key: String);
begin
  FController.Entidades.Exemplo.Delete(Key);
end;

procedure TExemplo.DataModuleCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TExemplo.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

function TExemplo.Exemplo(const Key: String): TJSONArray;
begin
  Result := FController.Entidades.Exemplo.Get(Key);
end;

procedure TExemplo.updateExemplo(const Key: String; jObject: TJSONObject);
begin
 FController.Entidades.Exemplo.Post(Key, jObject);
end;

end.
