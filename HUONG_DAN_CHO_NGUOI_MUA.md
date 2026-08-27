# 🎁 HƯỚNG DẪN DÀNH CHO KHÁCH HÀNG MUA SME CRM PRO
### COSS VIETNAM / TRUSTBASE EDITION

Cảm ơn Quý công ty đã tin tưởng lựa chọn phần mềm **SME CRM Pro**! Dưới đây là hướng dẫn cài đặt và sử dụng nhanh trong 3 phút.

---

## 🖥️ CÁCH 1: CÀI ĐẶT TRÊN MÁY TÍNH CÔNG TY (WINDOWS)
1. Mở **PowerShell** trên máy tính Windows và dán 1 dòng lệnh:
```powershell
irm https://raw.githubusercontent.com/justpassingByte/Django-CRM/master/install.ps1 | iex
```
2. Hoặc giải nén thư mục và nhấp đúp file **`start-windows.bat`**.
3. Hệ thống sẽ tự động khởi động và mở trang web: **`http://localhost:3000`**.
4. Đăng nhập với tài khoản: `admin@smecrm.vn` / Mật khẩu: `testpass123`.

---

## ☁️ CÁCH 2: CÀI ĐẶT LÊN CLOUD VPS & TÊN MIỀN RIÊNG
1. Mở terminal VPS Ubuntu gõ 1 dòng lệnh:
```bash
curl -fsSL https://raw.githubusercontent.com/justpassingByte/Django-CRM/master/install.sh | bash
```
2. Trỏ tên miền công ty (VD: `crm.tencongty.vn`) về IP VPS và gắn chứng chỉ SSL HTTPS theo mục số 4 trong file `README.md`.

---

## 📞 HỖ TRỢ KỸ THUẬT
Mọi thắc mắc và yêu cầu hỗ trợ kỹ thuật, Quý khách vui lòng liên hệ đội ngũ Trustbase / COSS Vietnam.
