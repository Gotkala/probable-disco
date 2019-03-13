unit Rectangle;

{$mode objfpc}{$H+}

interface
uses Shape, Point;
type
  TRectangle= class(Shape.TShape)
    private
      topLeft: Point.TPoint;
      bottomRight: Point.TPoint;
      active: boolean;
    public
      constructor create(T_topLeft, T_bottomRight: Point.TPoint; T_active:boolean );
      constructor create(xLeft, yTop, width, height: integer; T_active: boolean);
      constructor create(T_topLeft, T_bottomRight: Point.TPoint);
      constructor create(xLeft, yTop, width, height: integer);
      destructor  destroy;
      Function getWidth: integer;
      Function getHeight: integer;
      procedure setTopLeft(T_topLeft: Point.TPoint);
      procedure setBottomRight(T_bottomRight: Point.TPoint);
      function getTopLeft: Point.TPoint;
      function getBottomRight: Point.TPoint;
      function isActive: boolean;
      function isInside(x,y: integer): boolean;
      function isInside(point: Point.TPoint): boolean;
      procedure setActive(T_active: boolean);
      function isIntersects(rect: TRectangle): boolean;
      procedure moveTo(x,y: integer);
      procedure moveTo(point: Point.TPoint);
      procedure moveRel(dx, dy: integer);
      procedure resize(ratio: real);
   end;

implementation
  uses
    Classes, SysUtils;

  constructor TRectangle.create(T_topLeft, T_bottomRight: Point.TPoint; T_active: boolean);
  begin
    self.topLeft:= T_topLeft;
    self.bottomRight:= T_bottomRight;
    self.active:= T_active;
  end;

  constructor TRectangle.create(xLeft, yTop, width, height: integer; T_active: boolean);
  begin
    self.create(Point.TPoint.Create(xLeft, yTop), Point.TPoint.Create(height + yTop - 1, width + xLeft - 1) , T_active);
  end;

  constructor TRectangle.create(T_topLeft, T_bottomRight: Point.TPoint);
  begin
    self.create(T_topLeft, T_bottomRight, true);
  end;

  constructor TRectangle.create(xLeft, yTop, width, height: integer);
   begin
     self.create(xLeft, yTop, width, height, true);
   end;

  destructor TRectangle.destroy;
  begin
    self.Free;
  end;

  function TRectangle.getWidth: integer;
  begin
    Result:= bottomRight.getX - topLeft.getX + 1;
  end;

  function TRectangle.isActive: boolean;
  begin
    Result:= active;
  end;

  function TRectangle.isIntersects(rect: TRectangle): boolean;
  begin
    Result:= (rect.getWidth > 0) and (rect.getHeight > 0) and (self.getWidth > 0) and (self.getHeight > 0)
              and (rect.topLeft.getX < self.topLeft.getX + self.getWidth) and (rect.topLeft.getX + rect.getWidth > self.topLeft.getX)
              and (rect.topLeft.getY < self.topLeft.getY + self.getHeight) and (rect.topLeft.getY + rect.getHeight > self.topLeft.getY);
  end;

  procedure TRectangle.setActive(T_active: boolean);
  begin
   active:= T_active;
  end;

  procedure TRectangle.moveTo(x,y: integer);
  begin
   self.topLeft.setX(x);
   self.topLeft.setY(y);
  end;

  function TRectangle.isInside(x,y: integer): boolean;
  begin
   Result:= (self.topLeft.getY <= y) and (self.topLeft.getX <= x )
   and (self.bottomRight.getX >= x) and (self.bottomRight.getY >= Y);
  end;

  function TRectangle.isInside(point: Point.TPoint): boolean;
  begin
   Result:= self.isInside(point.getX,point.getY);
  end;

  procedure TRectangle.moveTo(point: Point.TPoint);
  begin
    self.moveTo(point.getX, point.getY);
  end;

  procedure TRectangle.moveRel(dX, dY: integer);
  begin
    self.topLeft.setX( self.topLeft.getX + dX );
    self.topLeft.setY( self.topLeft.getY + dY );
  end;

  procedure TRectangle.resize(ratio: real);
  begin
    self.bottomRight.setX( Trunc(self.getWidth * ratio) + self.getTopLeft.getX - 1);
    self.bottomRight.setY( Trunc(self.getHeight * ratio) + self.getTopLeft.getY - 1);
    if bottomRight.getX <= topLeft.getX then
    begin
      bottomRight.setX(topLeft.getX);
    end;
    if bottomRight.getY <= topLeft.getY then
    begin
      bottomRight.setY(topLeft.getY);
    end;
  end;

  function TRectangle.getHeight: integer;
  begin
    Result:= bottomRight.getY - topLeft.getY + 1;
  end;

   procedure TRectangle.setTopLeft(T_topLeft: Point.TPoint);
   begin
    topLeft:= T_topLeft;
   end;

   procedure TRectangle.setBottomRight(T_bottomRight: Point.TPoint);
   begin
     bottomRight:= T_bottomRight;
   end;

   function TRectangle.getTopLeft: Point.TPoint;
   begin
     Result:= self.topLeft;
   end;

   function TRectangle.getBottomRight: Point.TPoint;
   begin
     Result:= self.bottomRight;
   end;

end.

