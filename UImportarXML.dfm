object frmImportarXML: TfrmImportarXML
  Left = 162
  Top = 16
  Width = 882
  Height = 706
  BorderWidth = 5
  Caption = 'Importar XML NFe (Notas Emitidas)'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcDados: TPageControl
    Left = 0
    Top = 0
    Width = 864
    Height = 665
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 0
    object TabSheet7: TTabSheet
      Caption = 'Importar XML'
      ImageIndex = 8
      object Diretorio: TLabel
        Left = 251
        Top = 16
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pasta:'
      end
      object Label4: TLabel
        Left = 258
        Top = 40
        Width = 23
        Height = 13
        Caption = 'Filial:'
      end
      object Label48: TLabel
        Left = 408
        Top = 58
        Width = 367
        Height = 13
        Caption = 
          'Informar a Filial para separar os Produtos e Clientes por empres' +
          'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContador: TLabel
        Left = 192
        Top = 64
        Width = 6
        Height = 13
        Caption = '0'
      end
      object btnListar: TButton
        Left = 284
        Top = 56
        Width = 109
        Height = 25
        Hint = 'Importa arquivos XML'
        Caption = 'Importar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnListarClick
      end
      object chkSub: TCheckBox
        Left = 632
        Top = 16
        Width = 145
        Height = 17
        Caption = 'Incluir Subpastas'
        TabOrder = 2
      end
      object MemLista: TMemo
        Left = 0
        Top = 89
        Width = 856
        Height = 346
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'MemLista')
        ScrollBars = ssBoth
        TabOrder = 3
      end
      object edtDiretorio: TDirectoryEdit
        Left = 283
        Top = 10
        Width = 337
        Height = 21
        DialogKind = dkWin32
        InitialDir = 'C:\'
        MultipleDirs = True
        NumGlyphs = 1
        TabOrder = 0
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 435
        Width = 856
        Height = 202
        Align = alBottom
        Caption = 
          ' Arquivos que apresentaram erros e n'#227'o gravaram os Clientes/Prod' +
          'utos '
        TabOrder = 4
        object Memo1: TMemo
          Left = 2
          Top = 15
          Width = 852
          Height = 185
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 283
        Top = 32
        Width = 337
        Height = 21
        DropDownCount = 8
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = DMImportarXML.dsFilial
        TabOrder = 5
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Erros'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 856
        Height = 637
        Align = alClient
        Lines.Strings = (
          'MemLista')
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xml'
    Left = 680
    Top = 243
  end
end
