object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 395
  Width = 597
  object conexao: TSQLConnection
    ConnectionName = 'Devart MySQL Direct'
    DriverName = 'DevartMySQLDirect'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=delphi'
      'DriverName=DevartMySQLDirect'
      'User_Name=deivid'
      'Password=6291'
      'FetchAll=True'
      'EnableBoolean=False'
      'IPVersion=IPv4')
    Connected = True
    Left = 32
    Top = 16
  end
  object qry_cliente: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select cli. id as id,'
      'cli.descricao as "descricao",'
      'cli.id_produto as id_produto,'
      'cli.id_cidade as id_cidade,'
      'cli.idade as idade,'
      'ci.nome as cidade ,'
      'p.descricao as "produto" '
      ''
      'from cliente as cli'
      
        'inner join cidade as ci on ci.id=cli.id_cidade inner join produt' +
        'o as p '
      ' on p.id=cli.id_produto')
    SQLConnection = conexao
    Left = 112
    Top = 16
    object qry_clienteid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_clientedescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object qry_clienteidade: TIntegerField
      FieldName = 'idade'
      Required = True
    end
    object qry_clienteid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object qry_clientecidade: TStringField
      FieldName = 'cidade'
      ProviderFlags = []
      Size = 50
    end
    object qry_clienteid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object qry_clienteproduto: TStringField
      FieldName = 'produto'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsp_cliente: TDataSetProvider
    DataSet = qry_cliente
    Options = [poIncFieldProps, poAutoRefresh, poPropogateChanges, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 208
    Top = 16
  end
  object cds_cliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_cliente'
    AfterPost = cds_clienteAfterPost
    AfterDelete = cds_clienteAfterDelete
    Left = 328
    Top = 16
    object cds_clienteid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cds_clientedescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object cds_clienteidade: TIntegerField
      FieldName = 'idade'
      Required = True
    end
    object cds_clienteid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object cds_clientecidade: TStringField
      FieldName = 'cidade'
      ProviderFlags = []
      Size = 50
    end
    object cds_clienteid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object cds_clienteproduto: TStringField
      FieldName = 'produto'
      ProviderFlags = []
      Size = 100
    end
  end
  object qry_produto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from produto')
    SQLConnection = conexao
    Left = 112
    Top = 88
    object qry_produtoid: TIntegerField
      FieldName = 'id'
    end
    object qry_produtodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
  end
  object dsp_produto: TDataSetProvider
    DataSet = qry_produto
    Left = 208
    Top = 88
  end
  object cds_produto: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_produto'
    AfterPost = cds_produtoAfterPost
    AfterDelete = cds_produtoAfterDelete
    Left = 328
    Top = 88
    object cds_produtoid: TIntegerField
      FieldName = 'id'
    end
    object cds_produtodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
  end
  object qry_cidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from cidade')
    SQLConnection = conexao
    Left = 112
    Top = 176
    object qry_cidadeid: TIntegerField
      FieldName = 'id'
    end
    object qry_cidadenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
  object dsp_cidade: TDataSetProvider
    DataSet = qry_cidade
    Left = 200
    Top = 176
  end
  object cds_cidade: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_cidade'
    Left = 320
    Top = 176
    object cds_cidadeid: TIntegerField
      FieldName = 'id'
    end
    object cds_cidadenome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 50
    end
  end
end
