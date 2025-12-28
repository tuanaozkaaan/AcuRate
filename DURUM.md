# ✅ Servis Durumu

## 🟢 Backend
- **Durum:** ✅ ÇALIŞIYOR
- **URL:** http://localhost:8000
- **API:** http://localhost:8000/api
- **Health Check:** http://localhost:8000/api/health/
- **Swagger:** http://localhost:8000/swagger/
- **Admin Panel:** http://localhost:8000/admin

## 🟡 Frontend
- **Durum:** ⏳ Başlatılıyor...
- **URL:** http://localhost:3000
- **Login:** http://localhost:3000/login

---

## 📋 Servisleri Kontrol Etme

### Backend Çalışıyor mu?
```bash
curl http://localhost:8000/api/health/
```
Cevap: `{"status":"healthy"...}` → ✅ Çalışıyor

### Frontend Çalışıyor mu?
Tarayıcıda açın: http://localhost:3000

### Process'leri Kontrol Et
```bash
# Backend
lsof -ti:8000

# Frontend  
lsof -ti:3000
```

---

## 🔧 Servisleri Durdurma

### Backend'i Durdur
```bash
kill $(cat /tmp/backend.pid 2>/dev/null) || pkill -f "manage.py runserver"
```

### Frontend'i Durdur
```bash
kill $(cat /tmp/frontend.pid 2>/dev/null) || pkill -f "next dev"
```

---

## 🚀 Servisleri Yeniden Başlatma

### Backend
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/backend
source venv/bin/activate
python manage.py runserver
```

### Frontend
```bash
cd /Users/oguzhanozkan/AcuRate-3/AcuRate-8/frontend
npm run dev
```

---

## 🔐 Demo Kullanıcılar

- **Student:** beyza2 / beyza123
- **Teacher:** ahmet.bulut / ahmet123
- **Institution:** institution / institution123

