unit USPEDPisCofins;

{$IFDEF FPC}
  {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEPCBlocos, Dialogs, StdCtrls,
  ACBrSpedPisCofins, ExtCtrls, ComCtrls, ACBrUtil, ACBrTXTClass, Buttons, RxLookup, Mask, ToolEdit,
  UDMSPEDFiscal, NxCollection, RzTabs, RzPanel;

type
  
  { TFrmSPEDPisCofins }

  TfrmSPEDPisCofins = class(TForm)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    memoError: TMemo;
    memoTXT: TMemo;
    btnError: TButton;
    btnTXT: TButton;
    Panel2: TPanel;
    Label4: TLabel;
    btnB_0: TButton;
    btnB_1: TButton;
    btnB_C: TButton;
    btnB_D: TButton;
    btnB_A: TButton;
    btnB_F: TButton;
    btnB_M: TButton;
    btnVariosBlocos: TButton;
    btnB_9: TButton;
    edBufLinhas: TEdit;
    edBufNotas: TEdit;
    ProgressBar1: TProgressBar;
    btnImportarXML: TBitBtn;
    ACBrSPEDPisCofins1: TACBrSPEDPisCofins;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbFinalidade: TComboBox;
    ComboBox1: TComboBox;
    cbConcomitante: TCheckBox;
    edNotas: TEdit;
    BtnBloco_0: TNxButton;
    gbxRegistro_0110: TRzGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    ComboBox4: TComboBox;
    Label5: TLabel;
    ComboBox5: TComboBox;
    edtFile: TDirectoryEdit;
    btnBloco_A: TNxButton;
    btnBloco_C: TNxButton;
    btnBloco_D: TNxButton;
    btnBloco_F: TNxButton;
    btnBloco_M: TNxButton;
    btnGerar: TNxButton;
    btnGravar_Txt: TNxButton;
    DateEdit3: TDateEdit;
    lblC170: TLabel;
    lblC175: TLabel;
    procedure btnB_0Click(Sender: TObject);
    procedure btnB_9Click(Sender: TObject);
    procedure btnTXTClick(Sender: TObject);
    procedure btnB_1Click(Sender: TObject);
    procedure btnB_CClick(Sender: TObject);
    procedure btnB_DClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure cbConcomitanteClick(Sender: TObject);
    procedure ACBrSPEDPisCofins1Error(const MsnError: AnsiString);
    procedure btnB_FClick(Sender: TObject);
    procedure btnB_MClick(Sender: TObject);
    procedure btnB_AClick(Sender: TObject);
    procedure btnVariosBlocosClick(Sender: TObject);
    procedure btnImportarXMLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnBloco_0Click(Sender: TObject);
    procedure edtFileChange(Sender: TObject);
    procedure btnBloco_AClick(Sender: TObject);
    procedure btnBloco_CClick(Sender: TObject);
    procedure btnBloco_DClick(Sender: TObject);
    procedure btnBloco_FClick(Sender: TObject);
    procedure btnBloco_MClick(Sender: TObject);
    procedure btnGravar_TxtClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
    fDMSPEDFiscal: TDMSPEDFiscal;
    vContador_Reg_0: Integer;
    vContador_Reg_A: Integer;
    vContador_Reg_C: Integer;
    vContador_Reg_D: Integer;
    vContador_Reg_F: Integer;
    vContador_Reg_M: Integer;

    vContadorC170, vContadorC175 : Integer;
    procedure LoadToMemo;
    procedure prc_Movimento;
    procedure prc_Gravar_mPessoa;
    procedure prc_Gravar_mProduto;
    procedure prc_Gravar_mUnidade(Unidade: string);
    procedure prc_Gravar_Plano;
    procedure prc_Gravar_mNatureza;
    function fnc_Valida_Campos(Tipo_Bloco: string = ''): Boolean;
    procedure prc_Gerar_Bloco_0;
    procedure prc_Bloco_0_Reg_0000;
    procedure prc_Bloco_0_Reg_0001;
    procedure prc_Bloco_0_Reg_0035;  //Não usado
    procedure prc_Bloco_0_Reg_0100;
    procedure prc_Bloco_0_Reg_0110;
    procedure prc_Bloco_0_Reg_0111; //Não usado
    procedure prc_Bloco_0_Reg_0120; //Não usado
    procedure prc_Bloco_0_Reg_0140;
    procedure prc_Bloco_0_Reg_0400;
    procedure prc_Bloco_0_Reg_0500;
    procedure prc_Bloco_0_Reg_0600;
    procedure prc_Bloco_0_Reg_0990;
    procedure prc_Gerar_Bloco_A;
    procedure prc_Gerar_Bloco_C;
    procedure prc_Gerar_Bloco_C_Reg_C100;
    procedure prc_Gravar_mC175;
    procedure prc_Gravar_mM100;
    procedure prc_Gravar_mM105;
    procedure prc_Gravar_mM200;
    procedure prc_Gravar_mM210;
    procedure prc_Gravar_mM400;
    function fnc_Busca_CSTICMS(CST: string): TACBrCstIcms;
    function fnc_Busca_CSTIPI(CST: string): TACBrCstIpi;
    function fnc_Busca_CSTPIS(CST: string): TACBrCstPis;
    function fnc_Busca_CSTCOFINS(CST: string): TACBrCstCofins;
  public
    { Public declarations }
  end;

var
  frmSPEDPisCofins: TfrmSPEDPisCofins;

implementation

uses
  ACBrEPCBloco_0, ACBrEPCBloco_1, ACBrEPCBloco_A, ACBrEPCBloco_C, ACBrEPCBloco_D, ACBrEPCBloco_F,
  ACBrEPCBloco_M, UImportarXML, rsDBUtils, DB, uUtilPadrao, ACBrEPCBloco_C_Class,
  ACBrEPCBloco_D_Class, ACBrEPCBloco_F_Class, ACBrEPCBloco_M_Class, DateUtils;

{$IFDEF FPC}
 {$R *.lfm}
{$ELSE}
 {$R *.dfm}
{$ENDIF}

procedure TfrmSPEDPisCofins.ACBrSPEDPisCofins1Error(const MsnError: AnsiString);
begin
  memoError.Lines.Add(MsnError);
end;

procedure TfrmSPEDPisCofins.btnB_0Click(Sender: TObject);
const
  strUNID: array[0..4] of string = ('PC', 'UN', 'LT', 'KG', 'MT');
var
  int0140: integer;
  int0150: integer;
  int0190: integer;
  int0200: integer;
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco 0.
  cbConcomitante.Enabled := False;
  btnB_0.Enabled := false;
  btnB_C.Enabled := True;
  with ACBrSPEDPisCofins1 do
  begin
    DT_INI := DateEdit1.Date;
    DT_FIN := DateEdit3.Date;
    IniciaGeracao;
  end;

  if cbConcomitante.Checked then
  begin
    with ACBrSPEDPisCofins1 do
    begin
//         DT_INI := StrToDate('01/04/2011');
//         DT_FIN := StrToDate('30/04/2011');
      LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

//         IniciaGeracao;
    end;

    LoadToMemo;
  end;

  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
      // Dados da Empresa
    with Registro0000New do
    begin
      COD_VER := vlVersao201;
      TIPO_ESCRIT := tpEscrOriginal;
      IND_SIT_ESP := indSitAbertura;
      NUM_REC_ANTERIOR := '';
      NOME := fDMSPEDFiscal.cdsFilialNOME.AsString;
      CNPJ := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString,0);
      UF := fDMSPEDFiscal.cdsFilialUF.AsString;
      COD_MUN := fDMSPEDFiscal.cdsFilialCODMUNICIPIO.AsInteger;
      SUFRAMA := '';
      case fDMSPEDFiscal.cdsFilialIND_NAT_PJ.AsInteger of
        0:
          IND_NAT_PJ := indNatPJSocEmpresariaGeral;
        1:
          IND_NAT_PJ := indNatPJSocCooperativa;
        2:
          IND_NAT_PJ := indNatPJEntExclusivaFolhaSal;
        3:
          IND_NAT_PJ := indNatPJSocEmpresariaGeralSCP;
        4:
          IND_NAT_PJ := indNatPJSocCooperativaSCP;
        5:
          IND_NAT_PJ := indNatPJSocContaParticante;
      end;
      case fDMSPEDFiscal.cdsFilialIND_ATIV_PISCOFINS.AsInteger of
        0:
          IND_ATIV := indAtivIndustrial;
        1:
          IND_ATIV := indAtivPrestadorServico;
        2:
          IND_ATIV := indAtivComercio;
        3:
          IND_ATIV := indAtivoFincanceira;
        4:
          IND_ATIV := indAtivoImobiliaria;
        9:
          IND_ATIV := indAtivoOutros;
      end;

      with Registro0001New do
      begin
        case ComboBox1.ItemIndex of
          0:
            IND_MOV := imComDados;
          1:
            IND_MOV := imSemDados;
        end;


           // FILHO - Dados do contador.
        with Registro0100New do
        begin
          NOME := 'NOME DO CONTADOR';
          CPF := '12345678909'; // Deve ser uma informação valida
          CRC := '123456';
          CNPJ := '22222222000000';
          CEP := '';
          ENDERECO := '';
          NUM := '';
          COMPL := '';
          BAIRRO := '';
          FONE := '';
          FAX := '';
          EMAIL := '';
          COD_MUN := 3200607;
        end;

           // FILHO - Regime de Apuração
        with Registro0110New do
        begin
          COD_INC_TRIB := codEscrOpIncNaoCumulativo; //codEscrOpIncCumulativo;
          IND_APRO_CRED := indMetodoApropriacaoDireta;
          COD_TIPO_CONT := codIndTipoConExclAliqBasica;
              //Campo IND_REG_CUM apenas para Lucro Presumido e (COD_INC_TRIB = 2)
              //IND_REG_CUM := 1;
        end;


           //0140 - Tabela de Cadastro de Estabelecimento
        for int0140 := 1 to 2 do
        begin
           // FILHO
          with Registro0140New do
          begin
            COD_EST := IntToStr(int0140);
            NOME := 'NOME DO ESTABELECIMENTO ' + IntToStr(int0140);
            if int0140 = 1 then
              CNPJ := '11111111000191'
            else
              CNPJ := '11111111000272'; //oito primeiros dígitos devem bater...
            UF := 'ES';
            IE := '';
            COD_MUN := 3200607;
            IM := '';
            SUFRAMA := '';

                 // 10 Clientes por estabelecimento
            for int0150 := 1 to 10 do
            begin
                    //0150 - Tabela de Cadastro do Participante
              with Registro0150New do
              begin
                COD_PART := IntToStr(int0150);
                NOME := 'NOME DO CLIENTE ' + IntToStr(int0150);
                COD_PAIS := '1058';
                CNPJ := '';
                CPF := '12345678909';
                IE := '';
                COD_MUN := 3200607;
                SUFRAMA := '';
                ENDERECO := 'ENDERECO DO CLIENTE ' + IntToStr(int0150);
                NUM := IntToStr(int0150);
                COMPL := 'COMPLEMENTO DO CLIENTE ' + IntToStr(int0150);
                BAIRRO := 'BAIRRO';
                       //
              end;
            end;

                 // 0190 - Identificação das Unidades de Medida
            for int0190 := Low(strUNID) to High(strUNID) do
            begin
              with Registro0190New do
              begin
                UNID := strUNID[int0190];
                DESCR := 'Descricao ' + strUNID[int0190];
              end;
            end;

                 //10 produtos/serviços
            for int0200 := 1 to 10 do
            begin
                    // 0200 - Tabela de Identificação do Item (Produtos e Serviços)
              with Registro0200New do
              begin
                COD_ITEM := FormatFloat('000000', int0200);
                DESCR_ITEM := 'DESCRIÇÃO DO ITEM';
                COD_BARRA := '';
                COD_ANT_ITEM := '';
                UNID_INV := strUNID[int0200 mod (High(strUNID))];
                TIPO_ITEM := tiMercadoriaRevenda;
                COD_NCM := '12345678';
                EX_IPI := '';
                COD_GEN := '';
                COD_LST := '';
                ALIQ_ICMS := 0;

                      //Cria uma alteração apenas para o item 5...
                if (int0200 = 5) then
                  with Registro0205New do
                  begin
                    DESCR_ANT_ITEM := 'DESCRIÇÃO ANTERIOR DO ITEM 5';
                    DT_INI := StrToDate('01/04/2011');
                    DT_FIM := StrToDate('15/04/2011'); //Observe que o campo é DT_FIM e não DT_FIN
                  end;
              end;
            end;
          end;
        end;

           // FILHO - REGISTRO 0500: PLANO DE CONTAS CONTÁBEIS
        with Registro0500New do
        begin
          DT_ALT := StrToDate('01/04/2011');
          COD_NAT_CC := ncgAtivo;
          IND_CTA := indCTASintetica;
          NIVEL := '0';
          COD_CTA := '01';
          NOME_CTA := 'NOME CTA';
          COD_CTA_REF := '0';
          CNPJ_EST := '33333333000191';
        end;

      end;
    end;

  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_0;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDPisCofins.btnB_9Click(Sender: TObject);
begin
  btnB_9.Enabled := False;
  ACBrSPEDPisCofins1.WriteBloco_9;
  LoadToMemo;

   // Habilita os botões
  btnB_0.Enabled := true;
  btnB_1.Enabled := true;
  btnB_A.Enabled := true;
  btnB_C.Enabled := true;
  btnB_D.Enabled := true;
  btnB_F.Enabled := true;
  btnB_M.Enabled := true;

  cbConcomitante.Enabled := True;
end;

procedure TfrmSPEDPisCofins.btnTXTClick(Sender: TObject);
begin
  btnTXT.Enabled := False;

  ACBrSPEDPisCofins1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

  with ACBrSPEDPisCofins1 do
  begin
    DT_INI := StrToDate('01/04/2011');
    DT_FIN := StrToDate('30/04/2011');
  end;

   // Limpa a lista de erros.
  memoError.Lines.Clear;
   // Informa o pasta onde será salvo o arquivo TXT.
  ACBrSPEDPisCofins1.Path := '.\';
  ACBrSPEDPisCofins1.Arquivo := edtFile.Text;

   // Método que gera o arquivo TXT.
  ACBrSPEDPisCofins1.SaveFileTXT;

   // Carrega o arquivo TXT no memo.
  LoadToMemo;

   // Habilita os botões
  btnB_0.Enabled := true;
  btnB_1.Enabled := true;
  btnB_A.Enabled := true;
  btnB_C.Enabled := true;
  btnB_D.Enabled := true;
  btnB_F.Enabled := true;
  btnB_M.Enabled := true;
  btnTXT.Enabled := True;
  cbConcomitante.Enabled := True;
end;

procedure TfrmSPEDPisCofins.btnVariosBlocosClick(Sender: TObject);
begin
  btnB_0.Click;
  btnB_A.Click;
  btnB_C.Click;
  btnB_D.Click;
  btnB_F.Click;
  btnB_M.Click;
  btnB_1.Click;

end;

procedure TfrmSPEDPisCofins.btnErrorClick(Sender: TObject);
begin
  with ACBrSPEDPisCofins1 do
  begin
    DT_INI := StrToDate('01/04/2011');
    DT_FIN := StrToDate('30/04/2011');
  end;

   // Limpa a lista de erros.
  memoError.Lines.Clear;

   // Método que gera o arquivo TXT.
  ACBrSPEDPisCofins1.SaveFileTXT;

   // Habilita os botões
  btnB_0.Enabled := true;
  btnB_1.Enabled := true;
  btnB_A.Enabled := true;
  btnB_C.Enabled := true;
  btnB_D.Enabled := true;
  btnB_F.Enabled := true;
  btnB_M.Enabled := true;
end;

procedure TfrmSPEDPisCofins.btnB_1Click(Sender: TObject);
begin
  btnB_1.Enabled := false;
  btnB_9.Enabled := cbConcomitante.Checked;

   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco 1.
//   with ACBrSPEDPisCofins1.Bloco_1 do
//   begin
//      with Registro1001New do
//      begin
//        IND_MOV := 1;
//      end;
//   end;

  with ACBrSPEDPisCofins1.Bloco_1 do
  begin
    with Registro1001New do
    begin
      IND_MOV := imSemDados;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_1;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDPisCofins.btnB_CClick(Sender: TObject);
