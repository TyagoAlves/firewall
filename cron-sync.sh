#!/bin/sh
# Instala o cron para sincronizar logs a cada hora
CRON_JOB="0 * * * * /home/ec2-user/firewall/sync-s3.sh"
(crontab -l 2>/dev/null | grep -v sync-s3; echo "$CRON_JOB") | crontab -
echo "Cron instalado: $CRON_JOB"
