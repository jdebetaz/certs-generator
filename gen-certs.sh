#!/bin/bash

if [ -z "$1" ]; then
    echo "No CA Cert name supplied"
    exit
fi

if [ -z "$2" ]; then
    echo "No Cert name supplied"
    exit
fi

if [ ! -d "$1" ]; then
    mkdir $1
fi


openssl ecparam -out $1/$2.key -name prime256v1 -genkey
openssl req -new -sha256 -key $1/$2.key -out $1/$2.csr
openssl x509 -req -in $1/$2.csr -CA  root/$1-CA.crt -CAkey root/$1-CA.key -CAcreateserial -out $1/$2.crt -days 3650 -sha256