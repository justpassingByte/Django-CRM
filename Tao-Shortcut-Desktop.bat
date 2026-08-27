@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG TAO BIEU TUONG PHAN MEM RA MAN HINH DESKTOP
echo ==============================================================================

powershell -ExecutionPolicy Bypass -File "%~dp0tao-shortcut.ps1"

echo.
echo ==============================================================================
echo    DA TAO SHORTCUT "SME CRM Pro" RA MAN HINH DESKTOP THANH CONG!
echo ==============================================================================
echo.
echo - Khach hang khong can go bat ky lenh nao.
echo - Moi lan su dung, chi can nhap dup vao bieu tuong tren Desktop.
echo.
echo ==============================================================================
pause
