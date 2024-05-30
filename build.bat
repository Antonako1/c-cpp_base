@ECHO OFF
setlocal

IF NOT pwd==%cd% (cd /d %~dp0)

call .\batch\msvs-dev-env.bat
cd ..
ECHO Building project...

if not exist build mkdir build
cd build

@REM Release versiossa ota tää käyttöön:
@REM "C:\Windows\system32\cmd.exe" /c "%SYSTEMROOT%\System32\chcp.com 65001 >NUL && "%CMAKEPATH%\CMake\bin\cmake.exe"  -G "Ninja"  -DCMAKE_C_COMPILER:STRING="%COMPILERPATH%" -DCMAKE_CXX_COMPILER:STRING="%COMPILERPATH%" -DCMAKE_BUILD_TYPE:STRING="Release" -DCMAKE_INSTALL_PREFIX:PATH="./install/x64-release"   -DCMAKE_MAKE_PROGRAM="%NINJAPATH%\ninja.exe" ".." 2>&1"
@REM cmake --build . --config Release

@REM Debug:
"C:\Windows\system32\cmd.exe" /c "%SYSTEMROOT%\System32\chcp.com 65001 >NUL && "%CMAKEPATH%\CMake\bin\cmake.exe"  -G "Ninja"  -DCMAKE_C_COMPILER:STRING="%COMPILERPATH%" -DCMAKE_CXX_COMPILER:STRING="%COMPILERPATH%" -DCMAKE_BUILD_TYPE:STRING="Debug" -DCMAKE_INSTALL_PREFIX:PATH="./install/x64-debug"   -DCMAKE_MAKE_PROGRAM="%NINJAPATH%\ninja.exe" ".." 2>&1"
cmake --build . --config Debug

if %ERRORLEVEL% NEQ 0 (
    ECHO Build failed, exiting...
    exit /B 1
)
CD ..

MOVE /Y .\build\C_CPP_BASE.exe %ROOTPATH%
if %ERRORLEVEL% NEQ 0 (
    ECHO Move to %ROOTPATH% failed, exiting...
    exit /B 1
)

ECHO Done. Build successful. File moved to %ROOTPATH%