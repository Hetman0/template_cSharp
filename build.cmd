@ECHO OFF
SETLOCAL

SET cscDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe

ECHO Using %cscDir%
ECHO.

SET CONS=/recurse:ConApp.cs
SET APPL=/recurse:WinApp.cs
SET ABST=/recurse:abstract\*.cs
SET ATTR=/recurse:attribute\*.cs
SET DELE=/recurse:delegate\*.cs
SET ENUM=/recurse:enum\*.cs
SET EXCE=/recurse:exception\*.cs
SET INST=/recurse:instance\*.cs
SET INTE=/recurse:interface\*.cs
SET STAT=/recurse:static\*.cs
SET STRU=/recurse:struct\*.cs
SET LIBR=%ABST% %ATTR% %DELE% %ENUM% %EXCE% %INST% %INTE% %STAT% %STRU%

SET conDir=%cd%\bin\console
if not exist %conDir% mkdir %conDir%
%cscDir% /nowarn:1591 /doc:%conDir%\doc.xml /out:%conDir%\bin.exe /target:exe /main:ConApp %CONS% %LIBR%
start %conDir%\bin.exe

SET appDir=%cd%\bin\application
if not exist %appDir% mkdir %appDir%
%cscDir% /nowarn:1591 /doc:%appDir%\doc.xml /out:%appDir%\bin.exe /target:winexe /main:WinApp %APPL% %LIBR%

SET libDir=%cd%\bin\library
if not exist %libDir% mkdir %libDir%
%cscDir% /nowarn:1591 /doc:%libDir%\doc.xml /out:%libDir%\bin.exe /target:library %LIBR%

ENDLOCAL
@ECHO ON