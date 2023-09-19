# Мобильное приложение контролёра и партнёра ЕКЖ Мурманской области

## Реализованный функционал
* авторизация партнёра:
    + по логину и паролю
    + с помощью служебной карты через NFC и PIN-коду
* проверка наличия и размера скидки клиента
    + по QR-кодy карты ЕКЖ
    + с помощью считывания чипа карты ЕКЖ средствами NFC
* просмотр действующих скидок по карте ЕКЖ данного партнёра с фильтрацией и поиском
    <details> 
        <summary>Подробнее</summary>
            <img src="assets\screenshort\part_readme.gif" height=500 width=200>
        </details>


## Сборка приложения
Перед началось запуска/сборки проекта запустите команду:
```
dart run build_runner build --delete-conflicting-outputs
```

Для создание APK-файла запустите следующую команду:
```
flutter build apk 
```
Эта команда создаст один APK-файл для всех ABI, что делает его большим по объёму.

Чтобы создать отдельные APK-файлы, запустите команду:
```
flutter build apk --split-per-abi
```
Эта команда создаст 3 файла:
* app-armeabi-v7a-release.apk
* app-arm64-v8a-release.apk
* app-x86_64-release.apk

## Приложение
##### PIN-код для входа по служебной карте 
```
2121
```
[Ссылка на демонстрацию работы](https://drive.google.com/file/d/1PjJpdnyfpePBJ9mzpnK_zMeX6EefZuaV/view?usp=sharing)

[Ссылка на APK](https://github.com/sigma-hacks/mobile-partner/releases/tag/v1)



## Разработчики
Пелагейчева Мария | mobile | [Телеграм](https://t.me/MariyaViktorovna)
Сазонов Артем | mobile | [Телеграм](https://t.me/Drygan) [LinkedIn](https://www.linkedin.com/in/sazonov-artem/)
Станислав Стрижков | backend | [Телеграм](https://t.me/ctaciv)
Даурен Камбаров | frontend | [Телеграм](https://t.me/daurensky)
Сархан Ибрагимов | backend | [Телеграм](https://t.me/Sarkhan080)