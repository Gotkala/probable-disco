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
  public

  end;

var
  Form1: TForm1;

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
begin

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

