unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, jpeg, ExtCtrls, StdCtrls;

type
  TfMenu = class(TForm)
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    NxButton3: TNxButton;
    Image1: TImage;
    Label1: TLabel;
    NxButton4: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure NxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

uses UImportarXML, USPEDPisCofins, uUtilPadrao, ULerNotaCancelada;

{$R *.dfm}

procedure TfMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMenu.NxButton1Click(Sender: TObject);
begin
  frmImportarXML := TfrmImportarXML.Create(frmImportarXML);
  frmImportarXML.ShowModal;
  FreeAndNil(frmImportarXML);
end;

procedure TfMenu.NxButton2Click(Sender: TObject);
begin
  frmSPEDPisCofins := TfrmSPEDPisCofins.Create(frmSPEDPisCofins);
  frmSPEDPisCofins.ShowModal;
  FreeAndNil(frmSPEDPisCofins);
end;

procedure TfMenu.NxButton3Click(Sender: TObject);
begin
  prc_ShellExecute('BuscaNotas.exe');
end;

procedure TfMenu.NxButton4Click(Sender: TObject);
begin
  frmLerNotaCancelada := TfrmLerNotaCancelada.Create(frmImportarXML);
  frmLerNotaCancelada.ShowModal;
  FreeAndNil(frmLerNotaCancelada);
end;

end.
