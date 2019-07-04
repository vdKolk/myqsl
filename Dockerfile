FROM mysql:8.0.16

COPY config/my.cnf /etc/mysql/my.cnf

ENV MYSQL_ROOT_PASSWORD=${DB_PASS}

ENTRYPOINT ["docker-entrypoint.sh"]
