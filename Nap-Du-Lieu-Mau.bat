@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG XOA DATA CU VA NAP DU LIEU DOANH NGHIEP VIET NAM (SME CRM PRO)...
echo ==============================================================================
echo.

:: 1. Tao va chay migrate database
docker compose -f docker-compose.prod.yml exec -T backend python manage.py makemigrations --noinput
docker compose -f docker-compose.prod.yml exec -T backend python manage.py migrate --noinput

:: 2. Thiet lap tai khoan Admin mac dinh
docker compose -f docker-compose.prod.yml exec -T backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123

:: 3. Xoa data cu va Nap tron bo du lieu mau tieng Viet (VNĐ, Doanh nghiep Viet Nam)
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --password testpass123 --currency VND --country VN --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --clear --no-input

echo.
echo ==============================================================================
echo    DA NAP DU LIEU MAU DOANH NGHIEP VIET NAM THANH CONG!
echo ==============================================================================
echo  Tai khoan Admin : admin@smecrm.vn
echo  Mat khau        : testpass123
echo  Web URL         : http://localhost:3000
echo ==============================================================================
echo.
pause