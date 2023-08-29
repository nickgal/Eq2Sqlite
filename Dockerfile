FROM python:3-bookworm

ENV DEBIAN_FRONTEND noninteractive
ENV WAIT_HOSTS=localhost:3306

COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /wait

RUN apt update && apt -y install mariadb-server

RUN mkdir -p /run/mysqld
RUN mkdir /tmp/out

RUN pip install mysql-to-sqlite3

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
