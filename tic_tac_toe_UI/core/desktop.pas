unit Desktop;

{$mode objfpc}{$H+}

interface
   type TDesktop = class
     private
      height: integer;
      width: integer;
     public
      constructor create;
      constructor create(h,w: integer);
      destructor destroy;
      function getHeight: integer;
      function getWidth: integer;
      function getArea: real;
   end;



implementation

uses
  Classes, SysUtils;

constructor TDesktop.create;
begin
  height:= 640;
  width:= 480;
end;

constructor TDesktop.Create(h,w:integer);
begin
  height:= h;
  width:= w;
end;

destructor TDesktop.destroy;
begin
  writeln('Desktop destroyed');
end;

function TDesktop.getHeight: integer;
begin
  Result:= height;
end;

function TDesktop.getWidth: integer;
begin
  Result:= width;
end;

function TDesktop.getArea: real;
begin
  Result:= self.getHeight * self.getWidth;
end;

    {public int getWidth()
	Возвращает ширину экрана

public int getHeight()
	Возвращает высоту экрана

public int getArea()}


end.

