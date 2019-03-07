unit calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    userName: string;
    function isEmpty(msg: string): boolean;
    procedure sendMsg(msg: string);
    procedure makeLog();
    procedure writeIntoLog(msg: String);
  public
    function getUserName: string;
    procedure setUserName(_userName: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text:='Enter your name';
  Button1.Caption:= 'Send Message';
  Memo1.Lines.Text:='';
  Memo1.Visible:=false;
  Button1.Visible:=false;
  Edit2.Visible:=false;
  Label1.Visible:=false;
  Memo1.ReadOnly:= true;
  Label2.Visible:=false;
  makeLog();
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if not isEmpty(Edit1.text) then
  begin
    if (ord(key) = 13) and (length(Edit1.text) >= 1) then
    begin
      Label1.Caption:= 'Hello, '+ Edit1.text+'.';
      setUserName(Edit1.text);
      Edit1.Visible:=false;
      Memo1.Visible:=true;
      Button1.Visible:=true;
      Edit2.Visible:=true;
      Label1.Visible:=true;
      Label2.Visible:=false;
      Edit2.text:= '';
    end;
  end
 else
   begin
     Label2.Visible:=true;
     Label2.Caption:= 'Wrong name. Name has to be more than 1 syllabel and not empty';
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if (length(edit2.text) <> 0 ) and not IsEmpty(edit2.text) then
    begin
      sendMsg(edit2.text);
    end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: char);

begin
  if( ord(key) = 13) then
  begin
    if (length(edit2.text) <> 0 ) and not IsEmpty(edit2.text) then
    begin
     sendMsg(edit2.text);
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TForm1.sendMsg(msg: string);
var
  i: integer;
begin
 if memo1.Lines.Capacity < 23 then
   begin
    memo1.Lines.Add(getUserName+ '('+ DateToStr(Now)+' at '+TimeToStr(Time)+')' +' : '+msg);
    Edit2.text:= '';
   end
  else
   begin
     for i:= 1 to memo1.Lines.Capacity - 1 do
     begin
       writeIntoLog(memo1.Lines[i]);
     end;
     memo1.Caption:= '';
     memo1.Lines.Add(getUserName+ '('+ DateToStr(Now)+' at '+TimeToStr(Time)+')' +' : '+msg);
     Edit2.text:= '';
   end;
end;

function TForm1.isEmpty(msg: string): boolean;
begin
  Result:= msg.IsNullOrWhiteSpace(msg);
end;

procedure TForm1.Edit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edit1.Text:= '';
end;

procedure TForm1.makeLog();
var
  log: textFile;
begin
  assignFile(log,'C:\Users\Jura\Documents\project1\log\log.txt');
  if not FileExists('C:\Users\Jura\Documents\project1\log\log.txt') then
    begin
      Rewrite(log);
    end
   else
     begin
       Append(log);
     end;
  closeFile(log);
end;

procedure TForm1.writeIntoLog(msg: string);
var
  log: textFile;
begin
  assignFile(log,'C:\Users\Jura\Documents\project1\log\log.txt');
  Append(log);
  writeln(log, msg);
  closeFile(log);
end;

procedure TForm1.setUserName(_userName: string);
begin
  self.userName:=_userName;
end;

function TForm1.getUserName: string;
begin
  Result:= self.userName;
end;
end.

