@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG KHOI DONG PHAN MEM SME CRM PRO (DOCKER)...
echo ==============================================================================
echo.

docker compose -f docker-compose.prod.yml up -d

start http://localhost:3000

echo ==============================================================================
echo    HE THONG DA DUOC KHOI DONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
