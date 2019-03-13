unit Point;

{$mode objfpc}{$H+}

interface
 uses Desktop;

 type TPoint = class
   private
   x: integer;
   y: integer;
   public
   constructor create;
   constructor create(xVal , yVal: integer);
   constructor create(point: TPoint);
   procedure moveTo(T_x, T_y: integer);
   procedure moveRel(dX, dY: integer);
   function isVisibleOnDesktop(desktop: Desktop.TDesktop): boolean;
   function isNotVisibleOnDesktop(desktop: Desktop.TDesktop): boolean;
   function getX: integer;
   function getY: integer;
   function getPoint: TPoint;
   procedure setX(T_x: integer);
   procedure setY(T_y: integer);
  end;

implementation
  uses
   Classes, SysUtils;

procedure TPoint.moveTo(T_x, T_y: integer);
begin
  x:= T_x;
  y:= T_y;
end;

procedure TPoint.moveRel(dX, dY: integer);
begin
  x:= x + dX;
  y:= y + dY;
end;

function TPoint.isVisibleOnDesktop(desktop: Desktop.TDesktop): boolean;
 begin
  Result:= ((desktop.getHeight >= y) and (y >= 0) )
            and ((desktop.getWidth >= x) and (x >= 0))
 end;

function TPoint.isNotVisibleOnDesktop(desktop: Desktop.TDesktop): boolean;
 begin
  Result:= not self.isVisibleOnDesktop(desktop);
 end;

constructor TPoint.create;
begin
  x:= 0;
  y:= 0;
end;

constructor TPoint.create(xVal , yVal: integer);
begin
  x:= xVal;
  y:= yVal;
end;

function TPoint.getPoint: TPoint;
begin
  Result:= self;
end;

constructor TPoint.create(point: TPoint);
begin
 TPoint.Create(point.x, point.y);
end;

function TPoint.getX: integer;
  begin
    Result:= self.x;
  end;

  function TPoint.getY: integer;
  begin
    Result:= self.y;
  end;

  procedure TPoint.setX(T_x: integer);
  begin
    x:= T_x;
  end;

  procedure TPoint.setY(T_y: integer);
  begin
    y:= T_y;
  end;
end.

