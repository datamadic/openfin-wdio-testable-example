@ECHO OFF
REM This script is intended to be used for launching OpenFin Runtime by ChromeDriver or node of Selenium Grid server.
REM It parses --remote-debugging-port and --config parameters passed by ChromeDriver and passes them to OpenFinRVM.exe
REM %openfinLocation% needs to point to location of OpenFin install directory.
REM devtools_port should NOT be set in app manifest json file

SETLOCAL ENABLEDELAYEDEXPANSION
SETLOCAL ENABLEEXTENSIONS

SET debuggingPort=0

:loop  
 IF "%1"=="" GOTO cont  
 SET opt=%1
 IF "%opt%" == "--remote-debugging-port" (
    SET debuggingPort=%2
 )
 IF "%opt%" == "--config" (
    SET startupURL=%2
 )


 SHIFT & GOTO loop

:cont

echo %debuggingPort%
echo %startupURL%
echo %testable_proxy%

SET openfinLocation=C:\Users\Administrator\AppData\Local\OpenFin

%openfinLocation%\OpenFinRVM.exe --config=%startupURL% --support-email="support@openfin.co" --runtime-arguments="--remote-debugging-port=%debuggingPort%"

ENDLOCAL
