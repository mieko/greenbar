#!/usr/bin/env bash

[ -z "$EMAIL" ] && EMAIL=user@example.com

rm -f scores/*
mkdir -p scores

for i in ev-certs/* ; do
  hostname=$(echo $i | sed -e 's!ev-certs/!!' | sed -e 's/\.crt$//' )
  # No fork to be nice to SSLLabs
  ssllabs-scan-v4 --email "$EMAIL" --usecache --grade "$hostname"  > "scores/$hostname"
done
