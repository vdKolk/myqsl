FROM mysql:8.0.16
COPY config/my.cnf /etc/mysql/my.cnf
ENTRYPOINT ["docker-entrypoint.sh"]
