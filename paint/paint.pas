unit Paint;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ColorBox, ValEdit, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ColorBox1: TColorBox;
    ComboBox1: TComboBox;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    BrushPen: TBitmap;
    BrushSpray: TBitmap;
    pBrush: ^TBitmap;
    procedure makeField;
    procedure makeBrush(Shape: string; X, Y:integer);
    procedure makeSpray(X , Y: integer);
    procedure doSpray(X,Y: integer);
    function isInsideCircle(x,y,r: integer): boolean;
  public

  end;

var
  Form1: TForm1;
  pressed: boolean;
  shape: string;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  makeField;
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pressed:= true;
  shape:= ComboBox1.Text;
  makeBrush(shape, X, Y) ;
  Canvas.Draw(X, Y+48, pBrush^);

end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if pressed  and (shape = 'Pen')  then
  begin
   Canvas.Draw(X, Y+48, pBrush^);
  end;
  if pressed and (shape = 'Spray') then
  begin
   doSpray(X,Y);
  end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  pressed:= false;
end;

procedure TForm1.makeBrush(Shape: string; X, Y :integer);
begin
  pBrush:= nil;
  if Shape = 'Pen' then
  begin
    BrushPen := TBitmap.Create;
    pBrush := @BrushPen;
    pBrush^.Width:=1;
    pBrush^.Height:=1;
    pBrush^.Canvas.Brush.Color := Colorbox1.Selected;
  end;
  if Shape = 'Spray' then
  begin
    makeSpray(X, Y);
  end;
end;

procedure TForm1.makeField;
begin
  PaintBox1.Refresh;
  Canvas.Brush.Color:= clWhite;
  Canvas.Rectangle(8,48,PaintBox1.Width,PaintBox1.Height);
end;


procedure TForm1.makeSpray(X , Y: integer);
begin
  BrushSpray:= TBitmap.create;
  pBrush:= @BrushSpray;
  pBrush^.Width:=1;
  pBrush^.Height:=1;
  pBrush^.Canvas.Brush.Color := Colorbox1.Selected;
  doSpray(X,Y);
end;

procedure TForm1.doSpray(X,Y: integer);
var
  i,xc,yc: integer;
begin
  randomize;
  BrushSpray.Canvas.Brush.Color := Colorbox1.Selected;
  for i:= 1 to 10 do
  begin
    xc := random(10) + 1;
    yc := random(10) + 1;
    if isInsideCircle(xc, yc, 11) then
    begin
      Canvas.draw(x + xc,y + yc + 48, pBrush^);
      Canvas.draw(x - xc,y - yc + 48, pBrush^);
      Canvas.draw(x + xc,y - yc + 48, pBrush^);
      Canvas.draw(x - xc,y + yc + 48, pBrush^);
    end;
  end;
end;

function TForm1.isInsideCircle(x,y,r: integer): boolean;
begin
  if Power(x,2)+Power(y,2)<r*r then
    Result:= true
  else
    Result:= false;
end;

end.

