unit Core;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Rectangle, Shape, Point, Desktop;

type TCore = class
    private
      turn: integer;
      field: array [0..2] of array [0..2] of integer;
    public
      constructor Create;
      function whereInside(x,y: integer): string;
      function isEmpty(x,y: integer): boolean;
      function isDraw: boolean;
      function isWin: boolean;
      procedure reset;
  end;

implementation

   constructor TCore.Create;
   var
      i,j: integer;
   begin
     for i:= 0 to length(field)-1  do
        begin
        for j:= 0 to length(field)-1 do
           begin
             field[i][j]:= 0;
           end;
        end;
   end;

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
     str(turn, s);
     if TRectangle.create(TPoint.create(0, 8),TPoint.create(158,107)).isInside(x, y) then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '1' + s;
          end;
         if (field[0 , 0] = 0) and (turn = 0) then
           begin
             field[0 , 0] := 1
           end;
         if (field[0 , 0] = 0) and (turn = 1) then
           begin
             field[0 , 0] := -1;
           end;
       end;
      if TRectangle.create(TPoint.create(158, 8),TPoint.create(336, 107)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '2' + s;
           end;
         if (field[0 , 1] = 0) and (turn = 0) then
          begin
           field[0 , 1] := 1
          end;
         if (field[0 , 1] = 0) and (turn = 1) then
         begin
           field[0 , 1] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(336, 8),TPoint.create(495, 107)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '3' + s;
           end;
         if (field[0 , 2] = 0) and (turn = 0) then
          begin
           field[0 , 2] := 1
          end;
         if (field[0 , 2] = 0) and (turn = 1) then
         begin
           field[0 , 2] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(0, 107),TPoint.create(158, 207)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '4' + s;
           end;
         if (field[1 , 0] = 0) and (turn = 0) then
          begin
           field[1 , 0] := 1
          end;
         if (field[1 , 0] = 0) and (turn = 1) then
         begin
           field[1 , 0] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(158, 107),TPoint.create(336, 207)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '5' + s;
           end;
         if (field[1 , 1] = 0) and (turn = 0) then
          begin
           field[1 , 1] := 1
          end;
         if (field[1 , 1] = 0) and (turn = 1) then
          begin
           field[1 , 1] := -1;
          end;
       end;
      if TRectangle.create(TPoint.create(336, 107),TPoint.create(495, 207)).isInside(x, y) then
       begin
        if isEmpty(x , y) then
           begin
             Result:= '6' + s;
           end;
         if (field[1 , 2] = 0) and (turn = 0) then
          begin
           field[1 , 2] := 1
          end;
         if (field[1 , 2] = 0) and (turn = 1) then
         begin
           field[1 , 2] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(0, 207),TPoint.create(158, 310)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '7' + s;
           end;
         if (field[2 , 0] = 0) and (turn = 0) then
          begin
           field[2 , 0] := 1
          end;
         if (field[2 , 0] = 0) and (turn = 1) then
         begin
           field[2 , 0] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(158, 207),TPoint.create(336, 310)).isInside(x, y)  then
       begin
         if isEmpty(x , y) then
           begin
             Result:= '8' + s;
           end;
         if (field[2 , 1] = 0) and (turn = 0) then
          begin
           field[2 , 1] := 1
          end;
         if (field[2 , 1] = 0) and (turn = 1) then
         begin
           field[2, 1] := -1;
         end;
       end;
      if TRectangle.create(TPoint.create(336, 207),TPoint.create(495, 310)).isInside(x, y)  then
       begin
          if isEmpty(x , y) then
           begin
             Result:= '9' + s;
           end;
         if (field[2 , 2] = 0) and (turn = 0)  then
          begin
           field[2 , 2] := 1
          end;
         if (field[2 , 2] = 0) and (turn = 1) then
         begin
           field[2 , 2] := -1;
         end;
       end;
      if (turn = 0) and (Result <> '') then
        turn := 1
      else
        begin
          if (turn = 1) and (Result <> '') then
             turn:= 0;
        end;
      if Result = '' then
         Result:= '00';
   end;

   function TCore.isEmpty(x,y: integer): boolean;
   begin
     Result:= false;
      if TRectangle.create(TPoint.create(0, 8),TPoint.create(158,107)).isInside(x, y) then
       begin
          if field[0][0] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(158, 8),TPoint.create(336, 107)).isInside(x, y) then
       begin
         if field[0][1] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(336, 8),TPoint.create(495, 107)).isInside(x, y) then
       begin
         if field[0][2] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(0, 107),TPoint.create(158, 207)).isInside(x, y) then
       begin
         if field[1][0] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(158, 107),TPoint.create(336, 207)).isInside(x, y) then
       begin
         if self.field[1][1] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(336, 107),TPoint.create(495, 207)).isInside(x, y) then
       begin
        if field[1][2] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(0, 207),TPoint.create(158, 310)).isInside(x, y) then
       begin
         if field[2][0] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(158, 207),TPoint.create(336, 310)).isInside(x, y) then
       begin
         if field[2][1] = 0 then
            begin
              Result:= true;
            end;
       end;
      if TRectangle.create(TPoint.create(336, 207),TPoint.create(495, 310)).isInside(x, y) then
       begin
         if field[2][2] = 0 then
            begin
              Result:= true;
            end;
       end;
   end;

   function TCore.isDraw: boolean;
   var
      i,j: integer;
   begin
     Result:= true;
     for i:= 0 to 2 do
        for j:= 0 to 2 do
           begin
             if (field[i][j] = 0) then
                begin
                  Result:= false;
                  break;
                end;
           end;
   end;

   function TCore.isWin: boolean;
   var i,j: integer;
   begin
     i:= 0;
     Result:= false;
        for j:= 0 to 2 do
           begin
             if ((field[i][j] + field[i+1][j] + field[i+2][j]) = 3) or
                ((field[i][j] + field[i+1][j] + field[i+2][j]) = -3)
             then
                begin
                  Result:= true;
                  break;
                end;
           end;
        j:= 0;
        for i:= 0 to 2 do
           begin
             if ((field[i][j] + field[i][j+1] + field[i][j+2]) = 3) or
                ((field[i][j] + field[i][j+1] + field[i][j+2]) = -3)
                then
                begin
                  Result:= true;
                  break;
                end;
           end;
        i:= 0;
        j:= 0;
        if ((field[i][j] + field[i+1][j+1] + field[i+2][j+2]) = 3) or
           ((field[i][j+2] + field[i+1][j+1] + field[i+2][j]) = 3)
           then
                begin
                  Result:= true;
                end;
        if ((field[i][j] + field[i+1][j+1] + field[i+2][j+2]) = -3) or
           ((field[i][j+2] + field[i+1][j+1] + field[i+2][j]) = -3)
           then
                begin
                  Result:= true;
                end;
   end;
   procedure TCore.reset;
   var
      i,j: integer;
   begin
     for i:= 0 to length(field)-1  do
        begin
        for j:= 0 to length(field)-1 do
           begin
             field[i][j]:= 0;
           end;
        end;
     turn:= 0;
   end;
end.



