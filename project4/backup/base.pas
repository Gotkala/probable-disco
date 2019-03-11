unit base;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

 { TForm1 }
{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin
  PaintBox1.Color:= clWhite;
  with PaintBox1, canvas do
    begin
    Brush.Color := clRed;
    Pie(12,100,140,280,12,100,140,280);
    Pen.Width := 4;
    Pen.Color := clGreen;
    Pen.Style := psDash;
    Rectangle(120,60,Width,Height);
    Pen.Width := 1;
    Pen.Color := clRed;
    Polyline([Point(40, 10), Point(20, 60), Point(70, 30),
    Point(10, 30), Point(60, 60), Point(40, 10)]);
    TextOut(75,20,'Здесь может быть Ваш текст!');
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Hello World!');
end;


end.

