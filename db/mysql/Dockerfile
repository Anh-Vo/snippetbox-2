FROM mysql:5.7

COPY db/mysql/scripts/sql/ /docker-entrypoint-initdb.d

ENV MYSQL_ROOT_PASSWORD pass
ENV SQL_USER root
ENV SQL_USER_PASSWORD $MYSQL_ROOT_PASSWORD

EXPOSE 3306
