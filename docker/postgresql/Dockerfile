FROM postgres:10.5

USER root

COPY ./ddl/ /docker-entrypoint-initdb.d/
COPY ./entrypoint.sh /docker-entrypoint-initdb.d/
RUN chmod 775 /docker-entrypoint-initdb.d/entrypoint.sh

WORKDIR /var/www/app

EXPOSE 5432

CMD /docker-entrypoint-initdb.d/entrypoint.sh

