# 🚀 Servisleri Başlatma Rehberi

## ⚠️ Durum: Servisler Çalışmıyor

### Adım 1: PostgreSQL'i Başlat (Docker)

```bash
# Docker Desktop'ı açın (eğer kapalıysa)
# Terminal'de:
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8
docker compose up -d postgres

# VEYA (docker-compose kullanıyorsanız):
docker-compose up -d postgres

# Durumu kontrol edin:
docker compose ps
```

### Adım 2: Backend'i Başlat

**Terminal 1'de:**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/backend

# Virtual environment'ı aktif et
source venv/bin/activate

# Eğer venv yoksa oluştur:
# python -m venv venv
# source venv/bin/activate
# pip install -r requirements.txt

# Backend'i başlat
python manage.py runserver
```

✅ **Backend:** http://localhost:8000 adresinde çalışacak

### Adım 3: Frontend'i Başlat

**Terminal 2'de (yeni terminal açın):**
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/frontend

# Dependencies yükle (eğer node_modules yoksa):
npm install

# Frontend'i başlat
npm run dev
```

✅ **Frontend:** http://localhost:3000 adresinde çalışacak

---

## ✅ Kontrol Listesi

### Backend Kontrolü
- [ ] PostgreSQL Docker container çalışıyor mu?
- [ ] Backend virtual environment aktif mi?
- [ ] `python manage.py runserver` çalıştırıldı mı?
- [ ] http://localhost:8000/api/health/ erişilebilir mi?

### Frontend Kontrolü
- [ ] `.env.local` dosyası var mı? (✅ Oluşturuldu)
- [ ] `node_modules` klasörü var mı?
- [ ] `npm run dev` çalıştırıldı mı?
- [ ] http://localhost:3000 erişilebilir mi?

---

## 🔧 Sorun Giderme

### Backend başlamıyor
1. Virtual environment aktif mi kontrol et:
   ```bash
   which python  # venv/bin/python göstermeli
   ```

2. PostgreSQL çalışıyor mu kontrol et:
   ```bash
   docker compose ps
   ```

3. Migration'ları çalıştır:
   ```bash
   cd backend
   source venv/bin/activate
   python manage.py migrate
   ```

### Frontend başlamıyor
1. Node modules yüklü mü kontrol et:
   ```bash
   cd frontend
   ls node_modules  # Klasör görünmeli
   ```

2. .env.local dosyası var mı kontrol et:
   ```bash
   cat frontend/.env.local
   # NEXT_PUBLIC_API_URL=http://localhost:8000/api olmalı
   ```

3. Port 3000 kullanımda mı kontrol et:
   ```bash
   lsof -ti:3000
   # Eğer bir process gösterirse, onu durdurun veya farklı port kullanın
   ```

---

## 🎯 Hızlı Başlatma (Tüm Servisler)

### Terminal 1 - PostgreSQL & Backend
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8

# PostgreSQL
docker compose up -d postgres

# Backend
cd backend
source venv/bin/activate
python manage.py runserver
```

### Terminal 2 - Frontend
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/frontend
npm run dev
```

---

## 🔗 Erişim URL'leri

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8000/api
- **Swagger:** http://localhost:8000/swagger/
- **Admin Panel:** http://localhost:8000/admin

