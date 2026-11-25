# Демо: .ipa без своего Мака

Минимальный SwiftUI-проект, который целиком описан текстом и собирается на macOS-раннере GitHub.

## Как это устроено

| Файл | Роль |
|---|---|
| `project.yml` | Спека XcodeGen. Из неё на раннере генерируется `DemoApp.xcodeproj` — руками `.pbxproj` никто не пишет. |
| `Sources/DemoApp.swift` | Точка входа SwiftUI. |
| `Sources/ContentView.swift` | Экран-заглушка (счётчик + версия iOS). |
| `.github/workflows/ios-demo-ipa.yml` | Установка XcodeGen → `xcodegen generate` → `xcodebuild archive` без подписи → `Payload/` → `.ipa`. |

## Запуск

1. Создать пустой репозиторий на GitHub и запушить содержимое `fork` (папка `demo-ios` + `.github`).
2. Открыть `Actions` → `iOS demo unsigned IPA`. Сборка стартует сама на push, либо жми `Run workflow`.
3. Через ~2–4 минуты скачать артефакт `demo-unsigned-ipa`, внутри `app-unsigned.ipa`.

### Если git не установлен

`git` в PATH на этой машине нет, так что либо поставь [Git](https://git-scm.com/download/win) /
[GitHub Desktop](https://desktop.github.com/), либо залей файлы через веб:

- обычные файлы (`demo-ios/**`) — `Add file → Upload files`, перетащить папку;
- workflow — `Add file → Create new file`, в поле имени вписать
  `.github/workflows/ios-demo-ipa.yml` и вставить содержимое.

Папку `.github` через drag&drop залить нельзя — она скрытая, только через создание файла.

## Что проверить после сборки

- В логе шага *Package Payload into .ipa* печатается `CFBundleIdentifier`, версия и `lipo -info` (должно быть `arm64`).
- Размер `.ipa` — около 1 МБ.

## Установка на iPhone

Через Sideloadly на Windows: перетащить `.ipa`, ввести Apple ID, затем на телефоне
`Настройки → Основные → VPN и управление устройством → Доверять`. Подпись бесплатным
аккаунтом живёт 7 дней.

## Ограничения демо

- Приложение пустое: это проверка пайплайна, а не порт AyuGram.
- Никаких entitlements (App Groups, Push, Network Extension) — они бесплатной подписью не выдаются.
- Для приватного репозитория macOS-минуты расходуются с коэффициентом ×10 от общего лимита.
