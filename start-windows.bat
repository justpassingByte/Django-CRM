@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    KHOI DONG HE THONG SME CRM PRO (POSTGRESQL + DJANGO + SVELTEKIT)
echo ==============================================================================
echo.

echo [1/2] Dang khoi chay Docker Containers...
docker compose -f docker-compose.prod.yml up -d --build

echo.
echo [2/2] Dang nap du lieu mau ban dau...
docker compose -f docker-compose.prod.yml exec backend python manage.py seed_data --email admin@smecrm.vn --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

echo.
echo ==============================================================================
echo    HE THONG DA KHOI CHAY THANH CONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
echo.
start http://localhost:3000
pause
