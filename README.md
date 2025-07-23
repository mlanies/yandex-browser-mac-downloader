# Yandex Browser Mac Downloader

<img src="assets/pic.png" alt="Скриншот приложения" style="width: 50%;" />


Нативный сборщик-помощник для партнёров Яндекс.Браузера на платформе macOS, позволяющий пользователям легко выбрать и скачать нужную версию браузера с учётом архитектуры Mac (ARM/M1/M2/M3 или Intel).

Приложение официально поддерживает партнёрские ссылки Яндекса и предназначено для удобного распространения браузера среди вашей аудитории или корпоративных клиентов.

---

## Ключевые возможности

- Простое окно выбора архитектуры: ARM (Apple Silicon) или Intel.
- Автоматический переход на официальные партнёрские ссылки Яндекса.
- Компактный и удобный формат распространения (.dmg).

---

## Доступные варианты

### 1. Стандартная версия Яндекс.Браузера

Оптимальное решение для индивидуальных пользователей с поддержкой партнёрской ссылки для отслеживания скачиваний и установок.

- [Скачать браузер](https://browser.yandex.ru/download?partner_id=831050&banerid=1312898233)  
  (`partner_id=831050` — ваш партнёрский идентификатор)

### 2. Корпоративная версия Яндекс.Браузера

Специальное решение для организаций с возможностью самостоятельной конфигурации установщика и интеграции с корпоративными средами.

- [Создать корпоративную сборку](https://browser.yandex.ru/corp/builds?refid=5931838)  
  (`refid=5931838` — ваш партнёрский код)

![Скриншот корпоративной сборки](assets/corp.png)

---

## Получение партнёрских ссылок

1. Авторизуйтесь в личном кабинете [Яндекс.Дистрибуции](https://distribution.yandex.ru/v2/cpa/offers)
2. Выберите нужное предложение и нажмите **"Скопировать партнёрскую ссылку"**

![Скриншот личного кабинета](assets/lk.png)

---

## Сборка и использование

Для сборки требуется Swift и macOS 10.13+.

### Сборка проекта

```sh
git clone https://github.com/yourname/yandex-browser-mac-downloader.git
cd yandex-browser-mac-downloader/YandexBrowserInstallerApp
swift build -c release
````

### Создание .app и .dmg

```sh
mkdir -p ../dist/YandexBrowserInstaller.app/Contents/MacOS
cp .build/release/YandexBrowserInstaller ../dist/YandexBrowserInstaller.app/Contents/MacOS/
# Добавьте Info.plist, если нужно

cd ..
hdiutil create -volname "YandexBrowserInstall" -srcfolder dist/YandexBrowserInstaller.app -ov -format UDZO dist/YandexBrowserInstall.dmg
```

### Использование

1. Откройте `.dmg`
2. Запустите `YandexBrowserInstaller.app`
3. Выберите нужную архитектуру — откроется нужная партнёрская ссылка

---

## Лицензия

MIT License
