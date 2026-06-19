#!/bin/sh
# Script de sincronizacao de logs do PF para S3
BUCKET="firewall-logs-160940204014-1781898493"
HOSTNAME=$(hostname)
DATE=$(date +%Y%m%d-%H%M%S)

pflog -f /var/log/pflog -t | aws s3 cp - "s3://${BUCKET}/${HOSTNAME}/pflog-${DATE}.log" 2>/dev/null
aws s3 sync /var/log/ "s3://${BUCKET}/${HOSTNAME}/" --exclude "*" --include "*.log*" 2>/dev/null

echo "$(date): S3 sync completed" >> /var/log/s3-sync.log
