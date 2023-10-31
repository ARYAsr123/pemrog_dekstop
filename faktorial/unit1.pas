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
    edtJumlah: TEdit;
    edtfaktorial: TEdit;
    edtDeret: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function HitungFaktorial(N: Integer): Int64;
var
  i: Integer;
begin
  Result := 1;
  for i := 1 to N do
    Result := Result * i;
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  N: Integer;
begin
  try
    N := StrToInt(edtDeret.Text);
    edtfaktorial.Text := IntToStr(HitungFaktorial(N));
  except
    on EConvertError do
      ShowMessage('Masukkan angka yang valid.');
  end;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  edtDeret.Clear;
  edtfaktorial.Clear;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
