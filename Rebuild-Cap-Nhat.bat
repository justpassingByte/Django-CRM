@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG BUILD LAI HE THONG SME CRM PRO
echo ==============================================================================
echo.

:: 1. Build va khoi dong lai toan bo containers
docker compose -f docker-compose.prod.yml up -d --build

echo.
echo ==============================================================================
echo    DANG CAP NHAT BANG DU LIEU VA TAI KHOAN ADMIN
echo ==============================================================================
echo.

:: Cho backend va database san sang
timeout /t 6 /nobreak > nul

:: Chay migrate database de cap nhat toan bo cot bang bieu
docker compose -f docker-compose.prod.yml exec -T backend python manage.py migrate --noinput

:: Khoi tao tai khoan Admin
docker compose -f docker-compose.prod.yml exec -T backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123

:: Nap du lieu doanh nghiep mau
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --password testpass123 --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

echo.
echo ==============================================================================
echo    DA CAP NHAT VA DONG BO DANG NHAP THANH CONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
echo.
start http://localhost:3000
pause
