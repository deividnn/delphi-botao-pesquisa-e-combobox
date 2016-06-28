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
  Vcl.DBActns, System.Actions, Vcl.ActnList, frxClass;

type
  TfrmPrincipal = class(TForm)
    dts_cliente: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    entertab: TACBrEnterTab;
    Button1: TButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    acoes: TActionList;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    Label4: TLabel;
    dts_cidade: TDataSource;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const [Ref] Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
    desc: boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmConexao, ufrmProduto;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmProduto := TfrmProduto.Create(nil);
  try
    frmProduto.ShowModal;
    dts_cliente.DataSet.FieldByName('id_produto').AsInteger :=
      frmProduto.codprod;
    Edit1.Text := frmProduto.descprod;
  finally
    frmProduto.Free;
  end;
end;

procedure TfrmPrincipal.DBGrid1DrawColumnCell(Sender: TObject;
  const [Ref] Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
with DbGrid1 do
   begin
    if  dts_cliente.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
        if (Rect.Top = TStringGrid(DBGrid1).CellRect( DataCol ,TStringGrid(DbGrid1).Row).Top)
          or( gdSelected in State)  then
         begin
           Canvas.FillRect(Rect);
           Canvas.Brush.Color := clblue;
           DefaultDrawDataCell(Rect,Column.Field,State)
        end;
   end;
end;

procedure TfrmPrincipal.DBGrid1TitleClick(Column: TColumn);
var

  sort: string;
  comando: string;
begin
  dmConexao.qry_cliente.Close;
  dmConexao.qry_cliente.sql.Clear;

  if (desc) then
    sort := 'desc'
  else
    sort := 'asc';
  comando := 'select * from cliente order by ' + Column.FieldName + ' ' + sort;
  dmConexao.qry_cliente.sql.Add(comando);
  dmConexao.qry_cliente.Open;
  dts_cliente.DataSet.Refresh;
  desc := not desc;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  desc := true;
end;

end.
