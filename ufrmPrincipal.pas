unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxMaskEdit,
  cxSpinEdit, cxDBEdit, cxTextEdit, ACBrBase, ACBrEnterTab, Vcl.Buttons,
  Vcl.DBActns, System.Actions, Vcl.ActnList, frxClass, Vcl.ExtCtrls, frxDBSet,
  StrUtils, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TfrmPrincipal = class(TForm)
    dts_cliente: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    codprod: TDBEdit;
    entertab: TACBrEnterTab;
    Button1: TButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    inserir: TButton;
    cancelar: TButton;
    salvar: TButton;
    excluir: TButton;
    Label4: TLabel;
    dts_cidade: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    panel: TPanel;
    Panel2: TPanel;
    editar: TButton;
    Panel1: TPanel;
    frxdb: TfrxDBDataset;
    frxreport: TfrxReport;
    Button3: TButton;
    campo: TComboBox;
    valor: TEdit;
    Button2: TButton;
    DBEdit1: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure inserirClick(Sender: TObject);
    procedure cancelarClick(Sender: TObject);
    procedure salvarClick(Sender: TObject);
    procedure editarClick(Sender: TObject);
    procedure excluirClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);

  private
    procedure insercao;
    procedure normal;
    { Private declarations }
  public
    { Public declarations }
    desc: boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmConexao, ufrmProduto, ufrmGrade;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(nil);
  try
    frmProduto.ShowModal;
    dts_cliente.DataSet.FieldByName('id_produto').AsInteger :=
      frmProduto.codprod;
    dts_cliente.DataSet.FieldByName('produto').asstring := frmProduto.descprod;
  finally
    frmProduto.Free;
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  sql: string;
  comando: string;
  opcao: string;

begin
  dmConexao.qry_cliente.Close;
  dmConexao.qry_cliente.sql.Clear;

  sql := 'select cli.id as id,cli.descricao as descricao,cli.id_produto as id_produto,'
    + 'cli.id_cidade as id_cidade,cli.idade as idade,ci.nome as cidade ,p.descricao as produto'
    + ' from cliente as cli inner join cidade as ci on ci.id=cli.id_cidade ' +
    'inner join produto as p on p.id=cli.id_produto ';

  case AnsiIndexStr(campo.Items[campo.ItemIndex], ['id', 'descricao', 'produto',
    'cidade', 'id_cidade', 'id_produto', 'idade']) of
    0:
      opcao := 'cli.id';
    1:
      opcao := 'cli.descricao';
    2:
      opcao := 'p.descricao';
    3:
      opcao := 'ci.nome';
    4:
      opcao := 'ci.id';
    5:
      opcao := 'p.id';
    6:
      opcao := 'cli.idade';
  end;

  comando := sql + ' where ' + opcao + ' like  "%' + valor.Text + '%" order by '
    + opcao + ' asc';

  dmConexao.qry_cliente.sql.Add(comando);
  dmConexao.qry_cliente.Open;
  dts_cliente.DataSet.Refresh;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  if not dmConexao.cds_cliente.IsEmpty then
  begin
    frxdb.DataSet := dmConexao.cds_cliente;
    frxreport.LoadFromFile('cliente.fr3');
    frxreport.ShowReport;
  end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  frmGrade := TfrmGrade.Create(nil);
  try
    frmGrade.lista(DBGrid1);
    frmGrade.ShowModal;
    DBGrid1 := frmGrade.db2;
  finally
    frmGrade.Free;
  end;
end;

procedure TfrmPrincipal.cancelarClick(Sender: TObject);
begin
  If MessageBox(Handle, 'Deseja cancelar?', 'Favor confirmar...',
    MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES Then
  begin
    dts_cliente.DataSet.cancel;
    normal;
  end;
end;

procedure TfrmPrincipal.DBGrid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if not dts_cliente.DataSet.IsEmpty then
    begin
      if dts_cliente.DataSet.State in [dsEdit, dsInsert, dsBrowse] then
        // Cor da linha selecionada
        if (Rect.Top = TStringGrid(DBGrid1).CellRect(DataCol,
          TStringGrid(DBGrid1).Row).Top) or (gdSelected in State) then
        begin
          Canvas.FillRect(Rect);
          Canvas.Brush.Color := clYellow;
          DefaultDrawDataCell(Rect, Column.Field, State)
        end;
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid1TitleClick(Column: TColumn);
var
  sql: string;
  sort: string;
  comando: string;
begin
  dmConexao.qry_cliente.Close;
  dmConexao.qry_cliente.sql.Clear;

  if (desc) then
    sort := 'desc'
  else
    sort := 'asc';
  sql := 'select cli.id as id,cli.descricao as descricao,cli.id_produto as id_produto,'
    + 'cli.id_cidade as id_cidade,cli.idade as idade,ci.nome as cidade ,p.descricao as produto'
    + ' from cliente as cli inner join cidade as ci on ci.id=cli.id_cidade ' +
    'inner join produto as p on p.id=cli.id_produto ';
  comando := sql + ' order by ' + Column.FieldName + ' ' + sort;
  dmConexao.qry_cliente.sql.Add(comando);
  dmConexao.qry_cliente.Open;
  dts_cliente.DataSet.Refresh;
  desc := not desc;

end;

procedure TfrmPrincipal.editarClick(Sender: TObject);
begin
  if not dts_cliente.DataSet.IsEmpty then
  begin
    dts_cliente.DataSet.Edit;
  end;

  insercao;
end;

procedure TfrmPrincipal.excluirClick(Sender: TObject);
begin
  If MessageBox(Handle, 'Deseja excluir?', 'Favor confirmar...',
    MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES Then
  begin
    if not dts_cliente.DataSet.IsEmpty then
      dts_cliente.DataSet.delete;
    normal;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If MessageBox(Handle, 'Deseja sair?', 'Favor confirmar...',
    MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_NO Then
  begin
    abort;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  I: Integer;
begin

  dmConexao.conexao.Open;
  dmConexao.cds_cliente.Open;
  dmConexao.cds_produto.Open;
  dmConexao.cds_cidade.Open;

  desc := true;
  normal;

  for I := 0 to dts_cliente.DataSet.FieldCount - 1 do
  begin
    campo.Items.Add(dts_cliente.DataSet.FieldDefList.FieldDefs[I].name);
  end;

  campo.ItemIndex := 1;

end;

procedure TfrmPrincipal.inserirClick(Sender: TObject);
begin
  insercao;
  dts_cliente.DataSet.Insert;
end;

procedure TfrmPrincipal.salvarClick(Sender: TObject);
begin
  If MessageBox(Handle, 'Deseja salvar?', 'Favor confirmar...',
    MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES Then
  begin

    try
      dts_cliente.DataSet.post;
      normal;
    except
      on e: exception do
      begin
        showmessage('Ocorreu o seguinte erro: ' + e.message);
        insercao;
      end;

    end;
  end;
end;

procedure TfrmPrincipal.insercao;
begin
  salvar.Enabled := true;
  cancelar.Enabled := true;
  inserir.Enabled := false;
  excluir.Enabled := false;
  editar.Enabled := false;
  panel.Enabled := true;
  DBEdit3.SetFocus;
end;

procedure TfrmPrincipal.normal;
begin
  salvar.Enabled := false;
  cancelar.Enabled := false;
  editar.Enabled := true;
  inserir.Enabled := true;
  excluir.Enabled := true;
  panel.Enabled := false;
end;

end.
