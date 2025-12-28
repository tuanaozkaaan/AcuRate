# 🚀 Nasıl Başlatılır?

## ⚡ Hızlı Başlatma (3 Adım)

### 1️⃣ PostgreSQL'i Başlat

**Terminal'de:**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8
docker compose up -d postgres
```

✅ PostgreSQL çalışıyor olmalı

---

### 2️⃣ Backend'i Başlat

**Yeni Terminal açın (Terminal 1):**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/backend
source venv/bin/activate
python manage.py runserver
```

✅ Backend: http://localhost:8000 adresinde çalışacak

**İlk kez çalıştırıyorsanız:**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/backend
source venv/bin/activate

# Dependencies yükle (sadece ilk kez)
pip install -r requirements.txt

# Migration'ları çalıştır (sadece ilk kez)
python manage.py migrate

# Backend'i başlat
python manage.py runserver
```

---

### 3️⃣ Frontend'i Başlat

**Yeni Terminal açın (Terminal 2):**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/frontend
npm run dev
```

✅ Frontend: http://localhost:3000 adresinde çalışacak

**İlk kez çalıştırıyorsanız:**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/frontend

# Dependencies yükle (sadece ilk kez)
npm install

# Frontend'i başlat
npm run dev
```

---

## 📱 Tarayıcıda Aç

1. **Frontend:** http://localhost:3000
2. **Login Sayfası:** http://localhost:3000/login
3. **Backend API:** http://localhost:8000/api
4. **Admin Panel:** http://localhost:8000/admin

---

## ✅ Kontrol Et

### Backend Çalışıyor mu?
Tarayıcıda açın: http://localhost:8000/api/health/

Başarılı ise: `{"status":"ok"}` göreceksiniz

### Frontend Çalışıyor mu?
Tarayıcıda açın: http://localhost:3000

Login sayfası görünmeli

---

## 🐛 Sorun mu var?

### "Port 8000 already in use" hatası
```bash
# Port'u kullanan process'i bul ve durdur
lsof -ti:8000 | xargs kill -9
```

### "Port 3000 already in use" hatası
```bash
# Port'u kullanan process'i bul ve durdur
lsof -ti:3000 | xargs kill -9
```

### "Docker not found" hatası
- Docker Desktop'ı yükleyin ve başlatın
- https://www.docker.com/products/docker-desktop/

### "Module not found" hatası (Backend)
```bash
cd backend
source venv/bin/activate
pip install -r requirements.txt
```

### "Module not found" hatası (Frontend)
```bash
cd frontend
npm install
```

---

## 🎯 Özet

**3 Terminal Açın:**

1. **Terminal 1:** `docker compose up -d postgres` (PostgreSQL)
2. **Terminal 2:** `cd backend && source venv/bin/activate && python manage.py runserver` (Backend)
3. **Terminal 3:** `cd frontend && npm run dev` (Frontend)

**Tarayıcıda:** http://localhost:3000/login

✅ **Hepsi bu kadar!**

