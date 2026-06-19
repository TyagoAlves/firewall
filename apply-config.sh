#!/bin/sh
echo "Aplicando configuracao do firewall..."
pfctl -f /etc/pf.conf 2>/dev/null || pfctl -f pf.conf
pfctl -e 2>/dev/null || true
echo "Regras ativas:"
pfctl -sr
