@ECHO OFF
SETLOCAL

SET cscDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe

ECHO Using %cscDir%
ECHO.

SET libDir=%cd%\bin\library
SET conDir=%cd%\bin\console
SET appDir=%cd%\bin\application

mkdir %libDir%
mkdir %conDir%
mkdir %appDir%

SET CONS=/recurse:Console.cs
SET APPL=/recurse:Application.cs
SET ABST=/recurse:abstract\*.cs
SET ATTR=/recurse:attribute\*.cs
SET DELE=/recurse:delegate\*.cs
SET ENUM=/recurse:enum\*.cs
SET EXCE=/recurse:exception\*.cs
SET INST=/recurse:instance\*.cs
SET INTE=/recurse:interface\*.cs
SET STAT=/recurse:static\*.cs
SET STRU=/recurse:struct\*.cs

REM/nowarn:1591
%cscDir% /nowarn:1591 /doc:%conDir%\doc.xml /out:%conDir%\bin.exe /target:exe /main:Console %CONS% %ABST% %ATTR% %DELE% %ENUM% %EXCE% %INST% %INTE% %STAT% %STRU%
REM%cscDir% /nowarn:1591 /doc:%appDir%\doc.xml /out:%appDir%\bin.exe /target:winexe /main:Application  %APPL% %ABST% %ATTR% %DELE% %ENUM% %EXCE% %INST% %INTE% %STAT% %STRU%
REM%cscDir% /nowarn:1591 /doc:%libDir%\doc.xml /out:%libDir%\bin.exe /target:library %ABST% %ATTR% %DELE% %ENUM% %EXCE% %INST% %INTE% %STAT% %STRU%

ENDLOCAL
@ECHO ON