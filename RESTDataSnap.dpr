program RESTDataSnap;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'View\FormUnit1.pas' {Form1},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  WebModuleUnit1 in 'View\WebModuleUnit1.pas' {WebModule1: TWebModule},
  Model.Conexao.Firedac in 'Model\Conexão\Model.Conexao.Firedac.pas' {DataModule1: TDataModule},
  Model.Entidade.Exemplo in 'Model\Entidade\Model.Entidade.Exemplo.pas' {ModelEntidadeExemplo: TDataModule},
  Controller in 'Controller\Controller.pas',
  Model.Entidade.Factory in 'Model\Entidade\Model.Entidade.Factory.pas',
  View.Entidade.Exemplo in 'View\Entidades\View.Entidade.Exemplo.pas' {Exemplo: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TModelEntidadeExemplo, ModelEntidadeExemplo);
  Application.CreateForm(TExemplo, Exemplo);
  Application.Run;
end.
