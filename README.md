# flutter_todo

A test Flutter project from Andrianov Maxim.

## Getting Started
[Для запуска необходим Docker]
В терминале введите следующие команды:
1. Создаем Docker Image:
### docker build -t flutter-web .
2. Создаем Docker Container:
### docker run -d -p 8080:80 --name flutter-web flutter-web

Чтобы остановить, введите следующую команду в терминал:
### docker stop flutter-web


## About code
lib/main.dart - входная точка приложения.

lib/pages - папка, содержащая в себе страницы приложения.
lib/pages/main_screen.dart - при запуске приложения открывается эта страница, содержащая кнопку для перехода на страницу с биржами,
lib/pages/exchanges.dart - страница с биржами, отсортированными по размеру торгов на 24 часа (в USD).

lib/classes - папка, содержащая в себе классы Exchange, Value, USD.
lib/api - папка, содержащая в себе взаимодействие с API cryptorank.io.