var
  INotas: Integer;
  IItens: Integer;
  NNotas: Integer;
  BNotas: Integer;
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco C.
  btnB_C.Enabled := false;
  btnB_D.Enabled := True;

  NNotas := StrToInt64Def(edNotas.Text, 1);
  BNotas := StrToInt64Def(edBufNotas.Text, 1);

  ProgressBar1.Visible := cbConcomitante.Checked;
  ProgressBar1.Max := NNotas;
  ProgressBar1.Position := 0;

  with ACBrSPEDPisCofins1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      IND_MOV := imComDados;

         //C010 - Identificação do Estabelecimento
      with RegistroC010New do
      begin
        CNPJ := '11111111000191';
        IND_ESCRI := IndEscriConsolidado;

           //Inserir Notas...
        for INotas := 1 to NNotas do
        begin
              //C100 - Documento - Nota Fiscal (código 01), Nota Fiscal Avulsa (código 1B), Nota
              // Fiscal de Produtor (código 04) e NF-e (código 55)
          with RegistroC100New do
          begin
            IND_OPER := tpEntradaAquisicao;
            IND_EMIT := edEmissaoPropria;
            COD_PART := '2'; //Baseado no registro 0200
            COD_MOD := '01';
            COD_SIT := sdRegular;
            SER := '';
            NUM_DOC := FormatFloat('000000000', INotas); //
            CHV_NFE := '';
            DT_DOC := DT_INI + INotas;
            DT_E_S := DT_INI + INotas;
            VL_DOC := 0;
            IND_PGTO := tpSemPagamento;
            VL_DESC := 0;
            VL_ABAT_NT := 0;
            VL_MERC := 0;
            IND_FRT := tfSemCobrancaFrete;
            VL_FRT := 0;
            VL_SEG := 0;
            VL_OUT_DA := 0;
            VL_BC_ICMS := 0;
            VL_ICMS := 0;
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST := 0;
            VL_IPI := 0;
            VL_PIS := 0;
            VL_COFINS := 0;
            VL_PIS_ST := 0;
            VL_COFINS_ST := 0;

                //10 itens para cada nota...
            for IItens := 1 to 10 do
            begin
                  //c170 - Complemento de Documento – Itens do Documento (códigos 01, 1B, 04 e 55)
              with RegistroC170New do   //Inicio Adicionar os Itens:
              begin
                NUM_ITEM := FormatFloat('000', IItens);
                COD_ITEM := FormatFloat('000000', StrToInt(NUM_ITEM));
                DESCR_COMPL := FormatFloat('NF000000', INotas) + ' -> ITEM ' + COD_ITEM;
                QTD := 1.123456; // O último dígito deve ser ignorado no arquivo
                UNID := 'UN';
                VL_ITEM := 0;
                VL_DESC := 0;
                IND_MOV := mfNao;
                CST_ICMS := sticmsTributadaIntegralmente;
                CFOP := '1252';
                COD_NAT := '';
//                     COD_NAT          := '64'; //Informar no 0400 antes de utilizá-lo
                VL_BC_ICMS := 0;
                ALIQ_ICMS := 0;
                VL_ICMS := 0;
                VL_BC_ICMS_ST := 0;
                ALIQ_ST := 0;
                VL_ICMS_ST := 0;
                IND_APUR := iaMensal;
                CST_IPI := stipiEntradaIsenta;
                COD_ENQ := '';
                VL_BC_IPI := 0;
                ALIQ_IPI := 0;
                VL_IPI := 0;
                CST_PIS := stpisOutrasOperacoes;
                VL_BC_PIS := 0;
                ALIQ_PIS_PERC := 0;
                QUANT_BC_PIS := 0;
                ALIQ_PIS_R := 1;
                VL_PIS := 0;
                CST_COFINS := stcofinsOutrasOperacoes;
                VL_BC_COFINS := 0;
                ALIQ_COFINS_PERC := 0;
                QUANT_BC_COFINS := 0;
                ALIQ_COFINS_R := 0;
                VL_COFINS := 0;
                COD_CTA := '01'; //Baseado no 0500
              end; //Fim dos Itens;
            end;

            if cbConcomitante.Checked then
            begin
              if (INotas mod BNotas) = 0 then   // Gravar a cada BNotas notas
              begin
                      // Grava registros na memoria para o TXT, e limpa memoria
                ACBrSPEDPisCofins1.WriteBloco_C(False);  // False, NAO fecha o Bloco
                ProgressBar1.Position := INotas;
                Application.ProcessMessages;
              end;
            end;

          end;
        end;


//           //Registros c190
//           for INotas := 1 to NNotas  do
//           begin
//             // c190 - Consolidação de Notas Fiscais Eletrônicas (Código 55) – Operações de
//             // Aquisição com Direito a Crédito, e Operações de Devolução de Compras e
//             // Vendas.
//             with RegistroC190New do
//             begin
//               COD_MOD := '55';
//               DT_REF_INI := Date;
//               DT_REF_FIN := Date;
//               COD_ITEM := ''; //Código do item (campo 02 do Registro 0200)
//               COD_NCM := '';
//               EX_IPI := '';
//               VL_TOT_ITEM := 0;
//
//               //Registros C191 e C195
//
//
//             end;
//           end;
      end;
    end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_C(True);  // True, fecha o Bloco
    LoadToMemo;
  end;

  ProgressBar1.Visible := False;
end;

procedure TfrmSPEDPisCofins.btnB_DClick(Sender: TObject);
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco D.
//   with ACBrSPEDPisCofins1.Bloco_D do
//   begin
//      with RegistroD001New do
//      begin
//        IND_MOV := 1;
//      end;
//   end;
  with ACBrSPEDPisCofins1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      IND_MOV := imComDados;


        //Estabelecimento
      with RegistroD010New do
      begin
        CNPJ := '11111111000191';

//          for INotas := 1 to NNotas do
//          begin
//            with RegistroD100New do
//            begin
//              IND_OPER := 0;
//              IND_EMIT := 0;
//              COD_PART := '';
//              COD_MOD :=  '';
//            end;
//          end;

          //D200 - Resumo da Escrituração Diária – Prestação de Serviços de Transportes
          // (Códigos 07, 08, 8B, 09, 10, 11, 26, 27 e 57).
        with RegistroD200New do
        begin
          //|D200|08|00|||11574|11854|6352|000011574|000011854|6352|25072011|6807,57|0,00|
          COD_MOD := '08';
          COD_SIT := sdfRegular;
          SER := '';
          SUB := '';
          NUM_DOC_INI := 11574;
          NUM_DOC_FIN := 11854;
          CFOP := 6352;
          DT_REF := DT_INI; // StrToDate('15/04/2011');
          VL_DOC := 6807.57;
          VL_DESC := 0;
        end;


//          with RegistroD350New do
//          begin
//            COD_MOD := '2E';
//            ECF_MOD := 'MODELO DO ECF';
//            ECF_FAB := 'NUMSERIEECF';
//            DT_DOC := DT_INI;
//            CRO := 1;
//            CRZ := 1;
//            NUM_COO_FIN := 10;
//            GT_FIN := 10000;
//            VL_BRT := 10000;
//            CST_PIS := stpisValorAliquotaDiferenciada;
//            VL_BC_PIS := 100;
//            ALIQ_PIS := 2;
//            QUANT_BC_PIS := 100;
//            ALIQ_PIS_QUANT := 1;
//            VL_PIS := 1;
//            CST_COFINS := stcofinsValorAliquotaDiferenciada;
//            VL_BC_COFINS := 100;
//            ALIQ_COFINS := 2;
//            QUANT_BC_COFINS := 300;
//            ALIQ_COFINS_QUANT := 2;
//            VL_COFINS := 3;
//            COD_CTA := '';
//          end;
      end;
    end;
  end;
  btnB_D.Enabled := false;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_D;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDPisCofins.LoadToMemo;
begin
  memoTXT.Lines.Clear;
  if FileExists(ACBrSPEDPisCofins1.Path + ACBrSPEDPisCofins1.Arquivo) then
    memoTXT.Lines.LoadFromFile(ACBrSPEDPisCofins1.Path + ACBrSPEDPisCofins1.Arquivo);
end;

procedure TfrmSPEDPisCofins.cbConcomitanteClick(Sender: TObject);
begin
  btnTXT.Enabled := not cbConcomitante.Checked;
  btnError.Enabled := btnTXT.Enabled;

  edBufNotas.Enabled := cbConcomitante.Checked;

  if not cbConcomitante.Checked then
  begin
    btnB_0.Enabled := True;
    btnB_A.Enabled := False;
    btnB_C.Enabled := False;
    btnB_D.Enabled := False;
    btnB_F.Enabled := False;
    btnB_M.Enabled := False;
    btnB_1.Enabled := False;
    btnB_9.Enabled := False;
  end;
end;

procedure TfrmSPEDPisCofins.btnB_FClick(Sender: TObject);
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco F.
  with ACBrSPEDPisCofins1.Bloco_F do
  begin
    with RegistroF001New do
    begin
      IND_MOV := imComDados;

        //F010 - Identificação do Estabelecimento
      with RegistroF010New do
      begin
        CNPJ := '11111111000191';

           //F100 - Demais Documentos e Operações Geradoras de Contribuição e Créditos
        with RegistroF100New do
        begin
          IND_OPER := indRepCustosDespesasEncargos;
          COD_PART := '1';
          COD_ITEM := '000001'; //Codigo do Item no registro 0200
          DT_OPER := Date();
          VL_OPER := 0.01;  //Deve ser Maior que zero
          CST_PIS := stpisCredPresAquiExcRecTribMercInt;  //Para Operação Representativa de Aquisição, Custos, Despesa ou Encargos, Sujeita à Incidência de Crédito, o CST deve ser referente a Operações com Direito a Crédito (50 a 56) ou a Crédito Presumido (60 a 66).Para Operação Representativa de Receita Auferida, Sujeita ao Pagamento da Contribuição, o CST deve ser igual a 01, 02, 03 ou 05.Para Operação Representativa de Receita Auferida NÃO Sujeita ao Pagamento da Contribuição, o CST deve ser igual a 04, 06, 07, 08, 09, 49 ou 99.
          VL_BC_PIS := 0;
          ALIQ_PIS := 1.2375;
          VL_PIS := 0;
          CST_COFINS := stcofinsCredPresAquiExcRecTribMercInt;
          VL_BC_COFINS := 0;
          ALIQ_COFINS := 3.04;
          VL_COFINS := 0;
          NAT_BC_CRED := bccAqBensRevenda;
          IND_ORIG_CRED := opcMercadoInterno;
          COD_CTA := '';
          COD_CCUS := '';
//              COD_CCUS      := '123';//Para usar o COD_CCUS é necessário gerar, primeiro, um registro 0600 correspondente.
          DESC_DOC_OPER := '';
        end;
      end;
    end;
  end;
  btnB_F.Enabled := false;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_F;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDPisCofins.btnB_MClick(Sender: TObject);
var
  vlBC, vlBcCofins, aliqCofins, vlcredNC: Real;
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco M.
  with ACBrSPEDPisCofins1.Bloco_M do
  begin
    with RegistroM001New do
    begin
      IND_MOV := imComDados;

        //M100 - Crédito de PIS/PASEP Relativo ao Período
      with RegistroM100New do
      begin
        COD_CRED := '106';
        IND_CRED_ORI := icoOperProprias;
        VL_BC_PIS := 0;
        ALIQ_PIS := 1.2375;
        QUANT_BC_PIS := 0;
        ALIQ_PIS_QUANT := 0;
        VL_CRED := 0; //OBRIGATORIO
        VL_AJUS_ACRES := 0;
        VL_AJUS_REDUC := 0;
        VL_CRED_DIF := 0;
        VL_CRED_DISP := 0;
        IND_DESC_CRED := idcTotal;
        VL_CRED_DESC := 0; //Valor do Crédito disponível, descontado da contribuição apurada no próprio período. Se IND_DESC_CRED=0, informar o valor total do Campo 12; Se IND_DESC_CRED=1, informar o valor parcial do Campo 12.
        SLD_CRED := 0;

        with RegistroM105New do
        begin
          NAT_BC_CRED := bccAqBensRevenda;
          CST_PIS := stpisCredPresAquiExcRecTribMercInt;
          VL_BC_PIS_TOT := 0;
          VL_BC_PIS_CUM := 0;
          VL_BC_PIS_NC := 0;
          VL_BC_PIS := 0;
          QUANT_BC_PIS_TOT := 0;
          QUANT_BC_PIS := 0;
          DESC_CRED := '';
        end;

      end;

      with RegistroM200New do
      begin
        VL_TOT_CONT_NC_PER := 0;
        VL_TOT_CRED_DESC := 0;
        VL_TOT_CRED_DESC_ANT := 0;
        VL_TOT_CONT_NC_DEV := 0;
        VL_RET_NC := 0;
        VL_OUT_DED_NC := 0;
        VL_CONT_NC_REC := 0;
        VL_TOT_CONT_CUM_PER := 0;
        VL_RET_CUM := 0;
        VL_OUT_DED_CUM := 0;
        VL_CONT_CUM_REC := 0;
        VL_TOT_CONT_REC := 0;

//           with RegistroM210New do
//           begin
//             COD_CONT := ccNaoAcumAliqBasica;
//             VL_REC_BRT := 0;
//             VL_BC_CONT := 0;
//             ALIQ_PIS := 0;
//             QUANT_BC_PIS := 0;
//             ALIQ_PIS_QUANT := 0;
//             VL_CONT_APUR := 0.01;
//             VL_AJUS_ACRES := 0;
//             VL_AJUS_REDUC := 0;
//             VL_CONT_DIFER := 0;
//             VL_CONT_DIFER_ANT := 0;
//             VL_CONT_PER := 0.01;
//           end;

      end;

      with RegistroM500New do
      begin
        COD_CRED := '106';
        IND_CRED_ORI := icoOperProprias;
        VL_BC_COFINS := 0;
        ALIQ_COFINS := 3.0400;
        QUANT_BC_COFINS := 0;
        ALIQ_COFINS_QUANT := 0;
        VL_CRED := 0; //OBRIGATORIO
        VL_AJUS_ACRES := 0;
        VL_AJUS_REDUC := 0;
        VL_CRED_DIFER := 0;
        VL_CRED_DISP := 0;
        IND_DESC_CRED := idcTotal;
        VL_CRED_DESC := 0;
        SLD_CRED := 0;

        with RegistroM505New do
        begin
          NAT_BC_CRED := bccAqBensRevenda;
          CST_COFINS := stcofinsCredPresAquiExcRecTribMercInt;
          VL_BC_COFINS_TOT := 0;
          VL_BC_COFINS_CUM := 0;
          VL_BC_COFINS_NC := 0;
          VL_BC_COFINS := 0;
          QUANT_BC_COFINS_TOT := 0;
          QUANT_BC_COFINS := 0;
          DESC_CRED := '';
        end;

      end;

      with RegistroM600 do
      begin
        VL_TOT_CONT_NC_PER := 0;
        VL_TOT_CRED_DESC := 0;
        VL_TOT_CRED_DESC_ANT := 0;
        VL_TOT_CONT_NC_DEV := 0;
        VL_RET_NC := 0;
        VL_OUT_DED_NC := 0;
        VL_CONT_NC_REC := 0;
        VL_TOT_CONT_CUM_PER := 0;
        VL_RET_CUM := 0;
        VL_OUT_DED_CUM := 0;
        VL_CONT_CUM_REC := 0;
        VL_TOT_CONT_REC := 0;
//
//           with RegistroM610New do
//           begin
//             COD_CONT := ccNaoAcumAliqBasica;
//             VL_REC_BRT := 2;
//             VL_BC_CONT := 3;
//             ALIQ_COFINS := 4;
//             QUANT_BC_COFINS := 5;
//             ALIQ_COFINS_QUANT := 6;
//             VL_CONT_APUR := 7;
//             VL_AJUS_ACRES := 8;
//             VL_AJUS_REDUC := 9;
//             VL_CONT_DIFER := 10;
//             VL_CONT_DIFER_ANT := 11;
//             VL_CONT_PER := 12;
//           end;
//
      end;

//          vlBC := 293040.02;
//          vlBcCofins := 20823.48;
//          aliqCofins := 7.6;
//          vlcredNC := 0;
//          with RegistroM600New do begin
//            {02} VL_TOT_CONT_NC_PER := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100));
//            {03} VL_TOT_CRED_DESC := vlcredNC;
//            {04} VL_TOT_CRED_DESC_ANT := 0;
//            {05} VL_TOT_CONT_NC_DEV := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100))-vlcredNC;
//            {06} VL_RET_NC := 0;
//            {07} VL_OUT_DED_NC := 0;
//            {08} VL_CONT_NC_REC := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100))-vlcredNC;
//            {09} VL_TOT_CONT_CUM_PER := 0;
//            {10} VL_RET_CUM := 0;
//            {11} VL_OUT_DED_CUM := 0;
//            {12} VL_CONT_CUM_REC := 0;
//            {13} VL_TOT_CONT_REC := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100))-vlcredNC;
//
//            with RegistroM610New do begin
//            {02} COD_CONT := ccNaoAcumAliqBasica;
//            {03} VL_REC_BRT := vlBC;
//            {04} VL_BC_CONT := vlBcCofins;
//            {05} ALIQ_COFINS := aliqCofins;
//            {06} QUANT_BC_COFINS := 0;
//            {07} ALIQ_COFINS_QUANT := 0;
//            {08} VL_CONT_APUR := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100));
//            {09} VL_AJUS_ACRES := 0;
//            {10} VL_AJUS_REDUC := 0;
//            {11} VL_CONT_DIFER := 0;
//            {12} VL_CONT_DIFER_ANT:= 0;
//            {13} VL_CONT_PER := StrToCurr(FormatCurr('#####0.00',(vlBcCofins*aliqCofins)/100));
//            end;
//          end;


    end;
  end;
  btnB_M.Enabled := false;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_M;
    LoadToMemo;
  end;
