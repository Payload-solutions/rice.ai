#Create MySQL Image for JSP Tutorial Application
FROM mysql/mysql-server:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=IOTSoilValues
ENV MYSQL_USER=root_arturo
ENV MYSQL_PASSWORD=arturo_root


COPY ./scripts/scripts1.sql /docker-entrypoint-initdb.d/1.sql
EXPOSE 3306