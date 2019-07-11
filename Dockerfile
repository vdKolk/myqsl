FROM mysql:8.0.16
COPY config/my.cnf /etc/mysql/my.cnf
COPY dbBatch.sh /
RUN ["chmod", "+x", "/dbBatch.sh"]

COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
