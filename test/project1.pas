program project1;
uses CRT;
var
  i,j: integer;
begin
  clrscr;
  randomize;
  for i:= 1 to 80 do
    begin
         for j:= 1 to 25 do
           begin
                textColor(random(15));
                GotoXY(i,j);
                writeln('+');
           end;
    end;
  readln;
end.

