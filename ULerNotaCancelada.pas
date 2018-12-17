unit ULerNotaCancelada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls, UDMImportarXML, Grids,
  DBGrids, SMDBGrid, RzTabs, SqlExpr;

type
  TfrmLerNotaCancelada = class(TForm)
    Panel1: TPanel;
    Diretorio: TLabel;
    edtDiretorio: TDirectoryEdit;
    btnListar: TButton;
    MemLista: TMemo;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Memo1: TMemo;
    TabSheet2: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    TabSheet3: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnListarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDMImportarXML: TDMImportarXML;

    mXml : TMemoryStream;
    vChave_Acesso : String;
    vContador : Integer;
    sds: TSQLDataSet;

    procedure ListarArquivos(Diretorio: string; Sub:Boolean);
    procedure Carrega_XML(Arquivo : String);

    function TemAtributo(Attr, Val: Integer): Boolean;

  public
    { Public declarations }
  end;

var
  frmLerNotaCancelada: TfrmLerNotaCancelada;

implementation

uses rsDBUtils, DmdDatabase, StrUtils;

{$R *.dfm}

procedure TfrmLerNotaCancelada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmLerNotaCancelada.btnListarClick(Sender: TObject);
var
  vTexto : String;
begin
  if MessageDlg('Confirma a importação?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Memo1.Lines.Clear;
  MemLista.Lines.Clear;
  fDMImportarXML.mCancelada.EmptyDataSet;
  fDMImportarXML.mEncontrada.EmptyDataSet;

  vContador := 0;

  ListarArquivos(edtDiretorio.Text, False);

  vTexto := '';

  ShowMessage('Total de ' + IntToStr(vContador) +  ' Registros Cancelados!');
end;

procedure TfrmLerNotaCancelada.ListarArquivos(Diretorio: string; Sub: Boolean);
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
  vAux : String;
begin
  MXml := TMemoryStream.Create;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata := True;
  sds.GetMetadata := False;

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
        memLista.Lines.Add(Diretorio+'\'+F.Name);
        try
          vAux := ExtractFileExt(Diretorio+'\'+F.Name);
          if UpperCase(vAux) = '.XML' then
            Carrega_XML(Diretorio+'\'+F.Name)
          else
            Memo1.Lines.Add(Diretorio+'\'+F.Name);
        except
        end;
      end;
        Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
  FreeAndNil(mXml);
  FreeAndNil(sds);
end;

procedure TfrmLerNotaCancelada.Carrega_XML(Arquivo: String);
var
  SXml: TStringList;
  vEvento : String;
  vDtEvento : TDateTime;
  vAux : String;
  ano,mes,dia : word;
  vMotivo : String;
  i, i2 : Integer;
  vNumDoc : String;
  sXmlEvento: TStringStream;
begin
  sXml := TStringList.Create;
  sXmlEvento := TStringStream.Create('');
  sXmlEvento.Position := 0;
  mXml.LoadFromFile(Arquivo);
  mXml.Position := 0;
  sXmlEvento.CopyFrom(mXml,mXml.Size);
  sXmlEvento.Position := 0;

  vChave_Acesso := '';
  SXml.LoadFromStream(sXmlEvento);
  //i := posex('<chNFe>',SXml.Text);
  i := posex('<chNFe>',sXmlEvento.DataString);
  if i > 0 then
    vChave_Acesso := copy(sXmlEvento.DataString,i+7,44);

  if trim(vChave_Acesso) = '' then
  begin
    FreeAndNil(sXML);
    Memo1.Lines.Add(Arquivo);
    exit;
  end;

  vEvento := '';
  //i := posex('<tpEvento>',SXml.Text);
  i := posex('<tpEvento>',sXmlEvento.DataString);
  if i > 0 then
    vEvento := copy(sXmlEvento.DataString,i+10,6);
  if vEvento <> '110111' then
  begin
    FreeAndNil(sXML);
    Memo1.Lines.Add(Arquivo);
    exit;
  end;

  vMotivo := '';
  i  := posex('<xJust>',sXmlEvento.DataString);
  i2 := posex('</xJust>',sXmlEvento.DataString);
  i2 := (i2 - I) -7;
  if i > 0 then
    vMotivo := copy(sXmlEvento.DataString,i+7,i2);
  vAux := '';
  i := posex('<dhEvento>',sXmlEvento.DataString);
  if i > 0 then
    vAux := copy(sXmlEvento.DataString,i+10,10);
  ano := StrToInt(copy(vAux,1,4));
  mes := StrToInt(copy(vAux,6,2));
  dia := StrToInt(copy(vAux,9,2));
  vDtEvento := EncodeDate(ano,mes,dia);

  fDMImportarXML.qSped_Doc.Close;
  fDMImportarXML.qSped_Doc.ParamByName('CHAVE_ACESSO').AsString := vChave_Acesso;
  fDMImportarXML.qSped_Doc.Open;
  if fDMImportarXML.qSped_Doc.IsEmpty then
  begin
    fDMImportarXML.mCancelada.Insert;
    fDMImportarXML.mCanceladaNFeChave.AsString  := vChave_Acesso;
    fDMImportarXML.mCanceladaCancelada.AsString := 'S';
    fDMImportarXML.mCanceladaData.AsDateTime    := vDtEvento;
    fDMImportarXML.mCancelada.Post;
  end
  else
  begin
    fDMImportarXML.cdsSped_Doc.Close;
    fDMImportarXML.sdsSped_Doc.ParamByName('ID').AsInteger := fDMImportarXML.qSped_DocID.AsInteger;
    fDMImportarXML.cdsSped_Doc.Open;
    if not fDMImportarXML.cdsSped_Doc.IsEmpty then
    begin
      vNumDoc := fDMImportarXML.cdsSped_DocNUM_DOC.AsString;
      fDMImportarXML.cdsSped_Doc.Edit;
      fDMImportarXML.cdsSped_DocCANCELADO.AsString        := 'S';
      fDMImportarXML.cdsSped_DocDTCANCELADO.AsDateTime    := vDtEvento;
      fDMImportarXML.cdsSped_DocMOTIVO_CANCELADO.AsString := vMotivo;
      fDMImportarXML.cdsSped_DocCOD_SIT.AsString          := '02';
      fDMImportarXML.cdsSped_Doc.Post;
      fDMImportarXML.cdsSped_Doc.ApplyUpdates(0);
      vContador := vContador + 1;

      sds.Close;
      sds.CommandText := 'UPDATE MOVIMENTO SET CANCELADO = ' + QuotedStr('S') + ' WHERE ID_SPED_DOC = ' + fDMImportarXML.qSped_DocID.AsString;
      sds.ExecSQL;

      fDMImportarXML.mEncontrada.Insert;
      fDMImportarXML.mEncontradaData.AsDateTime   := vDtEvento;
      fDMImportarXML.mEncontradaNFeChave.AsString := vChave_Acesso;
      fDMImportarXML.mEncontradaNumNota.AsString  := vNumDoc;
      fDMImportarXML.mEncontrada.Post;
    end;
  end;
  FreeAndNil(sXML);
  FreeAndNil(sXmlEvento);
end;

procedure TfrmLerNotaCancelada.FormShow(Sender: TObject);
begin
  fDMImportarXML := TDMImportarXML.Create(Self);
  oDBUtils.SetDataSourceProperties(Self,fDMImportarXML);
end;

function TfrmLerNotaCancelada.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

end.
