@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG KHOI DONG PHAN MEM SME CRM PRO...
echo ==============================================================================
echo.

:: 1. Khoi chay Docker containers
docker compose -f docker-compose.prod.yml up -d --build

:: 2. Mo ung dung ngay lap tuc o che do Desktop App
start "" msedge.exe --app=http://localhost:3000 || start "" chrome.exe --app=http://localhost:3000 || start http://localhost:3000

echo.
echo ==============================================================================
echo    HE THONG DA KHOI CHAY THANH CONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
echo.
