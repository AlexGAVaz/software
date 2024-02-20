FROM openjdk:11-jdk

# Установите переменные окружения для версии JIRA
ENV JIRA_VERSION 8.13.0
ENV JIRA_HOME /var/atlassian/jira
ENV JIRA_INSTALL_DIR /opt/atlassian/jira

# Скачайте и установите JIRA
RUN mkdir -p ${JIRA_INSTALL_DIR} \
    && curl -Ls "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-${JIRA_VERSION}.tar.gz" \
    | tar -xz --directory "${JIRA_INSTALL_DIR}" --strip-components=1 --no-same-owner

# Настройте домашний каталог JIRA
RUN mkdir -p ${JIRA_HOME}
VOLUME ["${JIRA_HOME}"]

# Откройте порт 8080
EXPOSE 8080

# Запустите JIRA
WORKDIR $JIRA_INSTALL_DIR
CMD ["./bin/start-jira.sh", "-fg"]