end;

procedure TfrmSPEDPisCofins.btnB_AClick(Sender: TObject);
var
  INotas: Integer;
  IItens: Integer;
  NNotas: Integer;
  BNotas: Integer;
begin
   // Alimenta o componente com informações para gerar todos os registros do
   // Bloco A.
  btnB_A.Enabled := false;

  NNotas := StrToInt64Def(edNotas.Text, 1);
  BNotas := StrToInt64Def(edBufNotas.Text, 1);

  ProgressBar1.Visible := cbConcomitante.Checked;
  ProgressBar1.Max := NNotas;
  ProgressBar1.Position := 0;

  with ACBrSPEDPisCofins1.Bloco_A do
  begin
    with RegistroA001New do
    begin
      IND_MOV := imComDados;
         //
      with RegistroA010New do
      begin
        CNPJ := '11111111000191'; //ou 33333333333328
        for INotas := 1 to NNotas do
        begin
          with RegistroA100New do
          begin
            IND_OPER := itoContratado;
            IND_EMIT := iedfProprio;
            COD_PART := '2'; // baseado no registro 0150
            COD_SIT := sdfRegular;
            SER := '';
            SUB := '';
            NUM_DOC := FormatFloat('NF000000', INotas);
            CHV_NFSE := '';
            DT_DOC := DT_INI + INotas;
            DT_EXE_SERV := DT_INI + INotas;
            VL_DOC := 0.01; //Deve ser maior que zero
            IND_PGTO := tpSemPagamento;
            VL_DESC := 0;
            VL_BC_PIS := 0;
            VL_PIS := 0;
            VL_BC_COFINS := 0;
            VL_COFINS := 0;
            VL_PIS_RET := 0;
            VL_COFINS_RET := 0;
            VL_ISS := 0;

                 //A170
            for IItens := 1 to 5 do
            begin
              with RegistroA170New do   //Inicio Adicionar os Itens:
              begin
                NUM_ITEM := IItens;
                COD_ITEM := FormatFloat('000000', NUM_ITEM); //Código deve ser baseado no registro 0200
//                      COD_ITEM         := IntToStr(NUM_ITEM);
                DESCR_COMPL := FormatFloat('NF000000', INotas) + ' -> ITEM ' + COD_ITEM;
                VL_ITEM := 0;
                VL_DESC := 0;
                NAT_BC_CRED := bccOutrasOpeComDirCredito;
                IND_ORIG_CRED := opcMercadoInterno;
                CST_PIS := stpisOutrasOperacoes;
                VL_BC_PIS := 0;
                ALIQ_PIS := 0;
                VL_PIS := 0;
                CST_COFINS := stcofinsOutrasOperacoes;
                VL_BC_COFINS := 0;
                ALIQ_COFINS := 0;
                VL_COFINS := 0;
                COD_CTA := '01';
                COD_CCUS := '';
//                      COD_CCUS         := '123'; //Para usar o COD_CCUS é necessário gerar, primeiro, um registro 0600 correspondente.
              end; //Fim dos Itens;
            end;
          end;
          if cbConcomitante.Checked then
          begin
            if (INotas mod BNotas) = 0 then   // Gravar a cada N notas
            begin
                    // Grava registros na memoria para o TXT, e limpa memoria
              ACBrSPEDPisCofins1.WriteBloco_A(False);  // False, NAO fecha o Bloco
              ProgressBar1.Position := INotas;
              Application.ProcessMessages;
            end;
          end;
        end;
      end;
    end;
  end;
  if cbConcomitante.Checked then
  begin
    ACBrSPEDPisCofins1.WriteBloco_A(True);  // True, fecha o Bloco
    LoadToMemo;
  end;

  ProgressBar1.Visible := False;
end;

procedure TfrmSPEDPisCofins.btnImportarXMLClick(Sender: TObject);
begin
  frmImportarXML := TfrmImportarXML.Create(frmImportarXML);
  frmImportarXML.ShowModal;
  FreeAndNil(frmImportarXML);
end;

procedure TfrmSPEDPisCofins.FormShow(Sender: TObject);
begin
  fDMSPEDFiscal := TDMSPEDFiscal.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMSPEDFiscal);
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
end;

procedure TfrmSPEDPisCofins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSPEDPisCofins.BtnBloco_0Click(Sender: TObject);
begin
  //if btnGerar.Tag <> 1 then
  //begin
  if not fnc_Valida_Campos then
    exit;
  if MessageDlg('Deseja gerar o <Bloco 0>?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  //end;
  vContador_Reg_0 := 0;

  if fDMSPEDFiscal.cdsFilialID.AsInteger <> RxDBLookupCombo1.KeyValue then
    fDMSPEDFiscal.cdsFilial.Locate('ID', RxDBLookupCombo1.KeyValue, ([Locaseinsensitive]));
  fDMSPEDFiscal.qUF.Close;
  fDMSPEDFiscal.qUF.ParamByName('UF').AsString := fDMSPEDFiscal.cdsFilialUF.AsString;
  fDMSPEDFiscal.qUF.Open;

  {fDMSPEDFiscal.mPessoa.EmptyDataSet;
  fDMSPEDFiscal.mProduto.EmptyDataSet;
  fDMSPEDFiscal.mUnidade.EmptyDataSet;
  fDMSPEDFiscal.mNatureza.EmptyDataSet;
  fDMSPEDFiscal.mPlano.EmptyDataSet;}

  prc_Movimento;

  //if fDMSPEDFiscal.cdsMovimento.IsEmpty then
  //begin
  //  MessageDlg('*** Não existe movimento no período!', mtError, [mbOk], 0);
  //  exit;
  //end;

  prc_Gerar_Bloco_0;
end;

procedure TfrmSPEDPisCofins.prc_Gerar_Bloco_0;
begin
  vContador_Reg_0 := 0;

  prc_Bloco_0_Reg_0000;
  prc_Bloco_0_Reg_0001;
  prc_Bloco_0_Reg_0035; //Não usado
  prc_Bloco_0_Reg_0100;
  prc_Bloco_0_Reg_0110;
  prc_Bloco_0_Reg_0111; //Não usado
  prc_Bloco_0_Reg_0120; //Não usado
  prc_Bloco_0_Reg_0140;
  prc_Bloco_0_Reg_0400;
  prc_Bloco_0_Reg_0500;
  prc_Bloco_0_Reg_0600;
  prc_Bloco_0_Reg_0990;
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0000;
begin
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.COD_VER := vlVersao201;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.TIPO_ESCRIT := tpEscrOriginal;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.DT_INI := DateEdit1.Date;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.DT_FIN := DateEdit3.Date;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_SIT_ESP := indNenhum;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.NUM_REC_ANTERIOR := '';
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.NOME := fDMSPEDFiscal.cdsFilialNOME.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.CNPJ := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString,0);
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.UF := fDMSPEDFiscal.cdsFilialUF.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.COD_MUN := fDMSPEDFiscal.cdsFilialCODMUNICIPIO.AsInteger;
  ACBrSPEDPisCofins1.Bloco_0.Registro0000New.SUFRAMA := '';
  case fDMSPEDFiscal.cdsFilialIND_NAT_PJ.AsInteger of
    0:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJSocEmpresariaGeral;
    1:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJSocCooperativa;
    2:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJEntExclusivaFolhaSal;
    3:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJSocEmpresariaGeralSCP;
    4:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJSocCooperativaSCP;
    5:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_NAT_PJ := indNatPJSocContaParticante;
  end;
  case fDMSPEDFiscal.cdsFilialIND_ATIV_PISCOFINS.AsInteger of
    0:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivIndustrial;
    1:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivPrestadorServico;
    2:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivComercio;
    3:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivoFincanceira;
    4:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivoImobiliaria;
    9:
      ACBrSPEDPisCofins1.Bloco_0.Registro0000New.IND_ATIV := indAtivoOutros;
  end;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0001;
begin
  case ComboBox1.ItemIndex of
    0:
      ACBrSPEDPisCofins1.Bloco_0.Registro0001New.IND_MOV := imComDados;
    1:
      ACBrSPEDPisCofins1.Bloco_0.Registro0001New.IND_MOV := imSemDados;
  end;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

function TfrmSPEDPisCofins.fnc_Valida_Campos(Tipo_Bloco: string): Boolean;
begin

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0035;
begin

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0100;
begin
  fDMSPEDFiscal.qContabilista.Close;
  fDMSPEDFiscal.qContabilista.ParamByName('ID').AsInteger := fDMSPEDFiscal.cdsFilialID_CONTABILISTA.AsInteger;
  fDMSPEDFiscal.qContabilista.Open;
  if fDMSPEDFiscal.qContabilista.IsEmpty then
    exit;

  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.NOME := fDMSPEDFiscal.qContabilistaNOME.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CPF := Monta_Numero(fDMSPEDFiscal.qContabilistaCPF.AsString, 11);
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CRC := fDMSPEDFiscal.qContabilistaCRC.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CNPJ := Monta_Numero(fDMSPEDFiscal.qContabilistaCNPJ.AsString, 14);
  if copy(ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CNPJ, 1, 6) = '000000' then
    ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CNPJ := '';
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.CEP := Monta_Numero(fDMSPEDFiscal.qContabilistaCEP.AsString, 8);
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.ENDERECO := fDMSPEDFiscal.qContabilistaENDERECO.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.NUM := fDMSPEDFiscal.qContabilistaNUM_END.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.COMPL := fDMSPEDFiscal.qContabilistaCOMPLEMENTO_END.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.BAIRRO := fDMSPEDFiscal.qContabilistaBAIRRO.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.FONE := fDMSPEDFiscal.qContabilistaFONE.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.FAX := fDMSPEDFiscal.qContabilistaFAX.AsString;
  ACBrSPEDPisCofins1.Bloco_0.Registro0100New.EMAIL := fDMSPEDFiscal.qContabilistaEMAIL.AsString;
  fDMSPEDFiscal.prc_Abrir_qCidade(fDMSPEDFiscal.qContabilistaID_CIDADE.AsInteger);
  if not fDMSPEDFiscal.qCidade.IsEmpty then
    ACBrSPEDPisCofins1.Bloco_0.Registro0100New.COD_MUN := fDMSPEDFiscal.qCidadeCODMUNICIPIO.AsInteger;

  vContador_Reg_0 := vContador_Reg_0 + 1;

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0110;
begin
  // FILHO - Regime de Apuração
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    with Registro0001New do
    begin
      with Registro0110New do
      begin
        case ComboBox2.ItemIndex of
          0:
            COD_INC_TRIB := codEscrOpIncNaoCumulativo;
          1:
            COD_INC_TRIB := codEscrOpIncCumulativo;
          2:
            COD_INC_TRIB := codEscrOpIncAmbos;
        end;
        case ComboBox3.ItemIndex of
          0:
            IND_APRO_CRED := indMetodoApropriacaoDireta;
          1:
            IND_APRO_CRED := indMetodoDeRateioProporcional;
        end;
        case ComboBox4.ItemIndex of
          0:
            COD_TIPO_CONT := codIndTipoConExclAliqBasica;
          1:
            COD_TIPO_CONT := codIndTipoAliqEspecificas;
        end;
        case ComboBox5.ItemIndex of
          0:
            IND_REG_CUM := codRegimeCaixa;
          1:
            IND_REG_CUM := codRegimeCompetEscritConsolidada;
          2:
            IND_REG_CUM := codRegimeCompetEscritDetalhada;
        end;
      end;
    end;
  end;
  vContador_Reg_0 := vContador_Reg_0 + 1;
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0111;
begin

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0120;
begin

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0140;
begin
  with ACBrSPEDPisCofins1.Bloco_0 do
  begin
    with Registro0001New do
    begin
      with Registro0140New do
      begin
        COD_EST := fDMSPEDFiscal.cdsFilialID.AsString;
        NOME := fDMSPEDFiscal.cdsFilialNOME.AsString;
        CNPJ := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString, 14);
        UF := fDMSPEDFiscal.cdsFilialUF.AsString;
        IE := Monta_Numero(fDMSPEDFiscal.cdsFilialINSCR_EST.AsString, 0);
        COD_MUN := fDMSPEDFiscal.cdsFilialCODMUNICIPIO.AsInteger;
        IM := '';
        SUFRAMA := '';
        vContador_Reg_0 := vContador_Reg_0 + 1;

        // 10 Clientes por estabelecimento
        fDMSPEDFiscal.cdsMov_Pessoa.Close;
        fDMSPEDFiscal.sdsMov_Pessoa.ParamByName('DATA1').AsDate     := DateEdit1.Date;
        fDMSPEDFiscal.sdsMov_Pessoa.ParamByName('DATA2').AsDate     := DateEdit2.Date;
        fDMSPEDFiscal.sdsMov_Pessoa.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
        fDMSPEDFiscal.cdsMov_Pessoa.Open;
        fDMSPEDFiscal.cdsMov_Pessoa.First;
        while not fDMSPEDFiscal.cdsMov_Pessoa.Eof do
        begin
          with Registro0150New do
          begin
            COD_PART := fDMSPEDFiscal.cdsMov_PessoaID_PESSOA.AsString;
            NOME := fDMSPEDFiscal.cdsMov_PessoaNOME.AsString;
            COD_PAIS := fDMSPEDFiscal.cdsMov_PessoaCODPAIS.AsString;
            if fDMSPEDFiscal.cdsMov_PessoaPESSOA.AsString <> '' then
              CNPJ := Monta_Numero(fDMSPEDFiscal.cdsMov_PessoaCNPJ_CPF.AsString, 14)
            else
              CPF := Monta_Numero(fDMSPEDFiscal.cdsMov_PessoaCNPJ_CPF.AsString, 11);
            IE := Monta_Numero(fDMSPEDFiscal.cdsMov_PessoaINSCR_EST.AsString, 0);
            if trim(fDMSPEDFiscal.cdsMov_PessoaCODMUNICIPIO.AsString) <> '' then
              COD_MUN := fDMSPEDFiscal.cdsMov_PessoaCODMUNICIPIO.AsInteger
            else
              COD_MUN := 0;
            SUFRAMA := '';
            ENDERECO := fDMSPEDFiscal.cdsMov_PessoaENDERECO.AsString;
            NUM := fDMSPEDFiscal.cdsMov_PessoaNUM_END.AsString;
            COMPL := fDMSPEDFiscal.cdsMov_PessoaCOMPLEMENTO_END.AsString;
            BAIRRO := fDMSPEDFiscal.cdsMov_PessoaBAIRRO.AsString;
          end;
          vContador_Reg_0 := vContador_Reg_0 + 1;
          fDMSPEDFiscal.cdsMov_Pessoa.Next;
        end;

        // 0190 - Identificação das Unidades de Medida
        fDMSPEDFiscal.cdsMov_Unidade.Close;
        fDMSPEDFiscal.sdsMov_Unidade.ParamByName('DATA1').AsDate     := DateEdit1.Date;
        fDMSPEDFiscal.sdsMov_Unidade.ParamByName('DATA2').AsDate     := DateEdit2.Date;
        fDMSPEDFiscal.sdsMov_Unidade.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
        fDMSPEDFiscal.cdsMov_Unidade.Open;
        fDMSPEDFiscal.cdsMov_Unidade.First;
        while not fDMSPEDFiscal.cdsMov_Unidade.Eof do
        begin
          with Registro0190New do
          begin
            UNID := fDMSPEDFiscal.cdsMov_UnidadeUnidade.AsString;
            DESCR := fDMSPEDFiscal.cdsMov_UnidadeNOME.AsString;
          end;
          vContador_Reg_0 := vContador_Reg_0 + 1;
          fDMSPEDFiscal.cdsMov_Unidade.Next;
        end;

        //10 produtos/serviços
        fDMSPEDFiscal.cdsMov_Produto.Close;
        fDMSPEDFiscal.sdsMov_Produto.ParamByName('DATA1').AsDate     := DateEdit1.Date;
        fDMSPEDFiscal.sdsMov_Produto.ParamByName('DATA2').AsDate     := DateEdit2.Date;
        fDMSPEDFiscal.sdsMov_Produto.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
        fDMSPEDFiscal.cdsMov_Produto.Open;
        fDMSPEDFiscal.cdsMov_Produto.First;
        fDMSPEDFiscal.cdsMov_Produto.First;
        while not fDMSPEDFiscal.cdsMov_Produto.Eof do
        begin
            // 0200 - Tabela de Identificação do Item (Produtos e Serviços)
          with Registro0200New do
          begin
            COD_ITEM     := fDMSPEDFiscal.cdsMov_ProdutoREFERENCIA.AsString;
            DESCR_ITEM   := fDMSPEDFiscal.cdsMov_ProdutoNOME.AsString;
            COD_BARRA    := fDMSPEDFiscal.cdsMov_ProdutoCOD_BARRA.AsString;
            COD_ANT_ITEM := '';
            UNID_INV     := fDMSPEDFiscal.cdsMov_ProdutoUNIDADE.AsString;
            TIPO_ITEM    := tiMercadoriaRevenda;
            COD_NCM      := fDMSPEDFiscal.cdsMov_ProdutoNCM.AsString;
            EX_IPI       := fDMSPEDFiscal.cdsMov_ProdutoEX_IPI.AsString;
            COD_GEN := copy(fDMSPEDFiscal.cdsMov_ProdutoNCM.AsString, 1, 2);
            COD_LST := '';
            ALIQ_ICMS := StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.cdsMov_ProdutoPERC_ICMS.AsFloat));

              //Cria uma alteração apenas para o item 5...
              {if (int0200 = 5) then with Registro0205New do
              begin
                DESCR_ANT_ITEM := 'DESCRIÇÃO ANTERIOR DO ITEM 5';
                DT_INI := StrToDate('01/04/2011');
                DT_FIM := StrToDate('15/04/2011'); //Observe que o campo é DT_FIM e não DT_FIN
              end;}
          end;
          vContador_Reg_0 := vContador_Reg_0 + 1;
          fDMSPEDFiscal.cdsMov_Produto.Next;
        end;
      end;
    end;
  end;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mPessoa;
