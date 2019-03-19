unit Paint;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ColorBox, ValEdit, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ColorBox1: TColorBox;
    ComboBox1: TComboBox;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    BrushPen: TBitmap;
    procedure makeField;
    procedure makeBrush(Shape: string; X, Y:integer);
    procedure makeSpray(X , Y: integer);
  public

  end;

var
  Form1: TForm1;
  pressed: boolean;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Text:='Pen';
  ComboBox1.Items.Add('Pen');
  ComboBox1.Items.Add('Spray');
  Constraints.MaxHeight:= Height;
  Constraints.MaxWidth:= Width;
  Constraints.MinWidth:= Width;
  Constraints.MinHeight:= Height;
  makeField;

end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pressed:= true;
  makeBrush(ComboBox1.Text, X, Y) ;
  Canvas.Draw(X, Y+48, BrushPen);

end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if pressed then
   Canvas.Draw(X, Y+48, BrushPen);

end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pressed:= false;
  BrushPen.Free;
end;

procedure TForm1.makeBrush(Shape: string; X, Y :integer);
begin
  BrushPen := TBitmap.Create;
  if Shape = 'Pen' then
  begin
    BrushPen.Width:=1;
    BrushPen.Height:=1;
    BrushPen.Canvas.Brush.Color := Colorbox1.Selected;
    BrushPen.Canvas.Ellipse(0, 0, 10, 10);
  end;
  if Shape = 'Spray' then
  begin
    makeSpray(X, Y);
  end;
end;

procedure TForm1.makeField;
begin
  PaintBox1.Refresh;
  Canvas.Brush.Color:= clRed;
  Canvas.Rectangle(8,48,552,344);
end;


procedure TForm1.makeSpray(X , Y: integer);
var
  i: integer;
begin
  BrushPen.Width:=15;
  BrushPen.Height:=15;
  BrushPen.Canvas.Brush.Color:= PaintBox1.Color;
  BrushPen.Canvas.FillRect(0,0,BrushPen.Canvas.Width, BrushPen.Canvas.Height);
  BrushPen.Canvas.Brush.Color := Colorbox1.Selected;
  randomize;
  for i:= 1 to 20 do
  begin
    BrushPen.Canvas.Pen.Color:= Colorbox1.Selected;
    BrushPen.Canvas.Pen.Canvas.Ellipse(random(5)+1, random(5)+1, random(5)+1, random(5)+1);
  end;
end;

end.

