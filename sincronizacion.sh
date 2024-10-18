#!/bin/bash

rsync -e 'ssh -i /root/clave -p 6666' -av /etc/ respaldos@172.16.210.154:/home/respaldos/copia_etc