begin
  {if fDMSPEDFiscal.mPessoa.FindKey([fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger]) then
    exit;

  fDMSPEDFiscal.qPessoa.Close;
  fDMSPEDFiscal.qPessoa.ParamByName('CODIGO').AsInteger := fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger;
  fDMSPEDFiscal.qPessoa.Open;

  fDMSPEDFiscal.mPessoa.Insert;
  fDMSPEDFiscal.mPessoaCodigo.AsInteger := fDMSPEDFiscal.cdsMovimentoID_PESSOA.AsInteger;
  fDMSPEDFiscal.mPessoaNome.AsString := fDMSPEDFiscal.qPessoaNOME.AsString;
  fDMSPEDFiscal.mPessoaCod_Pais.AsString := fDMSPEDFiscal.qPessoaCODPAIS.AsString;
  fDMSPEDFiscal.mPessoaCNPJ.AsString := '';
  fDMSPEDFiscal.mPessoaCPF.AsString := '';

  if fDMSPEDFiscal.qPessoaPESSOA.AsString = 'J' then
    fDMSPEDFiscal.mPessoaCNPJ.AsString := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString, 14)
  else
    fDMSPEDFiscal.mPessoaCPF.AsString := Monta_Numero(fDMSPEDFiscal.qPessoaCNPJ_CPF.AsString, 11);
  fDMSPEDFiscal.mPessoaInscr_Estadual.AsString := fDMSPEDFiscal.qPessoaINSCR_EST.AsString;
  fDMSPEDFiscal.mPessoaCod_Municipio.AsString := fDMSPEDFiscal.qPessoaCODMUNICIPIO.AsString;
  fDMSPEDFiscal.mPessoaSuframa.AsString := '';
  fDMSPEDFiscal.mPessoaEndereco.AsString := fDMSPEDFiscal.qPessoaENDERECO.AsString;
  fDMSPEDFiscal.mPessoaNum_End.AsString := fDMSPEDFiscal.qPessoaNUM_END.AsString;
  fDMSPEDFiscal.mPessoaComplemento_End.AsString := fDMSPEDFiscal.qPessoaCOMPLEMENTO_END.AsString;
  fDMSPEDFiscal.mPessoaBairro.AsString := fDMSPEDFiscal.qPessoaBAIRRO.AsString;
  fDMSPEDFiscal.mPessoa.Post;}
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mProduto;
var
  vCodigo: string;
begin
  //if fDMSPEDFiscal.qParametrosIMP_NFE_REF_PROD.AsString = 'R' then
  {vCodigo := fDMSPEDFiscal.cdsMovimentoREFERENCIA.AsString;
  //else
  //  vCodigo := fDMSPEDFiscal.cdsMovimentoID_PRODUTO.AsString;
  if fDMSPEDFiscal.cdsMovimentoID_COR.AsInteger > 0 then
    vCodigo := vCodigo + '.' + fDMSPEDFiscal.cdsMovimentoID_COR.AsString;
  if (trim(fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString) <> '') and (fDMSPEDFiscal.cdsMovimentoUSA_TAMANHO_AGRUPADO_NFE.AsString <> 'S') then
    vCodigo := vCodigo + '.' + fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString;

  if fDMSPEDFiscal.mProduto.FindKey([vCodigo]) then
    exit;
  fDMSPEDFiscal.mProduto.Insert;
  fDMSPEDFiscal.mProdutoID.AsInteger := fDMSPEDFiscal.cdsMovimentoID_PRODUTO.AsInteger;
  fDMSPEDFiscal.mProdutoCod_Produto.AsString := vCodigo;
  if trim(fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString) <> '' then
    fDMSPEDFiscal.mProdutoTamanho.AsString := fDMSPEDFiscal.cdsMovimentoTAMANHO.AsString;
  fDMSPEDFiscal.mProdutoNome.AsString := fDMSPEDFiscal.cdsMovimentoNOME_PRODUTO_SERV.AsString;
  fDMSPEDFiscal.mProdutoCod_Barra.AsString := fDMSPEDFiscal.cdsMovimentoCOD_BARRA_CAD.AsString;
  fDMSPEDFiscal.mProdutoCod_Anterior.AsString := '';
  fDMSPEDFiscal.mProdutoUnidade.AsString := fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString;
  fDMSPEDFiscal.mProdutoTipo_Item.AsString := fDMSPEDFiscal.cdsMovimentoSPED_TIPO_ITEM.AsString;
  fDMSPEDFiscal.mProdutoNCM.AsString := Monta_Numero(fDMSPEDFiscal.cdsMovimentoNCM.AsString, 0);
  fDMSPEDFiscal.mProdutoNCM_EX.AsString := fDMSPEDFiscal.cdsMovimentoNCM_EX.AsString;
  fDMSPEDFiscal.mProdutoEX_IPI.AsString := '999';
  fDMSPEDFiscal.mProdutoCOD_SERVICO.AsInteger := 0;
  fDMSPEDFiscal.mProdutoPERC_ICMS.AsFloat := StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.qUFPERC_ICMS_INTERNO.AsFloat));
  fDMSPEDFiscal.mProduto.Post;}
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mUnidade(Unidade: string);
begin
  {if fDMSPEDFiscal.mUnidade.FindKey([Unidade]) then
    exit;
  fDMSPEDFiscal.qUnidade.Close;
  fDMSPEDFiscal.qUnidade.ParamByName('UNIDADE').AsString := Unidade;
  fDMSPEDFiscal.qUnidade.Open;
  fDMSPEDFiscal.mUnidade.Insert;
  fDMSPEDFiscal.mUnidadeUnidade.AsString := Unidade;
  if fDMSPEDFiscal.qUnidadeUNIDADE.AsString <> fDMSPEDFiscal.qUnidadeNOME.AsString then
    fDMSPEDFiscal.mUnidadeNome.AsString := fDMSPEDFiscal.qUnidadeNOME.AsString;
  fDMSPEDFiscal.mUnidadeFator_Conversao.AsFloat := 1;
  fDMSPEDFiscal.mUnidade.Post;}
end;

procedure TfrmSPEDPisCofins.prc_Movimento;
var
  vTipo_Reg: string;
  vNumNota: string;
  vID_Natureza: Integer;
begin
  prc_Gravar_Plano;

  {fDMSPEDFiscal.cdsMovimento.Close;
  fDMSPEDFiscal.sdsMovimento.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsMovimento.ParamByName('DT_FINAL').AsDate := DateEdit2.Date;
  fDMSPEDFiscal.sdsMovimento.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsMovimento.Open;
  fDMSPEDFiscal.cdsMovimento.IndexFieldNames := 'ID';}
  vTipo_Reg := '';
  vNumNota := '';
  vID_Natureza := 0;

  {fDMSPEDFiscal.cdsMovimento.First;
  while not fDMSPEDFiscal.cdsMovimento.Eof do
  begin
    //Tirado e colocado em sql cdsMov_Pessoa   13/03/2018
    //if (((fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTS') or (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTE') or
    //    (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'CFI')) and (fDMSPEDFiscal.cdsMovimentoNUM_NOTA.AsString <> vNumNota)) then
    //  prc_Gravar_mPessoa;
    //******************

    //prc_Gravar_Plano;

    //13/03/2018
    //prc_Gravar_mProduto;
    //13/03/2018
    //prc_Gravar_mUnidade(fDMSPEDFiscal.cdsMovimentoUNIDADE.AsString);
    //if fDMSPEDFiscal.cdsMovimentoUNIDADE.AsString <> fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString then
    //  prc_Gravar_mUnidade(fDMSPEDFiscal.cdsMovimentoUNIDADE_PRODUTO_CAD.AsString);
    //*****************

    //13/03/2018
    //if vID_Natureza <> fDMSPEDFiscal.cdsMovimentoID_CFOP.AsInteger then
      //prc_Gravar_mNatureza;

    if (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTS') or (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTE') then
      vNumNota := fDMSPEDFiscal.cdsMovimentoNUM_NOTA.AsString
    else if (fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'CFI') then
      vNumNota := fDMSPEDFiscal.cdsMovimentoNUM_NOTA.AsString;
    vID_Natureza := 0;
    fDMSPEDFiscal.cdsMovimento.Next;
  end;}

end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0400;
begin
  fDMSPEDFiscal.cdsMov_Natureza.Close;
  fDMSPEDFiscal.sdsMov_Natureza.ParamByName('DATA1').AsDate     := DateEdit1.Date;
  fDMSPEDFiscal.sdsMov_Natureza.ParamByName('DATA2').AsDate     := DateEdit2.Date;
  fDMSPEDFiscal.sdsMov_Natureza.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsMov_Natureza.Open;
  fDMSPEDFiscal.cdsMov_Natureza.First;
  while not fDMSPEDFiscal.cdsMov_Natureza.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0400New do
        begin
          COD_NAT := fDMSPEDFiscal.cdsMov_NaturezaCODCFOP.AsString;
          DESCR_NAT := fDMSPEDFiscal.cdsMov_NaturezaNOME.AsString;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.cdsMov_Natureza.Next;
  end;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_Plano;
var
  vCodPlano: string;
begin
  fDMSPEDFiscal.cdsPlano_Contas.Close;
  fDMSPEDFiscal.cdsPlano_Contas.Open;
  fDMSPEDFiscal.cdsPlano_Contas.First;
  while not fDMSPEDFiscal.cdsPlano_Contas.Eof do
  begin
    fDMSPEDFiscal.mPlano.Insert;
    fDMSPEDFiscal.mPlanoCOD_CTA.AsString := fDMSPEDFiscal.cdsPlano_ContasCODIGO.AsString;
    fDMSPEDFiscal.mPlanoDTALT.AsDateTime  := fDMSPEDFiscal.cdsPlano_ContasDT_CADASTRO.AsDateTime;
    fDMSPEDFiscal.mPlanoCOD_NAT.AsInteger := fDMSPEDFiscal.cdsPlano_ContasCOD_NATUREZA.AsInteger;
    fDMSPEDFiscal.mPlanoTIPO_REG.AsString := fDMSPEDFiscal.cdsPlano_ContasTIPO_REG.AsString;
    fDMSPEDFiscal.mPlanoNIVEL.AsInteger   := fDMSPEDFiscal.cdsPlano_ContasNIVEL.AsInteger;
    fDMSPEDFiscal.mPlanoNOME_CTA.AsString := fDMSPEDFiscal.cdsPlano_ContasNOME.AsString;
    fDMSPEDFiscal.mPlano.Post;
    fDMSPEDFiscal.cdsPlano_Contas.Next;
  end;


  {if (fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsMovimentoPERC_PIS.AsFloat)) > 0) then
    vCodPlano := '3.1.1.01.01.01.2000'
  else
  if (fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsMovimentoPERC_PIS.AsFloat)) <= 0) then
    vCodPlano := '3.1.1.01.01.01.0157'
  else
    vCodPlano := '3.1.1.01.01.01.1010';

  if fDMSPEDFiscal.mPlano.Locate('COD_CTA', vCodPlano, ([Locaseinsensitive])) then
    exit;
  //fDMSPEDFiscal.mPlano.Insert;
  //fDMSPEDFiscal.mPlanoCOD_CTA.AsString := vCodPlano;
  if (fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsMovimentoPERC_PIS.AsFloat)) > 0) then
  begin
    fDMSPEDFiscal.qPlanoContas.Close;
    fDMSPEDFiscal.qPlanoContas.ParamByName('CODIGO').AsString := '3.1.1.01.01.01.2000';
    fDMSPEDFiscal.qPlanoContas.Open;

    fDMSPEDFiscal.mPlano.Insert;
    fDMSPEDFiscal.mPlanoCOD_CTA.AsString  := fDMSPEDFiscal.qPlanoContasCODIGO.AsString;
    fDMSPEDFiscal.mPlanoDTALT.AsDateTime  := fDMSPEDFiscal.qPlanoContasDT_CADASTRO.AsDateTime;
    fDMSPEDFiscal.mPlanoCOD_NAT.AsInteger := fDMSPEDFiscal.qPlanoContasCOD_NATUREZA.AsInteger;
    fDMSPEDFiscal.mPlanoTIPO_REG.AsString := fDMSPEDFiscal.qPlanoContasTIPO_REG.AsString;
    fDMSPEDFiscal.mPlanoNIVEL.AsInteger   := fDMSPEDFiscal.qPlanoContasNIVEL.AsInteger;
    fDMSPEDFiscal.mPlanoNOME_CTA.AsString := fDMSPEDFiscal.qPlanoContasNOME.AsString;
  end;

  {if fDMSPEDFiscal.cdsMovimentoTIPO_REG.AsString = 'NTE' then
  begin
    fDMSPEDFiscal.mPlanoDTALT.AsDateTime := fDMSPEDFiscal.cdsMovimentoCONT_FORN_DT_CAD.AsDateTime;
    fDMSPEDFiscal.mPlanoCOD_NAT.AsInteger := fDMSPEDFiscal.cdsMovimentoCONT_FORN_NAT.AsInteger;
    fDMSPEDFiscal.mPlanoTIPO_REG.AsString := fDMSPEDFiscal.cdsMovimentoCONT_FORN_TIPO.AsString;
    fDMSPEDFiscal.mPlanoNIVEL.AsInteger := fDMSPEDFiscal.cdsMovimentoCONT_FORN_NIVEL.AsInteger;
    fDMSPEDFiscal.mPlanoNOME_CTA.AsString := fDMSPEDFiscal.cdsMovimentoCONT_FORN_NOME.AsString;
  end
  else
  begin
    fDMSPEDFiscal.mPlanoDTALT.AsDateTime := fDMSPEDFiscal.cdsMovimentoCONT_PROD_DT_CAD.AsDateTime;
    fDMSPEDFiscal.mPlanoCOD_NAT.AsInteger := fDMSPEDFiscal.cdsMovimentoCONT_PROD_NAT.AsInteger;
    fDMSPEDFiscal.mPlanoTIPO_REG.AsString := fDMSPEDFiscal.cdsMovimentoCONT_PROD_TIPO.AsString;
    fDMSPEDFiscal.mPlanoNIVEL.AsInteger := fDMSPEDFiscal.cdsMovimentoCONT_PROD_NIVEL.AsInteger;
    fDMSPEDFiscal.mPlanoNOME_CTA.AsString := fDMSPEDFiscal.cdsMovimentoCONT_PROD_NOME.AsString;
  end;
  fDMSPEDFiscal.mPlano.Post;}
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0500;
begin
  fDMSPEDFiscal.mPlano.First;
  while not fDMSPEDFiscal.mPlano.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0500New do
        begin
          DT_ALT := fDMSPEDFiscal.mPlanoDTALT.AsDateTime;
          case fDMSPEDFiscal.mPlanoCOD_NAT.AsInteger of
            01:
              COD_NAT_CC := ncgAtivo;
            02:
              COD_NAT_CC := ncgPassivo;
            03:
              COD_NAT_CC := ncgLiquido;
            04:
              COD_NAT_CC := ncgResultado;
            05:
              COD_NAT_CC := ncgCompensacao;
            09:
              COD_NAT_CC := ncgOutras;
          end;
          if fDMSPEDFiscal.mPlanoTIPO_REG.AsString = 'A' then
            IND_CTA := indCTAnalitica
          else
            IND_CTA := indCTASintetica;
          NIVEL := fDMSPEDFiscal.mPlanoNIVEL.AsString;
          COD_CTA := fDMSPEDFiscal.mPlanoCOD_CTA.AsString;
          NOME_CTA := fDMSPEDFiscal.mPlanoNOME_CTA.AsString;
          COD_CTA_REF := '';
          CNPJ_EST := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString, 14);
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.mPlano.Next;
  end;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mNatureza;
