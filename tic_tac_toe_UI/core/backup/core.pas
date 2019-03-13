unit Core;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Rectangle, Shape, Point, Desktop;

type TCore = class
    private
      turn: integer;

    public
    function whereInside(x,y: integer): string;

  end;

implementation
   function TCore.whereInside(x,y: integer): string;
   var
    s: string;
   begin
     {
    Rectangle 1 = (0, 8 ; 158, 107)
    Rectangle 2 = (158, 8; 336, 107)
    Rectangle 3 = (336, 8; 495, 107)
    Rectangle 4 = (0, 107 ; 158, 207)
    Rectangle 5 = (158, 107; 336, 207)
    Rectangle 6 = (336, 107; 495, 207)
    Rectangle 7 = (0, 207; 158, 310)
    Rectangle 8 = (158, 207; 336, 310)
    Rectangle 9 = (336, 207; 495, 310)
   }
     str(self.turn, s);
     if TRectangle.create(TPoint.create(0, 8),TPoint.create(158,107)).isInside(x, y) then
       begin
         Result:= '1' + s;
       end;
      if TRectangle.create(TPoint.create(158, 8),TPoint.create(336, 107)).isInside(x, y) then
       begin
         Result:= '2' +s;
       end;
      if TRectangle.create(TPoint.create(336, 8),TPoint.create(495, 107)).isInside(x, y) then
       begin
         Result:= '3' + s;
       end;
      if TRectangle.create(TPoint.create(0, 107),TPoint.create(158, 207)).isInside(x, y) then
       begin
         Result:= '4'+ s;
       end;
      if TRectangle.create(TPoint.create(158, 107),TPoint.create(336, 207)).isInside(x, y) then
       begin
         Result:= '5'+ s;
       end;
      if TRectangle.create(TPoint.create(336, 107),TPoint.create(495, 207)).isInside(x, y) then
       begin
         Result:= '6'+ s;
       end;
      if TRectangle.create(TPoint.create(0, 207),TPoint.create(158, 310)).isInside(x, y) then
       begin
         Result:= '7'+s;
       end;
      if TRectangle.create(TPoint.create(158, 207),TPoint.create(336, 310)).isInside(x, y) then
       begin
         Result:= '8'+ s;
       end;
      if TRectangle.create(TPoint.create(336, 207),TPoint.create(495, 310)).isInside(x, y) then
       begin
         Result:= '9'+ s;
       end;
      if self.turn = 0 then
        self.turn := 1
      else
        self.turn:= 0;
   end;

end.

