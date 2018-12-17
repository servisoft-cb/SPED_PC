unit UImportarXML;

interface

uses
  inifiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, xmldom, Grids, DBGrids,
  DB, Xmlxform, ExtCtrls, StdCtrls, ComCtrls, Mask, DBCtrls, RXDBCtrl, SMDBGrid, Buttons, DBTables, ToolEdit, RxLookup,
  UDMImportarXML, UCBase, StrUtils, DBXpress, ShellApi, StdConvs, Contnrs, SqlExpr;

type
  TfrmImportarXML = class(TForm)
    OpenDialog1: TOpenDialog;
    pcDados: TPageControl;
    TabSheet7: TTabSheet;
    Diretorio: TLabel;
    btnListar: TButton;
    chkSub: TCheckBox;
    MemLista: TMemo;
    edtDiretorio: TDirectoryEdit;
    GroupBox5: TGroupBox;
    Memo1: TMemo;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label48: TLabel;
    lblContador: TLabel;
    TabSheet1: TTabSheet;
    Memo2: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
    //Novo 07/03/2018
    vTipo_Nota : String;
    //**************

    vCodCidade : Integer;
    vIDPais    : Integer;
    vDescICMS      : array[1..9] of String;
    vTipoIcms      : String;
    vItem          : Integer;
    vGravar        : Boolean;
    vOpenDialog    : String;
    vReferencia_Loc : String;
    vErro          : WideString;
    vContador      : Integer;

    sXmlEvento: TStringStream;

    fDMImportarXML: TDMImportarXML;

    procedure Le_cdsDetalhe;
    procedure Grava_mItensNota;

    procedure Procura_DadosCabecalho;

    function fnc_Busca_CFOP : Integer;
    function fnc_Busca_Pessoa : Integer;

    procedure Move_Campos(Campo1,Campo2, Soma : String);

    procedure Gravar_Cliente;
    //procedure Gravar_Fornecedor;
    procedure Gravar_Cidade;
    procedure Gravar_Pais;

    procedure Verificar_Produto;

    procedure prc_Abrir_qFilial(CNPJ_CPF : String);

    function fnc_NumValido(Const S: String) : Integer;

    procedure ListarArquivos(Diretorio: string; Sub:Boolean);

    function TemAtributo(Attr, Val: Integer): Boolean;

    procedure Carrega_XML(Arquivo : String);
    procedure prc_Gravar_Movimento;

  public
    { Public declarations }
    vUsaConfigNatOper2 : String;
    vCodFornecedor : Integer;
    vCodTransportadora : Integer;

    function fnc_Monta_CNPJ(CNPJ: String; Qtd: Integer): String;

  end;

var
  frmImportarXML: TfrmImportarXML;

implementation

uses
  DmdDatabase, uUtilPadrao, rsDBUtils, uNFeComandos;

{$R *.dfm}

procedure TfrmImportarXML.Move_Campos(Campo1,Campo2, Soma : String);
var
  i : Integer;
begin
  for i:=0 to (fDMImportarXML.cdsDetalhe.FieldCount-1) do
  begin
    if fDMImportarXML.cdsDetalhe.Fields[i].FieldName = Campo1 then
      fDMImportarXML.mItensNota.FieldByName(Campo2).AsString := fDMImportarXML.cdsDetalhe.FieldByName(Campo1).AsString;
  end;
end;


