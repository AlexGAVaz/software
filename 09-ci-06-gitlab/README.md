# Домашнее задание к занятию 12 «GitLab»

## Подготовка к выполнению

1. Подготовьте к работе Managed GitLab от yandex cloud [по инструкции](https://cloud.yandex.ru/docs/managed-gitlab/operations/instance/instance-create).

   ![alt text](./screenshots/Managed_Service_for_GitLab.png)

2. Создайте виртуальную машину и установите на нее gitlab runner, подключите к вашему серверу gitlab [по инструкции](https://docs.gitlab.com/runner/install/linux-repository.html).

   ![alt text](./screenshots/runner.png)

   ![alt text](./screenshots/runner_gitlab.png)

3. Создайте свой новый проект.

4. Создайте новый репозиторий в GitLab, наполните его [файлами](./repository).

   ![alt text](./screenshots/screenshots_1.png)

5. Проект должен быть публичным, остальные настройки по желанию.

## Основная часть

### DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

1. Образ собирается на основе [centos:7](https://hub.docker.com/_/centos?tab=tags&page=1&ordering=last_updated).

2. Python версии не ниже 3.7.

   ![alt text](./screenshots/Dockerfile.png)

3. Установлены зависимости: `flask` `flask-jsonpify` `flask-restful`.

   ![alt text](./screenshots/requirements.txt.png)

4. Создана директория `/python_api`.

5. Скрипт из репозитория размещён в /python_api.

   ![alt text](./screenshots/project.png)

6. Точка вызова: запуск скрипта.

7. При комите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.

   ![alt text](./screenshots/screenshots_2.png)

   ![alt text](./screenshots/screenshots_3.png)

   ![alt text](./screenshots/screenshots_4.png)

   ![alt text](./screenshots/screenshots_5.png)

### Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET `/rest/api/get_info`, необходимо создать Issue в котором указать:

1. Какой метод необходимо исправить.

2. Текст с `{ "message": "Already started" }` на `{ "message": "Running"}`.

3. Issue поставить label: feature.

   ![alt text](./screenshots/screenshots_6.png)

### Developer

Пришёл новый Issue на доработку, вам нужно:

1. Создать отдельную ветку, связанную с этим Issue.

2. Внести изменения по тексту из задания.

3. Подготовить Merge Request, влить необходимые изменения в `master`, проверить, что сборка прошла успешно.

   ![alt text](./screenshots/screenshots_7.png)

   ![alt text](./screenshots/screenshots_8.png)

   ![alt text](./screenshots/screenshots_9.png)

### Tester

Разработчики выполнили новый Issue, необходимо проверить валидность изменений:

1. Поднять докер-контейнер с образом `python-api:latest` и проверить возврат метода на корректность.

2. Закрыть Issue с комментарием об успешности прохождения, указав желаемый результат и фактически достигнутый.

   ![alt text](./screenshots/screenshots_10.png)

   ![alt text](./screenshots/screenshots_11.png)

## Итог

В качестве ответа пришлите подробные скриншоты по каждому пункту задания:

- файл gitlab-ci.yml;
  [файлами](./SRC/netology/gitlab-ci.yml)

- Dockerfile;
  [файлами](./SRC/netology/Dockerfile)

- лог успешного выполнения пайплайна;
  [файлами](./logs/pipelines.log)

- решённый Issue.
  [файлами](./logs/gavazin-netology_issues_2024-04-21.csv)

### Важно

После выполнения задания выключите и удалите все задействованные ресурсы в Yandex Cloud.
