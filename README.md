# 🚀 SME CRM Pro (Django-CRM Commercial Edition) — COSS Vietnam

[![Docker Ready](https://img.shields.io/badge/Docker-1--Click%20Deploy-blue.svg)](https://www.docker.com/)
[![PostgreSQL 16](https://img.shields.io/badge/Database-PostgreSQL%2016-336791.svg)](https://www.postgresql.org/)
[![Django 5](https://img.shields.io/badge/Backend-Django%20REST-092e20.svg)](https://www.djangoproject.com/)
[![SvelteKit 2](https://img.shields.io/badge/Frontend-SvelteKit%202%20%2B%20Tailwind-ff3e00.svg)](https://kit.svelte.dev/)
[![Language](https://img.shields.io/badge/Language-100%25%20Tiếng%20Việt-red.svg)]()
[![Trustbase Verified](https://img.shields.io/badge/Platform-COSS%20Vietnam-orange.svg)]()

> **SME CRM Pro** là phần mềm quản trị quan hệ khách hàng (CRM), phễu bán hàng B2B, quản lý báo giá và hợp đồng tự lưu trữ (**Self-hosted 100% On-Premise**) dành riêng cho doanh nghiệp vừa và nhỏ (SME 5-50 nhân sự) tại Việt Nam.

---

## 🎯 2 PHIÊN BẢN LINH HOẠT THEO NHU CẦU

| Tiêu chí | 🖥️ Phiên Bản 1: Dùng Nội Bộ Công Ty (Local / LAN) | ☁️ Phiên Bản 2: Truy Cập Online 24/7 (Cloud VPS) |
| :--- | :--- | :--- |
| **Mục đích** | Quản lý khách hàng, nhân viên kinh doanh nội bộ công ty | Toàn bộ nhân viên làm việc từ xa, gắn Tên Miền riêng |
| **Chi phí duy trì** | **0đ / tháng** (Dữ liệu lưu 100% tại máy chủ công ty) | ~100.000đ - 150.000đ/tháng thuê VPS |
| **Cơ sở dữ liệu** | PostgreSQL 16 + Redis trong Docker | PostgreSQL 16 + Redis trong Docker |
| **Cách khởi động** | **1-Click nhấp đúp file `start-windows.bat`** | **1 Dòng lệnh `curl ... | bash`** trên VPS Ubuntu |

---

## 🌟 TÍNH NĂNG THƯƠNG MẠI NỔI BẬT

1. **100% Việt Hóa Chuẩn Nghiệp Vụ Doanh Nghiệp Việt:**
   - Bản địa hóa toàn diện: Khách tiềm năng (Leads), Khách hàng doanh nghiệp (Accounts), Người liên hệ (Contacts), Cơ hội kinh doanh (Deals), Hóa đơn & Báo giá, Công việc (Tasks) và Kho giải pháp.

2. **Quản Lý Phễu Bán Hàng Trực Quan (Pipeline Kanban):**
   - Kéo thả trạng thái Deal theo từng giai đoạn: *Tiếp cận ➔ Gửi báo giá ➔ Đàm phán ➔ Đã ký kết ➔ Thất bại*.
   - Dự báo doanh số và đo lường tỷ lệ chuyển đổi của từng nhân viên kinh doanh (Sales).

3. **Soạn Báo Giá (Estimates) & Hóa Đơn (Invoices) Chuyên Nghiệp:**
   - Tạo báo giá mẫu gửi khách hàng, tự động chuyển báo giá thành hóa đơn khi chốt hợp đồng.
   - Hỗ trợ xuất PDF và tạo hóa đơn định kỳ (Recurring Billing).

4. **Quản Lý Công Việc & Chấm Công (Tasks & Timesheet):**
   - Phân công nhiệm vụ cho nhân viên, xem lịch theo dạng Kanban hoặc Calendar.
   - Ghi nhận thời gian thực hiện dự án/hợp đồng của từng nhân sự.

5. **Hệ Thống Hỗ Trợ Khách Hàng (Helpdesk & Tickets):**
   - Tiếp nhận yêu cầu hỗ trợ, phân luồng ticket tự động, đo lường chỉ số hài lòng khách hàng (CSAT) và cam kết chất lượng dịch vụ (SLA).

6. **Đóng Gói 1-Click Trọn Gói:**
   - Tự động dựng toàn bộ cụm: PostgreSQL 16 + Redis 7 + Django REST + Celery + SvelteKit Web chỉ với 1 thao tác.

---

## ⚡ CÀI ĐẶT 1-DÒNG LỆNH (1-CLICK INSTALLER)

### 🐧 Dành cho Máy chủ Linux / Cloud VPS (Ubuntu, Debian, CentOS):
Mở terminal VPS và dán câu lệnh:
```bash
curl -fsSL https://raw.githubusercontent.com/justpassingByte/Django-CRM/master/install.sh | bash
```

### 🪟 Dành cho Máy tính Windows (PowerShell):
Mở **PowerShell** trên Windows và dán:
```powershell
irm https://raw.githubusercontent.com/justpassingByte/Django-CRM/master/install.ps1 | iex
```

Sau 1-2 phút, hệ thống sẽ tự động hoàn tất và hiển thị:
* **Trang quản trị CRM:** `http://<IP_HOẶC_LOCALHOST>:3000`
* **Tài khoản quản trị mặc định:** `admin@smecrm.vn`
* **Mật khẩu:** `testpass123`

---

## 🌐 HƯỚNG DẪN CẤU HÌNH TÊN MIỀN (CUSTOM DOMAIN) & SSL HTTPS

1. **Trỏ DNS Tên Miền:**
   * Tạo bản ghi `A` trỏ về IP của VPS (VD: `crm.tencongty.vn` ➔ `103.x.x.x`).
2. **Cấu hình Nginx Reverse Proxy:**
   ```nginx
   server {
       listen 80;
       server_name crm.tencongty.vn;

       location / {
           proxy_pass http://127.0.0.1:3000;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
           proxy_set_header X-Forwarded-Proto $scheme;
       }
   }
   ```
3. **Cấp SSL HTTPS miễn phí:**
   ```bash
   sudo certbot --nginx -d crm.tencongty.vn
   ```

---

## 🛠️ CÁC LỆNH QUẢN TRỊ NHANH

* **Nạp lại dữ liệu mẫu (Seed Demo Data):**
  ```bash
  docker compose -f docker-compose.prod.yml exec backend python manage.py seed_data --email admin@smecrm.vn --orgs 1 --leads 50 --accounts 20 --contacts 30 --opportunities 15 --tasks 25 --no-input
  ```
* **Xem log thời gian thực:**
  ```bash
  docker compose -f docker-compose.prod.yml logs -f
  ```
* **Khởi động lại:**
  ```bash
  docker compose -f docker-compose.prod.yml restart
  ```

---

## 📄 BẢN QUYỀN & THƯƠNG MẠI HÓA

Được tối ưu hóa và đóng gói bởi **COSS Vietnam (Trustbase)** dựa trên nền tảng BottleCRM / Django-CRM. Phù hợp triển khai trọn gói cho doanh nghiệp SME, công ty dịch vụ, thương mại và agency tại Việt Nam.
