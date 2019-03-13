unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, core;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

    procedure makeField;
    procedure drawTurn(s: string; x, y: integer);
  public

  end;

var
  Form1: TForm1;
  coreImpl: TCore;
implementation

{$R *.lfm}

{ TForm1 }

 procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.Caption:= 'Start';
  Edit1.text:= 'Enter your name';
  Edit2.visible:= false;
  label1.visible:= false;
  edit3.visible:= false;
  PaintBox1.visible:= true;
  Constraints.MaxHeight:= Height;
  Constraints.MaxWidth:= Width;
  Constraints.MinWidth:= Width;
  Constraints.MinHeight:= Height;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin

end;


procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  s: string;
  pCore: ^TCore;
begin
   pCore:= @coreImpl;
   s:= pCore^.whereInside(x,y);
   drawTurn(s, x ,y);

end;
 {
    Rectangle 1 = (0, 8 ; 158, 107)
    Rectangle 2 = (158, 8; 336, 107)
    Rectangle 3 = (336, 8; 495, 107)
    Rectangle 4 = (0, 107+34; 158, 207+34)
    Rectangle 5 = (158, 107+34; 336, 207+34)
    Rectangle 6 = (336, 107+34; 495, 207+34)
    Rectangle 7 = (0, 207+34; 158, 310+34)
    Rectangle 8 = (158, 207+34; 336, 310+34)
    Rectangle 9 = (336, 207+34; 495, 310+34)
   }
procedure TForm1.drawTurn(s: string; x, y: integer);
begin
  case s[1] of
  '1': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
  '2': begin
      if s[2] = '0' then
        begin
          Canvas.Line(158+56, 40, 336+56, 141);
          Canvas.Line(336+56, 40, 158+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
    '3': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
  '4': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
    '5': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
  '6': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
    '7': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
  '8': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;
    '9': begin
      if s[2] = '0' then
        begin
          Canvas.Line(56,40, 158+56, 141);
          Canvas.Line(158+56, 40 , 0+56, 141);
        end
      else
        begin
        canvas.Ellipse(56,40, 158+56, 141);
        end;
    end;

  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.visible:= false;
  Edit1.visible:= false;
  edit2.visible:= true;
  edit2.Text:= edit1.text;
  label1.caption:= 'VS';
  label1.visible:= true;
  edit3.text:= 'Computer';
  edit3.visible:= true;
  makeField;
  coreImpl:= TCore.Create;
end;

procedure TForm1.makeField;
begin
  PaintBox1.visible:= true;
  PaintBox1.Refresh;
  Canvas.Brush.Color:= clWhite;
  Canvas.Rectangle(56,40,552,344);
  Canvas.Brush.Color:= clBlack;
  Canvas.Line(214,40,214,344);
  Canvas.Line(392,40,392,344);
  Canvas.Line(56,141,552,141);
  Canvas.Line(56,241,552,241);
end;



end.

