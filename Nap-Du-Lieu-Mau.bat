@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG CAP NHAT VA NAP DU LIEU MAU SME CRM PRO...
echo ==============================================================================
echo.

:: Chay migrate truoc
docker compose -f docker-compose.prod.yml exec -T backend python manage.py migrate --noinput

:: Thiet lap admin
docker compose -f docker-compose.prod.yml exec -T backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123

:: Nap du lieu mau
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --password testpass123 --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

echo.
echo ==============================================================================
echo    DA NAP DU LIEU MAU VA THIET LAP ADMIN THANH CONG!
echo ==============================================================================
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo  Web URL         : http://localhost:3000
echo ==============================================================================
echo.
pause