procedure TfrmImportarXML.FormShow(Sender: TObject);
begin
  fDMImportarXML     := TDMImportarXML.Create(Self);

  oDBUtils.SetDataSourceProperties(Self,fDMImportarXML);

  fDMImportarXML.cdsFilial.Close;
  fDMImportarXML.cdsFilial.Open;
  fDMImportarXML.qParametros.Close;
  fDMImportarXML.qParametros.Open;

  Label4.Visible := ((fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') or (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S'));
  RxDBLookupCombo1.Visible := ((fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') or (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S'));
  Label48.Visible := ((fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') or (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S'));
  if (fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') and (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S') then
    Label48.Caption := 'Informar a Filial para separar os Produtos e Clientes por empresa'
  else
  if (fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') then
    Label48.Caption := 'Informar a Filial para separar os Clientes por empresa'
  else
  if (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S') then
    Label48.Caption := 'Informar a Filial para separar os Produtos por empresa';
end;

procedure TfrmImportarXML.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMImportarXML);
  Action := Cafree;
end;

function TfrmImportarXML.fnc_Monta_CNPJ(CNPJ: String; Qtd: Integer): String;
begin
  result := '';
  if Qtd = 14 then
    result := Copy(cnpj,1,2)
            + '.' + Copy(cnpj,3,3)
            + '.' + Copy(cnpj,6,3)
            + '/' + Copy(cnpj,9,4)
            + '-' + Copy(cnpj,13,2)
  else
    result := Copy(cnpj,1,3)
            + '.' + Copy(cnpj,4,3)
            + '.' + Copy(cnpj,7,3)
            + '-' + Copy(cnpj,10,2);
end;

procedure TfrmImportarXML.Le_cdsDetalhe;
begin
  fDMImportarXML.mItensNota.EmptyDataSet;

  fDMImportarXML.cdsDetalhe.First;
  while not fDMImportarXML.cdsDetalhe.Eof do
  begin
    Grava_mItensNota;

    fDMImportarXML.cdsDetalhe.Next;
  end;

end;

procedure TfrmImportarXML.Grava_mItensNota;
var
  i : Integer;
  vContadorIcms : Integer;
  vTexto : String;
  vPosIni : Integer;
  vPosStr : String;
  vQtdAux : Real;
begin
  if trim(fDMImportarXML.cdsDetalhecProd.AsString) = '' then
    exit;

  fDMImportarXML.mItensNota.Insert;
  fDMImportarXML.mItensNotaItem.AsInteger              := fDMImportarXML.cdsDetalhenItem.AsInteger;
  fDMImportarXML.mItensNotaCodProduto.AsString         := fDMImportarXML.cdsDetalhecProd.AsString;

  fDMImportarXML.mItensNotaModelo.AsString             := fDMImportarXML.cdsCabecalhomod.AsString;
  fDMImportarXML.mItensNotaCodProdutoInterno.AsInteger := 0;
  //fDMImportarXML.mItensNotaCodCor.AsInteger            := 0;
  //fDMImportarXML.mItensNotaCodGrade.AsInteger          := 0;
  //fDMImportarXML.mItensNotaPosicao.AsInteger           := 0;
  //fDMImportarXML.mItensNotaTamanho.AsString            := '';
  //fDMImportarXML.mItensNotaNomeCor.AsString            := '';
  //fDMImportarXML.mItensNotaCodFornecedor.AsInteger     :=

  fDMImportarXML.mItensNotaQtd.AsFloat                 := fDMImportarXML.cdsDetalheqCom.AsFloat;
  fDMImportarXML.mItensNotaVlrUnitario.AsFloat         := fDMImportarXML.cdsDetalhevUnCom.AsFloat;
  fDMImportarXML.mItensNotaVlrTotal.AsFloat            := fDMImportarXML.cdsDetalhevProd.AsFloat;
  fDMImportarXML.mItensNotaCodBarra.AsString           := fDMImportarXML.cdsDetalhecEAN.AsString;
  fDMImportarXML.mItensNotaNomeProduto.AsString        := fDMImportarXML.cdsDetalhexProd.AsString;
  fDMImportarXML.mItensNotaNCM.AsString                := fDMImportarXML.cdsDetalheNCM.AsString;
  fDMImportarXML.mItensNotaID_NCM.AsInteger            := fDMImportarXML.fnc_Abrir_NCM(fDMImportarXML.cdsDetalheNCM.AsString);
  fDMImportarXML.mItensNotaCFOP.AsString               := fDMImportarXML.cdsDetalheCFOP.AsString;
  fDMImportarXML.mItensNotaCFOPOriginal.AsString       := fDMImportarXML.cdsDetalheCFOP.AsString;
  fDMImportarXML.mItensNotaCFOPInterno.AsInteger       := fnc_Busca_CFOP;
  if fDMImportarXML.mItensNotaCFOPInterno.AsInteger > 0 then
  begin
    fDMImportarXML.mItensNotaCFOP.AsString             := fDMImportarXML.qCFOPCODCFOP.AsString;
    fDMImportarXML.mItensNotaBeneficiamento.AsString   := fDMImportarXML.qCFOPBENEFICIAMENTO.AsString;
  end
  else
  begin
    fDMImportarXML.mItensNotaCFOP.AsString             := '';
    fDMImportarXML.mItensNotaBeneficiamento.AsString   := 'N';
  end;
  fDMImportarXML.mItensNotaUnidade.AsString            := fDMImportarXML.cdsDetalheuCom.AsString;
  fDMImportarXML.mItensNotaUnidadeInterno.AsString     := fDMImportarXML.cdsDetalheuCom.AsString;

  fDMImportarXML.mItensNotaNumPedido.AsString          := fDMImportarXML.cdsDetalhexPed.AsString;
  fDMImportarXML.mItensNotaItemPedido.AsInteger        := fDMImportarXML.cdsDetalhenItemPed.AsInteger;
  fDMImportarXML.mItensNotaInfAdicionais.AsString      := fDMImportarXML.cdsDetalheinfAdProd.AsString;

  //vTexto  := Copy(fDMImportarXML.cdsDetalheinfAdProd.AsString,1,250);
  //fDMImportarXML.mItensNotaNumLote.AsString := '';

  fDMImportarXML.vCSTInterno := 0;
  vTipoIcms   := '';
  case fDMImportarXML.cdsCabecalhoCRT.AsInteger of
    3 : vContadorIcms := 9;
    1,2 : vContadorIcms := 6;
  end;
  i := 0;
  while (vTipoIcms = '') or (i < vContadorIcms) do
  begin                                       
    inc(i);
    if Trim(fDMImportarXML.cdsDetalhe.FieldByName(vDescICMS[i]+'Orig').AsString) <> '' then
      vTipoIcms := vDescICMS[i];
  end;

  if fDMImportarXML.cdsCabecalhoCRT.AsInteger = 3 then
  begin
    if vTipoIcms <> '' then
    begin
      if  fDMImportarXML.cdsCabecalhoenderEmit_cPais.AsString = '1058' then
        fDMImportarXML.mItensNotaOrigem.AsString  := '0'
      else
        fDMImportarXML.mItensNotaOrigem.AsString  := fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'Orig').AsString;
      fDMImportarXML.Busca_SitTrib(fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'CST').AsString);
      fDMImportarXML.mItensNotaCodSitTribInterno.AsInteger := fDMImportarXML.vCSTInterno;
      fDMImportarXML.mItensNotaCodSitTrib.AsString         := fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'CST').AsString;
      Move_Campos(vTipoIcms+'ModBC','ModICMS','N');
      Move_Campos(vTipoIcms+'vBC','BaseIcms','N');
      Move_Campos(vTipoIcms+'pICMS','AliqIcms','N');
      Move_Campos(vTipoIcms+'vICMS','VlrIcms','N');
      Move_Campos(vTipoIcms+'ModBCST','ModIcmsST','N');
      Move_Campos(vTipoIcms+'pMVAST','PercMVAST','N');
      Move_Campos(vTipoIcms+'pRedBCST','PercRedBCST','N');
      Move_Campos(vTipoIcms+'vBCST','BaseCST','N');
      Move_Campos(vTipoIcms+'pICMSST','PercIcmsST','N');
      Move_Campos(vTipoIcms+'vICMSST','VlrIcmsST','N');
      Move_Campos(vTipoIcms+'pRedBC','PercRedIcms','N');
      Move_Campos(vTipoIcms+'vBCSTRet','BaseCSTRet','N');
      Move_Campos(vTipoIcms+'vICMSSTRet','VlrIcmsCSTRet','N');
    end;

  end
  else
  begin
    if vTipoIcms <> '' then
    begin
      if  fDMImportarXML.cdsCabecalhoenderEmit_cPais.AsString = '1058' then
        fDMImportarXML.mItensNotaOrigem.AsString  := '0'
      else
        fDMImportarXML.mItensNotaOrigem.AsString  := fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'Orig').AsString;
      fDMImportarXML.busca_SitTrib(fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'CSOSN').AsString);
      fDMImportarXML.mItensNotaCodSitTribInterno.AsInteger := fDMImportarXML.vCSTInterno;
      fDMImportarXML.mItensNotaCodSitTrib.AsString         := fDMImportarXML.cdsDetalhe.FieldByName(vTipoIcms+'CSOSN').AsString;
      Move_Campos(vTipoIcms+'pCredSN','AliqIcms','N');
      Move_Campos(vTipoIcms+'vCredIcmsSN','VlrIcms','N');
      Move_Campos(vTipoIcms+'ModBCST','ModIcmsST','N');
      Move_Campos(vTipoIcms+'pMVAST','PercMVAST','N');
      Move_Campos(vTipoIcms+'pRedBCST','PercRedBCST','N');
      Move_Campos(vTipoIcms+'vBCST','BaseCST','N');
      Move_Campos(vTipoIcms+'pICMSST','PercIcmsST','N');
      Move_Campos(vTipoIcms+'vICMSST','VlrIcmsST','N');
      Move_Campos(vTipoIcms+'vBCSTRet','BaseCSTRet','N');
      Move_Campos(vTipoIcms+'vICMSSTRet','VlrIcmsCSTRet','N');
    end;
  end;

  fDMImportarXML.mItensNotaAliqIPI.AsFloat    := fDMImportarXML.cdsDetalhepIPI.AsFloat;
  fDMImportarXML.mItensNotaCodCSTIPI.AsString := fDMImportarXML.cdsDetalheIPITrib_CST.AsString;
  fDMImportarXML.mItensNotaVlrIPI.AsFloat     := fDMImportarXML.cdsDetalhevIPI.AsFloat;
  fDMImportarXML.mItensNotaEX_TIPI.AsString   := fDMImportarXML.cdsDetalhecEnq.AsString;

  fDMImportarXML.mItensNotaVlrDesconto.AsFloat      := fDMImportarXML.cdsDetalhevDesc.AsFloat;
  fDMImportarXML.mItensNotaVlrFrete.AsFloat         := fDMImportarXML.cdsDetalhevFrete.AsFloat;
  fDMImportarXML.mItensNotaGravarNovo.AsBoolean     := False;
  //fDMImportarXML.mItensNotaQtdPacote.AsFloat        := 0;
  //fDMImportarXML.mItensNotaConversorUnidade.AsFloat := 0;
  //fDMImportarXML.mItensNotaQtdPacote.AsFloat        := StrToFloat(FormatFloat('0.00000',0));
  //fDMImportarXML.mItensNotaConversorUnidade.AsFloat := StrToFloat(FormatFloat('0.00000',0));

