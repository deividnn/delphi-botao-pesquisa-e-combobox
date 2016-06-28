unit ufrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmProduto = class(TForm)
    dts_produto: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    acoes: TActionList;
    Action1: TAction;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codprod: integer;
    descprod: string;
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses udmConexao;

procedure TfrmProduto.DBGrid1DblClick(Sender: TObject);
begin
  codprod := dts_produto.DataSet.FieldByName('id').AsInteger;
  descprod := dts_produto.DataSet.FieldByName('descricao').AsString;
  close;
 end;

end.
