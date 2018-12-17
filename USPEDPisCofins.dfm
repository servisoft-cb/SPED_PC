object frmSPEDPisCofins: TfrmSPEDPisCofins
  Left = 124
  Top = 68
  Width = 1152
  Height = 623
  Caption = 'ACBrSpedPisCofins - Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1136
    Height = 584
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'TabSheet1'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1132
        Height = 297
        Align = alTop
        TabOrder = 0
        DesignSize = (
          1132
          297)
        object Label9: TLabel
          Left = 40
          Top = 16
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Inicial:'
        end
        object Label10: TLabel
          Left = 197
          Top = 16
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Final:'
        end
        object Label11: TLabel
          Left = 65
          Top = 37
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filial:'
        end
        object Label12: TLabel
          Left = 37
          Top = 58
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Finalidade:'
        end
        object Label13: TLabel
          Left = 52
          Top = 103
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Arquivo'
        end
        object Label14: TLabel
          Left = 10
          Top = 80
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ind. Movimento:'
        end
        object Label6: TLabel
          Left = 958
          Top = 22
          Width = 71
          Height = 13
          Caption = 'Num.Notas (C)'
          Color = clBtnFace
          ParentColor = False
        end
        object lblC170: TLabel
          Left = 808
          Top = 104
          Width = 4
          Height = 13
          Hint = 'C170'
          Caption = '.'
          ParentShowHint = False
          ShowHint = False
        end
        object lblC175: TLabel
          Left = 875
          Top = 107
          Width = 4
          Height = 13
          Hint = 'C175'
          Caption = '.'
          ParentShowHint = False
          ShowHint = True
        end
        object DateEdit1: TDateEdit
          Left = 92
          Top = 8
          Width = 97
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          Text = '01/02/2018'
        end
        object DateEdit2: TDateEdit
          Left = 242
          Top = 8
          Width = 96
          Height = 21
          NumGlyphs = 2
          TabOrder = 1
          Text = '28/02/2018'
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 91
          Top = 29
          Width = 366
          Height = 21
          DropDownCount = 8
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = DMSPEDFiscal.dsFilial
          TabOrder = 3
        end
        object cbFinalidade: TComboBox
          Left = 91
          Top = 50
          Width = 366
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 4
          Text = 'Remessa do arquivo original'
          Items.Strings = (
            'Remessa do arquivo original'
            'Remessa do arquivo substituto')
        end
        object ComboBox1: TComboBox
          Left = 91
          Top = 72
          Width = 238
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 5
          Text = 'Com Movimento'
          Items.Strings = (
            'Com Movimento'
            'Sem Movimento')
        end
        object cbConcomitante: TCheckBox
          Left = 956
          Top = 78
          Width = 134
          Height = 19
          Hint = 
            'Grava os Registros a medida que s'#227'o alimentados'#13#10'Economizando me' +
            'm'#243'ria. '#13#10#218'til para evitar erros em arquivos Enormes'
          Anchors = [akTop, akRight]
          Caption = 'Gerar Concomitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = cbConcomitanteClick
        end
        object edNotas: TEdit
          Left = 950
          Top = 44
          Width = 80
          Height = 21
          TabOrder = 7
          Text = '5'
        end
        object gbxRegistro_0110: TRzGroupBox
          Left = 78
          Top = 119
          Width = 963
          Height = 103
          Anchors = [akLeft, akTop, akRight]
          BorderColor = clNavy
          BorderInner = fsButtonUp
          BorderOuter = fsBump
          Caption = ' Configura'#231#227'o Reg. 0110 '
          Ctl3D = True
          FlatColor = clNavy
          FlatColorAdjustment = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
          VisualStyle = vsGradient
          object Label15: TLabel
            Left = 347
            Top = 20
            Width = 206
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd.indicador da incid'#234'ncia trib.no per'#237'odo:'
          end
          object Label16: TLabel
            Left = 117
            Top = 42
            Width = 436
            Height = 13
            Alignment = taRightJustify
            Caption = 
              'C'#243'd.indicador de m'#233'todo de apropria'#231#227'o de cr'#233'd. comuns, no caso ' +
              'de incid'#234'ncia no regime:'
          end
          object Label1: TLabel
            Left = 257
            Top = 64
            Width = 296
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo indicador do Tipo de Contribui'#231#227'o Apurada no per'#237'odo:'
          end
          object Label5: TLabel
            Left = 2
            Top = 86
            Width = 551
            Height = 13
            Alignment = taRightJustify
            Caption = 
              'C'#243'd.indicador do crit'#233'rio de escrit. e apura'#231#227'o adotado, no caso' +
              ' de incid'#234'ncia exclusivamente no regime cumulativo:'
          end
          object ComboBox2: TComboBox
            Left = 555
            Top = 12
            Width = 310
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              
                '1 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
                'egime n'#227'o-cumulativo'
              
                '2 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia exclusivamente no r' +
                'egime cumulativo'
              
                '3 - Escritura'#231#227'o de opera'#231#245'es com incid'#234'ncia nos regimes n'#227'o-cum' +
                'ulativo e cumulativo')
          end
          object ComboBox3: TComboBox
            Left = 555
            Top = 34
            Width = 310
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              '1 - M'#233'todo de Apropria'#231#227'o Direta'
              '2 - M'#233'todo de Rateio Proporcional (Receita Bruta)')
          end
          object ComboBox4: TComboBox
            Left = 555
            Top = 56
            Width = 310
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              '1 - Apura'#231#227'o da Contribui'#231#227'o Exclusivamente a Al'#237'quota B'#225'sica'
              
                '2 - Apura'#231#227'o da Contribui'#231#227'o a Al'#237'quotas Espec'#237'ficas (Diferencia' +
                'das e/ou por Unidade de Medida de Produto)')
          end
          object ComboBox5: TComboBox
            Left = 555
            Top = 78
            Width = 310
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 3
            Items.Strings = (
              '1 - Regime de Caixa   Escritura'#231#227'o consolidada (Registro F500)'
              
                '2 - Regime de Compet'#234'ncia - Escritura'#231#227'o consolidada (Registro F' +
                '550)'
              '9 - Regime de compet'#234'ncia - Escritura'#231#227'o detalhada ')
          end
        end
        object edtFile: TDirectoryEdit
          Left = 91
          Top = 95
          Width = 366
          Height = 21
          NumGlyphs = 1
          TabOrder = 9
          Text = 'C:\A'
          OnChange = edtFileChange
          OnExit = edtFileChange
        end
        object DateEdit3: TDateEdit
          Left = 361
          Top = 8
          Width = 96
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
          Text = '28/02/2018'
        end
      end
      object BtnBloco_0: TNxButton
        Left = 51
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 1
        Transparent = True
        OnClick = BtnBloco_0Click
      end
      object btnBloco_A: TNxButton
        Left = 211
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 2
        Transparent = True
        OnClick = btnBloco_AClick
      end
      object btnBloco_C: TNxButton
        Left = 371
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 3
        Transparent = True
        OnClick = btnBloco_CClick
      end
      object btnBloco_D: TNxButton
        Left = 531
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 4
        Transparent = True
        OnClick = btnBloco_DClick
      end
      object btnBloco_F: TNxButton
        Left = 691
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 5
        Transparent = True
        OnClick = btnBloco_FClick
      end
      object btnBloco_M: TNxButton
        Left = 851
        Top = 355
        Width = 151
        Height = 30
        Caption = 'Bloco M'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 6
        Transparent = True
        OnClick = btnBloco_MClick
      end
      object btnGerar: TNxButton
        Left = 51
        Top = 312
        Width = 151
        Height = 30
        Caption = 'Gerar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          AE060000424DAE06000000000000360000002800000017000000170000000100
          1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BED7B786B5A064A1955795965B
          95AB84AAD5C8D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB571AA801171831376902787
          9B3B9BA451A6AA5DAEA25DA89C68A45B215C8E6B8EFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFDEBAD9880C728E177D9B
          3193A54CA4A550A4A44DA2A34BA2A24BA1A448A2A247A1C37CC6AC84B6480E48
          D1C6D2FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFCA90C18602
          719524899E3898A249A1A147A0A0449DA1469FA1469FA1469FA1469FA1459F9E
          409BA747A0CB91CF5D2A61B39CB2FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          D8AED2860072962489983092A1449CA0419A9F4199AA55A59E3D989F419BA041
          99A0419AA0419BA0419B9F3F9A9E3996C57EC65A285FCFC1CFFFFFFFFFFFFF00
          0000FFFFFFFFFFFF8A06779421849127899E3C959D3E949D3D949B3691D8BECF
          9D3D949E3B949D3D949D3D949D3D949D3D949D3D949C3B93972D8DC88ECC480E
          4AFFFFFFFFFFFF000000FFFFFFB15FA790197D8B2782942E899E37919D36919D
          36919C34909A308DFFFFFF9220859D35919D36919D35909D36919D35919F3692
          942C8994338BA97FB48F6A8DFFFFFF000000FFFFFF8D0D7B88277F81277F9A31
          8C9B318D9B318D9A318D9B318D962588C896C2FFFFFF9421859B318D9B318D9B
          318D9B318D9B318D9D318D7D1E79AF69B25C225FFFFFFF000000D8B2D38D187E
          7721787B237B9B2A8A9629889629889629889629889628888F1880FDFFFEA23F
          95922184962988962988962988962988992A8A80237D741B76995F9FD8CBD800
          0000C07AB6821F7B5E195F731C6E991F83941D80941D80941D80941E80931E81
          8E137ABF7BB2F5FDF48F127B941F829621839521839521839821857C1E735C15
          5C8C4292AF89AF000000B35DAB701B6C390D3E74206AA139949F4098A1439BA1
          429A9F3C96972B878E157786046DF1F2ECD8BECF8B087094217D94227D94227D
          982380781C6A3D0C3F7B357D9E659E000000B76CB9701B6F7821739A3F97A751
          A7A44EA4A44EA4A34EA49E419DFFFFFFFFFFFFFEFFFFEFEFE9F4FFF0BD81AA90
          15719621789521779921797618634D134F8828869B5F9C000000C38AC87E227C
          8A257D963A90A54FA5A44DA3A34CA2A44CA29E429EC997C9FFFFFFFEFCFEC693
          C7CA99C9C9A1C89C378D9B368D9E398FA042979B3D958C27808C2182A670A800
          0000D8B4DE8132838F237F95348CA54FA5A34CA2A34CA2A34CA2A34BA29D409C
          FFFFFFFFFFFFB873B69B3B9A9F449EA44EA4A44FA5A44FA4A650A697388F8E26
          7F891D7EBD90BB000000ECDDF3975B9F861D77942A84A755AAA44FA5A44FA5A4
          4FA5A550A59E429FD6B0D6FFFFFFFDFEFD9C3F9DA44EA5A54FA5A54FA5A44FA5
          A654AA942D87912782831277E0CADE000000FFFFFFC899D96D1764962083A855
          ADA95AB1A959B0A959B0A959B1A857AFA859B0FFFFFFFFFFFFD0A5D4A34EAAA9
          59B1A959B0AA5AB1A959B0932080952285831674FFFFFF000000FFFFFFE7D0F6
          8C5B958C1678A03E9CB16EC2AE67BCAE67BCAE67BCAE67BCA658B5E5D1EAFFFF
          FFFFFFFFAC64BCAE65BBAE67BCB16DC2A0429F9622868C147ABC7FB3FFFFFF00
          0000FFFFFFFFFFFFDCBCF16322639A2284B472C9B778CEB576CBB576CBB576CB
          B472CAFFFFFFF9F3FAF8F1F9FFFFFFB26FC9B678CDB575CB962783931F828B12
          78FFFFFFFFFFFF000000FFFFFFFFFFFFF7F0FCD0B0E35E1459A1328FC291E7BD
          8AE1BC88DFBD88DFBC88DFBA84DDB57AD9B67ADAB781DBBC8AE0C192E99F3A92
          962483870171E6CDE3FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFF4EBFCCFB0
          E364216095308ACDA2F7CAA1F4C599EFC598EEC598EEC598EEC599EEC8A1F3CB
          A3F4A04299921E7D860072D5ACD0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDCBDF18958936B1E63B785C5E3CDFEE3CDFEE1CCFDE3CF
          FEE4D0FFC291D39130838911768B0D7BE5CAE1FFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D4F5CA99DA9150977A307B
          8F49909951999443918218778108718E127DBF7AB6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1E4F5DCBBE1C792CAB86FB9B76AB0C78DC0E4C8E0FFFFFFFFFFFFFFFFFF
          FFFFFFF2F2F2FFFFFFFFFFFFF2F2F2000000}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 7
        Transparent = True
        OnClick = btnGerarClick
      end
      object btnGravar_Txt: TNxButton
        Left = 883
        Top = 427
        Width = 151
        Height = 30
        Caption = 'Gravar Txt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 8
        Transparent = True
        OnClick = btnGravar_TxtClick
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'TabSheet2'
      DesignSize = (
        1132
        561)
      object Label2: TLabel
        Left = 8
        Top = 280
        Width = 65
        Height = 13
        Caption = 'Lista de erros'
        Color = clBtnFace
        ParentColor = False
      end
      object Label3: TLabel
        Left = 8
        Top = 392
        Width = 75
        Height = 13
        Caption = 'Arquivo Gerado'
        Color = clBtnFace
        ParentColor = False
      end
      object Label7: TLabel
        Left = 24
        Top = 507
        Width = 63
        Height = 13
        Caption = 'Buffer Linhas'
        Color = clBtnFace
        ParentColor = False
      end
      object Label8: TLabel
        Left = 128
        Top = 507
        Width = 61
        Height = 13
        Caption = 'Buffer Notas'
        Color = clBtnFace
        ParentColor = False
      end
      object memoError: TMemo
        Left = 8
        Top = 297
        Width = 977
        Height = 83
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object memoTXT: TMemo
        Left = 0
        Top = 408
        Width = 977
        Height = 97
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
      object btnError: TButton
        Left = 733
        Top = 519
        Width = 98
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Gerar TXT Error'
        TabOrder = 2
        OnClick = btnErrorClick
      end
      object btnTXT: TButton
        Left = 859
        Top = 519
        Width = 98
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Gerar TXT'
        TabOrder = 3
        OnClick = btnTXTClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1132
        Height = 87
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 1
        BorderStyle = bsSingle
        TabOrder = 4
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 450
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 
            '2 - Clique em cada bot'#227'o dos Blocos e em seguida no bot'#227'o Gerar ' +
            'TXT'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btnB_0: TButton
          Left = 79
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco 0'
          TabOrder = 0
          OnClick = btnB_0Click
        end
        object btnB_1: TButton
          Left = 600
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco 1'
          TabOrder = 1
          OnClick = btnB_1Click
        end
        object btnB_C: TButton
          Left = 253
          Top = 51
          Width = 60
          Height = 25
          Caption = 'Bloco C'
          TabOrder = 3
          OnClick = btnB_CClick
        end
        object btnB_D: TButton
          Left = 339
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco D'
          TabOrder = 4
          OnClick = btnB_DClick
        end
        object btnB_A: TButton
          Left = 166
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco A'
          TabOrder = 2
          OnClick = btnB_AClick
        end
        object btnB_F: TButton
          Left = 426
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco F'
          TabOrder = 5
          OnClick = btnB_FClick
        end
        object btnB_M: TButton
          Left = 513
          Top = 51
          Width = 62
          Height = 25
          Caption = 'Bloco M'
          TabOrder = 6
          OnClick = btnB_MClick
        end
        object btnVariosBlocos: TButton
          Left = 22
          Top = 20
          Width = 584
          Height = 25
          Hint = 'Gera o arquivo com os bloco 0,1,A,C,9'
          Caption = 'Todos os Blocos'
          TabOrder = 7
          OnClick = btnVariosBlocosClick
        end
      end
      object btnB_9: TButton
        Left = 610
        Top = 519
        Width = 98
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Gravar Bloco 9'
        Enabled = False
        TabOrder = 5
        OnClick = btnB_9Click
      end
      object edBufLinhas: TEdit
        Left = 16
        Top = 521
        Width = 78
        Height = 21
        TabOrder = 6
        Text = '1000'
      end
      object edBufNotas: TEdit
        Left = 128
        Top = 521
        Width = 78
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = '1000'
      end
      object ProgressBar1: TProgressBar
        Left = 199
        Top = 271
        Width = 346
        Height = 20
        TabOrder = 8
        Visible = False
      end
      object btnImportarXML: TBitBtn
        Left = 576
        Top = 384
        Width = 95
        Height = 25
        Caption = 'btnImportarXML'
        TabOrder = 9
        OnClick = btnImportarXMLClick
      end
    end
  end
  object ACBrSPEDPisCofins1: TACBrSPEDPisCofins
    Path = '.\'
    Arquivo = 'ACBrSPEDPisCofins.txt'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 368
    Top = 256
  end
end
