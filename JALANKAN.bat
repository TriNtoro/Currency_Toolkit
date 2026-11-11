@echo off
chcp 65001 >nul
title Currency Download Toolkit
cd /d "%~dp0"

if not exist ".venv\Scripts\streamlit.exe" (
  echo Aplikasi belum di-setup. Menjalankan SETUP.bat dulu ...
  call SETUP.bat
)

rem Lewati pertanyaan email Streamlit saat pertama kali jalan
if not exist "%USERPROFILE%\.streamlit" mkdir "%USERPROFILE%\.streamlit"
if not exist "%USERPROFILE%\.streamlit\credentials.toml" (
  >"%USERPROFILE%\.streamlit\credentials.toml" echo [general]
  >>"%USERPROFILE%\.streamlit\credentials.toml" echo email = ""
)

echo ============================================
echo   Currency Download Toolkit
echo   Browser akan terbuka otomatis.
echo   Jika tidak, buka: http://localhost:8501
echo   JANGAN tutup jendela ini selama dipakai.
echo   Untuk berhenti: tutup jendela ini.
echo ============================================
echo.
".venv\Scripts\streamlit.exe" run app.py --server.port 8501
pause
