# MySQL Docker Image with TLS support

This image is based on https://hub.docker.com/_/mysql/ and currently support:

 - MySQL 5.7

You can use the docker hub image `cyprien/mysql-tls:5.7`. See https://hub.docker.com/r/cyprien/mysql-tls/.

## Configuration & CA

Enviroment variables and configuration files from https://hub.docker.com/_/mysql/ still apply.

At first start, this image will run `mysql_ssl_rsa_setup` which will build a Certification Authority for TLS transport.

## TLS certificates

TLS certificates can be found in `/var/lib/mysql`. You will find the following files:

 - `server-cert.pem` : MySQL server certificate
 - `server-key.pem` : MySQL server key
 - `ca-key.pem` : MySQL CA Key
 - `ca.pem` : MySQL CA Certificate
 - `client-cert.pem` : Client certificate (signed by CA)
 - `client-key.pem` : Client key

This image will also display at startup, the client certificate, key and the CA.

## Connect with MySQL Client

Run the container:
```
docker-compose up
```

Connect to the server:
```
mysql -u root -p -h 127.0.0.1 --ssl-ca=/var/lib/docker/volumes/dockermysqltls_mysql_tls/_data/ca.pem --ssl-cert=/var/lib/docker/volumes/dockermysqltls_mysql_tls/_data/client-cert.pem --ssl-key=/var/lib/docker/volumes/dockermysqltls_mysql_tls/_data/client-key.pem
```