begin
  {if fDMSPEDFiscal.mNatureza.FindKey([fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString]) then
    exit;
  fDMSPEDFiscal.mNatureza.Insert;
  fDMSPEDFiscal.mNaturezaCod_Natureza.AsString := fDMSPEDFiscal.cdsMovimentoCODCFOP.AsString;
  fDMSPEDFiscal.mNaturezaNome_Natureza.AsString := fDMSPEDFiscal.cdsMovimentoNOME_CFOP.AsString;
  fDMSPEDFiscal.mNatureza.Post;}
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0600;
begin
  fDMSPEDFiscal.cdsCentroCusto.Close;
  fDMSPEDFiscal.cdsCentroCusto.Open;
  fDMSPEDFiscal.cdsCentroCusto.First;
  while not fDMSPEDFiscal.cdsCentroCusto.Eof do
  begin
    with ACBrSPEDPisCofins1.Bloco_0 do
    begin
      with Registro0001New do
      begin
        with Registro0600New do
        begin
          DT_ALT := fDMSPEDFiscal.cdsCentroCustoDT_CADASTRO.AsDateTime;
          COD_CCUS := fDMSPEDFiscal.cdsCentroCustoCODIGO.AsString;
          CCUS := fDMSPEDFiscal.cdsCentroCustoDESCRICAO.AsString;
        end;
      end;
    end;
    vContador_Reg_0 := vContador_Reg_0 + 1;
    fDMSPEDFiscal.cdsCentroCusto.Next;
  end;
end;

procedure TfrmSPEDPisCofins.prc_Bloco_0_Reg_0990;
begin
  vContador_Reg_0 := vContador_Reg_0 + 1;
  ACBrSPEDPisCofins1.Bloco_0.Registro0990.QTD_LIN_0 := vContador_Reg_0;
end;

procedure TfrmSPEDPisCofins.edtFileChange(Sender: TObject);
begin
  ACBrSPEDPisCofins1.Arquivo := edtFile.Text;
end;

procedure TfrmSPEDPisCofins.btnBloco_AClick(Sender: TObject);
begin
  prc_Gerar_Bloco_A;
end;

procedure TfrmSPEDPisCofins.prc_Gerar_Bloco_A;
begin
  vContador_Reg_A := 1;
  //case ComboBox1.ItemIndex of
   // 0 : ACBrSPEDPisCofins1.Bloco_A.RegistroA001New.IND_MOV := imComDados;
    //1 : ACBrSPEDPisCofins1.Bloco_A.RegistroA001New.IND_MOV := imSemDados;
  ACBrSPEDPisCofins1.Bloco_A.RegistroA001New.IND_MOV := imSemDados;
  //end;
  vContador_Reg_A := vContador_Reg_A + 1;

  ACBrSPEDPisCofins1.Bloco_A.RegistroA990.QTD_LIN_A := vContador_Reg_A;
end;

procedure TfrmSPEDPisCofins.btnBloco_CClick(Sender: TObject);
begin
  prc_Gerar_Bloco_C;
end;

procedure TfrmSPEDPisCofins.prc_Gerar_Bloco_C;
begin
  fDMSPEDFiscal.cdsSped_Doc.Close;
  fDMSPEDFiscal.sdsSped_Doc.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsSped_Doc.ParamByName('DT_FINAL').AsDate := DateEdit2.Date;
  fDMSPEDFiscal.sdsSped_Doc.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsSped_Doc.Open;

  fDMSPEDFiscal.cdsNFe_Inutilizadas.Close;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('DT_INICIAL').AsDate := DateEdit1.Date;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('DT_FINAL').AsDate := DateEdit2.Date;
  fDMSPEDFiscal.sdsNFe_Inutilizadas.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
  fDMSPEDFiscal.cdsNFe_Inutilizadas.Open;

  with ACBrSPEDPisCofins1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      case ComboBox1.ItemIndex of
        0:
          IND_MOV := imComDados;
        1:
          IND_MOV := imSemDados;
      end;
    end;
  end;

  prc_Gerar_Bloco_C_Reg_C100;
end;

procedure TfrmSPEDPisCofins.prc_Gerar_Bloco_C_Reg_C100;
var
  vAux: string;
begin
  with ACBrSPEDPisCofins1.Bloco_C do
  begin
    with RegistroC001New do
    begin
      with RegistroC010New do
      begin
        CNPJ := Monta_Numero(fDMSPEDFiscal.cdsFilialCNPJ_CPF.AsString, 14);
        IND_ESCRI := IndEscriIndividualizado;
        vContador_Reg_C := vContador_Reg_C + 1;

           //Inserir Notas...
        fDMSPEDFiscal.cdsSped_Doc.First;
        while not fDMSPEDFiscal.cdsSped_Doc.Eof do
        begin
          with RegistroC100New do
          begin
            case fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsInteger of
              0:
                IND_OPER := tpEntradaAquisicao;
              1:
                IND_OPER := tpSaidaPrestacao;
            end;
            case fDMSPEDFiscal.cdsSped_DocIND_EMITENTE.AsInteger of
              0:
                IND_EMIT := edEmissaoPropria;
              1:
                IND_EMIT := edTerceiros;
            end;
            if fDMSPEDFiscal.cdsSped_DocID_PESSOA.AsString = '99999' then
              COD_PART := ''
            else
              COD_PART := fDMSPEDFiscal.cdsSped_DocID_PESSOA.AsString;
            COD_MOD := fDMSPEDFiscal.cdsSped_DocMODELO.AsString;
            if fDMSPEDFiscal.cdsSped_DocCOD_SIT.AsString = '00' then
              COD_SIT := sdRegular
            else if fDMSPEDFiscal.cdsSped_DocCOD_SIT.AsString = '02' then
              COD_SIT := sdCancelado
            else if fDMSPEDFiscal.cdsSped_DocCOD_SIT.AsString = '04' then
              COD_SIT := sdDoctoDenegado
            else if fDMSPEDFiscal.cdsSped_DocCOD_SIT.AsString = '06' then
              COD_SIT := sdfComplementar;
            SER := fDMSPEDFiscal.cdsSped_DocSERIE.AsString;
            NUM_DOC := Monta_Numero(fDMSPEDFiscal.cdsSped_DocNUM_DOC.AsString, 9);
            CHV_NFE := fDMSPEDFiscal.cdsSped_DocCHAVE_ACESSO.AsString;
            DT_DOC := fDMSPEDFiscal.cdsSped_DocDTEMISSAO.AsDateTime;
            if fDMSPEDFiscal.cdsSped_DocDTES.AsDateTime > 10 then
              DT_E_S := fDMSPEDFiscal.cdsSped_DocDTES.AsDateTime;
            VL_DOC := fDMSPEDFiscal.cdsSped_DocVLR_TOTAL.AsFloat;
            case fDMSPEDFiscal.cdsSped_DocIND_PAGTO.AsInteger of
              0:
                IND_PGTO := tpVista;
              1:
                IND_PGTO := tpPrazo;
              9:
                IND_PGTO := tpSemPagamento;
            end;
            VL_DESC := fDMSPEDFiscal.cdsSped_DocVLR_DESCONTO.AsFloat;
            VL_ABAT_NT := fDMSPEDFiscal.cdsSped_DocVLR_ABATIMENTO_ICMS.AsFloat;
            VL_MERC := fDMSPEDFiscal.cdsSped_DocVLR_PRODUTOS.AsFloat;
            if fDMSPEDFiscal.cdsSped_DocTIPO_FRETE.IsNull then
              IND_FRT := tfNenhum
            else
            begin
              case fDMSPEDFiscal.cdsSped_DocTIPO_FRETE.AsInteger of
                0:
                  IND_FRT := tfPorContaEmitente;
                1:
                  IND_FRT := tfPorContaDestinatario;
                2:
                  IND_FRT := tfPorContaTerceiros;
                9:
                  IND_FRT := tfSemCobrancaFrete;
              end;
            end;
            VL_FRT := fDMSPEDFiscal.cdsSped_DocVLR_FRETE.AsFloat;
            VL_SEG := fDMSPEDFiscal.cdsSped_DocVLR_SEGURO.AsFloat;
            VL_OUT_DA := fDMSPEDFiscal.cdsSped_DocVLR_OUTRASDESP.AsFloat;
            VL_BC_ICMS := fDMSPEDFiscal.cdsSped_DocVLR_BASE_ICMS.AsFloat;
            VL_ICMS := fDMSPEDFiscal.cdsSped_DocVLR_ICMS.AsFloat;
            VL_BC_ICMS_ST := fDMSPEDFiscal.cdsSped_DocVLR_BASE_ICMS_ST.AsFloat;
            VL_ICMS_ST := fDMSPEDFiscal.cdsSped_DocVLR_ICMS_ST.AsFloat;
            VL_IPI := fDMSPEDFiscal.cdsSped_DocVLR_IPI.AsFloat;
            VL_PIS := fDMSPEDFiscal.cdsSped_DocVLR_PIS.AsFloat;
            VL_COFINS := fDMSPEDFiscal.cdsSped_DocVLR_COFINS.AsFloat;
            VL_PIS_ST := fDMSPEDFiscal.cdsSped_DocVLR_PIS_ST.AsFloat;
            VL_COFINS_ST := fDMSPEDFiscal.cdsSped_DocVLR_COFINS_ST.AsFloat;

            vContador_Reg_C := vContador_Reg_C + 1;


                //Registro C110 não foi gerado   Complemento do Documento - Informação Complementar da Nota Fiscal
                //Registro C111 não foi gerado   Processo Referenciado
                //Registro C120 não foi gerado   Complemento do Documento - Operações de Importação

                //Registro C170
            fDMSPEDFiscal.mC175.EmptyDataSet;
            fDMSPEDFiscal.cdsSped_Doc_Itens.Close;
            fDMSPEDFiscal.sdsSped_Doc_Itens.ParamByName('ID_SPED_DOC').AsInteger := fDMSPEDFiscal.cdsSped_DocID.AsInteger;
            fDMSPEDFiscal.cdsSped_Doc_Itens.Open;
            fDMSPEDFiscal.cdsSped_Doc_Itens.First;
            while not fDMSPEDFiscal.cdsSped_Doc_Itens.Eof do
            begin
                  //c170 - Complemento de Documento – Itens do Documento (códigos 01, 1B, 04 e 55)
              if fDMSPEDFiscal.cdsSped_DocMODELO.AsString <> '65' then
              begin
                with RegistroC170New do   //Inicio Adicionar os Itens:
                begin
                  vContadorC170 := vContadorC170 + 1;
                  lblC170.Caption := IntToStr(vContadorC170);
                  lblC170.Refresh;
                  NUM_ITEM := fDMSPEDFiscal.cdsSped_Doc_ItensITEM.AsString;
                  COD_ITEM := fDMSPEDFiscal.cdsSped_Doc_ItensREFERENCIA.AsString;
                  DESCR_COMPL := fDMSPEDFiscal.cdsSped_Doc_ItensNOME_PRODUTO_CAD.AsString;
                  QTD := fDMSPEDFiscal.cdsSped_Doc_ItensQTD.AsFloat;
                  UNID := fDMSPEDFiscal.cdsSped_Doc_ItensUNIDADE.AsString;
                  VL_ITEM := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
                  VL_DESC := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_DESCONTO.AsFloat;
                  if fDMSPEDFiscal.cdsSped_DocCOD_SIT.AsString = '06' then
                    IND_MOV := mfNao
                  else
                    IND_MOV := mfSim;
                  vAux := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_ICMS.AsString;
                  if Length(vAux) < 3 then
                    vAux := fDMSPEDFiscal.cdsSped_Doc_ItensORIGEM_PROD.AsString + vAux;
                  CST_ICMS := fnc_Busca_CSTICMS(vAux);
                  CFOP := fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString;
                  COD_NAT := fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString;
                  if (fDMSPEDFiscal.cdsSped_DocREGIME_TRIB.AsInteger = 1) or (fDMSPEDFiscal.cdsSped_DocREGIME_TRIB.AsInteger = 2) then
                  begin
                    VL_BC_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensBASE_ICMSSIMPLES.AsFloat;
                    ALIQ_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_ICMSSIMPLES.AsFloat;
                    VL_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_ICMSSIMPLES.AsFloat;
                  end
                  else
                  begin
                    VL_BC_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensBASE_ICMS.AsFloat;
                    ALIQ_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_ICMS.AsFloat;
                    VL_ICMS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_ICMS.AsFloat;
                  end;
                  VL_BC_ICMS_ST := fDMSPEDFiscal.cdsSped_Doc_ItensBASE_ICMSSUBST.AsFloat;
                  ALIQ_ST := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_ICMS_ST.AsFloat;
                  VL_ICMS_ST := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_ICMSSUBST.AsFloat;
                  IND_APUR := iaMensal;

                  CST_IPI := fnc_Busca_CSTIPI(fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_IPI.AsString);
                  COD_ENQ := '999';
                  VL_BC_IPI := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
                  ALIQ_IPI := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_IPI.AsFloat;
                  VL_IPI := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_IPI.AsFloat;
                  CST_PIS := fnc_Busca_CSTPIS(fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsString);
                  VL_BC_PIS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
                  ALIQ_PIS_PERC := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat;
                  QUANT_BC_PIS := 0;
                  ALIQ_PIS_R := 0;
                  VL_PIS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
                  CST_COFINS := stcofinsOutrasOperacoes;
                  VL_BC_COFINS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
                  ALIQ_COFINS_PERC := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_COFINS.AsFloat;
                  QUANT_BC_COFINS := 0;
                  ALIQ_COFINS_R := 0;
                  VL_COFINS := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;

                  if (fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat)) > 0) then
                    COD_CTA := '3.1.1.01.01.01.2000'
                  else
                  if (fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat)) <= 0) then
                    COD_CTA := '3.1.1.01.01.01.0157'
                  else
                    COD_CTA := '3.1.1.01.01.01.1010';
                  //if fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsInteger = 0 then
                  //  COD_CTA := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_FORN.AsString
                  //else
                  //  COD_CTA := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.AsString;
                  vContador_Reg_C := vContador_Reg_C + 1;
                end; //Fim dos Itens;
              end;
              if (fDMSPEDFiscal.cdsSped_Doc_ItensCANCELADO.AsString <> 'S') and
                 (fDMSPEDFiscal.cdsSped_DocMODELO.AsString = '65') then
                prc_Gravar_mC175;
              //prc_Gravar_mM100;
              //prc_Gravar_mM105;
              //prc_Gravar_mM200;
              //prc_Gravar_mM210;
              //prc_Gravar_mM400;

              fDMSPEDFiscal.cdsSped_Doc_Itens.Next;
            end;

            fDMSPEDFiscal.mC175.First;
            while not fDMSPEDFiscal.mC175.Eof do
            begin
              with RegistroC175New do
              begin
                vContadorC175 := vContadorC175 + 1;
                lblC175.Caption := IntToStr(vContadorC175);
                lblC175.Refresh;
                CFOP := fDMSPEDFiscal.mC175CodCFOP.AsString;
                VL_OPR := fDMSPEDFiscal.mC175Vlr_Total.AsFloat;
                VL_DESC := fDMSPEDFiscal.mC175Vlr_Desconto.AsFloat;
                CST_PIS := fnc_Busca_CSTPIS(fDMSPEDFiscal.mC175CST_PIS.AsString);
                VL_BC_PIS := fDMSPEDFiscal.mC175Vlr_Total.AsFloat;
                ALIQ_PIS := fDMSPEDFiscal.mC175Perc_Pis.AsFloat;
                QUANT_BC_PIS := 0;
                ALIQ_PIS_QUANT := 0;
                VL_PIS := fDMSPEDFiscal.mC175Vlr_Pis.AsFloat;
                CST_COFINS := fnc_Busca_CSTCOFINS(fDMSPEDFiscal.mC175CST_COFINS.AsString);
                VL_BC_COFINS := fDMSPEDFiscal.mC175Vlr_Total.AsFloat;
                ALIQ_COFINS := fDMSPEDFiscal.mC175Perc_Cofins.AsFloat;
                QUANT_BC_COFINS := 0;
                ALIQ_COFINS_QUANT := 0;
                VL_COFINS := fDMSPEDFiscal.mC175Vlr_Cofins.AsFloat;
                COD_CTA := fDMSPEDFiscal.mC175COD_CTA.AsString;
                INFO_COMPL := '';
              end;
              vContador_Reg_C := vContador_Reg_C + 1;
              fDMSPEDFiscal.mC175.Next;
            end;
                //Registro C180  não
                //Registro C181  não
                //Registro C188  não
                //Registro C190  não
                //Registro C191  não
          end;
          fDMSPEDFiscal.cdsSped_Doc.Next;
        end;
      end;
    end;
  end;
  vContador_Reg_C := vContador_Reg_C + 1;
  ACBrSPEDPisCofins1.Bloco_C.RegistroC990.QTD_LIN_C := vContador_Reg_C;
end;