//  if Monta_Numero(fDMImportarXML.cdsDetalhePISNT_CST.AsString,2) <> '04' then
//    ShowMessage('aqui');

  if not fDMImportarXML.cdsDetalhePISNT_CST.IsNull then
  begin
    fDMImportarXML.mItensNotaCodPIS.AsString    := Monta_Numero(fDMImportarXML.cdsDetalhePISNT_CST.AsString,2);
    fDMImportarXML.mItensNotaCodCofins.AsString := Monta_Numero(fDMImportarXML.cdsDetalheCOFINSNT_CST.AsString,2);
    fDMImportarXML.mItensNotaAliqPIS.AsFloat    := 0;
    fDMImportarXML.mItensNotaAliqCofins.AsFloat := 0;
    fDMImportarXML.mItensNotaVlrPis.AsFloat     := 0;
    fDMImportarXML.mItensNotaVlrCofins.AsFloat  := 0;
  end
  else
  if not fDMImportarXML.cdsDetalhePISAliq_CST.IsNull then
  begin
    fDMImportarXML.mItensNotaCodPIS.AsString    := Monta_Numero(fDMImportarXML.cdsDetalhePISAliq_CST.AsString,2);
    fDMImportarXML.mItensNotaCodCofins.AsString := Monta_Numero(fDMImportarXML.cdsDetalheCOFINSAliq_CST.AsString,2);
    fDMImportarXML.mItensNotaAliqPIS.AsFloat    := fDMImportarXML.cdsDetalhePISAliq_pPIS.AsFloat;
    fDMImportarXML.mItensNotaAliqCofins.AsFloat := fDMImportarXML.cdsDetalheCOFINSAliq_pCOFINS.AsFloat;
    fDMImportarXML.mItensNotaVlrPis.AsFloat     := fDMImportarXML.cdsDetalhePISAliq_vPIS.AsFloat;
    fDMImportarXML.mItensNotaVlrCofins.AsFloat  := fDMImportarXML.cdsDetalheCOFINSAliq_vCOFINS.AsFloat;
  end
  else
  if not fDMImportarXML.cdsDetalhePISOutr_CST.IsNull then
  begin
    fDMImportarXML.mItensNotaCodPIS.AsString    := Monta_Numero(fDMImportarXML.cdsDetalhePISOutr_CST.AsString,2);
    fDMImportarXML.mItensNotaCodCofins.AsString := Monta_Numero(fDMImportarXML.cdsDetalheCOFINSOutr_CST.AsString,2);
    fDMImportarXML.mItensNotaAliqPIS.AsFloat    := fDMImportarXML.cdsDetalhePISOutr_pPIS.AsFloat;
    fDMImportarXML.mItensNotaAliqCofins.AsFloat := fDMImportarXML.cdsDetalheCOFINSOutr_pCOFINS.AsFloat;
    fDMImportarXML.mItensNotaVlrPis.AsFloat     := fDMImportarXML.cdsDetalhePISOutr_vPIS.AsFloat;
    fDMImportarXML.mItensNotaVlrCofins.AsFloat  := fDMImportarXML.cdsDetalheCOFINSOutr_vCOFINS.AsFloat;
  end;
  fDMImportarXML.mItensNota.Post;
end;

procedure TfrmImportarXML.Procura_DadosCabecalho;
var
  vAux : String;
  i : Integer;
begin
  vCodFornecedor   := 0;
  vCodCidade       := 0;
  vIDPais          := 0;
  vFilial          := 0;

  vTipo_Nota := '';
  vAux := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,14);
  prc_Abrir_qFilial(vAux);
  if vFilial > 0 then
  begin //Não vai gravar as entradas por enquanto
    vTipo_Nota := 'E';
    exit;
  end
  else
  begin
    vAux := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhoemit_CNPJ.AsString,14);
    prc_Abrir_qFilial(vAux);
    if vFilial <= 0 then
      prc_Abrir_qFilial(fDMImportarXML.cdsCabecalhoemit_CNPJ.AsString);
    if vFilial > 0 then
      vTipo_Nota := 'S';
  end;
  if vFilial <= 0 then
    exit;

  //Fornecedor  Nota de Entrada
  if vTipo_Nota = 'E' then
  begin
    vAux := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhoemit_CNPJ.AsString,14);
    if fDMImportarXML.fnc_Abrir_Fornecedor(vAux) then
    begin
      vCodFornecedor := fDMImportarXML.cdsFornecedorCODIGO.AsInteger;
      if fDMImportarXML.cdsFornecedorTP_FORNECEDOR.AsString <> 'S' then
      begin
        fDMImportarXML.cdsFornecedor.Edit;
        fDMImportarXML.cdsFornecedorTP_FORNECEDOR.AsString := 'S';
        fDMImportarXML.cdsFornecedor.Post;
        fDMImportarXML.cdsFornecedor.ApplyUpdates(0);
      end;
    end
    else
      //Gravar_Fornecedor;
  end
  else
  //Cliente  Nota de Saída
  if vTipo_Nota = 'S' then
  begin
    vCodFornecedor := 0;
    begin
      //Verifica o CNPJ do Cliente
      vAux := '';
      i := PosEx('CONSUMIDOR',fDMImportarXML.cdsCabecalhodest_xNome.AsString);
      if (i > 0) OR ((TRIM(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString) = '') and (trim(fDMImportarXML.cdsCabecalhodest_CPF.AsString) = '')) then
        vCodFornecedor := fDMImportarXML.qParametrosID_CLIENTE_CONSUMIDOR.AsInteger
      else
      begin
        if (trim(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString) <> '') then
          vAux := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,14)
        else
        if (trim(fDMImportarXML.cdsCabecalhodest_CPF.AsString) <> '') then
          vAux := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhodest_CPF.AsString,11);
        if fDMImportarXML.fnc_Abrir_Fornecedor(vAux) then
        begin
          vCodFornecedor := fDMImportarXML.cdsFornecedorCODIGO.AsInteger;
          if fDMImportarXML.cdsFornecedorTP_CLIENTE.AsString <> 'S' then
          begin
            fDMImportarXML.cdsFornecedor.Edit;
            fDMImportarXML.cdsFornecedorTP_CLIENTE.AsString := 'S';
            fDMImportarXML.cdsFornecedor.Post;
            fDMImportarXML.cdsFornecedor.ApplyUpdates(0);
          end;
        end
        else
          Gravar_Cliente;
      end;
    end;
  end;


  if fDMImportarXML.cdsCabecalhoCRT.AsInteger = 3 then
  begin
    vDescICMS[1] := 'ICMS00_';
    vDescICMS[2] := 'ICMS10_';
    vDescICMS[3] := 'ICMS20_';
    vDescICMS[4] := 'ICMS30_';
    vDescICMS[5] := 'ICMS40_';
    vDescICMS[6] := 'ICMS51_';
    vDescICMS[7] := 'ICMS60_';
    vDescICMS[8] := 'ICMS70_';
    vDescICMS[9] := 'ICMS90_';
  end
  else
  begin
    vDescICMS[1] := 'ICMSSN101_';
    vDescICMS[2] := 'ICMSSN102_';
    vDescICMS[3] := 'ICMSSN201_';
    vDescICMS[4] := 'ICMSSN202_';
    vDescICMS[5] := 'ICMSSN500_';
    vDescICMS[6] := 'ICMSSN900_';
  end;
end;

function TfrmImportarXML.fnc_Busca_CFOP: Integer;
var
  vCodNatOper : String;
begin
  Result := 0;
  vCodNatOper := fDMImportarXML.cdsDetalheCFOP.AsString;
  fDMImportarXML.qCFOP.Close;
  fDMImportarXML.qCFOP.ParamByName('CODCFOP').AsString := vCodNatOper;
  fDMImportarXML.qCFOP.Open;
  if not fDMImportarXML.qCFOP.IsEmpty then
    Result := fDMImportarXML.qCFOPID.AsInteger;
end;

procedure TfrmImportarXML.Gravar_Cidade;
var
  vAux: Integer;
begin
  if vTipo_Nota = 'S' then
    if (trim(fDMImportarXML.cdsCabecalhoenderDest_xMun.AsString) = '') or (fDMImportarXML.cdsCabecalhoenderDest_xMun.IsNull) then
      exit;
  if vTipo_Nota = 'E' then
    if (trim(fDMImportarXML.cdsCabecalhoenderEmit_xMun.AsString) = '') or (fDMImportarXML.cdsCabecalhoenderEmit_xMun.IsNull) then
      exit;

  vAux := dmDatabase.ProximaSequencia('CIDADE',0);

  fDMImportarXML.cdsCidade.Insert;
  fDMImportarXML.cdsCidadeID.AsInteger          := vAux;
  if vTipo_Nota = 'S' then
  begin
    fDMImportarXML.cdsCidadeNOME.AsString         := fDMImportarXML.cdsCabecalhoenderDest_xMun.AsString;
    fDMImportarXML.cdsCidadeUF.AsString           := fDMImportarXML.cdsCabecalhoenderDest_UF.AsString;
    fDMImportarXML.cdsCidadeCODMUNICIPIO.AsString := fDMImportarXML.cdsCabecalhoenderDest_cMun.AsString;
  end
  else
  begin
    fDMImportarXML.cdsCidadeNOME.AsString         := fDMImportarXML.cdsCabecalhoenderEmit_xMun.AsString;
    fDMImportarXML.cdsCidadeUF.AsString           := fDMImportarXML.cdsCabecalhoenderEmit_UF.AsString;
    fDMImportarXML.cdsCidadeCODMUNICIPIO.AsString := fDMImportarXML.cdsCabecalhoenderEmit_cMun.AsString;
  end;
  fDMImportarXML.cdsCidade.Post;
  fDMImportarXML.cdsCidade.ApplyUpdates(0);
  vCodCidade := vAux;
