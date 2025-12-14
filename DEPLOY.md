# نشر تطبيق تيليجرام بوت على Render

## الملفات المُنشأة:

### ✅ ملفات التكوين:
1. **render.yaml** - تكوين تلقائي لـ Render
2. **Procfile** - أمر تشغيل التطبيق
3. **runtime.txt** - إصدار Python (3.11)
4. **gunicorn.conf.py** - تكوين خادم Gunicorn
5. **.env.example** - مثال على متغيرات البيئة
6. **setup.sh** - سكريبت فحص الإعداد
7. **README_RENDER.md** - دليل النشر الكامل

---

## 🚀 خطوات النشر السريع:

### 1. رفع الكود على GitHub:
```bash
cd bothhhhhhhhhhhhh-main
git init
git add .
git commit -m "Initial commit - Ready for Render"
git branch -M main
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

### 2. إنشاء Web Service على Render:
1. اذهب إلى [Render Dashboard](https://dashboard.render.com/)
2. اضغط **New +** → **Web Service**
3. اربط GitHub واختر المستودع
4. Render سيكتشف `render.yaml` تلقائياً

### 3. تكوين متغيرات البيئة في Render:

انتقل إلى **Environment** وأضف:

| المتغير | القيمة | ملاحظة |
|---------|--------|---------|
| `BOT_TOKEN` | توكن من @BotFather | إلزامي |
| `SITE_URL` | `https://YOUR-APP.onrender.com` | سيتوفر بعد الإنشاء |
| `FIREBASE_CREDENTIALS` | JSON كامل | محتوى serviceAccountKey.json |
| `SECRET_KEY` | نص عشوائي طويل | لأمان الجلسات |

### 4. نشر التطبيق:
- اضغط **Create Web Service**
- انتظر 2-5 دقائق للبناء
- ستحصل على رابط مثل: `https://your-app.onrender.com`

---

## 🔧 تفاصيل المتغيرات:

### BOT_TOKEN
احصل عليه من [@BotFather](https://t.me/BotFather):
```
/newbot
اسم البوت
اسم_مستخدم_البوت
```

### FIREBASE_CREDENTIALS
انسخ محتوى `serviceAccountKey.json` كاملاً في سطر واحد:
```json
{"type":"service_account","project_id":"xxx",...}
```

### SECRET_KEY
أنشئ مفتاح عشوائي:
```bash
python3 -c "import secrets; print(secrets.token_urlsafe(32))"
```

---

## 📊 الأوامر المتاحة:

### تشغيل محلي:
```bash
# فحص الإعداد
bash setup.sh

# تشغيل مباشر
python3 app.py

# تشغيل بـ Gunicorn
gunicorn app:app
```

### تحديث على Render:
```bash
git add .
git commit -m "Update"
git push
```
(سيتم النشر تلقائياً)

---

## ⚙️ إعدادات التطبيق:

### Admin ID
في [app.py](app.py#L45):
```python
ADMIN_ID = 5665438577  # غيّره لآيدي الخاص بك
```

### قائمة المشرفين
في [app.py](app.py#L50-L55):
```python
ADMINS_LIST = [
    5665438577,  # المشرف الرئيسي
    # أضف المزيد (حتى 10)
]
```

---

## 🔍 استكشاف الأخطاء:

### البوت لا يستجيب:
- تحقق من **Logs** في Render Dashboard
- تأكد من صحة `BOT_TOKEN`
- تحقق من حالة السيرفر (يجب أن يكون "Live")

### Firebase لا يعمل:
- تأكد من `FIREBASE_CREDENTIALS` نسخة صحيحة
- تحقق من صلاحيات Service Account في Firebase Console
- تأكد من عدم وجود أسطر جديدة في JSON

### التطبيق ينام:
الخطة المجانية تُسكّن التطبيق بعد 15 دقيقة.
الحل: استخدم [UptimeRobot](https://uptimerobot.com) لإرسال ping كل 5 دقائق.

---

## 📚 موارد مفيدة:

- [Render Docs](https://render.com/docs)
- [Flask Docs](https://flask.palletsprojects.com/)
- [pyTelegramBotAPI](https://github.com/eternnoir/pyTelegramBotAPI)
- [Firebase Admin SDK](https://firebase.google.com/docs/admin/setup)

---

## ✅ قائمة التحقق النهائية:

- [ ] رفع الكود على GitHub
- [ ] إنشاء Web Service على Render
- [ ] إضافة BOT_TOKEN
- [ ] إضافة FIREBASE_CREDENTIALS
- [ ] إضافة SECRET_KEY
- [ ] تحديث SITE_URL بعد الإنشاء
- [ ] تحديث ADMIN_ID في app.py
- [ ] اختبار البوت على تيليجرام

---

## 💡 نصيحة:
احتفظ بنسخة من:
- `BOT_TOKEN`
- `serviceAccountKey.json`
- `SECRET_KEY`

في مكان آمن (password manager).

**لا ترفع هذه الملفات على GitHub!**
