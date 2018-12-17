object frmLerNotaCancelada: TfrmLerNotaCancelada
  Left = 259
  Top = 69
  Width = 928
  Height = 560
  Caption = 'frmLerNotaCancelada'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 65
    Align = alTop
    Color = 16763283
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Diretorio: TLabel
      Left = 235
      Top = 16
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pasta:'
    end
    object edtDiretorio: TDirectoryEdit
      Left = 267
      Top = 10
      Width = 398
      Height = 21
      DialogKind = dkWin32
      InitialDir = 'C:\'
      MultipleDirs = True
      NumGlyphs = 1
      TabOrder = 0
    end
    object btnListar: TButton
      Left = 268
      Top = 32
      Width = 109
      Height = 25
      Hint = 'Importa arquivos XML'
      Caption = 'Ler Arquivos'
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
  end
  object MemLista: TMemo
    Left = 0
    Top = 65
    Width = 912
    Height = 223
    Align = alClient
    Ctl3D = False
    Lines.Strings = (
      'MemLista')
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 288
    Width = 912
    Height = 233
    ActivePage = TabSheet3
    Align = alBottom
    TabIndex = 2
    TabOrder = 2
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Arquivos com erros apresentados'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 908
        Height = 210
        Align = alClient
        Ctl3D = False
        ParentCtl3D = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Notas / Cupons N'#227'o Encontrados'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 908
        Height = 210
        Align = alClient
        Ctl3D = False
        DataSource = DMImportarXML.dsCancelada
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'NFeChave'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cancelada'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Width = 115
            Visible = True
          end>
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Notas Encontradas'
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 908
        Height = 210
        Align = alClient
        Ctl3D = False
        DataSource = DMImportarXML.dsmEncontrada
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 4
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'NFeChave'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumNota'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Visible = True
          end>
      end
    end
  end
end