function TfrmSPEDPisCofins.fnc_Busca_CSTICMS(CST: string): TACBrCstIcms;
begin
  if CST = '000' then
    Result := sticmsTributadaIntegralmente
  else if CST = '010' then
    Result := sticmsTributadaComCobracaPorST
  else if CST = '020' then
    Result := sticmsComReducao
  else if CST = '030' then
    Result := sticmsIsentaComCobracaPorST
  else if CST = '040' then
    Result := sticmsIsenta
  else if CST = '041' then
    Result := sticmsNaoTributada
  else if CST = '050' then
    Result := sticmsSuspensao
  else if CST = '051' then
    Result := sticmsDiferimento
  else if CST = '060' then
    Result := sticmsCobradoAnteriormentePorST
  else if CST = '070' then
    Result := sticmsComReducaoPorST
  else if CST = '090' then
    Result := sticmsOutros
  else if CST = '100' then
    Result := sticmsEstrangeiraImportacaoDiretaTributadaIntegralmente
  else if CST = '110' then
    Result := sticmsEstrangeiraImportacaoDiretaTributadaComCobracaPorST
  else if CST = '120' then
    Result := sticmsEstrangeiraImportacaoDiretaComReducao
  else if CST = '130' then
    Result := sticmsEstrangeiraImportacaoDiretaIsentaComCobracaPorST
  else if CST = '140' then
    Result := sticmsEstrangeiraImportacaoDiretaIsenta
  else if CST = '141' then
    Result := sticmsEstrangeiraImportacaoDiretaNaoTributada
  else if CST = '150' then
    Result := sticmsEstrangeiraImportacaoDiretaSuspensao
  else if CST = '151' then
    Result := sticmsEstrangeiraImportacaoDiretaDiferimento
  else if CST = '160' then
    Result := sticmsEstrangeiraImportacaoDiretaCobradoAnteriormentePorST
  else if CST = '170' then
    Result := sticmsEstrangeiraImportacaoDiretaComReducaoPorST
  else if CST = '190' then
    Result := sticmsEstrangeiraImportacaoDiretaOutros
  else if CST = '200' then
    Result := sticmsEstrangeiraAdqMercIntTributadaIntegralmente
  else if CST = '210' then
    Result := sticmsEstrangeiraAdqMercIntTributadaComCobracaPorST
  else if CST = '220' then
    Result := sticmsEstrangeiraAdqMercIntComReducao
  else if CST = '230' then
    Result := sticmsEstrangeiraAdqMercIntIsentaComCobracaPorST
  else if CST = '240' then
    Result := sticmsEstrangeiraAdqMercIntIsenta
  else if CST = '241' then
    Result := sticmsEstrangeiraAdqMercIntNaoTributada
  else if CST = '250' then
    Result := sticmsEstrangeiraAdqMercIntSuspensao
  else if CST = '251' then
    Result := sticmsEstrangeiraAdqMercIntDiferimento
  else if CST = '260' then
    Result := sticmsEstrangeiraAdqMercIntCobradoAnteriormentePorST
  else if CST = '270' then
    Result := sticmsEstrangeiraAdqMercIntComReducaoPorST
  else if CST = '290' then
    Result := sticmsEstrangeiraAdqMercIntOutros
  else if CST = '300' then
    Result := csticms300
  else if CST = '310' then
    Result := csticms310
  else if CST = '320' then
    Result := csticms320
  else if CST = '330' then
    Result := csticms330
  else if CST = '340' then
    Result := csticms340
  else if CST = '341' then
    Result := csticms341
  else if CST = '350' then
    Result := csticms350
  else if CST = '351' then
    Result := csticms351
  else if CST = '360' then
    Result := csticms360
  else if CST = '370' then
    Result := csticms370
  else if CST = '390' then
    Result := csticms390
  else if CST = '400' then
    Result := csticms400
  else if CST = '410' then
    Result := csticms410
  else if CST = '420' then
    Result := csticms420
  else if CST = '430' then
    Result := csticms430
  else if CST = '440' then
    Result := csticms440
  else if CST = '441' then
    Result := csticms441
  else if CST = '450' then
    Result := csticms450
  else if CST = '451' then
    Result := csticms451
  else if CST = '460' then
    Result := csticms460
  else if CST = '470' then
    Result := csticms470
  else if CST = '490' then
    Result := csticms490
  else if CST = '500' then
    Result := csticms500
  else if CST = '510' then
    Result := csticms510
  else if CST = '520' then
    Result := csticms520
  else if CST = '530' then
    Result := csticms530
  else if CST = '540' then
    Result := csticms540
  else if CST = '541' then
    Result := csticms541
  else if CST = '550' then
    Result := csticms550
  else if CST = '551' then
    Result := csticms551
  else if CST = '560' then
    Result := csticms560
  else if CST = '570' then
    Result := csticms570
  else if CST = '590' then
    Result := csticms590
  else if CST = '600' then
    Result := csticms600
  else if CST = '610' then
    Result := csticms610
  else if CST = '620' then
    Result := csticms620
  else if CST = '630' then
    Result := csticms630
  else if CST = '640' then
    Result := csticms640
  else if CST = '641' then
    Result := csticms641
  else if CST = '650' then
    Result := csticms650
  else if CST = '651' then
    Result := csticms651
  else if CST = '660' then
    Result := csticms660
  else if CST = '670' then
    Result := csticms670
  else if CST = '690' then
    Result := csticms690
  else if CST = '700' then
    Result := csticms700
  else if CST = '710' then
    Result := csticms710
  else if CST = '720' then
    Result := csticms720
  else if CST = '730' then
    Result := csticms730
  else if CST = '740' then
    Result := csticms740
  else if CST = '741' then
    Result := csticms741
  else if CST = '750' then
    Result := csticms750
  else if CST = '751' then
    Result := csticms751
  else if CST = '760' then
    Result := csticms760
  else if CST = '770' then
    Result := csticms770
  else if CST = '790' then
    Result := csticms790
  else if CST = '800' then
    Result := csticms800
  else if CST = '810' then
    Result := csticms810
  else if CST = '820' then
    Result := csticms820
  else if CST = '830' then
    Result := csticms830
  else if CST = '840' then
    Result := csticms840
  else if CST = '841' then
    Result := csticms841
  else if CST = '850' then
    Result := csticms850
  else if CST = '851' then
    Result := csticms851
  else if CST = '860' then
    Result := csticms860
  else if CST = '870' then
    Result := csticms870
  else if CST = '890' then
    Result := csticms890
  else if CST = '101' then
    Result := sticmsSimplesNacionalTributadaComPermissaoCredito
  else if CST = '102' then
    Result := sticmsSimplesNacionalTributadaSemPermissaoCredito
  else if CST = '103' then
    Result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBruta
  else if CST = '201' then
    Result := sticmsSimplesNacionalTributadaComPermissaoCreditoComST
  else if CST = '202' then
    Result := sticmsSimplesNacionalTributadaSemPermissaoCreditoComST
  else if CST = '203' then
    Result := sticmsSimplesNacionalIsencaoPorFaixaReceitaBrutaComST
  else if CST = '300' then
    Result := sticmsSimplesNacionalImune
  else if CST = '400' then
    Result := sticmsSimplesNacionalNaoTributada
  else if CST = '500' then
    Result := sticmsSimplesNacionalCobradoAnteriormentePorST
  else if CST = '900' then
    Result := sticmsSimplesNacionalOutros;
end;

function TfrmSPEDPisCofins.fnc_Busca_CSTIPI(CST: string): TACBrCstIpi;
begin
  if CST = '00' then
    result := stipiEntradaRecuperacaoCredito
  else if CST = '01' then
    result := stipiEntradaTributradaZero
  else if CST = '02' then
    result := stipiEntradaIsenta
  else if CST = '03' then
    result := stipiEntradaNaoTributada
  else if CST = '04' then
    result := stipiEntradaImune
  else if CST = '05' then
    result := stipiEntradaComSuspensao
  else if CST = '49' then
    result := stipiOutrasEntradas
  else if CST = '50' then
    result := stipiSaidaTributada
  else if CST = '51' then
    result := stipiSaidaTributadaZero
  else if CST = '52' then
    result := stipiSaidaIsenta
  else if CST = '53' then
    result := stipiSaidaNaoTributada
  else if CST = '54' then
    result := stipiSaidaImune
  else if CST = '55' then
    result := stipiSaidaComSuspensao
  else if CST = '99' then
    result := stipiOutrasSaidas
  else
    result := stipiVazio;
end;

function TfrmSPEDPisCofins.fnc_Busca_CSTPIS(CST: string): TACBrCstPis;
begin
  if CST = '01' then
    Result := stpisValorAliquotaNormal
  else if CST = '02' then
    Result := stpisValorAliquotaDiferenciada
  else if CST = '03' then
    Result := stpisQtdeAliquotaUnidade
  else if CST = '04' then
    Result := stpisMonofaticaAliquotaZero
  else if CST = '05' then
    Result := stpisValorAliquotaPorST
  else if CST = '06' then
    Result := stpisAliquotaZero
  else if CST = '07' then
    Result := stpisIsentaContribuicao
  else if CST = '08' then
    Result := stpisSemIncidenciaContribuicao
  else if CST = '09' then
    Result := stpisSuspensaoContribuicao
  else if CST = '49' then
    Result := stpisOutrasOperacoesSaida
  else if CST = '50' then
    Result := stpisOperCredExcRecTribMercInt
  else if CST = '51' then
    Result := stpisOperCredExcRecNaoTribMercInt
  else if CST = '52' then
    Result := stpisOperCredExcRecExportacao
  else if CST = '53' then
    Result := stpisOperCredRecTribNaoTribMercInt
  else if CST = '54' then
    Result := stpisOperCredRecTribMercIntEExportacao
  else if CST = '55' then
    Result := stpisOperCredRecNaoTribMercIntEExportacao
  else if CST = '56' then
    Result := stpisOperCredRecTribENaoTribMercIntEExportacao
  else if CST = '60' then
    Result := stpisCredPresAquiExcRecTribMercInt
  else if CST = '61' then
    Result := stpisCredPresAquiExcRecNaoTribMercInt
  else if CST = '62' then
    Result := stpisCredPresAquiExcExcRecExportacao
  else if CST = '63' then
    Result := stpisCredPresAquiRecTribNaoTribMercInt
  else if CST = '64' then
    Result := stpisCredPresAquiRecTribMercIntEExportacao
  else if CST = '65' then
    Result := stpisCredPresAquiRecNaoTribMercIntEExportacao
  else if CST = '66' then
    Result := stpisCredPresAquiRecTribENaoTribMercIntEExportacao
  else if CST = '67' then
    Result := stpisOutrasOperacoes_CredPresumido
  else if CST = '70' then
    Result := stpisOperAquiSemDirCredito
  else if CST = '71' then
    Result := stpisOperAquiComIsensao
  else if CST = '72' then
    Result := stpisOperAquiComSuspensao
  else if CST = '73' then
    Result := stpisOperAquiAliquotaZero
  else if CST = '74' then
    Result := stpisOperAqui_SemIncidenciaContribuicao
  else if CST = '75' then
    Result := stpisOperAquiPorST
  else if CST = '98' then
    Result := stpisOutrasOperacoesEntrada
  else if CST = '99' then
    Result := stpisOutrasOperacoes;
end;

function TfrmSPEDPisCofins.fnc_Busca_CSTCOFINS(CST: string): TACBrCstCofins;
begin
  if CST = '01' then
    Result := stcofinsValorAliquotaNormal
  else if CST = '02' then
    Result := stcofinsValorAliquotaDiferenciada
  else if CST = '03' then
    Result := stcofinsQtdeAliquotaUnidade
  else if CST = '04' then
    Result := stcofinsMonofaticaAliquotaZero
  else if CST = '05' then
    Result := stcofinsValorAliquotaPorST
  else if CST = '06' then
    Result := stcofinsAliquotaZero
  else if CST = '07' then
    Result := stcofinsIsentaContribuicao
  else if CST = '08' then
    Result := stcofinsSemIncidenciaContribuicao
  else if CST = '09' then
    Result := stcofinsSuspensaoContribuicao
  else if CST = '49' then
    Result := stcofinsOutrasOperacoesSaida
  else if CST = '50' then
    Result := stcofinsOperCredExcRecTribMercInt
  else if CST = '51' then
    Result := stcofinsOperCredExcRecNaoTribMercInt
  else if CST = '52' then
    Result := stcofinsOperCredExcRecExportacao
  else if CST = '53' then
    Result := stcofinsOperCredRecTribNaoTribMercInt
  else if CST = '54' then
    Result := stcofinsOperCredRecTribMercIntEExportacao
  else if CST = '55' then
    Result := stcofinsOperCredRecNaoTribMercIntEExportacao
  else if CST = '56' then
    Result := stcofinsOperCredRecTribENaoTribMercIntEExportacao
  else if CST = '60' then
    Result := stcofinsCredPresAquiExcRecTribMercInt
  else if CST = '61' then
    Result := stcofinsCredPresAquiExcRecNaoTribMercInt
  else if CST = '62' then
    Result := stcofinsCredPresAquiExcExcRecExportacao
  else if CST = '63' then
    Result := stcofinsCredPresAquiRecTribNaoTribMercInt
  else if CST = '64' then
    Result := stcofinsCredPresAquiRecTribMercIntEExportacao
  else if CST = '65' then
    Result := stcofinsCredPresAquiRecNaoTribMercIntEExportacao
  else if CST = '66' then
    Result := stcofinsCredPresAquiRecTribENaoTribMercIntEExportacao
  else if CST = '67' then
    Result := stcofinsOutrasOperacoes_CredPresumido
  else if CST = '70' then
    Result := stcofinsOperAquiSemDirCredito
  else if CST = '71' then
    Result := stcofinsOperAquiComIsensao
  else if CST = '72' then
    Result := stcofinsOperAquiComSuspensao
  else if CST = '73' then
    Result := stcofinsOperAquiAliquotaZero
  else if CST = '74' then
    Result := stcofinsOperAqui_SemIncidenciaContribuicao
  else if CST = '75' then
    Result := stcofinsOperAquiPorST
  else if CST = '98' then
    Result := stcofinsOutrasOperacoesEntrada
  else if CST = '99' then
    Result := stcofinsOutrasOperacoes;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mC175;
begin
  if fDMSPEDFiscal.mC175.Locate('CST_PIS;CST_COFINS;CodCFOP', VarArrayOf([fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsString,
    fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsString, fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString]), [locaseinsensitive]) then
    fDMSPEDFiscal.mC175.Edit
  else
  begin
    fDMSPEDFiscal.mC175.Insert;
    fDMSPEDFiscal.mC175CST_PIS.AsString     := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsString;
    fDMSPEDFiscal.mC175CST_COFINS.AsString  := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsString;
    fDMSPEDFiscal.mC175CodCFOP.AsString     := fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString;
    fDMSPEDFiscal.mC175Perc_Pis.AsFloat     := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat;
    fDMSPEDFiscal.mC175Perc_Cofins.AsFloat  := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_COFINS.AsFloat;
    fDMSPEDFiscal.mC175Vlr_Total.AsFloat    := 0;
    fDMSPEDFiscal.mC175Vlr_Desconto.AsFloat := 0;
    fDMSPEDFiscal.mC175Vlr_Pis.AsFloat      := 0;
    fDMSPEDFiscal.mC175Vlr_Cofins.AsFloat   := 0;
    if (fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat)) > 0) then
      fDMSPEDFiscal.mC175COD_CTA.AsString := '3.1.1.01.01.01.2000'
    else
    if (fDMSPEDFiscal.cdsSped_Doc_ItensCODCFOP.AsString = '5656') and (StrToFloat(FormatFloat('0.000',fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat)) <= 0) then
      fDMSPEDFiscal.mC175COD_CTA.AsString := '3.1.1.01.01.01.0157'
    else
      fDMSPEDFiscal.mC175COD_CTA.AsString := '3.1.1.01.01.01.1010';
  end;
  fDMSPEDFiscal.mC175Vlr_Total.AsFloat := fDMSPEDFiscal.mC175Vlr_Total.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mC175Vlr_Desconto.AsFloat := fDMSPEDFiscal.mC175Vlr_Desconto.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_DESCONTO.AsFloat;
  fDMSPEDFiscal.mC175Vlr_Pis.AsFloat := fDMSPEDFiscal.mC175Vlr_Pis.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
  fDMSPEDFiscal.mC175Vlr_Cofins.AsFloat := fDMSPEDFiscal.mC175Vlr_Cofins.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;
  fDMSPEDFiscal.mC175.Post;
end;

procedure TfrmSPEDPisCofins.btnBloco_DClick(Sender: TObject);
begin
  vContador_Reg_D := 1;
  with ACBrSPEDPisCofins1.Bloco_D do
  begin
    with RegistroD001New do
    begin
      IND_MOV := imSemDados;

      vContador_Reg_D := vContador_Reg_D + 1;
      with RegistroD990 do
        QTD_LIN_D := vContador_Reg_D;
    end;
  end;
end;

procedure TfrmSPEDPisCofins.btnBloco_FClick(Sender: TObject);
begin
  vContador_Reg_F := 1;
  with ACBrSPEDPisCofins1.Bloco_F do
  begin
    with RegistroF001 do
    begin
      IND_MOV := imSemDados;

      vContador_Reg_F := vContador_Reg_F + 1;
      with RegistroF990 do
        QTD_LIN_F := vContador_Reg_F;
    end;
  end;
