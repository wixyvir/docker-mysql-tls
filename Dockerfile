FROM mysql:5.7

RUN apt-get update && apt-get install -y openssl
RUN chown mysql: /etc/mysql/mysql.conf.d/

ADD docker-entrypoint-initdb.d/run_rsa.sh /docker-entrypoint-initdb.d/

