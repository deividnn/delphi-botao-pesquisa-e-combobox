unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  DbxDevartMySql, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider;

type
  TdmConexao = class(TDataModule)
    conexao: TSQLConnection;
    qry_cliente: TSQLQuery;
    qry_clienteid: TIntegerField;
    qry_clientedescricao: TStringField;
    qry_clienteidade: TIntegerField;
    dsp_cliente: TDataSetProvider;
    cds_cliente: TClientDataSet;
    cds_clienteid: TIntegerField;
    cds_clientedescricao: TStringField;
    cds_clienteidade: TIntegerField;
    qry_produto: TSQLQuery;
    dsp_produto: TDataSetProvider;
    cds_produto: TClientDataSet;
    qry_clienteid_produto: TIntegerField;
    cds_clienteid_produto: TIntegerField;
    qry_produtoid: TIntegerField;
    qry_produtodescricao: TStringField;
    cds_produtoid: TIntegerField;
    cds_produtodescricao: TStringField;
    qry_cidade: TSQLQuery;
    dsp_cidade: TDataSetProvider;
    cds_cidade: TClientDataSet;
    cds_cidadeid: TIntegerField;
    cds_cidadenome: TStringField;
    qry_cidadeid: TIntegerField;
    qry_cidadenome: TStringField;
    qry_clienteid_cidade: TIntegerField;
    cds_clienteid_cidade: TIntegerField;
    procedure cds_produtoAfterDelete(DataSet: TDataSet);
    procedure cds_produtoAfterPost(DataSet: TDataSet);
    procedure cds_clienteAfterDelete(DataSet: TDataSet);
    procedure cds_clienteAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.cds_clienteAfterDelete(DataSet: TDataSet);
begin
dmConexao.cds_cliente.ApplyUpdates(0);
end;

procedure TdmConexao.cds_clienteAfterPost(DataSet: TDataSet);
begin
dmConexao.cds_cliente.ApplyUpdates(0);
end;

procedure TdmConexao.cds_produtoAfterDelete(DataSet: TDataSet);
begin
dmConexao.cds_produto.ApplyUpdates(0) ;
end;

procedure TdmConexao.cds_produtoAfterPost(DataSet: TDataSet);
begin
dmConexao.cds_produto.ApplyUpdates(0) ;
end;

end.
