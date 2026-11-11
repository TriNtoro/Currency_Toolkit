@echo off
chcp 65001 >nul
title Setup - Currency Download Toolkit
cd /d "%~dp0"
echo ============================================
echo   Setup Currency Download Toolkit (sekali saja)
echo ============================================
echo.

set PY=
where py >nul 2>nul && set PY=py -3
if "%PY%"=="" (
  where python >nul 2>nul && set PY=python
)
if "%PY%"=="" (
  echo [!] Python belum terpasang.
  echo     Unduh di https://www.python.org/downloads/
  echo     Saat instal, CENTANG "Add python.exe to PATH", lalu jalankan SETUP.bat lagi.
  echo.
  pause
  exit /b 1
)

echo Membuat lingkungan Python di folder .venv ...
%PY% -m venv .venv
if errorlevel 1 goto gagal

echo Memasang paket (butuh internet, beberapa menit) ...
".venv\Scripts\python.exe" -m pip install --upgrade pip -q
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto gagal

echo.
echo ============================================
echo   SELESAI. Mulai sekarang cukup klik dua kali
echo   JALANKAN.bat
echo ============================================
pause
exit /b 0

:gagal
echo.
echo [!] Setup gagal. Foto/salin pesan di atas dan kirim ke Claude.
pause
exit /b 1
