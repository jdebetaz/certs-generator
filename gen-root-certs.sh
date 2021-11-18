#!/bin/bash

if [ -z "$1" ]; then
    echo "No CA Cert name supplied"
    exit
fi

if [ ! -d "root" ]; then
    mkdir root
fi


openssl ecparam -out root/$1-CA.key -name prime256v1 -genkey
openssl req -new -sha256 -key root/$1-CA.key -out root/$1-CA.csr
openssl x509 -req -sha256 -days 3650 -in root/$1-CA.csr -signkey root/$1-CA.key -out root/$1-CA.crt