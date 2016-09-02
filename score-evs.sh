#!/usr/bin/env bash

rm -f scores/*
mkdir -p scores

for i in ev-certs/* ; do
  hostname=$(echo $i | sed -e 's!ev-certs/!!' | sed -e 's/\.crt$//' )
  # No fork to be nice to SSLLabs
  ssllabs-scan -usecache -grade "$hostname"  > "scores/$hostname"
done
