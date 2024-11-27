#!/usr/bin/env bash

DOMAIN_CSV="cloudflare-radar_top-2000-domains_20241118-20241125.csv"

mkdir -p certs

cat "$DOMAIN_CSV" | sed '1d' | cut -d',' -f1 | xargs '-I{}' bash -c 'gtimeout 5 openssl s_client -connect "{}:443" > "certs/{}.crt"'
