@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG NAP DU LIEU DOANH NGHIEP MAU CHO SME CRM PRO...
echo ==============================================================================
echo.

docker compose -f docker-compose.prod.yml exec backend python manage.py seed_data --email admin@smecrm.vn --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

echo.
echo ==============================================================================
echo    DA NAP DU LIEU MAU THANH CONG!
echo ==============================================================================
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo  Web URL         : http://localhost:3000
echo ==============================================================================
echo.
pause
