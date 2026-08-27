@echo off
cd /d "%~dp0"

echo ==============================================================================
echo    DANG MO HE THONG SME CRM PRO...
echo ==============================================================================

docker compose -f docker-compose.prod.yml up -d

start "" msedge.exe --app=http://localhost:3000 || start "" chrome.exe --app=http://localhost:3000 || start http://localhost:3000
