unit VisualizationBubbleSort;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  s: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i,n: integer;
begin
  Edit1.text:= '';
  randomize;
  for i:= 0 to 9 do
  begin
    n:= random(10);
    str(n,s);
    Edit1.text:= concat(Edit1.text,s);
  end;
  Edit1.ReadOnly:= true;
  Button1.caption:= 'Sort';
  Label1.Visible:= false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i: integer;
 s: string;
 ch: char;
 ed: boolean;
begin
  s:= edit1.text;
  ed:= false;
  while(not ed) do
    begin
      ed:= true;
      for i:= 1 to length(Edit1.text) - 1 do
      begin
        Label1.Caption:= 'Thread is on ' + IntToStr(i) +' element';
       if s[i] > s[i+1] then
         begin
           ch:= s[i];
           s[i]:= s[i+1];
           s[i+1]:= ch;
           ed:= false;
           edit1.text:= s;
           Sleep(500);
           Edit1.Update;
         end;
       Label1.Update;
      end;
    end;
  Timer1.Enabled:= false;
  Label1.Caption:= 'Over';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Visible:= true;
  Timer1.Enabled:= true;
  Label1.Caption:= 'Starting...';
end;

end.

