#!/bin/bash

echo "🚀 بدء التحقق من الإعداد..."

# التحقق من Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python غير مثبت"
    exit 1
fi
echo "✅ Python مثبت"

# التحقق من pip
if ! command -v pip &> /dev/null; then
    echo "❌ pip غير مثبت"
    exit 1
fi
echo "✅ pip مثبت"

# تثبيت المتطلبات
echo "📦 تثبيت المكتبات..."
pip install -r requirements.txt

# التحقق من متغيرات البيئة
if [ ! -f .env ]; then
    echo "⚠️  ملف .env غير موجود"
    echo "📝 انسخ .env.example إلى .env وأضف قيمك"
    cp .env.example .env
    echo "✅ تم إنشاء .env - الرجاء تحديث القيم"
    exit 1
fi

echo "✅ ملف .env موجود"

# التحقق من Firebase
if [ ! -f serviceAccountKey.json ]; then
    echo "⚠️  ملف serviceAccountKey.json غير موجود"
    echo "📝 ضع ملف Firebase Service Account في المجلد الحالي"
    exit 1
fi

echo "✅ ملف Firebase موجود"

echo ""
echo "🎉 الإعداد كامل! يمكنك الآن:"
echo "   1. للتشغيل المحلي: python3 app.py"
echo "   2. للتشغيل بـ Gunicorn: gunicorn app:app"
echo ""
