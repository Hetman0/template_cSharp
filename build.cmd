@ECHO OFF
SETLOCAL

SET cscDir=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe


ECHO Compiling %cscDir%
mkdir %cd%\bin\

%cscDir% /doc:%cd%\bin\doc.xml /out:%cd%\bin\build.exe /target:exe /main:Console /recurse:%cd%\*.cs /nowarn:1591

ENDLOCAL
@ECHO ON