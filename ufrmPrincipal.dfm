object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 390
  ClientWidth = 772
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
    Left = 16
    Top = 48
    Width = 45
    Height = 13
    Caption = 'descricao'
  end
  object Label2: TLabel
    Left = 455
    Top = 48
    Width = 26
    Height = 13
    Caption = 'idade'
  end
  object Label3: TLabel
    Left = 16
    Top = 5
    Width = 38
    Height = 13
    Caption = 'produto'
  end
  object Label4: TLabel
    Left = 16
    Top = 94
    Width = 31
    Height = 13
    Caption = 'cidade'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 208
    Width = 740
    Height = 169
    DataSource = dts_cliente
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 24
    Width = 57
    Height = 21
    DataField = 'id_produto'
    DataSource = dts_cliente
    Enabled = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 79
    Top = 22
    Width = 42
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 67
    Width = 433
    Height = 21
    DataField = 'descricao'
    DataSource = dts_cliente
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 455
    Top = 67
    Width = 73
    Height = 21
    DataField = 'idade'
    DataSource = dts_cliente
    TabOrder = 3
  end
  object Button2: TButton
    Left = 24
    Top = 168
    Width = 75
    Height = 25
    Action = DatasetInsert1
    Caption = 'Inserir'
    TabOrder = 4
  end
  object Button3: TButton
    Left = 267
    Top = 168
    Width = 75
    Height = 25
    Action = DatasetCancel1
    Caption = 'Cancelar'
    TabOrder = 7
  end
  object Button4: TButton
    Left = 105
    Top = 168
    Width = 75
    Height = 25
    Action = DatasetPost1
    Caption = 'Salvar'
    TabOrder = 5
  end
  object Button5: TButton
    Left = 186
    Top = 168
    Width = 75
    Height = 25
    Action = DatasetDelete1
    Caption = 'Excluir'
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 127
    Top = 24
    Width = 401
    Height = 21
    Enabled = False
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 120
    Width = 145
    Height = 21
    DataField = 'id_cidade'
    DataSource = dts_cliente
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dts_cidade
    TabOrder = 10
  end
  object dts_cliente: TDataSource
    DataSet = dmConexao.cds_cliente
    Left = 696
    Top = 336
  end
  object entertab: TACBrEnterTab
    EnterAsTab = True
    Left = 696
    Top = 288
  end
  object acoes: TActionList
    Left = 696
    Top = 240
    object DatasetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = dts_cliente
    end
    object DatasetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
      DataSource = dts_cliente
    end
    object DatasetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
      DataSource = dts_cliente
    end
    object DatasetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
      DataSource = dts_cliente
    end
  end
  object dts_cidade: TDataSource
    DataSet = dmConexao.cds_cidade
    Left = 40
    Top = 328
  end
end
