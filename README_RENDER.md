# دليل نشر التطبيق على Render

## الخطوات المطلوبة:

### 1. إعداد الملفات المطلوبة ✅
تم إنشاء جميع الملفات اللازمة:
- `render.yaml` - ملف تكوين Render
- `Procfile` - أوامر تشغيل التطبيق
- `runtime.txt` - إصدار Python
- `.env.example` - مثال على متغيرات البيئة

### 2. رفع المشروع على GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin your-github-repo-url
git push -u origin main
```

### 3. إنشاء حساب على Render
- اذهب إلى: https://render.com
- سجل حساب جديد (يفضل استخدام GitHub)

### 4. إنشاء Web Service جديد
1. اضغط على "New +" → "Web Service"
2. اربط حساب GitHub الخاص بك
3. اختر المستودع (Repository)
4. اختر Branch (عادة `main`)

### 5. تكوين الإعدادات
- **Name**: اختر اسم للتطبيق
- **Region**: اختر أقرب منطقة لك
- **Branch**: main
- **Runtime**: Python 3
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `gunicorn app:app --bind 0.0.0.0:$PORT`

### 6. إضافة متغيرات البيئة (Environment Variables)

اضغط على "Environment" وأضف المتغيرات التالية:

#### BOT_TOKEN
```
توكن البوت من @BotFather في تيليجرام
```

#### SITE_URL
```
https://اسم-تطبيقك.onrender.com
```
(انتظر حتى يتم إنشاء التطبيق أولاً، ثم عد وأضف الرابط)

#### FIREBASE_CREDENTIALS
```json
{
  "type": "service_account",
  "project_id": "your-project-id",
  "private_key_id": "...",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "...",
  "client_id": "...",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "..."
}
```
(انسخ محتوى ملف serviceAccountKey.json بالكامل في سطر واحد)

#### SECRET_KEY
```
نص عشوائي طويل مثل: dj3n4k5j6h7g8f9d0s1a2q3w4e5r6t7y8u9i0o
```

### 7. تشغيل التطبيق
- اضغط على "Create Web Service"
- انتظر حتى يتم بناء التطبيق (Build)
- سيتم تخصيص رابط لك مثل: `https://app-name.onrender.com`

### 8. ربط البوت بـ Webhook (اختياري)
إذا كنت تريد استخدام webhook بدلاً من polling:

```python
# في app.py، أضف:
@app.route(f'/{TOKEN}', methods=['POST'])
def webhook():
    json_str = request.get_data().decode('UTF-8')
    update = telebot.types.Update.de_json(json_str)
    bot.process_new_updates([update])
    return '', 200

# بعد app.run، أضف:
bot.remove_webhook()
bot.set_webhook(url=f"{SITE_URL}/{TOKEN}")
```

## ملاحظات مهمة:

### الخطة المجانية على Render:
- ✅ 750 ساعة مجانية شهرياً
- ⚠️ التطبيق ينام بعد 15 دقيقة من عدم النشاط
- ⚠️ يستغرق 30-50 ثانية للاستيقاظ من السكون
- ✅ SSL مجاني (HTTPS)
- ✅ نطاق فرعي مجاني (.onrender.com)

### لمنع التطبيق من النوم:
استخدم خدمة مجانية مثل UptimeRobot لإرسال ping كل 5 دقائق:
```
https://uptimerobot.com
```

### إدارة Admin ID:
في ملف [app.py](app.py#L45):
```python
ADMIN_ID = 5665438577  # غيّر هذا إلى آيدي تيليجرام الخاص بك
```

### قائمة المشرفين:
في ملف [app.py](app.py#L50-L55):
```python
ADMINS_LIST = [
    5665438577,  # المشرف 1
    # أضف المزيد
]
```

## استكشاف الأخطاء:

### إذا لم يعمل البوت:
1. تحقق من Logs في Render
2. تأكد من صحة BOT_TOKEN
3. تأكد من صحة FIREBASE_CREDENTIALS
4. تحقق من أن PORT = 10000

### إذا كانت Firebase لا تعمل:
- تأكد من أن FIREBASE_CREDENTIALS نسخة JSON صحيحة
- تأكد من عدم وجود مسافات أو أسطر جديدة غير ضرورية
- تحقق من صلاحيات Service Account في Firebase Console

## دعم:
إذا واجهت أي مشاكل، تحقق من:
- [Render Documentation](https://render.com/docs)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Gunicorn Documentation](https://docs.gunicorn.org/)
