#!/bin/bash -e

mysql_ssl_rsa_setup

echo "======= MYSQL CLIENT KEY ========"
cat /var/lib/mysql/client-key.pem

echo "======= MYSQL CLIENT CERT ========"
cat /var/lib/mysql/client-cert.pem

echo "======= MYSQL CA ========"
cat /var/lib/mysql/ca.pem

cat << EOF > /etc/mysql/mysql.conf.d/ssl.cnf
[mysqld]
ssl-ca=/var/lib/mysql/ca.pem
ssl-cert=/var/lib/mysql/server-cert.pem
ssl-key=/var/lib/mysql/server-key.pem
EOF

