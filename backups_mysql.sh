#!/bin/bash


# Antes de nada, crear usuario en MySQL con permisos para mysqldump
# create user 'respaldos'@'localhost' identified by 'respaldos';
# GRANT SELECT, LOCK TABLES ON `mysql`.* TO
# GRANT SELECT, LOCK TABLES, SHOW VIEW, EVENT, TRIGGER ON `nombre_base_datos`.* TO 'respaldos'@'localhost';
#
# Tambien crear una clave SSH sin passphrase
USUARIO_MYSQL="respaldos"
PASSWORD_MYSQL="respaldos"
BASE_DE_DATOS="base"
ARCHIVO_FINAL=$(date +"%Y-%m-%d__%H-%M.sql.gz")
CLAVE_SSH="/root/clave"

mysqldump -u $USUARIO_MYSQL -p$PASSWORD_MYSQL $BASE_DE_DATOS | gzip -9 > $ARCHIVO_FINAL
scp -i $CLAVE_SSH -P 6666 $ARCHIVO_FINAL respaldos@172.16.210.154:/home/respaldos
rm -rf $ARCHIVO_FINAL
