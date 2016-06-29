object frmGrade: TfrmGrade
  Left = 325
  Top = 108
  Caption = 'Colunas'
  ClientHeight = 235
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtnToHabilidades: TSpeedButton
    Left = 187
    Top = 29
    Width = 35
    Height = 26
    Hint = 'Botao'
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnToHabilidadesClick
  end
  object BtnToAllTecnologias: TSpeedButton
    Left = 187
    Top = 149
    Width = 35
    Height = 26
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnToAllTecnologiasClick
  end
  object BtnToAllHabilidades: TSpeedButton
    Left = 187
    Top = 69
    Width = 35
    Height = 26
    Caption = '>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnToAllHabilidadesClick
  end
  object BtnToTecnoligias: TSpeedButton
    Left = 187
    Top = 109
    Width = 35
    Height = 26
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = BtnToTecnoligiasClick
  end
  object scolunas: TListBox
    Left = 228
    Top = 8
    Width = 173
    Height = 189
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = BtnToTecnoligiasClick
    OnDragDrop = scolunasDragDrop
    OnDragOver = scolunasDragOver
  end
  object Button1: TButton
    Left = 168
    Top = 207
    Width = 85
    Height = 25
    Hint = 'Sair | Close;'
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object colunas: TListBox
    Left = 8
    Top = 8
    Width = 173
    Height = 189
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = BtnToHabilidadesClick
    OnDragDrop = colunasDragDrop
    OnDragOver = colunasDragOver
  end
end
