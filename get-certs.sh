#!/usr/bin/env bash

mkdir -p certs

cat top-2k.csv | cut -d',' -f2 | xargs '-I{}' bash -c 'gtimeout 5 openssl s_client -connect "{}:443" > "certs/{}.crt"'
