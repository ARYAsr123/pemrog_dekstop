unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnClose: TButton;
    btnHitung: TButton;
    btnClear: TButton;
    cbJabatan: TComboBox;
    edtTunjangan: TEdit;
    edtNama: TEdit;
    edtGajiPokok: TEdit;
    edtGajiBersih: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    procedure btnHitungClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
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
  gajiPokok, tunjangan, gajiBersih: Double;
begin
  // Mengambil gaji pokok dari combo box
  case cbJabatan.ItemIndex of
    0: gajiPokok := 5000000; // Direktur
    1: gajiPokok := 2000000; // Manager
    2: gajiPokok := 1000000; // Karyawan
  end;

  // Menghitung tunjangan berdasarkan status
  if RadioGroup1.ItemIndex = 0 then
    tunjangan := 15000000 // Pegawai tetap
  else
    tunjangan := 5000000; // Honorer

  // Menghitung gaji bersih
  gajiBersih := gajiPokok + tunjangan;

  // Menampilkan hasil perhitungan pada komponen TEdit
  edtGajiPokok.Text := FloatToStr(gajiPokok);
  edtTunjangan.Text := FloatToStr(tunjangan);
  edtGajiBersih.Text := FloatToStr(gajiBersih);
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  // Menghapus semua input dan hasil perhitungan
  edtNama.Text := '';
  cbJabatan.ItemIndex := -1;
  RadioGroup1.ItemIndex := -1;
  edtGajiPokok.Text := '';
  edtTunjangan.Text := '';
  edtGajiBersih.Text := '';
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  // Menutup aplikasi
  Close;
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
begin

end;

end.

