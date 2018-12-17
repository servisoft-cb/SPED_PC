program SS_SPED_PC;

uses
  Forms,
  DmdDatabase in '..\ssfacil\DmdDatabase.pas' {dmDatabase: TDataModule},
  UDMSPEDFiscal in 'UDMSPEDFiscal.pas' {DMSPEDFiscal: TDataModule},
  uUtilPadrao in '..\ssfacil\uUtilPadrao.pas',
  UEscolhe_Filial in '..\ssfacil\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  rsDBUtils in '..\rslib\nova\rsDBUtils.pas',
  UDMImportarXML in 'UDMImportarXML.pas' {DMImportarXML: TDataModule},
  UImportarXML in 'UImportarXML.pas' {frmImportarXML},
  uNFeComandos in '..\ssfacil\uNFeComandos.pas',
  uNFeConsts in '..\NFe 3.10\NFESrv\uNFeConsts.pas',
  USPEDPisCofins in 'USPEDPisCofins.pas' {frmSPEDPisCofins},
  UDMMovimento in '..\ssfacil\UDMMovimento.pas' {DMMovimento: TDataModule},
  UMenu in 'UMenu.pas' {fMenu},
  ULerNotaCancelada in 'ULerNotaCancelada.pas' {frmLerNotaCancelada};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfMenu, fMenu);
  Application.Run;
end.
