unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnClear: TButton;
    btnClose: TButton;
    cbKode: TComboBox;
    edtTotalBayar: TEdit;
    edtDiskon: TEdit;
    edtSubTotal: TEdit;
    edtHargaSatuan: TEdit;
    edtNamaBrang: TEdit;
    edtQuantity: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  HargaBarang: array[0..3] of integer = (50000, 2500, 750000, 5000);
  Diskon: array[0..3] of integer = (15, 10, 5, 0);
  KodeIndex: integer;
  SubTotal: integer;
begin
  KodeIndex := cbKode.ItemIndex;
  if (KodeIndex >= 0) and (KodeIndex <= 3) then
  begin
    SubTotal := StrToIntDef(edtQuantity.Text, 0) * HargaBarang[KodeIndex];
    edtSubTotal.Text := IntToStr(SubTotal);

    if SubTotal >= 100000 then
      edtDiskon.Text := IntToStr(Diskon[0])
    else if SubTotal >= 50000 then
      edtDiskon.Text := IntToStr(Diskon[1])
    else if SubTotal >= 25000 then
      edtDiskon.Text := IntToStr(Diskon[2])
    else
      edtDiskon.Text := IntToStr(Diskon[3]);

    edtTotalBayar.Text := IntToStr(SubTotal - (SubTotal * StrToIntDef(edtDiskon.Text, 0) div 100));
  end;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  cbKode.ItemIndex := -1;
  edtQuantity.Text := '';
  edtHargaSatuan.Text := '';
  edtNamaBrang.Text := '';
  edtSubTotal.Text := '';
  edtDiskon.Text := '';
  edtTotalBayar.Text := '';
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

