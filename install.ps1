# ==============================================================================
# Trinh Cai Dat Tu Dong 1-Click: SME CRM Pro cho Windows (PowerShell)
# ==============================================================================

Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host "      🚀 TRINH CAI DAT TU DONG: SME CRM PRO CHO WINDOWS (COSS VIETNAM)        " -ForegroundColor Cyan
Write-Host "==============================================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Chua tim thay Docker Desktop tren may tinh!" -ForegroundColor Red
    Write-Host "👉 Vui long cai dat Docker Desktop tai: https://www.docker.com/products/docker-desktop/" -ForegroundColor Yellow
    exit 1
}

$installDir = "$HOMESMECRM-Pro"
Write-Host "📂 Thiet lap thu muc cai dat tai: $installDir ..." -ForegroundColor Yellow

if (Test-Path "$installDir") {
    Set-Location "$installDir"
} else {
    git clone https://github.com/justpassingByte/Django-CRM.git "$installDir"
    Set-Location "$installDir"
}

if (-not (Test-Path ".env")) {
    $secret = [Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Minimum 0 -Maximum 256 } | ForEach-Object { [byte]$_ }))
    Copy-Item ".env.production.example" ".env" -ErrorAction SilentlyContinue
    (Get-Content ".env") -replace "SECRET_KEY=.*", "SECRET_KEY=$secret" | Set-Content ".env"
}

Write-Host "⚡ Dang khoi chay he thong (PostgreSQL, Redis, Django, SvelteKit)..." -ForegroundColor Yellow
docker compose -f docker-compose.prod.yml up -d --build

Write-Host "🌱 Dang nap du lieu doanh nghiep mau..." -ForegroundColor Yellow
Start-Sleep -Seconds 8
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input

Write-Host ""
Write-Host "==============================================================================" -ForegroundColor Green
Write-Host "🎉🎉🎉 CHUC MUNG BAN DA CAI DAT THANH CONG SME CRM PRO! 🎉🎉🎉" -ForegroundColor Green
Write-Host "==============================================================================" -ForegroundColor Green
Write-Host "👉 Truy cap he thong tai:   http://localhost:3000" -ForegroundColor Cyan
Write-Host "👉 Tai khoan Admin mac dinh: admin@smecrm.vn" -ForegroundColor Cyan
Write-Host "👉 Mat khau:                testpass123" -ForegroundColor Cyan
Write-Host "==============================================================================" -ForegroundColor Green
Write-Host ""

Start-Process "http://localhost:3000"
