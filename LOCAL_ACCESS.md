# 🌐 Frontend & Backend Local Access Guide

## 🚀 Hızlı Başlangıç

### 1️⃣ PostgreSQL'i Başlat (Docker)
```bash
docker-compose up -d postgres
```

### 2️⃣ Backend'i Başlat
```bash
cd backend
source venv/bin/activate  # Windows: venv\Scripts\activate
python manage.py runserver
```

✅ **Backend URL:** http://localhost:8000
✅ **Backend API:** http://localhost:8000/api
✅ **Swagger UI:** http://localhost:8000/swagger/
✅ **Admin Panel:** http://localhost:8000/admin

### 3️⃣ Frontend'i Başlat
```bash
cd frontend
npm run dev
```

✅ **Frontend URL:** http://localhost:3000
✅ **Login Sayfası:** http://localhost:3000/login

---

## 🔗 Erişim URL'leri

### Backend
- **API Base URL:** `http://localhost:8000/api`
- **Swagger Documentation:** `http://localhost:8000/swagger/`
- **Django Admin:** `http://localhost:8000/admin`
- **Health Check:** `http://localhost:8000/api/health/`

### Frontend
- **Ana Sayfa:** `http://localhost:3000`
- **Login:** `http://localhost:3000/login`
- **Student Dashboard:** `http://localhost:3000/student`
- **Teacher Dashboard:** `http://localhost:3000/teacher`
- **Institution Dashboard:** `http://localhost:3000/institution`
- **Super Admin Dashboard:** `http://localhost:3000/super-admin`

---

## ⚙️ Environment Variables

### Frontend (.env.local)
Frontend klasöründe `.env.local` dosyası oluşturun:
```bash
NEXT_PUBLIC_API_URL=http://localhost:8000/api
```

### Backend (.env)
Backend klasöründe `.env` dosyası (opsiyonel, development için):
```bash
DJANGO_DEBUG=True
POSTGRES_HOST=localhost
POSTGRES_DB=acurate_db
POSTGRES_USER=acurate_user
POSTGRES_PASSWORD=acurate_pass_2024
```

---

## 🔐 Demo Kullanıcılar

### Student
```
URL: http://localhost:3000/login
Username: beyza2
Password: beyza123
```

### Teacher
```
URL: http://localhost:3000/login
Username: ahmet.bulut
Password: ahmet123
```

### Institution Admin
```
URL: http://localhost:3000/login
Username: institution
Password: institution123
```

### Django Admin
```
URL: http://localhost:8000/admin
Username: admin
Password: admin123
```

---

## 🧪 Test Etme

### Backend API Test
```bash
# Health check
curl http://localhost:8000/api/health/

# Login test
curl -X POST http://localhost:8000/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{"username":"beyza2","password":"beyza123"}'
```

### Frontend Test
1. Tarayıcıda `http://localhost:3000` adresine git
2. Login sayfasında demo kullanıcılardan biriyle giriş yap
3. Dashboard'ları kontrol et

---

## 🔍 Kontrol Komutları

### PostgreSQL Durumu
```bash
docker-compose ps
```

### Backend Durumu
```bash
curl http://localhost:8000/api/health/
```

### Frontend Durumu
Tarayıcıda `http://localhost:3000` adresini aç

---

## 🐛 Sorun Giderme

### Backend çalışmıyor
- PostgreSQL container'ının çalıştığından emin ol: `docker-compose ps`
- Virtual environment aktif mi kontrol et: `source venv/bin/activate`
- Port 8000 kullanımda mı kontrol et

### Frontend çalışmıyor
- Node modules yüklü mü: `npm install`
- Port 3000 kullanımda mı kontrol et
- `.env.local` dosyası var mı ve doğru mu kontrol et

### CORS Hatası
- Backend'in çalıştığından emin ol
- Backend `settings.py`'da `CORS_ALLOWED_ORIGINS` listesinde `http://localhost:3000` olmalı

### API Connection Error
- Backend'in `http://localhost:8000` adresinde çalıştığından emin ol
- Frontend `.env.local` dosyasında `NEXT_PUBLIC_API_URL=http://localhost:8000/api` olduğundan emin ol
- Browser console'da network errors kontrol et

---

## 📝 Notlar

- Backend varsayılan olarak `localhost:8000` portunda çalışır
- Frontend varsayılan olarak `localhost:3000` portunda çalışır
- API base URL: `http://localhost:8000/api`
- JWT token authentication kullanılır
- Token'lar localStorage'da saklanır