end;

procedure TfrmImportarXML.Gravar_Pais;
var                           
  vAux : Integer;
begin
  if (trim(fDMImportarXML.cdsCabecalhoenderDest_xPais.AsString) = '') or (fDMImportarXML.cdsCabecalhoenderDest_xPais.IsNull) then
  begin
    vIDPais := 1;
    exit;
  end;
  vAux := dmDatabase.ProximaSequencia('PAIS',0);
  fDMImportarXML.cdsPais.Insert;
  fDMImportarXML.cdsPaisID.AsInteger     := vAux;
  if vTipo_Nota = 'E' then
  begin
    fDMImportarXML.cdsPaisNOME.AsString    := fDMImportarXML.cdsCabecalhoenderEmit_xPais.AsString;
    fDMImportarXML.cdsPaisCODPAIS.AsString := fDMImportarXML.cdsCabecalhoenderEmit_cPais.AsString;
  end
  else
  begin
    fDMImportarXML.cdsPaisNOME.AsString    := fDMImportarXML.cdsCabecalhoenderDest_xPais.AsString;
    fDMImportarXML.cdsPaisCODPAIS.AsString := fDMImportarXML.cdsCabecalhoenderDest_cPais.AsString;
  end;
  fDMImportarXML.cdsPais.Post;
  fDMImportarXML.cdsPais.ApplyUpdates(0);
  vIDPais := vAux;
end;

procedure TfrmImportarXML.Gravar_Cliente;
var
  vAux: Integer;
  vAux2: String;
