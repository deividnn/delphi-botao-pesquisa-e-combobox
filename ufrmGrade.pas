{ * ListBox, speedButton, Bevel
  Bevel: separador
  Teste nos butoes SpeedButton
  Drag and Drop: Arrastar e soltar, de um listBox para outro, armazenando oque foi pego
  For pegando todos itens de listBox, e pegando somente um item(por index)
  * }
unit ufrmGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmGrade = class(TForm)
    scolunas: TListBox;
    BtnToHabilidades: TSpeedButton;
    BtnToAllTecnologias: TSpeedButton;
    BtnToAllHabilidades: TSpeedButton;
    BtnToTecnoligias: TSpeedButton;
    Button1: TButton;
    colunas: TListBox;
    procedure BtnToHabilidadesClick(Sender: TObject);
    procedure BtnToTecnoligiasClick(Sender: TObject);
    procedure BtnToAllTecnologiasClick(Sender: TObject);
    procedure BtnToAllHabilidadesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure colunasDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure scolunasDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure scolunasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure colunasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    dbgrid: tdbgrid;
    db2: tdbgrid;
    { Public declarations }
    procedure lista(DB: tdbgrid);

  end;

var
  frmGrade: TfrmGrade;

implementation

{$R *.dfm}

procedure TfrmGrade.BtnToHabilidadesClick(Sender: TObject);
begin
  if colunas.ItemIndex > -1 then
  begin
    scolunas.Items.add(colunas.Items[colunas.ItemIndex]);
    colunas.DeleteSelected;
  end
  else
    ShowMessage('Selecione um campo o valido');
end;

procedure TfrmGrade.BtnToTecnoligiasClick(Sender: TObject);
begin
  if scolunas.ItemIndex > -1 then
  begin
    colunas.Items.add(scolunas.Items[scolunas.ItemIndex]);
    scolunas.DeleteSelected;
  end
  else
    ShowMessage('Selecione um campo o valido');
end;

procedure TfrmGrade.BtnToAllTecnologiasClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to scolunas.Count - 1 do
  begin
    colunas.Items.add(scolunas.Items[i]);
  end;
  scolunas.clear;
end;

procedure TfrmGrade.BtnToAllHabilidadesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to colunas.Count - 1 do
  begin
    scolunas.Items.add(colunas.Items[i]);
  end;
  colunas.clear;
end;

procedure TfrmGrade.Button1Click(Sender: TObject);

begin
  db2.Columns.Delete(0);

  close;
end;

procedure TfrmGrade.colunasDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  BtnToTecnoligiasClick(Sender);
end;

procedure TfrmGrade.scolunasDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  BtnToHabilidadesClick(Sender);
end;

procedure TfrmGrade.scolunasDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source <> Sender;
end;

procedure TfrmGrade.colunasDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source <> Sender;
end;

procedure TfrmGrade.lista(DB: tdbgrid);
var
  i: Integer;
begin
  db2 := DB;
  for i := 0 to db2.Columns.Count - 1 do
  begin
    colunas.Items.add(db2.Columns[i].FieldName);
  end;
end;

end.
