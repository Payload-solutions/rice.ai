#Create MySQL Image for JSP Tutorial Application
FROM mysql/mysql-server:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=IOTSoilValues
ENV MYSQL_USER=root_arturo
ENV MYSQL_PASSWORD=arturo_root
ENV MYSQL_HOST=localhost

COPY ./scripts/up.sql /docker-entrypoint-initdb.d/up.sql
# COPY ./scripts/riceaiv3.sql /docker-entrypoint-initdb.d/riceaiv3.sql
EXPOSE 3306