#!/usr/bin/env bash
# ==============================================================================
# Trình Cài Đặt Tự Động 1-Click: SME CRM Pro (Django-CRM) — COSS Vietnam
# Hệ thống quản trị quan hệ khách hàng B2B, Báo giá & Hóa đơn cho SME
# ==============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "=============================================================================="
echo "      🚀 TRÌNH CÀI ĐẶT 1-CLICK: SME CRM PRO (COSS VIETNAM / TRUSTBASE)        "
echo "=============================================================================="
echo -e "${NC}"

# 1. Kiểm tra Docker Engine
echo -e "${BLUE}🔍 [1/5] Kiểm tra Docker Engine...${NC}"
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}📦 Đang cài đặt Docker Engine tự động...${NC}"
    curl -fsSL https://get.docker.com | sh
    systemctl enable --now docker
    echo -e "${GREEN}✅ Đã cài đặt Docker thành công!${NC}"
fi

# 2. Thư mục cài đặt
INSTALL_DIR="/opt/sme-crm-pro"
echo -e "${BLUE}📂 [2/5] Thiết lập thư mục cài đặt tại ${INSTALL_DIR}...${NC}"
mkdir -p "$INSTALL_DIR"

if [ -f "./docker-compose.prod.yml" ]; then
    cp -r ./* "$INSTALL_DIR/"
else
    git clone https://github.com/justpassingByte/Django-CRM.git "$INSTALL_DIR" || true
fi

cd "$INSTALL_DIR"

# 3. Tạo file .env
echo -e "${BLUE}⚙️  [3/5] Tạo file cấu hình môi trường (.env)...${NC}"
if [ ! -f .env ]; then
    RANDOM_SECRET=$(openssl rand -hex 32 2>/dev/null || head -c 32 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | head -c 32)
    cp .env.production.example .env 2>/dev/null || cp .env.example .env
    sed -i "s/SECRET_KEY=.*/SECRET_KEY=${RANDOM_SECRET}/g" .env
fi

# 4. Khởi chạy Docker
echo -e "${BLUE}⚡ [4/5] Đang build và khởi động hệ thống SME CRM Pro (PostgreSQL + Redis)...${NC}"
docker compose -f docker-compose.prod.yml down 2>/dev/null || true
docker compose -f docker-compose.prod.yml up -d --build

# 5. Nạp dữ liệu mẫu ban đầu
echo -e "${BLUE}🌱 [5/5] Đang nạp dữ liệu doanh nghiệp mẫu (Seed Data)...${NC}"
sleep 8
docker compose -f docker-compose.prod.yml exec -T backend python manage.py seed_data --email admin@smecrm.vn --orgs 1 --leads 30 --accounts 15 --contacts 20 --opportunities 10 --cases 5 --tasks 15 --no-input || true

SERVER_IP=$(curl -s -m 3 ifconfig.me 2>/dev/null || hostname -I | awk '{print $1}' || echo "localhost")

echo -e "${GREEN}"
echo "=============================================================================="
echo "🎉🎉🎉 CHÚC MỪNG BẠN ĐÃ CÀI ĐẶT THÀNH CÔNG SME CRM PRO! 🎉🎉🎉"
echo "=============================================================================="
echo -e "${NC}"
echo -e "👉 ${CYAN}Truy cập trang Web hệ thống:${NC}  http://${SERVER_IP}:3000"
echo -e "👉 ${CYAN}Tài khoản Quản Trị Viên:${NC}      admin@smecrm.vn"
echo -e "👉 ${CYAN}Mật khẩu mặc định:${NC}             testpass123"
echo ""
echo -e "${YELLOW}📋 Các lệnh quản trị nhanh:${NC}"
echo "  • Xem log hệ thống:       cd ${INSTALL_DIR} && docker compose -f docker-compose.prod.yml logs -f"
echo "  • Khởi động lại:          cd ${INSTALL_DIR} && docker compose -f docker-compose.prod.yml restart"
echo "  • Dừng hệ thống:          cd ${INSTALL_DIR} && docker compose -f docker-compose.prod.yml down"
echo "=============================================================================="
