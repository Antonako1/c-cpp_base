@echo off
cd /d %~dp0
call .\batch\globals.bat
cd ..
cd ..\build
.\win\%PROJECTNAME%.exe %*
@rem echo %ERRORLEVEL%
cd ..