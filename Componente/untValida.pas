unit untValida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmValida = class(TForm)
    BitBtn1: TBitBtn;
    lblInfo: TLabel;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValida: TfrmValida;

implementation

{$R *.dfm}

procedure TfrmValida.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.
