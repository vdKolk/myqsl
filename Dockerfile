FROM mysql:8.0.16
COPY config/my.cnf /etc/mysql/my.cnf
COPY docker-entrypoint.sh /
RUN apt update && \
    apt -y install gettext-base

RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
