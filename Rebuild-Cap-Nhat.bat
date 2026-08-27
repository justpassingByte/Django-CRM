@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG BUILD LAI HE THONG SME CRM PRO
echo ==============================================================================
echo.

:: 1. Build lai toan bo container
docker compose -f docker-compose.prod.yml up -d --build

echo.
echo ==============================================================================
echo    DANG DONG BO DU LIEU VA TAI KHOAN ADMIN
echo ==============================================================================
echo.

:: Cho backend san sang 5 giay
timeout /t 5 /nobreak > nul

docker compose -f docker-compose.prod.yml exec -T backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --password testpass123 --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

echo.
echo ==============================================================================
echo    DA BUILD LAI VA DONG BO DANG NHAP THANH CONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
echo.
start http://localhost:3000
pause
