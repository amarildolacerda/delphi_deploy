program project1;
{$APPTYPE CONSOLE}
{.$R *.res}
uses
  System.SysUtils;

begin
  try
    WriteLn('Program Project1 Sample.');
    WriteLn('Press the ENTER key to stop');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.