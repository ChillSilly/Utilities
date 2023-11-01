@echo off
:menu
cls
echo.
echo =============================
echo Windows Cleaner Utility
echo =============================
echo.
echo 1 - Limpiar la carpeta Temp
echo 2 - Limpiar la Papelera de Reciclaje
echo 3 - Limpiar Memoria RAM
echo 4 - Salir
echo.
set /p option=Elige una opcion: 
if "%option%"=="1" goto clean_temp
if "%option%"=="2" goto clean_recycle_bin
if "%option%"=="3" goto clean_ram
if "%option%"=="4" goto end
goto menu

:clean_temp
echo Limpiando la carpeta Temp...
cd %temp%
del /S /Q *.*
echo Carpeta Temp limpiada.
pause
goto menu

:clean_recycle_bin
echo Limpiando la Papelera de Reciclaje...
powershell.exe -Command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue"
echo Papelera de Reciclaje limpiada.
pause
goto menu

:clean_ram
echo Limpiando Memoria RAM...
%windir%\\system32\\rundll32.exe advapi32.dll,ProcessIdleTasks
echo Memoria RAM limpiada.
pause
goto menu

:end
exit