begin
  vAux := dmDatabase.ProximaSequencia('PESSOA',0);
  vAux := vAux;

  fDMImportarXML.cdsFornecedor.Insert;
  fDMImportarXML.cdsFornecedorCODIGO.AsInteger       := vAux;
  fDMImportarXML.cdsFornecedorNOME.AsString          := UpperCase(fDMImportarXML.cdsCabecalhodest_xNome.AsString);
  fDMImportarXML.cdsFornecedorENDERECO.AsString      := UpperCase(fDMImportarXML.cdsCabecalhoenderDest_xLgr.AsString);
  fDMImportarXML.cdsFornecedorBAIRRO.AsString        := UpperCase(fDMImportarXML.cdsCabecalhoenderDest_xBairro.AsString);
  fDMImportarXML.cdsFornecedorCIDADE.AsString        := fDMImportarXML.cdsCabecalhoenderDest_xMun.AsString;
  fDMImportarXML.cdsFornecedorCEP.AsString           := fDMImportarXML.cdsCabecalhoenderDest_CEP.AsString;
  fDMImportarXML.cdsFornecedorUF.AsString            := fDMImportarXML.cdsCabecalhoenderDest_UF.AsString;
  if trim(fDMImportarXML.cdsFornecedorUF.AsString) = '' then
    fDMImportarXML.cdsFornecedorUF.AsString := 'RS';

  fDMImportarXML.cdsFornecedorTELEFONE1.AsString     := fDMImportarXML.cdsCabecalhoenderDest_fone.AsString;
  vAux2 := '';
  if (trim(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString) <> '') then
    vAux2 := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,14)
  else
  if (trim(fDMImportarXML.cdsCabecalhodest_CPF.AsString) <> '') then
    vAux2 := fnc_Monta_CNPJ(fDMImportarXML.cdsCabecalhodest_CPF.AsString,11);

  fDMImportarXML.cdsFornecedorCNPJ_CPF.AsString      := vAux2;
  fDMImportarXML.cdsFornecedorINSCR_EST.AsString     := fDMImportarXML.cdsCabecalhodest_IE.AsString;
  fDMImportarXML.cdsFornecedorDTCADASTRO.AsDateTime  := Date;
  fDMImportarXML.cdsFornecedorFANTASIA.AsString      := fDMImportarXML.cdsFornecedorNOME.AsString;
  fDMImportarXML.cdsFornecedorTP_FORNECEDOR.AsString := 'N';
  fDMImportarXML.cdsFornecedorTP_CLIENTE.AsString    := 'S';

  vCodCidade := 0;
  if trim(fDMImportarXML.cdsCabecalhoenderDest_cMun.AsString) <> '' then
  begin
    if fDMImportarXML.fnc_Abrir_Cidade(fDMImportarXML.cdsCabecalhoenderDest_cMun.AsString) then
      vCodCidade := fDMImportarXML.cdsCidadeID.AsInteger
    else
      Gravar_Cidade;
  end
  else
    vCodCidade := fDMImportarXML.cdsFilialID_CIDADE.AsInteger;

  vIDPais := 0;
  if fDMImportarXML.fnc_Abrir_Pais(fDMImportarXML.cdsCabecalhoenderDest_cPais.AsString) then
    vIDPais := fDMImportarXML.cdsPaisID.AsInteger
  else
    Gravar_Pais;

  if vCodCidade > 0 then
    fDMImportarXML.cdsFornecedorID_CIDADE.AsInteger      := vCodCidade
  else
    fDMImportarXML.cdsFornecedorID_CIDADE.Clear;
  fDMImportarXML.cdsFornecedorUSUARIO.AsString         := 'NFeXML';
  fDMImportarXML.cdsFornecedorHRCADASTRO.AsDateTime    := Now;
  fDMImportarXML.cdsFornecedorCOMPLEMENTO_END.AsString := fDMImportarXML.cdsCabecalhoenderDest_xCpl.AsString;
  fDMImportarXML.cdsFornecedorNUM_END.AsString         := fDMImportarXML.cdsCabecalhoenderDest_nro.AsString;
  if vIDPais > 0 then
    fDMImportarXML.cdsFornecedorID_PAIS.AsInteger      := vIDPais;
  if Length(fDMImportarXML.cdsFornecedorCNPJ_CPF.AsString) = 18 then
    fDMImportarXML.cdsFornecedorPESSOA.AsString := 'J'
  else
  begin
    fDMImportarXML.cdsFornecedorPESSOA.AsString := 'F';
    fDMImportarXML.cdsFornecedorID_REGIME_TRIB.AsInteger := 1;
  end;

  //03/06/2016
  if (fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') then
    fDMImportarXML.cdsFornecedorFILIAL.AsInteger       := vFilial;
  if (fDMImportarXML.cdsFornecedorINSCR_EST.AsString = 'ISENTO') and ((fDMImportarXML.cdsFornecedorUF.AsString = 'RS')
    or (fDMImportarXML.cdsFornecedorPESSOA.AsString = 'F')) then
    fDMImportarXML.cdsFornecedorINSCR_EST.AsString := '';

  if fDMImportarXML.cdsFornecedorINSCR_EST.AsString = 'ISENTO' then
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 2
  else
  if trim(fDMImportarXML.cdsFornecedorINSCR_EST.AsString) = '' then
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 9
  else
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 1;

  if fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger = 1 then
    fDMImportarXML.cdsFornecedorTIPO_CONSUMIDOR.AsInteger := 0
  else
    fDMImportarXML.cdsFornecedorTIPO_CONSUMIDOR.AsInteger := 1;
  fDMImportarXML.cdsFornecedorINATIVO.AsString           := 'N';
  fDMImportarXML.cdsFornecedorTP_VENDEDOR.AsString       := 'N';
  fDMImportarXML.cdsFornecedorTP_FUNCIONARIO.AsString    := 'N';
  fDMImportarXML.cdsFornecedorTP_ATELIER.AsString        := 'N';
  fDMImportarXML.cdsFornecedorTP_EXPORTACAO.AsString     := 'N';
  fDMImportarXML.cdsFornecedorTP_PREPOSTO.AsString       := 'N';
  fDMImportarXML.cdsFornecedorTP_TRANSPORTADORA.AsString := 'N';

  //*******************

  fDMImportarXML.cdsFornecedor.Post;
  vCodFornecedor  := vAux;
  
  fDMImportarXML.cdsFornecedor.ApplyUpdates(0);
end;

procedure TfrmImportarXML.Verificar_Produto;
var
  vExiste : Boolean;
begin
  vExiste := False;
  if (trim(fDMImportarXML.mItensNotaCodBarra.AsString) <> '') then
    fDMImportarXML.prc_Abrir_Produto(0,'','',fDMImportarXML.mItensNotaCodBarra.AsString)
  else
  begin
    fDMImportarXML.prc_Abrir_Produto(0,fDMImportarXML.mItensNotaCodProduto.AsString,'','');
  end;
  if fDMImportarXML.cdsProdutoID.AsInteger > 0 then
  begin
    vExiste := True;
    fDMImportarXML.mItensNota.Edit;
    fDMImportarXML.mItensNotaCodProdutoInterno.AsInteger := fDMImportarXML.cdsProdutoID.AsInteger;
    fDMImportarXML.mItensNota.Post;

    if (fDMImportarXML.cdsProdutoID_NCM.AsInteger <= 0) and (fDMImportarXML.mItensNotaID_NCM.AsInteger > 0) then
    begin
      fDMImportarXML.cdsProduto.Edit;
      fDMImportarXML.cdsProdutoID_NCM.AsInteger := fDMImportarXML.mItensNotaID_NCM.AsInteger;
      fDMImportarXML.cdsProduto.Post;
      fDMImportarXML.cdsProduto.ApplyUpdates(0);
    end;
  end
  else
    fDMImportarXML.Gravar_Produto('NFeXML',True);
end;

function TfrmImportarXML.fnc_NumValido(Const S: String) : Integer;
var
  i : Integer;
  vTexto : String;
begin
  Result := 0;
  vTexto := '';
  for i := 1 to Length(s) do
  begin
    if S[i] in['0','1','2','3','4','5','6','7','8','9'] then
      vTexto := vTexto + s[i]
    else
    begin
      vTexto := '';
      Break;
    end;
  end;
  if vTexto <> '' then
    Result := StrToInt(vTexto);
end;

procedure TfrmImportarXML.prc_Abrir_qFilial(CNPJ_CPF : String);
begin
  //vFilial := 0;
  fDMImportarXML.qFilial.Close;
  fDMImportarXML.qFilial.ParamByName('CNPJ_CPF').AsString := CNPJ_CPF;
  fDMImportarXML.qFilial.Open;
  vFilial := fDMImportarXML.qFilialID.AsInteger;
  fDMImportarXML.cdsFilial.Locate('ID',fDMImportarXML.qFilialID.AsInteger,[loCaseInsensitive]);
end;

procedure TfrmImportarXML.btnListarClick(Sender: TObject);
var
  vTexto : String;
begin
  if MessageDlg('Confirma a importação?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Memo2.Lines.Clear;
  vErro     := '';
  vContador := 0;
  fDMImportarXML.cdsMovimento.Close;
  fDMImportarXML.sdsMovimento.ParamByName('ID').AsInteger := 0;
  fDMImportarXML.cdsMovimento.Open;

  //vFilial := 0;
  if (fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') or (fDMImportarXML.qParametrosUSA_PRODUTO_FILIAL.AsString = 'S') then
  begin
    if trim(RxDBLookupCombo1.Text) = '' then
    begin
      MessageDlg('*** Filial não informada!', mtError, [mbOk], 0);
      exit;
    end
    else
      vFilial := RxDBLookupCombo1.KeyValue;
  end;

  memLista.Lines.Clear;

  ListarArquivos(edtDiretorio.Text, chkSub.Checked);

  vTexto := '';

  if vErro <> '' then
  begin
    ShowMessage('Conversão concluída com Erros|');
    Memo1.Lines.Add(vErro);
  end
  else
    ShowMessage('Arquivo de ' + vTexto +  ' Gerados!');
end;

procedure TfrmImportarXML.Carrega_XML(Arquivo: String);
begin
  try
    fDMImportarXML.AbrirNFe(Arquivo);
    if not fDMImportarXML.cdsCabecalho.Active then
      vGravar := False
    else
      vGravar := True;
  except
    on e: Exception do
    begin
      vGravar := False;
      Memo1.Lines.Add(Arquivo);
      raise Exception.Create('Erro ao abrir o arquivo: ' + #13 + e.Message);
    end;
  end;
  if not vGravar then
  begin
    Memo1.Lines.Add(Arquivo);
    exit;
  end;

  Procura_DadosCabecalho;
  if vFilial <= 0 then
  begin
    Memo2.Lines.Add('Nota Nº ' + fDMImportarXML.cdsCabecalhonNF.AsString + '  Não encontrada a Filial!');
    exit;
  end;

  Le_cdsDetalhe;
end;

procedure TfrmImportarXML.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  vAux : String;
begin
  sXmlEvento := TStringStream.Create('');

  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      Refresh;
      MemLista.Refresh;
      Memo1.Refresh;
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if Sub = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            ListarArquivos(TempNome, True);
          end;
      end
      else
      begin
        vGravar := True;
        memLista.Lines.Add(Diretorio+'\'+F.Name);
        try
          Carrega_XML(Diretorio+'\'+F.Name);
          if vFilial <= 0 then
            vGravar := False;
        except
          vGravar := False;
        end;
        
        if vGravar then
        begin
          //Gravar_Cliente;
          fDMImportarXML.mItensNota.First;
          while not fDMImportarXML.mItensNota.Eof do
          begin
            fDMImportarXML.Gravar_ClasFiscal;
            fDMImportarXML.Gravar_Unidade;
            Verificar_Produto;
            fDMImportarXML.mItensNota.Next;
          end;
          //Gravar_Fornecedor;

          prc_Gravar_Movimento;
        end;

      end;
        Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
  FreeAndNil(sXmlEvento);
end;

function TfrmImportarXML.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

{procedure TfrmImportarXML.Gravar_Fornecedor;
var
  vAux : Integer;
begin
  vAux := dmDatabase.ProximaSequencia('PESSOA',0);
  vAux := vAux;

  fDMImportarXML.cdsFornecedor.Insert;
  fDMImportarXML.cdsFornecedorCODIGO.AsInteger       := vAux;
  fDMImportarXML.cdsFornecedorNOME.AsString          := UpperCase(fDMImportarXML.cdsCabecalhoemit_xNome.AsString);
  fDMImportarXML.cdsFornecedorENDERECO.AsString      := UpperCase(fDMImportarXML.cdsCabecalhoenderEmit_xLgr.AsString);
  fDMImportarXML.cdsFornecedorBAIRRO.AsString        := UpperCase(fDMImportarXML.cdsCabecalhoenderEmit_xBairro.AsString);
  fDMImportarXML.cdsFornecedorCIDADE.AsString        := fDMImportarXML.cdsCabecalhoenderEmit_xMun.AsString;
  fDMImportarXML.cdsFornecedorCEP.AsString           := fDMImportarXML.cdsCabecalhoenderEmit_CEP.AsString;
  fDMImportarXML.cdsFornecedorUF.AsString            := fDMImportarXML.cdsCabecalhoenderEmit_UF.AsString;
  if trim(fDMImportarXML.cdsFornecedorUF.AsString) = '' then
    fDMImportarXML.cdsFornecedorUF.AsString := 'RS';

  fDMImportarXML.cdsFornecedorTELEFONE1.AsString     := fDMImportarXML.cdsCabecalhoenderEmit_fone.AsString;
  fDMImportarXML.cdsFornecedorCNPJ_CPF.AsString      := edCNPJEmitente2.Text;
  fDMImportarXML.cdsFornecedorINSCR_EST.AsString     := edInscEmitente2.Text;
  fDMImportarXML.cdsFornecedorDTCADASTRO.AsDateTime  := Date;
  fDMImportarXML.cdsFornecedorFANTASIA.AsString      := fDMImportarXML.cdsFornecedorNOME.AsString;
  fDMImportarXML.cdsFornecedorTP_FORNECEDOR.AsString := 'S';
  fDMImportarXML.cdsFornecedorTP_CLIENTE.AsString    := 'N';

  vCodCidade := 0;
  if fDMImportarXML.fnc_Abrir_Cidade(fDMImportarXML.cdsCabecalhoenderEmit_cMun.AsString) then
    vCodCidade := fDMImportarXML.cdsCidadeID.AsInteger
  else
    Gravar_Cidade;
  vIDPais := 0;
  if fDMImportarXML.fnc_Abrir_Pais(fDMImportarXML.cdsCabecalhoenderEmit_cPais.AsString) then
    vIDPais := fDMImportarXML.cdsPaisID.AsInteger
  else
    Gravar_Pais;
  fDMImportarXML.cdsFornecedorID_CIDADE.AsInteger      := vCodCidade;
  fDMImportarXML.cdsFornecedorUSUARIO.AsString         := 'NFeXML';
  fDMImportarXML.cdsFornecedorHRCADASTRO.AsDateTime    := Now;
  fDMImportarXML.cdsFornecedorCOMPLEMENTO_END.AsString := fDMImportarXML.cdsCabecalhoenderEmit_xCpl.AsString;
  fDMImportarXML.cdsFornecedorNUM_END.AsString         := fDMImportarXML.cdsCabecalhoenderEmit_nro.AsString;
  fDMImportarXML.cdsFornecedorID_PAIS.AsInteger        := vIDPais;
  if Length(edCNPJEmitente2.Text) = 18 then
  begin
    fDMImportarXML.cdsFornecedorPESSOA.AsString          := 'J';
    fDMImportarXML.cdsFornecedorID_REGIME_TRIB.AsInteger := 1;
  end
  else
  begin
    fDMImportarXML.cdsFornecedorPESSOA.AsString          := 'F';
    fDMImportarXML.cdsFornecedorID_REGIME_TRIB.AsInteger := 1;
  end;

  //03/06/2016
  if (fDMImportarXML.qParametrosUSAR_PESSOA_FILIAL.AsString = 'S') then
    fDMImportarXML.cdsFornecedorFILIAL.AsInteger       := vFilial;
    
  if (fDMImportarXML.cdsFornecedorINSCR_EST.AsString = 'ISENTO') and ((fDMImportarXML.cdsFornecedorUF.AsString = 'RS')
    or (fDMImportarXML.cdsFornecedorPESSOA.AsString = 'F')) then
    fDMImportarXML.cdsFornecedorINSCR_EST.AsString := '';
    
  if fDMImportarXML.cdsFornecedorINSCR_EST.AsString = 'ISENTO' then
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 2
  else
  if trim(fDMImportarXML.cdsFornecedorINSCR_EST.AsString) = '' then
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 9
  else
    fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger := 1;
  if fDMImportarXML.cdsFornecedorTIPO_CONTRIBUINTE.AsInteger = 1 then
    fDMImportarXML.cdsFornecedorTIPO_CONSUMIDOR.AsInteger := 0
  else
    fDMImportarXML.cdsFornecedorTIPO_CONSUMIDOR.AsInteger := 1;

  fDMImportarXML.cdsFornecedorINATIVO.AsString           := 'N';
  fDMImportarXML.cdsFornecedorTP_VENDEDOR.AsString       := 'N';
  fDMImportarXML.cdsFornecedorTP_FUNCIONARIO.AsString    := 'N';
  fDMImportarXML.cdsFornecedorTP_ATELIER.AsString        := 'N';
  fDMImportarXML.cdsFornecedorTP_EXPORTACAO.AsString     := 'N';
  fDMImportarXML.cdsFornecedorTP_PREPOSTO.AsString       := 'N';
  fDMImportarXML.cdsFornecedorTP_TRANSPORTADORA.AsString := 'N';
  //*******************

  fDMImportarXML.cdsFornecedor.Post;
  fDMImportarXML.cdsFornecedor.ApplyUpdates(0);

  vCodFornecedor := vAux;
end;}

procedure TfrmImportarXML.prc_Gravar_Movimento;
var
  vAux : Integer;
  vTexto : String;
  dia, mes, ano : word;
  vID_Sped : Integer;
  vID_Pessoa : Integer;
  vExiste : Boolean;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  vContador := vContador + 1;
  lblContador.Caption := IntToStr(vContador);
  lblContador.Refresh; 
  vExiste := fDMImportarXML.fnc_Localizar_SPED_DOC(fDMImportarXML.cdsNFeProtocolochNFe.AsString);
  if (vExiste) then
    vID_Sped := fDMImportarXML.cdsSped_DocID.AsInteger
  else
  if not(vExiste) then
    vID_Sped := dmDatabase.ProximaSequencia('SPED_DOC',0);
  fDMImportarXML.prc_Localizar_SPED_DOC(vID_Sped);
  try
    if fDMImportarXML.cdsSped_Doc.IsEmpty then
    begin
      fDMImportarXML.cdsSped_Doc.Insert;
      fDMImportarXML.cdsSped_DocID.AsInteger := vID_Sped;
      vID_Pessoa := fnc_Busca_Pessoa;
      fDMImportarXML.cdsSped_DocID_PESSOA.AsInteger := vID_Pessoa;
      case fDMImportarXML.cdsCabecalhotpNF.AsInteger of
        0 : fDMImportarXML.cdsSped_DocIND_EMITENTE.AsInteger := 1;
        1 : fDMImportarXML.cdsSped_DocIND_EMITENTE.AsInteger := 0;
      end;

      vTexto := Monta_Numero(fDMImportarXML.cdsFilialCNPJ_CPF.AsString,0);
      if vTexto <> fDMImportarXML.cdsCabecalhoemit_CNPJ.AsString then
        fDMImportarXML.cdsSped_DocTIPO_ES.AsInteger := 0
      else
        fDMImportarXML.cdsSped_DocTIPO_ES.AsInteger := 1;
      fDMImportarXML.cdsSped_DocMODELO.AsString := fDMImportarXML.cdsCabecalhomod.AsString;
      if (fDMImportarXML.cdsCabecalhofinNFe.AsInteger = 2) or (fDMImportarXML.cdsCabecalhofinNFe.AsInteger = 3) then
        fDMImportarXML.cdsSped_DocCOD_SIT.AsString := '06'
      else
        fDMImportarXML.cdsSped_DocCOD_SIT.AsString := '00';
      fDMImportarXML.cdsSped_DocSERIE.AsString := fDMImportarXML.cdsCabecalhoserie.AsString;
      fDMImportarXML.cdsSped_DocNUM_DOC.AsString := fDMImportarXML.cdsCabecalhonNF.AsString;
      fDMImportarXML.cdsSped_DocCHAVE_ACESSO.AsString := fDMImportarXML.cdsNFeProtocolochNFe.AsString;
      ano := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,1,4));
      mes := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,6,2));
      dia := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,9,2));
      fDMImportarXML.cdsSped_DocDTEMISSAO.AsDateTime := EncodeDate(ano,mes,dia);
      fDMImportarXML.cdsSped_DocDTES.AsDateTime := EncodeDate(ano,mes,dia);
      fDMImportarXML.cdsSped_DocVLR_TOTAL.AsFloat := fDMImportarXML.cdsCabecalhovNF.AsFloat;
      if fDMImportarXML.cdsCabecalhomod.AsString = '55' then
        fDMImportarXML.cdsSped_DocIND_PAGTO.AsInteger := 1
      else
        fDMImportarXML.cdsSped_DocIND_PAGTO.AsInteger := 0;
      fDMImportarXML.cdsSped_DocVLR_DESCONTO.AsFloat := fDMImportarXML.cdsCabecalhoICMSTot_vDesc.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_ABATIMENTO_ICMS.AsFloat := 0;
      fDMImportarXML.cdsSped_DocVLR_PRODUTOS.AsFloat := fDMImportarXML.cdsCabecalhovProd.AsFloat;
      fDMImportarXML.cdsSped_DocTIPO_FRETE.AsInteger   := fDMImportarXML.cdsCabecalhomodFrete.AsInteger;
      fDMImportarXML.cdsSped_DocVLR_FRETE.AsFloat      := fDMImportarXML.cdsCabecalhovFrete.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_SEGURO.AsFloat     := fDMImportarXML.cdsCabecalhovSeg.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_OUTRASDESP.AsFloat := fDMImportarXML.cdsCabecalhovOutro.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_BASE_ICMS.AsFloat  := fDMImportarXML.cdsCabecalhoICMSTot_vBC.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_ICMS.AsFloat       := fDMImportarXML.cdsCabecalhovICMS.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_BASE_ICMS_ST.AsFloat := fDMImportarXML.cdsCabecalhovBCST.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_ICMS_ST.AsFloat      := fDMImportarXML.cdsCabecalhovST.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_IPI.AsFloat          := fDMImportarXML.cdsCabecalhovIPI.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_PIS.AsFloat          := fDMImportarXML.cdsCabecalhoICMSTot_vPIS.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_COFINS.AsFloat       := fDMImportarXML.cdsCabecalhoICMSTot_vCOFINS.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_PIS_ST.AsFloat       := fDMImportarXML.cdsCabecalhovRetPIS.AsFloat;
      fDMImportarXML.cdsSped_DocVLR_COFINS_ST.AsFloat    := fDMImportarXML.cdsCabecalhovRetCOFINS.AsFloat;
      fDMImportarXML.cdsSped_DocFILIAL.AsInteger         := vFilial;
      fDMImportarXML.cdsSped_DocCANCELADO.AsString       := 'N';
      fDMImportarXML.cdsSped_DocDTCANCELADO.Clear;
      fDMImportarXML.cdsSped_DocDENEGADO.AsString         := 'N';
      fDMImportarXML.cdsSped_DocMOTIVO_CANCELADO.AsString := '';
      fDMImportarXML.cdsSped_DocMOTIVO_DENEGADO.AsString  := '';
      fDMImportarXML.cdsSped_DocREGIME_TRIB.AsInteger := fDMImportarXML.cdsCabecalhoCRT.AsInteger;
      fDMImportarXML.cdsSped_Doc.Post;
      fDMImportarXML.cdsSped_Doc.ApplyUpdates(0);
    end;

    fDMImportarXML.mItensNota.First;
    while not fDMImportarXML.mItensNota.Eof do
    begin
      fDMImportarXML.qMov.close;
      fDMImportarXML.qMov.ParamByName('ID_SPED').AsInteger := vID_Sped;
      fDMImportarXML.qMov.ParamByName('ITEM').AsInteger    := fDMImportarXML.mItensNotaItem.AsInteger;
      fDMImportarXML.qMov.Open;
      if fDMImportarXML.qMovCONTADOR.AsInteger > 0 then
      begin
        fDMImportarXML.mItensNota.Next;
        continue
      end;
      vAux := dmDatabase.ProximaSequencia('MOVIMENTO',0);
      fDMImportarXML.cdsMovimento.Insert;
      fDMImportarXML.cdsMovimentoID.AsInteger   := vAux;
      fDMImportarXML.cdsMovimentoITEM.AsInteger := fDMImportarXML.mItensNotaItem.AsInteger;
      fDMImportarXML.cdsMovimentoCHAVE_ACESSO.AsString := fDMImportarXML.cdsNFeProtocolochNFe.AsString;
      fDMImportarXML.cdsMovimentoTIPO_FRETE.AsInteger  := fDMImportarXML.cdsCabecalhomodFrete.AsInteger;
      fDMImportarXML.cdsMovimentoID_SPED_DOC.AsInteger := vID_Sped;

      if fDMImportarXML.mItensNotaModelo.AsString = '65' then
      begin
        fDMImportarXML.cdsMovimentoTIPO_REG.AsString := 'CFI';
        fDMImportarXML.cdsMovimentoTIPO_MOV.AsString := 'CFI';
      end
      else
      if fDMImportarXML.cdsCabecalhotpNF.AsString = '1' then
      begin
        fDMImportarXML.cdsMovimentoTIPO_REG.AsString := 'NTS';
        fDMImportarXML.cdsMovimentoTIPO_MOV.AsString := 'NOT';
      end
      else
      if fDMImportarXML.cdsCabecalhotpNF.AsString = '0' then
      begin
        fDMImportarXML.cdsMovimentoTIPO_REG.AsString := 'NTE';
        fDMImportarXML.cdsMovimentoTIPO_MOV.AsString := 'NOT';
      end;
      fDMImportarXML.cdsMovimentoSERIE.AsString       := fDMImportarXML.cdsCabecalhoserie.AsString;
      fDMImportarXML.cdsMovimentoNUM_NOTA.AsInteger   := fDMImportarXML.cdsCabecalhonNF.AsInteger;
      fDMImportarXML.cdsMovimentoID_PRODUTO.AsInteger := fDMImportarXML.mItensNotaCodProdutoInterno.AsInteger;
      fDMImportarXML.cdsMovimentoID_CFOP.AsInteger    := fnc_Busca_CFOP;
      fDMImportarXML.cdsMovimentoFILIAL.AsInteger     := vFilial;
      //fDMImportarXML.cdsMovimentoID_PESSOA.AsInteger  := fnc_Busca_Pessoa;
      fDMImportarXML.cdsMovimentoID_PESSOA.AsInteger  := vID_Pessoa;
      fDMImportarXML.cdsMovimentoVLR_UNITARIO.AsFloat := fDMImportarXML.mItensNotaVlrUnitario.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_TOTAL.AsFloat    := fDMImportarXML.mItensNotaVlrTotal.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_DESCONTO.AsFloat := fDMImportarXML.mItensNotaVlrDesconto.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_FRETE.AsFloat    := fDMImportarXML.mItensNotaVlrFrete.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_ICMS.AsFloat     := fDMImportarXML.mItensNotaVlrIcms.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_ICMSSUBST.AsFloat := fDMImportarXML.mItensNotaVlrIcmsST.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_ISSQN.AsFloat     := 0;
      fDMImportarXML.cdsMovimentoVLR_IR.AsFloat        := 0;
      fDMImportarXML.cdsMovimentoVLR_IPI.AsFloat       := fDMImportarXML.mItensNotaVlrIPI.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_INSS.AsFloat      := 0;
      fDMImportarXML.cdsMovimentoVLR_PIS.AsFloat       := fDMImportarXML.mItensNotaVlrPis.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_COFINS.AsFloat    := fDMImportarXML.mItensNotaVlrCofins.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_DUPLICATA.AsFloat := 0;
      fDMImportarXML.cdsMovimentoVLR_CSLL.AsFloat      := 0;
      fDMImportarXML.cdsMovimentoVLR_IMPORTACAO.AsFloat := fDMImportarXML.mItensNotaVlrImportacao.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_SEGURO.AsFloat     := fDMImportarXML.mItensNotaVlrSeguro.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_OUTRASDESPESAS.AsFloat := fDMImportarXML.mItensNotaVlrOutrasDespesas.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_ADUANEIRA.AsFloat      := fDMImportarXML.mItensNotaVlrDespesaAduaneira.AsFloat;
      fDMImportarXML.cdsMovimentoBASE_INSS.AsFloat          := 0;
      fDMImportarXML.cdsMovimentoBASE_ISSQN.AsFloat         := 0;
      fDMImportarXML.cdsMovimentoBASE_ICMS.AsFloat          := fDMImportarXML.mItensNotaBaseIcms.AsFloat;
      fDMImportarXML.cdsMovimentoBASE_ICMSSIMPLES.AsFloat   := 0;
      fDMImportarXML.cdsMovimentoBASE_ICMSSUBST.AsFloat     := fDMImportarXML.mItensNotaBaseCST.AsFloat;
      fDMImportarXML.cdsMovimentoVLR_ISSQN_RETIDO.AsFloat   := 0;
      fDMImportarXML.cdsMovimentoVLR_CSRF.AsFloat           := 0;
      fDMImportarXML.cdsMovimentoVLR_LIQUIDO_NFSE.AsFloat   := 0;
      if fDMImportarXML.cdsCabecalhomod.AsString = '65' then
        fDMImportarXML.cdsMovimentoVLR_CUPOMFISCAL.AsFloat := fDMImportarXML.mItensNotaVlrTotal.AsFloat;
      fDMImportarXML.cdsMovimentoCANCELADO.AsString := 'N';
      fDMImportarXML.cdsMovimentoDENEGADA.AsString  := 'N';
      ano := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,1,4));
      mes := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,6,2));
      dia := StrToInt(copy(fDMImportarXML.cdsCabecalhoide_dhEmi.AsString,9,2));
      fDMImportarXML.cdsMovimentoDTEMISSAO.AsDateTime := EncodeDate(ano,mes,dia);
      fDMImportarXML.cdsMovimentoDTENTRADASAIDA.AsDateTime := EncodeDate(ano,mes,dia);
      fDMImportarXML.cdsMovimentoUNIDADE.AsString := fDMImportarXML.mItensNotaUnidade.AsString;

      case fDMImportarXML.cdsCabecalhotpNF.AsInteger of
        0 : fDMImportarXML.cdsMovimentoTIPO_ES.AsString := 'E';
        1 : fDMImportarXML.cdsMovimentoTIPO_ES.AsString := 'S';
      end;
      fDMImportarXML.cdsMovimentoQTD.AsFloat       := fDMImportarXML.mItensNotaQtd.AsFloat;
      fDMImportarXML.cdsMovimentoPERC_ICMS.AsFloat := fDMImportarXML.mItensNotaAliqIcms.AsFloat;
      fDMImportarXML.cdsMovimentoPERC_IPI.AsFloat  := fDMImportarXML.mItensNotaAliqIPI.AsFloat;
      fDMImportarXML.cdsMovimentoCOD_CST_ICMS.AsString := fDMImportarXML.mItensNotaCodSitTrib.AsString;
      fDMImportarXML.cdsMovimentoORIGEM_PROD.AsString  := fDMImportarXML.mItensNotaOrigem.AsString;
      fDMImportarXML.cdsMovimentoPERC_ICMSSIMPLES.AsFloat := 0;
      fDMImportarXML.cdsMovimentoPERC_PIS.AsFloat         := fDMImportarXML.mItensNotaAliqPIS.AsFloat;
      fDMImportarXML.cdsMovimentoPERC_COFINS.AsFloat      := fDMImportarXML.mItensNotaAliqCofins.AsFloat;
      fDMImportarXML.cdsMovimentoPERC_ISSQN.AsFloat       := 0;
      fDMImportarXML.cdsMovimentoMOTIVO_CD.AsString       := '';
      fDMImportarXML.cdsMovimentoTP_SAIDA.AsString        := 'N';
      fDMImportarXML.cdsMovimentoTP_ENTRADA.AsString      := 'N';
      if fDMImportarXML.cdsMovimentoTIPO_ES.AsString = 'E' then
        fDMImportarXML.cdsMovimentoTP_ENTRADA.AsString := 'S'
      else
      if fDMImportarXML.cdsMovimentoTIPO_ES.AsString = 'S' then
        fDMImportarXML.cdsMovimentoTP_SAIDA.AsString := 'S';
      fDMImportarXML.cdsMovimentoTP_SERVICO.AsString := 'N';
      if fDMImportarXML.cdsCabecalhomod.AsString = '65' then
        fDMImportarXML.cdsMovimentoTP_CUPOMFISCAL.AsString := 'S'
      else
        fDMImportarXML.cdsMovimentoTP_CUPOMFISCAL.AsString := 'N';
      fDMImportarXML.cdsMovimentoNUM_RPS.AsInteger := 0;
      fDMImportarXML.cdsMovimentoNOME_PRODUTO_SERV.AsString := fDMImportarXML.mItensNotaNomeProduto.AsString;
      fDMImportarXML.cdsMovimentoREFERENCIA.AsString        := vReferencia_Loc;
      fDMImportarXML.cdsMovimentoTAMANHO.AsString           := '';
      fDMImportarXML.cdsMovimentoID_CONDPGTO.Clear;
      if fDMImportarXML.mItensNotaModelo.AsString = '55' then
        fDMImportarXML.cdsMovimentoTIPO_CONDICAO.AsString := 'P'
      else
        fDMImportarXML.cdsMovimentoTIPO_CONDICAO.AsString := 'V';
      fDMImportarXML.cdsMovimentoID_VENDEDOR.Clear;
      fDMImportarXML.cdsMovimentoID_COR.AsInteger := 0;
      fDMImportarXML.cdsMovimentoPERC_COMISSAO.AsFloat := 0;
      fDMImportarXML.cdsMovimentoID_FECHAMENTO.Clear;
      //aqui
      fDMImportarXML.cdsMovimentoVLR_ICMS_UF_REMET.AsFloat := 0;
      fDMImportarXML.cdsMovimentoVLR_ICMS_UF_DEST.AsFloat  := 0;
      fDMImportarXML.cdsMovimentoPERC_ICMS_ST.AsFloat      := fDMImportarXML.mItensNotaPercIcmsST.AsFloat;
      fDMImportarXML.cdsMovimentoCOD_CST_IPI.AsString      := fDMImportarXML.mItensNotaCodCSTIPI.AsString;
      fDMImportarXML.cdsMovimentoCOD_CST_COFINS.AsString   := fDMImportarXML.mItensNotaCodCofins.AsString;
      fDMImportarXML.cdsMovimentoCOD_CST_PIS.AsString      := fDMImportarXML.mItensNotaCodPIS.AsString;
      fDMImportarXML.cdsMovimento.Post;
      fDMImportarXML.cdsMovimento.ApplyUpdates(0);
      fDMImportarXML.mItensNota.Next;
    end;

  except
    on e: Exception do
      begin
