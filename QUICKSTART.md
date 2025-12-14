# 🚀 دليل النشر السريع على Render

## الملفات المطلوبة (✅ تم إنشاؤها):

```
✅ render.yaml         - تكوين Render
✅ Procfile            - أمر التشغيل
✅ runtime.txt         - Python 3.11
✅ gunicorn.conf.py    - إعدادات الخادم
✅ requirements.txt    - المكتبات المطلوبة
✅ .env.example        - مثال متغيرات البيئة
✅ setup.sh            - سكريبت الإعداد
```

---

## 🎯 خطوات النشر (5 دقائق):

### 1️⃣ رفع على GitHub
```bash
git init
git add .
git commit -m "Ready for Render deployment"
git branch -M main
git remote add origin YOUR_REPO_URL
git push -u origin main
```

### 2️⃣ إنشاء Web Service
1. [Render Dashboard](https://dashboard.render.com/) → **New +** → **Web Service**
2. اربط GitHub واختر المستودع
3. Render سيكتشف الإعدادات تلقائياً من `render.yaml`

### 3️⃣ إضافة المتغيرات (Environment Variables)

#### BOT_TOKEN
```
الحصول عليه من @BotFather في تيليجرام
/newbot → اتبع التعليمات
```

#### FIREBASE_CREDENTIALS
```json
انسخ محتوى serviceAccountKey.json كاملاً (سطر واحد)
```

#### SECRET_KEY
```bash
# أنشئه باستخدام:
python3 -c "import secrets; print(secrets.token_urlsafe(32))"
```

#### SITE_URL
```
https://اسم-تطبيقك.onrender.com
(أضفه بعد إنشاء التطبيق)
```

### 4️⃣ النشر
- اضغط **Create Web Service**
- انتظر 2-5 دقائق
- جاهز! 🎉

---

## 🔑 الحصول على BOT_TOKEN:

1. افتح [@BotFather](https://t.me/BotFather)
2. أرسل: `/newbot`
3. اختر اسم للبوت (مثل: `My Store Bot`)
4. اختر username (مثل: `my_store_bot`)
5. انسخ التوكن (مثل: `123456:ABC-DEF...`)

---

## 🔥 الحصول على FIREBASE_CREDENTIALS:

### طريقة 1: من Firebase Console
1. [Firebase Console](https://console.firebase.google.com/)
2. اختر مشروعك (أو أنشئ جديد)
3. **Project Settings** (⚙️) → **Service Accounts**
4. **Generate New Private Key** → تنزيل JSON
5. افتح الملف وانسخ محتواه كاملاً

### طريقة 2: تحويل الملف لسطر واحد
```bash
cat serviceAccountKey.json | tr -d '\n\r'
```

---

## 📝 ملاحظات مهمة:

### ⚠️ لا تنس:
1. تحديث `ADMIN_ID` في app.py (السطر 45)
2. إضافة مشرفين في `ADMINS_LIST` (السطر 50-55)
3. تحديث `SITE_URL` بعد الحصول على رابط Render

### 💰 الخطة المجانية:
- ✅ 750 ساعة/شهر مجاناً
- ⚠️ ينام بعد 15 دقيقة خمول
- 🔄 يستيقظ في 30-50 ثانية

### 🛡️ منع النوم:
استخدم [UptimeRobot](https://uptimerobot.com):
- أنشئ Monitor جديد
- نوع: HTTP(s)
- URL: `https://your-app.onrender.com`
- Interval: 5 دقائق

---

## 🧪 اختبار محلي (اختياري):

```bash
# 1. تثبيت المكتبات
pip install -r requirements.txt

# 2. إنشاء .env
cp .env.example .env
# ثم عدّل .env وأضف قيمك

# 3. تشغيل
python3 app.py
```

---

## 🆘 حل المشاكل:

### البوت لا يرد:
```bash
# في Render Dashboard → Logs
# تحقق من:
✓ BOT_TOKEN صحيح
✓ السيرفر حالته "Live"
✓ لا توجد أخطاء في Logs
```

### Firebase Error:
```bash
✓ FIREBASE_CREDENTIALS نسخة JSON صحيحة
✓ لا مسافات أو أسطر جديدة
✓ صلاحيات Service Account مفعّلة
```

### Build Failed:
```bash
✓ requirements.txt موجود
✓ runtime.txt يحتوي على python-3.11.0
✓ لا توجد أخطاء في app.py
```

---

## 📞 الدعم:

**الملفات المرجعية:**
- [DEPLOY.md](DEPLOY.md) - دليل مفصل
- [README_RENDER.md](README_RENDER.md) - توثيق كامل
- [.env.example](.env.example) - مثال المتغيرات

**الموارد:**
- [Render Docs](https://render.com/docs)
- [Telegram Bot API](https://core.telegram.org/bots/api)
- [Firebase Admin](https://firebase.google.com/docs/admin/setup)

---

## ✨ بعد النشر:

1. اختبر البوت: `/start` في تيليجرام
2. تحقق من لوحة التحكم
3. اختبر عملية شراء تجريبية
4. راقب Logs لأول 24 ساعة

**تهانينا! بوتك الآن مباشر على الإنترنت! 🎊**
