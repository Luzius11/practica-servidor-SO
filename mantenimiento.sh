#!/bin/bash

echo "Inicio mantenimiento $(date)"

date

sudo apt update
sudo apt upgrade -y

mkdir -p ~/backups

tar --exclude='/home/bobo/practica1/backups' \
    --exclude='/home/bobo/practica1/.git' \
    -czf ~/practica1/backups/backup_$(date +%F).tar.gz \
    /etc /home/bobo/practica1

find /var/log -type f -mtime +7 -delete

echo "Mantenimiento completado $(date)"

cd ~/practica1
git add backups
git commit -m "Nuevo backup $(date)"
git push