end;

procedure TfrmSPEDPisCofins.btnBloco_MClick(Sender: TObject);
var
  vlBC, vlBcCofins, aliqCofins, vlcredNC: Real;
  vVL_Rec: Real;
begin
  with ACBrSPEDPisCofins1.Bloco_M do
  begin
    with RegistroM001New do
    begin
      IND_MOV := imComDados;

      vContador_Reg_M := 1;

        //M100 - Crédito de PIS/PASEP Relativo ao Período
      // 14/03/2018
      {fDMSPEDFiscal.mM100.Filtered := False;
      fDMSPEDFiscal.mM100.Filter   := 'TIPO = ' + QuotedStr('P');
      fDMSPEDFiscal.mM100.Filtered := True;
      fDMSPEDFiscal.mM100.First;}
      fDMSPEDFiscal.cdsMov_PisCofins.Close;
      fDMSPEDFiscal.sdsMov_PisCofins.ParamByName('DATA1').AsDate     := DateEdit1.Date;
      fDMSPEDFiscal.sdsMov_PisCofins.ParamByName('DATA2').AsDate     := DateEdit2.Date;
      fDMSPEDFiscal.sdsMov_PisCofins.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
      fDMSPEDFiscal.cdsMov_PisCofins.Open;
      fDMSPEDFiscal.cdsMov_PisCofins.First;
      while not fDMSPEDFiscal.cdsMov_PisCofins.Eof do
      begin
        with RegistroM100New do
        begin
          //COD_CRED := fDMSPEDFiscal.mM100Cod_Cred.AsString;
          COD_CRED := '101';
          {case fDMSPEDFiscal.mM100Ind_Cred_Ori.AsInteger of
            0:
              IND_CRED_ORI := icoOperProprias;
            1:
              IND_CRED_ORI := icoEvenFusaoCisao;
          end;}
         IND_CRED_ORI  := icoOperProprias;
          //VL_BC_PIS    := fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat;
          VL_BC_PIS    := fDMSPEDFiscal.cdsMov_PisCofinsVLR_TOTAL.AsFloat;
          ALIQ_PIS     := fDMSPEDFiscal.cdsMov_PisCofinsPERC_PIS.AsFloat;
          QUANT_BC_PIS := 0;
          ALIQ_PIS_QUANT := 0;
          //VL_CRED := fDMSPEDFiscal.mM100Vlr_Credito.AsFloat;
          VL_CRED := fDMSPEDFiscal.cdsMov_PisCofinsVLR_PIS.AsFloat;
          //VL_AJUS_ACRES := fDMSPEDFiscal.mM100Vlr_Ajuste_Acrescimo.AsFloat;
          //VL_AJUS_REDUC := fDMSPEDFiscal.mM100Vlr_Ajuste_Reducao.AsFloat;
          VL_AJUS_ACRES := 0;
          VL_AJUS_REDUC := 0;
          //VL_CRED_DIF := fDMSPEDFiscal.mM100Vlr_Diferido.AsFloat;
          VL_CRED_DIF := 0;
          //VL_CRED_DISP := fDMSPEDFiscal.mM100Vlr_Credito_Disp.AsFloat;
          VL_CRED_DISP := fDMSPEDFiscal.cdsMov_PisCofinsVLR_PIS.AsFloat;
          {case fDMSPEDFiscal.mM100Ind_Cred_Ori.AsInteger of
            0:
              IND_DESC_CRED := idcTotal;
            1:
              IND_DESC_CRED := idcParcial;
          end;}
          IND_DESC_CRED := idcTotal;
          //VL_CRED_DESC  := fDMSPEDFiscal.mM100Vlr_Credito_Disp.AsFloat;
          VL_CRED_DESC  := fDMSPEDFiscal.cdsMov_PisCofinsVLR_PIS.AsFloat;
          SLD_CRED      := 0;
        end;
        vContador_Reg_M := vContador_Reg_M + 1;
        //fDMSPEDFiscal.mM100.Next;
        fDMSPEDFiscal.cdsMov_PisCofins.Next;
      end;
      //14/03/2018
      {fDMSPEDFiscal.mM105.Filtered := False;
      fDMSPEDFiscal.mM105.Filter := 'TIPO = ' + QuotedStr('P');
      fDMSPEDFiscal.mM105.Filtered := True;
      fDMSPEDFiscal.mM105.First;}
      fDMSPEDFiscal.cdsMov_CSTPISCofins.Close;
      fDMSPEDFiscal.sdsMov_CSTPISCofins.ParamByName('DATA1').AsDate     := DateEdit1.Date;
      fDMSPEDFiscal.sdsMov_CSTPISCofins.ParamByName('DATA2').AsDate     := DateEdit2.Date;
      fDMSPEDFiscal.sdsMov_CSTPISCofins.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
      fDMSPEDFiscal.cdsMov_CSTPISCofins.Open;
      fDMSPEDFiscal.cdsMov_CSTPISCofins.First;
      //while not fDMSPEDFiscal.mM105.Eof do
      while not fDMSPEDFiscal.cdsMov_CSTPISCofins.Eof do
      begin
        with RegistroM105New do
        begin
          NAT_BC_CRED := bccAqBensRevenda;
          //CST_PIS := fnc_Busca_CSTPIS(FormatFloat('00', fDMSPEDFiscal.mM105CST_PIS.AsInteger));
          CST_PIS := fnc_Busca_CSTPIS(fDMSPEDFiscal.cdsMov_CSTPISCofinsCOD_CST_PIS.AsString);
          //VL_BC_PIS_TOT := fDMSPEDFiscal. mM105Vlr_Total.AsFloat;
          VL_BC_PIS_TOT := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          VL_BC_PIS_CUM := 0;
          //VL_BC_PIS_NC := fDMSPEDFiscal.mM105VL_BC_PIS_NC.AsFloat;
          VL_BC_PIS_NC := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          //VL_BC_PIS := fDMSPEDFiscal.mM105VL_BC_PIS.AsFloat;
          VL_BC_PIS := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          QUANT_BC_PIS_TOT := 0;
          QUANT_BC_PIS := 0;
          DESC_CRED := '';
        end;
        vContador_Reg_M := vContador_Reg_M + 1;
        fDMSPEDFiscal.cdsMov_CSTPISCofins.Next;
      end;
      //14/03/2018
      {fDMSPEDFiscal.mM200.Filtered := False;
      fDMSPEDFiscal.mM200.Filter := 'TIPO = ' + QuotedStr('P');
      fDMSPEDFiscal.mM200.Filtered := True;
      fDMSPEDFiscal.mM200.First;}
      fDMSPEDFiscal.cdsMov_TotalPisCofins.Close;
      fDMSPEDFiscal.sdsMov_TotalPisCofins.ParamByName('DATA1').AsDate     := DateEdit1.Date;
      fDMSPEDFiscal.sdsMov_TotalPisCofins.ParamByName('DATA2').AsDate     := DateEdit2.Date;
      fDMSPEDFiscal.sdsMov_TotalPisCofins.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
      fDMSPEDFiscal.cdsMov_TotalPisCofins.Open;
      fDMSPEDFiscal.cdsMov_TotalPisCofins.First;
      with RegistroM200New do
      begin
        //VL_TOT_CONT_NC_PER := fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat;
        VL_TOT_CONT_NC_PER   := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;
        VL_TOT_CRED_DESC     := 0;
        VL_TOT_CRED_DESC_ANT := 0;
        VL_TOT_CONT_NC_DEV   := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;
        VL_RET_NC            := 0;
        VL_OUT_DED_NC        := 0;
        VL_CONT_NC_REC       := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;
        VL_TOT_CONT_CUM_PER  := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;
        VL_RET_CUM           := 0;
        VL_OUT_DED_CUM       := 0;
        VL_CONT_CUM_REC      := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;
        VL_TOT_CONT_REC      := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;

        vContador_Reg_M := vContador_Reg_M + 1;

        with RegistroM205New do
        begin
          NUM_CAMPO := '08';
          COD_REC := '691201';
          //VL_DEBITO := fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat;
          VL_DEBITO := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_PIS.AsFloat;

          vContador_Reg_M := vContador_Reg_M + 1;
        end;

        //14/03/2018
        {fDMSPEDFiscal.mM210.Filtered := False;
        fDMSPEDFiscal.mM210.Filter := 'TIPO = ' + QuotedStr('P');
        fDMSPEDFiscal.mM210.Filtered := True;
        fDMSPEDFiscal.mM210.First;}
        fDMSPEDFiscal.cdsMov_PisCofins.First;
        with RegistroM210New do
        begin
          COD_CONT          := ccNaoAcumAliqBasica;
          VL_REC_BRT        := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_TOTAL.AsFloat;
          VL_BC_CONT        := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_BASE.AsFloat;
          ALIQ_PIS          := fDMSPEDFiscal.cdsMov_PisCofinsPERC_PIS.AsFloat;
          QUANT_BC_PIS      := 0;
          ALIQ_PIS_QUANT    := 0;
          VL_CONT_APUR      := fDMSPEDFiscal.cdsMov_PisCofinsVLR_PIS.AsFloat;
          VL_AJUS_ACRES     := 0;
          VL_AJUS_REDUC     := 0;
          VL_CONT_DIFER     := 0;
          VL_CONT_DIFER_ANT := 0;
          VL_CONT_PER       := fDMSPEDFiscal.cdsMov_PisCofinsVLR_PIS.AsFloat;
          vContador_Reg_M := vContador_Reg_M + 1;
        end;

      end;

      vVL_Rec := 0;
      //14/03/2018
      {fDMSPEDFiscal.mM400.Filtered := False;
      fDMSPEDFiscal.mM400.Filter := 'TIPO = ' + QuotedStr('P');
      fDMSPEDFiscal.mM400.Filtered := True;
      fDMSPEDFiscal.mM400.First;}
      fDMSPEDFiscal.cdsMov_SemPisCofins.Close;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('DATA1').AsDate     := DateEdit1.Date;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('DATA2').AsDate     := DateEdit2.Date;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
      fDMSPEDFiscal.cdsMov_SemPisCofins.Open;
      fDMSPEDFiscal.cdsMov_SemPisCofins.First;
      //while not fDMSPEDFiscal.mM400.Eof do
      while not fDMSPEDFiscal.cdsMov_SemPisCofins.Eof do
      begin
        with RegistroM400New do
        begin
          CST_PIS := fnc_Busca_CSTPIS(fDMSPEDFiscal.cdsMov_SemPisCofinsCOD_CST_PIS.AsString);
          VL_TOT_REC := fDMSPEDFiscal.cdsMov_SemPisCofinsVLR_TOTAL.AsFloat;
          //COD_CTA := fDMSPEDFiscal.mM400COD_CTA.AsString;
          COD_CTA := '';
          //DESC_COMPL := fDMSPEDFiscal.mM400DESC_COMPL.AsString;
          DESC_COMPL := '';
          vVL_Rec := vVL_Rec + fDMSPEDFiscal.cdsMov_SemPisCofinsVLR_TOTAL.AsFloat;
          vContador_Reg_M := vContador_Reg_M + 1;
        end;
        //fDMSPEDFiscal.mM400.Next;
        fDMSPEDFiscal.cdsMov_SemPisCofins.Next;
      end;

      //fDMSPEDFiscal.mM400.First;
      fDMSPEDFiscal.cdsMov_SemPisCofins.First;
      if not fDMSPEDFiscal.cdsMov_SemPisCofins.IsEmpty then
      begin
        with RegistroM410New do
        begin
          NAT_REC := '001';
          VL_REC  := vVL_Rec;
          //COD_CTA := fDMSPEDFiscal.mM400COD_CTA.AsString;
          COD_CTA := '';
          //DESC_COMPL := fDMSPEDFiscal.mM400DESC_COMPL.AsString;
          DESC_COMPL := '';

          vContador_Reg_M := vContador_Reg_M + 1;
        end;
      end;

      //Registro M500
      //14/03/2018
      {fDMSPEDFiscal.mM100.Filtered := False;
      fDMSPEDFiscal.mM100.Filter := 'TIPO = ' + QuotedStr('C');
      fDMSPEDFiscal.mM100.Filtered := True;
      fDMSPEDFiscal.mM100.First;}
      fDMSPEDFiscal.cdsMov_PisCofins.First;
      while not fDMSPEDFiscal.cdsMov_PisCofins.Eof do
      begin
        with RegistroM500New do
        begin
          COD_CRED          := '101';
          IND_CRED_ORI      := icoOperProprias;
          VL_BC_COFINS      := fDMSPEDFiscal.cdsMov_PisCofinsVLR_TOTAL.AsFloat;
          ALIQ_COFINS       := fDMSPEDFiscal.cdsMov_PisCofinsPERC_COFINS.AsFloat;
          QUANT_BC_COFINS   := 0;
          ALIQ_COFINS_QUANT := 0;
          VL_CRED           := fDMSPEDFiscal.cdsMov_PisCofinsVLR_COFINS.AsFloat;
          VL_AJUS_ACRES     := 0;
          VL_AJUS_REDUC     := 0;
          VL_CRED_DIFER     := 0;
          VL_CRED_DISP      := fDMSPEDFiscal.cdsMov_PisCofinsVLR_COFINS.AsFloat;
          IND_DESC_CRED     := idcTotal;
          VL_CRED_DESC      := fDMSPEDFiscal.cdsMov_PisCofinsVLR_COFINS.AsFloat;
          SLD_CRED          := 0;
        end;
        vContador_Reg_M := vContador_Reg_M + 1;
        fDMSPEDFiscal.cdsMov_PisCofins.Next;
      end;

      //14/03/2018
      {fDMSPEDFiscal.mM105.Filtered := False;
      fDMSPEDFiscal.mM105.Filter := 'TIPO = ' + QuotedStr('C');
      fDMSPEDFiscal.mM105.Filtered := True;
      fDMSPEDFiscal.mM105.First;}
      fDMSPEDFiscal.cdsMov_CSTPISCofins.First;
      while not fDMSPEDFiscal.cdsMov_CSTPISCofins.Eof do
      begin
        with RegistroM505New do
        begin
          NAT_BC_CRED         := bccAqBensRevenda;
          CST_COFINS          := fnc_Busca_CSTCOFINS(fDMSPEDFiscal.cdsMov_CSTPISCofinsCOD_CST_COFINS.AsString);
          VL_BC_COFINS_TOT    := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          VL_BC_COFINS_CUM    := 0;
          VL_BC_COFINS_NC     := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          VL_BC_COFINS        := fDMSPEDFiscal.cdsMov_CSTPISCofinsVLR_TOTAL.AsFloat;
          QUANT_BC_COFINS_TOT := 0;
          QUANT_BC_COFINS     := 0;
          DESC_CRED           := '';
          vContador_Reg_M := vContador_Reg_M + 1;
        end;
        fDMSPEDFiscal.cdsMov_CSTPISCofins.Next;
      end;
      //14/03/2018
      {fDMSPEDFiscal.mM200.Filtered := False;
      fDMSPEDFiscal.mM200.Filter := 'TIPO = ' + QuotedStr('C');
      fDMSPEDFiscal.mM200.Filtered := True;
      fDMSPEDFiscal.mM200.First;}
      fDMSPEDFiscal.cdsMov_TotalPisCofins.First;
      with RegistroM600 do
      begin
        VL_TOT_CONT_NC_PER   := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;
        VL_TOT_CRED_DESC     := 0;
        VL_TOT_CRED_DESC_ANT := 0;
        VL_TOT_CONT_NC_DEV   := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;
        VL_RET_NC            := 0;
        VL_OUT_DED_NC        := 0;
        VL_CONT_NC_REC       := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;
        VL_TOT_CONT_CUM_PER  := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;
        VL_RET_CUM           := 0;
        VL_OUT_DED_CUM       := 0;
        VL_CONT_CUM_REC      := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;
        VL_TOT_CONT_REC      := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;

        vContador_Reg_M := vContador_Reg_M + 1;

        with RegistroM605New do
        begin
          NUM_CAMPO := '08';
          COD_REC := '585601';
          VL_DEBITO := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_COFINS.AsFloat;

          vContador_Reg_M := vContador_Reg_M + 1;
        end;
        //14/03/2018
        {fDMSPEDFiscal.mM210.Filtered := False;
        fDMSPEDFiscal.mM210.Filter := 'TIPO = ' + QuotedStr('C');
        fDMSPEDFiscal.mM210.Filtered := True;
        fDMSPEDFiscal.mM210.First;}
        fDMSPEDFiscal.cdsMov_PisCofins.First;
        with RegistroM610New do
        begin
          COD_CONT          := ccNaoAcumAliqBasica;
          VL_REC_BRT        := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_TOTAL.AsFloat;
          VL_BC_CONT        := fDMSPEDFiscal.cdsMov_TotalPisCofinsVLR_BASE.AsFloat;
          ALIQ_COFINS       := fDMSPEDFiscal.cdsMov_PisCofinsPERC_COFINS.AsFloat;
          QUANT_BC_COFINS   := 0;
          ALIQ_COFINS_QUANT := 0;
          VL_CONT_APUR      := fDMSPEDFiscal.cdsMov_PisCofinsVLR_COFINS.AsFloat;
          VL_AJUS_ACRES     := 0;
          VL_AJUS_REDUC     := 0;
          VL_CONT_DIFER     := 0;
          VL_CONT_DIFER_ANT := 0;
          VL_CONT_PER       := fDMSPEDFiscal.cdsMov_PisCofinsVLR_COFINS.AsFloat;

          vContador_Reg_M := vContador_Reg_M + 1;
        end;
      end;

      vVL_Rec := 0;
      //14/03/2018
      {fDMSPEDFiscal.mM400.Filtered := False;
      fDMSPEDFiscal.mM400.Filter := 'TIPO = ' + QuotedStr('C');
      fDMSPEDFiscal.mM400.Filtered := True;
      fDMSPEDFiscal.mM400.First;}
      fDMSPEDFiscal.cdsMov_SemPisCofins.Close;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('DATA1').AsDate     := DateEdit1.Date;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('DATA2').AsDate     := DateEdit2.Date;
      fDMSPEDFiscal.sdsMov_SemPisCofins.ParamByName('FILIAL').AsInteger := RxDBLookupCombo1.KeyValue;
      fDMSPEDFiscal.cdsMov_SemPisCofins.Open;
      fDMSPEDFiscal.cdsMov_SemPisCofins.First;
      while not fDMSPEDFiscal.cdsMov_SemPisCofins.Eof do
      begin
        with RegistroM800New do
        begin
          CST_COFINS := fnc_Busca_CSTCOFINS(fDMSPEDFiscal.cdsMov_SemPisCofinsCOD_CST_COFINS.AsString);
          VL_TOT_REC := fDMSPEDFiscal.cdsMov_SemPisCofinsVLR_TOTAL.AsFloat;
          COD_CTA    := '';
          DESC_COMPL := '';

          vVL_Rec := vVL_Rec + fDMSPEDFiscal.cdsMov_SemPisCofinsVLR_TOTAL.AsFloat;

          vContador_Reg_M := vContador_Reg_M + 1;
        end;
        fDMSPEDFiscal.cdsMov_SemPisCofins.Next;
      end;

      fDMSPEDFiscal.cdsMov_SemPisCofins.First;
      if not fDMSPEDFiscal.cdsMov_SemPisCofins.IsEmpty then
      begin
        with RegistroM810New do
        begin
          NAT_REC    := '001';
          VL_REC     := vVL_Rec;
          COD_CTA    := '';
          DESC_COMPL := '';
          vContador_Reg_M := vContador_Reg_M + 1;
        end;
      end;

      with RegistroM990 do
      begin
        vContador_Reg_M := vContador_Reg_M + 1;
        QTD_LIN_M := vContador_Reg_M;
      end;
    end;

  end;

