# Firewall Corporativo FreeBSD

Firewall corporativo plug & play baseado em FreeBSD + PF (Packet Filter).

## Uso Rapido

```bash
# Na maquina FreeBSD recem-instalada:
curl -sL https://raw.githubusercontent.com/<SEU_USUARIO>/firewall-corp/main/firewall-bootstrap.sh | sudo sh
```

Ou especificando interfaces:

```bash
curl -sL https://raw.githubusercontent.com/<SEU_USUARIO>/firewall-corp/main/firewall-bootstrap.sh | sudo sh -s -- em0 em1 10.0.0.0/8
```

## Funcionalidades

- Firewall PF com bloqueio total de entrada (default deny)
- NAT para rede interna corporativa
- Liberacao seletiva de saida (HTTP, HTTPS, DNS, NTP, VPN)
- Exportacao automatica de logs para Amazon S3
- Script cron a cada 5 minutos
- Suporte a OpenVPN (porta 1194)
- Tabelas dinamicas para bloqueio/liberacao de IPs

## Estrutura

```
firewall-corp/
  firewall-bootstrap.sh   # Script principal plug & play
  apply-config.sh         # Reaplica configuracao do firewall
  pf.conf                 # Regras do Packet Filter
  export-pf-logs.sh       # Script de exportacao de logs para S3
```

## Requisitos

- FreeBSD 13+ ou 14+
- Acesso a internet
- Opcional: conta AWS para bucket S3 de logs

## Comandos Uteis

| Comando | Descricao |
|---------|-----------|
| `pfctl -sr` | Listar regras |
| `pfctl -sn` | Ver NAT |
| `pfctl -si` | Estatisticas |
| `pfctl -sa` | Tudo |
| `tcpdump -i pflog0` | Ver logs ao vivo |
