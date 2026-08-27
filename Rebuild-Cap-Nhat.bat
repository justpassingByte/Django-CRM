@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG BUILD LAI HE THONG SME CRM PRO (CAP NHAT CODE & DANG NHAP MOI)...
echo ==============================================================================
echo.

:: 1. Build lai toan bo container (Backend API + Frontend SvelteKit)
docker compose -f docker-compose.prod.yml up -d --build

echo.
echo ==============================================================================
echo    DANG THIET LAP TAI KHOAN ADMIN & NAP DU LIEU MAU...
echo ==============================================================================
echo.

:: 2. Thiet lap tai khoan admin@smecrm.vn / testpass123
docker compose -f docker-compose.prod.yml exec backend python manage.py setup_admin --email admin@smecrm.vn --password testpass123

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