end;

procedure TfrmSPEDPisCofins.prc_Gravar_mM100;
begin
  //Pis
  if (StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat)) <= 0) or (fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsInteger = 0) then
    exit;

  if fDMSPEDFiscal.mM100.Locate('Cod_Cred;Tipo', VarArrayOf(['101', 'P']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM100.Edit
  else
  begin
    fDMSPEDFiscal.mM100.Insert;
    fDMSPEDFiscal.mM100Cod_Cred.AsString := '101';
    fDMSPEDFiscal.mM100Tipo.AsString := 'P';
    fDMSPEDFiscal.mM100Ind_Cred_Ori.AsInteger := 0;
    fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat := 0;
    fDMSPEDFiscal.mM100Perc_Pis.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat;
    fDMSPEDFiscal.mM100Quant_BC_Pis.AsFloat := 0;
    fDMSPEDFiscal.mM100Perc_Pis_Quant.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Credito.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Ajuste_Acrescimo.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Ajuste_Reducao.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Diferido.AsFloat := 0;
  end;
  fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat := fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM100Vlr_Credito.AsFloat := fDMSPEDFiscal.mM100Vlr_Credito.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
  fDMSPEDFiscal.mM100Vlr_Credito_Disp.AsFloat := fDMSPEDFiscal.mM100Vlr_Credito.AsFloat;
  fDMSPEDFiscal.mM100.Post;

  //Cofins
  if fDMSPEDFiscal.mM100.Locate('Cod_Cred;Tipo', VarArrayOf(['101', 'C']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM100.Edit
  else
  begin
    fDMSPEDFiscal.mM100.Insert;
    fDMSPEDFiscal.mM100Cod_Cred.AsString := '101';
    fDMSPEDFiscal.mM100Tipo.AsString := 'C';
    fDMSPEDFiscal.mM100Ind_Cred_Ori.AsInteger := 0;
    fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat := 0;
    fDMSPEDFiscal.mM100Perc_Pis.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_COFINS.AsFloat;
    fDMSPEDFiscal.mM100Quant_BC_Pis.AsFloat := 0;
    fDMSPEDFiscal.mM100Perc_Pis_Quant.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Credito.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Ajuste_Acrescimo.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Ajuste_Reducao.AsFloat := 0;
    fDMSPEDFiscal.mM100Vlr_Diferido.AsFloat := 0;
  end;

  fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat := fDMSPEDFiscal.mM100Vlr_Base_Pis.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM100Vlr_Credito.AsFloat := fDMSPEDFiscal.mM100Vlr_Credito.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;
  fDMSPEDFiscal.mM100Vlr_Credito_Disp.AsFloat := fDMSPEDFiscal.mM100Vlr_Credito.AsFloat;
  fDMSPEDFiscal.mM100.Post;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mM105;
begin
  if (StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat)) <= 0) or (fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsInteger = 0) then
    exit;

  //Pis
  if fDMSPEDFiscal.mM105.Locate('CST_PIS;Tipo', VarArrayOf([fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsInteger, 'P']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM105.Edit
  else
  begin
    fDMSPEDFiscal.mM105.Insert;
    fDMSPEDFiscal.mM105Nat_BC_Cred.AsString := '01';
    fDMSPEDFiscal.mM105Tipo.AsString := 'P';
    fDMSPEDFiscal.mM105CST_PIS.AsInteger := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsInteger;
    fDMSPEDFiscal.mM105Vlr_Total.AsFloat := 0;
    fDMSPEDFiscal.mM105VL_BC_PIS_NC.AsFloat := 0;
    fDMSPEDFiscal.mM105VL_BC_PIS.AsFloat := 0;
  end;
  fDMSPEDFiscal.mM105Vlr_Total.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM105VL_BC_PIS_NC.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat;
  fDMSPEDFiscal.mM105VL_BC_PIS.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat;
  fDMSPEDFiscal.mM105.Post;

  //Cofins
  if fDMSPEDFiscal.mM105.Locate('CST_PIS;Tipo', VarArrayOf([fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsInteger, 'C']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM105.Edit
  else
  begin
    fDMSPEDFiscal.mM105.Insert;
    fDMSPEDFiscal.mM105Nat_BC_Cred.AsString := '01';
    fDMSPEDFiscal.mM105Tipo.AsString := 'C';
    fDMSPEDFiscal.mM105CST_PIS.AsInteger := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsInteger;
    fDMSPEDFiscal.mM105Vlr_Total.AsFloat := 0;
    fDMSPEDFiscal.mM105VL_BC_PIS_NC.AsFloat := 0;
    fDMSPEDFiscal.mM105VL_BC_PIS.AsFloat := 0;
  end;
  fDMSPEDFiscal.mM105Vlr_Total.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM105VL_BC_PIS_NC.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat;
  fDMSPEDFiscal.mM105VL_BC_PIS.AsFloat := fDMSPEDFiscal.mM105Vlr_Total.AsFloat;
  fDMSPEDFiscal.mM105.Post;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mM200;
begin
  if (StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat)) <= 0) or (fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsInteger = 0) then
    exit;

  //Pis
  if fDMSPEDFiscal.mM200.Locate('Tipo', 'P', ([Locaseinsensitive])) then
    fDMSPEDFiscal.mM200.Edit
  else
  begin
    fDMSPEDFiscal.mM200.Insert;
    fDMSPEDFiscal.mM200Tipo.AsString := 'P';
    fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_RET_NC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_REC.AsFloat := 0;
  end;
  fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat - fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat - fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat;
  fDMSPEDFiscal.mM200VL_RET_NC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat - fDMSPEDFiscal.mM200VL_RET_NC.AsFloat - fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
  fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat - fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat - fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CONT_REC.AsFloat := fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat + fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat;
  fDMSPEDFiscal.mM200.Post;


  //Cofins
  if fDMSPEDFiscal.mM200.Locate('Tipo', 'C', ([Locaseinsensitive])) then
    fDMSPEDFiscal.mM200.Edit
  else
  begin
    fDMSPEDFiscal.mM200.Insert;
    fDMSPEDFiscal.mM200Tipo.AsString := 'C';
    fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_RET_NC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat := 0;
    fDMSPEDFiscal.mM200VL_TOT_CONT_REC.AsFloat := 0;
  end;
  fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_NC_PER.AsFloat - fDMSPEDFiscal.mM200VL_TOT_CRED_DESC.AsFloat - fDMSPEDFiscal.mM200VL_TOT_CRED_DESC_ANT.AsFloat;
  fDMSPEDFiscal.mM200VL_RET_NC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_NC_DEV.AsFloat - fDMSPEDFiscal.mM200VL_RET_NC.AsFloat - fDMSPEDFiscal.mM200VL_OUT_DED_NC.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;
  fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat := 0;
  fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat := fDMSPEDFiscal.mM200VL_TOT_CONT_CUM_PER.AsFloat - fDMSPEDFiscal.mM200VL_RET_CUM.AsFloat - fDMSPEDFiscal.mM200VL_OUT_DED_CUM.AsFloat;
  fDMSPEDFiscal.mM200VL_TOT_CONT_REC.AsFloat := fDMSPEDFiscal.mM200VL_CONT_NC_REC.AsFloat + fDMSPEDFiscal.mM200VL_CONT_CUM_REC.AsFloat;
  fDMSPEDFiscal.mM200.Post;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mM210;
begin
  //Pis
  if fDMSPEDFiscal.mM210.Locate('Tipo', 'P', ([Locaseinsensitive])) then
    fDMSPEDFiscal.mM210.Edit
  else
  begin
    fDMSPEDFiscal.mM210.Insert;
    fDMSPEDFiscal.mM210Tipo.AsString := 'P';
    fDMSPEDFiscal.mM210COD_CONT.AsString := '01';
    fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat := 0;
    fDMSPEDFiscal.mM210ALIQ_PIS.AsFloat := 0;
    fDMSPEDFiscal.mM210QUANT_BC_PIS.AsFloat := 0;
    fDMSPEDFiscal.mM210ALIQ_PIS_QUANT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_PER.AsFloat := 0;
  end;

  fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat := fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  if fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat > 0 then
    fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat := fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM210ALIQ_PIS.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_PIS.AsFloat;
  fDMSPEDFiscal.mM210QUANT_BC_PIS.AsFloat := 0;
  fDMSPEDFiscal.mM210ALIQ_PIS_QUANT.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat;
  fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_PER.AsFloat := fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat + fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat
    - fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat - fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat + fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat;
  fDMSPEDFiscal.mM210.Post;

  //Cofins
  if fDMSPEDFiscal.mM210.Locate('Tipo', 'C', ([Locaseinsensitive])) then
    fDMSPEDFiscal.mM210.Edit
  else
  begin
    fDMSPEDFiscal.mM210.Insert;
    fDMSPEDFiscal.mM210Tipo.AsString := 'C';
    fDMSPEDFiscal.mM210COD_CONT.AsString := '01';
    fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat := 0;
    fDMSPEDFiscal.mM210ALIQ_PIS.AsFloat := 0;
    fDMSPEDFiscal.mM210QUANT_BC_PIS.AsFloat := 0;
    fDMSPEDFiscal.mM210ALIQ_PIS_QUANT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat := 0;
    fDMSPEDFiscal.mM210VL_CONT_PER.AsFloat := 0;
  end;

  fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat := fDMSPEDFiscal.mM210VL_REC_BRT.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  if fDMSPEDFiscal.cdsSped_Doc_ItensPERC_COFINS.AsFloat > 0 then
    fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat := fDMSPEDFiscal.mM210VL_BC_CONT.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM210ALIQ_PIS.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensPERC_COFINS.AsFloat;
  fDMSPEDFiscal.mM210QUANT_BC_PIS.AsFloat := 0;
  fDMSPEDFiscal.mM210ALIQ_PIS_QUANT.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat := fDMSPEDFiscal.cdsSped_Doc_ItensVLR_COFINS.AsFloat;
  fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat := 0;
  fDMSPEDFiscal.mM210VL_CONT_PER.AsFloat := fDMSPEDFiscal.mM210VL_CONT_APUR.AsFloat + fDMSPEDFiscal.mM210VL_AJUS_ACRES.AsFloat
    - fDMSPEDFiscal.mM210VL_AJUS_REDUC.AsFloat - fDMSPEDFiscal.mM210VL_CONT_DIFER.AsFloat + fDMSPEDFiscal.mM210VL_CONT_DIFER_ANT.AsFloat;
  fDMSPEDFiscal.mM210.Post;
end;

procedure TfrmSPEDPisCofins.prc_Gravar_mM400;
begin
  if (StrToFloat(FormatFloat('0.00', fDMSPEDFiscal.cdsSped_Doc_ItensVLR_PIS.AsFloat)) > 0) or (fDMSPEDFiscal.cdsSped_DocTIPO_ES.AsString = '0') then
    exit;

  //PIS
  if fDMSPEDFiscal.mM400.Locate('CST_PIS;Tipo', VarArrayOf([fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsString, 'P']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM400.Edit
  else
  begin
    fDMSPEDFiscal.mM400.Insert;
    fDMSPEDFiscal.mM400CST_PIS.AsString := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_PIS.AsString;
    fDMSPEDFiscal.mM400Tipo.AsString := 'P';
    fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat := 0;
    if (trim(fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.AsString) <> '') and (not (fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.IsNull)) then
      fDMSPEDFiscal.mM400COD_CTA.AsString := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.AsString;
    fDMSPEDFiscal.mM400DESC_COMPL.AsString := '';
  end;
  fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat := fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM400.Post;

  //COFINS
  if fDMSPEDFiscal.mM400.Locate('CST_PIS;Tipo', VarArrayOf([fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsString, 'C']), [locaseinsensitive]) then
    fDMSPEDFiscal.mM400.Edit
  else
  begin
    fDMSPEDFiscal.mM400.Insert;
    fDMSPEDFiscal.mM400CST_PIS.AsString := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CST_COFINS.AsString;
    fDMSPEDFiscal.mM400Tipo.AsString := 'C';
    fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat := 0;
    if (trim(fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.AsString) <> '') and (not (fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.IsNull)) then
      fDMSPEDFiscal.mM400COD_CTA.AsString := fDMSPEDFiscal.cdsSped_Doc_ItensCOD_CONTABIL_PRO.AsString;
    fDMSPEDFiscal.mM400DESC_COMPL.AsString := '';
  end;
  fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat := fDMSPEDFiscal.mM400VL_TOT_REC.AsFloat + fDMSPEDFiscal.cdsSped_Doc_ItensVLR_TOTAL.AsFloat;
  fDMSPEDFiscal.mM400.Post;
end;

procedure TfrmSPEDPisCofins.btnGravar_TxtClick(Sender: TObject);
var
  vArq: string;
begin
  ACBrSPEDPisCofins1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);
  ACBrSPEDPisCofins1.Path := edtFile.Text;
  vArq := 'SPED_Fiscal_' + FormatFloat('0000', YearOf(DateEdit1.Date)) + FormatFloat('00', MonthOf(DateEdit1.Date)) + '.txt';
  edtFile.Text := vArq;
  ACBrSPEDPisCofins1.Arquivo := edtFile.Text;

  ACBrSPEDPisCofins1.SaveFileTXT;
  LoadToMemo;
  ShowMessage('Arquivo Gerado!');
end;

procedure TfrmSPEDPisCofins.btnGerarClick(Sender: TObject);
begin
  fDMSPEDFiscal.mM100.Filtered := False;
  fDMSPEDFiscal.mM100.EmptyDataSet;
  fDMSPEDFiscal.mM105.Filtered := False;
  fDMSPEDFiscal.mM105.EmptyDataSet;
  fDMSPEDFiscal.mM200.Filtered := False;
  fDMSPEDFiscal.mM200.EmptyDataSet;
  fDMSPEDFiscal.mM210.Filtered := False;
  fDMSPEDFiscal.mM210.EmptyDataSet;
  fDMSPEDFiscal.mM400.Filtered := False;
  fDMSPEDFiscal.mM400.EmptyDataSet;

  BtnBloco_0Click(Sender);
  btnBloco_AClick(Sender);
  btnBloco_CClick(Sender);
  btnBloco_DClick(Sender);
  btnBloco_FClick(Sender);
  btnBloco_MClick(Sender);

  btnGravar_TxtClick(Sender);
end;

end.

