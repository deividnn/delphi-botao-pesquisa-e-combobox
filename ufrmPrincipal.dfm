object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 529
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panel: TPanel
    Left = 0
    Top = 57
    Width = 772
    Height = 166
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 63
    ExplicitWidth = 756
    ExplicitHeight = 154
    object Label1: TLabel
      Left = 19
      Top = 8
      Width = 45
      Height = 13
      Caption = 'descricao'
    end
    object Label2: TLabel
      Left = 466
      Top = 8
      Width = 26
      Height = 13
      Caption = 'idade'
    end
    object Label3: TLabel
      Left = 20
      Top = 53
      Width = 38
      Height = 13
      Caption = 'produto'
    end
    object Label4: TLabel
      Left = 20
      Top = 94
      Width = 31
      Height = 13
      Caption = 'cidade'
    end
    object Button1: TButton
      Left = 83
      Top = 70
      Width = 42
      Height = 25
      Caption = '...'
      TabOrder = 5
      OnClick = Button1Click
    end
    object DBEdit1: TDBEdit
      Left = 20
      Top = 72
      Width = 57
      Height = 21
      DataField = 'id_produto'
      DataSource = dts_cliente
      Enabled = False
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 19
      Top = 27
      Width = 433
      Height = 21
      DataField = 'descricao'
      DataSource = dts_cliente
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 466
      Top = 27
      Width = 66
      Height = 21
      DataField = 'idade'
      DataSource = dts_cliente
      TabOrder = 4
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 19
      Top = 113
      Width = 145
      Height = 21
      DataField = 'id_cidade'
      DataSource = dts_cliente
      KeyField = 'id'
      ListField = 'nome'
      ListSource = dts_cidade
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 131
      Top = 72
      Width = 401
      Height = 21
      Enabled = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 57
    Align = alTop
    TabOrder = 1
    object inserir: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Insert'
      Caption = 'Inserir'
      ImageIndex = 4
      TabOrder = 0
      OnClick = inserirClick
    end
    object cancelar: TButton
      Left = 251
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Cancel'
      Caption = 'Cancelar'
      ImageIndex = 8
      TabOrder = 3
      OnClick = cancelarClick
    end
    object salvar: TButton
      Left = 170
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Post'
      Caption = 'Salvar'
      ImageIndex = 7
      TabOrder = 2
      OnClick = salvarClick
    end
    object excluir: TButton
      Left = 332
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Delete'
      Caption = 'Excluir'
      ImageIndex = 5
      TabOrder = 4
      OnClick = excluirClick
    end
    object editar: TButton
      Left = 89
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = editarClick
    end
    object Button3: TButton
      Left = 494
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Relatorio'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 223
    Width = 772
    Height = 306
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 304
      Align = alClient
      DataSource = dts_cliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
    end
  end
  object dts_cliente: TDataSource
    DataSet = dmConexao.cds_cliente
    Left = 728
    Top = 16
  end
  object entertab: TACBrEnterTab
    EnterAsTab = True
    Left = 616
    Top = 16
  end
  object dts_cidade: TDataSource
    DataSet = dmConexao.cds_cidade
    Left = 672
    Top = 16
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 616
    Top = 72
  end
  object frxReport1: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42550.410343495400000000
    ReportOptions.LastChange = 42550.432892650500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 672
    Top = 73
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Memo.UTF8W = (
            'id')
        end
        object Memo3: TfrxMemoView
          Left = 94.488250000000000000
          Width = 200.315090000000000000
          Height = 22.677180000000000000
          Memo.UTF8W = (
            'descricao')
        end
        object Memo4: TfrxMemoView
          Left = 302.362400000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          Memo.UTF8W = (
            'idade')
        end
        object Memo5: TfrxMemoView
          Left = 374.173470000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          Memo.UTF8W = (
            'produto')
        end
        object Memo6: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'cidade')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1frxDBDataset1: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."id"]')
        end
        object frxDBDataset1frxDBDataset11: TfrxMemoView
          Left = 94.488250000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."descricao"]')
        end
        object frxDBDataset1frxDBDataset12: TfrxMemoView
          Left = 294.803340000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'idade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."idade"]')
        end
        object frxDBDataset1frxDBDataset13: TfrxMemoView
          Left = 374.173470000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'produto'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."produto"]')
        end
        object frxDBDataset1frxDBDataset14: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'cidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."cidade"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
    end
  end
end
