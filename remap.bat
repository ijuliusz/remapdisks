@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set "newIP=192.168.3.16"

FOR /f "tokens=1-4" %%a IN ('net use') do (call :replaceIP %%b %%c)
goto :end

:replaceIP
set "driveLetter=%~1"
set "serverIP=%~2"
net use %driveLetter% /delete /y
for /f delims^=^\^ tokens^=1 %%p in ("%serverIP%") do (set oldIP=%%p)
call set serverIP=%%serverIP:!oldIP!=!newIP!%%
net use %driveLetter% %serverIP% /p:yes
net use

echo Questions or problems? Contact me at coder@ijuliusz.pl
echo script written by iJuliusz

endlocal
:end
pause
