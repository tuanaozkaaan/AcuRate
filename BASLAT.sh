#!/bin/bash

# AcuRate - Servisleri Başlatma Scripti

echo "🚀 AcuRate Servisleri Başlatılıyor..."
echo ""

# Renkler
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# PostgreSQL kontrolü
echo "📦 PostgreSQL kontrol ediliyor..."
if command -v docker &> /dev/null; then
    if docker compose ps | grep -q postgres; then
        echo -e "${GREEN}✅ PostgreSQL çalışıyor${NC}"
    else
        echo -e "${YELLOW}⚠️  PostgreSQL başlatılıyor...${NC}"
        docker compose up -d postgres
        sleep 3
    fi
else
    echo -e "${RED}❌ Docker bulunamadı! Lütfen Docker Desktop'ı yükleyin.${NC}"
    exit 1
fi

# Backend kontrolü
echo ""
echo "🐍 Backend hazırlanıyor..."

cd backend

# venv kontrolü
if [ ! -d "venv" ]; then
    echo -e "${YELLOW}⚠️  Virtual environment oluşturuluyor...${NC}"
    python3 -m venv venv
fi

# venv aktif et
source venv/bin/activate

# Dependencies kontrolü
if [ ! -f "venv/.installed" ]; then
    echo -e "${YELLOW}⚠️  Dependencies yükleniyor... (bu birkaç dakika sürebilir)${NC}"
    pip install --upgrade pip
    pip install -r requirements.txt
    touch venv/.installed
fi

# Migration kontrolü
echo -e "${YELLOW}⚠️  Migration'lar kontrol ediliyor...${NC}"
python manage.py migrate --check || python manage.py migrate

echo -e "${GREEN}✅ Backend hazır!${NC}"
echo -e "${GREEN}   Terminal 1'de şu komutu çalıştırın:${NC}"
echo ""
echo "   cd backend"
echo "   source venv/bin/activate"
echo "   python manage.py runserver"
echo ""

# Frontend kontrolü
echo ""
echo "⚛️  Frontend hazırlanıyor..."

cd ../frontend

# node_modules kontrolü
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}⚠️  Node modules yükleniyor... (bu birkaç dakika sürebilir)${NC}"
    npm install
fi

# .env.local kontrolü
if [ ! -f ".env.local" ]; then
    echo -e "${YELLOW}⚠️  .env.local dosyası oluşturuluyor...${NC}"
    echo "NEXT_PUBLIC_API_URL=http://localhost:8000/api" > .env.local
fi

echo -e "${GREEN}✅ Frontend hazır!${NC}"
echo -e "${GREEN}   Terminal 2'de şu komutu çalıştırın:${NC}"
echo ""
echo "   cd frontend"
echo "   npm run dev"
echo ""

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ Hazırlık tamamlandı!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Şimdi yapılacaklar:"
echo ""
echo "1. Terminal 1'de Backend'i başlatın (yukarıdaki komutları)"
echo "2. Terminal 2'de Frontend'i başlatın (yukarıdaki komutları)"
echo ""
echo "🔗 Erişim URL'leri:"
echo "   Frontend: http://localhost:3000"
echo "   Backend:  http://localhost:8000"
echo ""

