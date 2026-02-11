# Ubuntu Mirror Switch - Pishgaman 🇮🇷

اسکریپت تغییر میرور سرورهای Ubuntu به میرور داخلی پیشگامان  
مناسب برای سرورهای ایران جهت افزایش سرعت `apt update` و `apt upgrade`

---

## 🚀 اجرا روی سرور

کافیست این دستور را روی سرور Ubuntu اجرا کنید:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/aliabsharii/ubuntu-mirror-switch/main/fix-mirror.sh)"
```

یا با wget:

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/aliabsharii/ubuntu-mirror-switch/main/fix-mirror.sh)"
```

---

## 🔧 عملکرد اسکریپت

- تشخیص خودکار نسخه Ubuntu (noble, jammy, focal و ...)
- گرفتن بکاپ از فایل قبلی
- تغییر میرور به:
  
```
http://ubuntu.pishgaman.net/ubuntu/
```

- اجرای `apt clean`
- اجرای `apt update`

---

## 📦 پشتیبانی شده

- Ubuntu 20.04
- Ubuntu 22.04
- Ubuntu 24.04

---

## ⚠️ نکته

قبل از اجرا، دسترسی root یا sudo داشته باشید.

---

## 👨‍💻 Author

Ali Abshari
