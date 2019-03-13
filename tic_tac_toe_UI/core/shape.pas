unit Shape;

{$mode objfpc}{$H+}

interface
 type
  TShape= class
    shape: string;
    function getShape: string;
    procedure setShape(var T_shape: string);
   end;


implementation
  uses
    Classes, SysUtils;

  function TShape.getShape: string;
  begin
    Result:= shape;
  end;

  procedure TShape.setShape(var T_shape: string);
  begin
   shape:= T_shape;
  end;

end.

