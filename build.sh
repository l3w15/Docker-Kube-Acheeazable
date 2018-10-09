#!/bin/bash

export version=$1
echo $version
docker build -t acheezable:$version .

for file in `ls kubes | grep yaml`; do 
  cat kubes/$file | envsubst | kubectl apply -f - 
done
