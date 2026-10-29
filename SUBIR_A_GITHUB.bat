@echo off
chcp 65001 >nul
title SUBIR INSTANCIA PRIVADA A GITHUB
color 0B
echo ======================================================================
echo          SUBIDA AUTOMATICA DE INSTANCIA ENCRIPTADA A GITHUB
echo ======================================================================
echo.
echo Los mods estan 100%% protegidos con AES-256 (.jar.enc).
echo Nadie podra ver ni robar tus mods sin la clave del launcher.
echo.
echo Repositorio GitHub: https://github.com/ArturoDev-UnrealStudios/mods.git
echo.
set /p CONFIRM="¿Deseas subir los archivos protegidos ahora mismo? (S/N) [ENTER = S]: "
if /i "%CONFIRM%"=="n" exit /b 0

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git no esta instalado en este equipo.
    echo Por favor instala Git o sube los archivos de esta carpeta manualmente a GitHub.
    pause
    exit /b 1
)

echo.
echo Subiendo a GitHub...
git init
git branch -M main 2>nul
git add .
git commit -m "feat: release de instancia privada protegida"
git remote remove origin 2>nul
git remote add origin https://github.com/ArturoDev-UnrealStudios/mods.git
git push -u origin main --force
if %errorlevel% neq 0 (
    echo.
    echo [AVISO] Si GitHub te pidio inicio de sesion, autorizalo en tu navegador.
) else (
    echo.
    echo [✓] ¡Archivos subidos exitosamente a GitHub!
    echo Los jugadores podran descargar los mods automaticamente por internet.
)
pause
