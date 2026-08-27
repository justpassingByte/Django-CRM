@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG BUILD LAI HE THONG SME CRM PRO (CAP NHAT GIAO DIEN & DU LIEU VIET NAM)
echo ==============================================================================
echo.

:: 1. Build lai toan bo containers
docker compose -f docker-compose.prod.yml up -d --build

echo.
echo ==============================================================================
echo    DANG NAP DU LIEU DOANH NGHIEP VIET NAM (VND, CONG TY VIET)
echo ==============================================================================
echo.

:: Cho backend san sang
timeout /t 6 /nobreak > nul

:: Migrate va thiet lap admin
docker compose -f docker-compose.prod.yml exec -T backend python manage.py makemigrations --noinput
docker compose -f docker-compose.prod.yml exec -T backend python manage.py migrate --noinput
docker compose -f docker-compose.prod.yml exec -T backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --password testpass123 --currency VND --country VN --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --clear --no-input

echo.
echo ==============================================================================
echo    DA CAP NHAT VA NAP DU LIEU DOANH NGHIEP VIET NAM THANH CONG!
echo ==============================================================================
echo  Web URL         : http://localhost:3000
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo ==============================================================================
echo.
start http://localhost:3000
pause