//        dmDatabase.scoDados.Rollback(ID);
        vErro := vErro + #13 + 'Erro ao gravar sped doc: ' + fDMImportarXML.cdsCabecalhonNF.AsString + e.Message;
      end;
  end;
//end;
end;

function TfrmImportarXML.fnc_Busca_Pessoa: Integer;
var
  vAux : String;
begin
  Result      := 0;
  if (fDMImportarXML.cdsCabecalhodest_xNome.AsString = 'CONSUMIDOR FINAL') or
    (trim(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString) = '') or (fDMImportarXML.cdsCabecalhodest_CNPJ.IsNull)
    or (trim(fDMImportarXML.cdsCabecalhoenderDest_xLgr.AsString) = '') then
    Result := fDMImportarXML.qParametrosID_CLIENTE_CONSUMIDOR.AsInteger
  else
  begin
    if trim(fDMImportarXML.cdsCabecalhodest_CPF.AsString) <> '' then
      vAux := copy(fDMImportarXML.cdsCabecalhodest_CPF.AsString,1,3) + '.' + copy(fDMImportarXML.cdsCabecalhodest_CPF.AsString,4,3) + '.' + copy(fDMImportarXML.cdsCabecalhodest_CPF.AsString,7,3)
            + '-' + copy(fDMImportarXML.cdsCabecalhodest_CPF.AsString,10,2)
    else
      vAux := copy(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,1,2) + '.' + copy(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,3,3) + '.' + copy(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,6,3)
            + '/' + copy(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,9,4) + '-' + copy(fDMImportarXML.cdsCabecalhodest_CNPJ.AsString,13,2);
    fDMImportarXML.fnc_Abrir_Fornecedor(vAux,'C');
    if fDMImportarXML.cdsFornecedor.IsEmpty then
    begin
      Gravar_Cliente;
      Result := vCodFornecedor;
    end
    else
    begin
      Result := fDMImportarXML.cdsFornecedorCODIGO.AsInteger;
    end;
  end;

end;

end.
