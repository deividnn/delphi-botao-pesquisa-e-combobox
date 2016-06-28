object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  Caption = 'Produto'
  ClientHeight = 309
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 46
    Height = 13
    Caption = 'Descricao'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 95
    Width = 495
    Height = 210
    DataSource = dts_produto
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 377
    Height = 21
    DataField = 'descricao'
    DataSource = dts_produto
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Action = DatasetInsert1
    Caption = 'Inserir'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 251
    Top = 64
    Width = 75
    Height = 25
    Action = DatasetCancel1
    Caption = 'Cancelar'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 170
    Top = 64
    Width = 75
    Height = 25
    Action = DatasetDelete1
    Caption = 'Excluir'
    TabOrder = 4
  end
  object Button4: TButton
    Left = 89
    Top = 64
    Width = 75
    Height = 25
    Action = DatasetPost1
    Caption = 'Salvar'
    TabOrder = 5
  end
  object dts_produto: TDataSource
    DataSet = dmConexao.cds_produto
    Left = 440
    Top = 216
  end
  object acoes: TActionList
    Left = 440
    Top = 160
    object Action1: TAction
      Caption = 'Action1'
    end
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dts_produto
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dts_produto
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dts_produto
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dts_produto
    end
  end
end
