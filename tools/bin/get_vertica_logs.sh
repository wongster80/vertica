#!/bin/bash

# Script runs on one of the Vertica cluster nodes
# Collects Vertica logs from multiple nodes

if [[ -z $1 || -z $2 ]]; then
  echo "Usage: $0 [database_name] [number_of_nodes]"
  exit 1
fi

DB=$1
NODE_CNT=$2

for i in {1..$2}; do echo vert-dev-node${i}; scp -o StrictHostKeyChecking=no vert-dev-node${i}.foo.com:/vertica/${DB}/v_${DB}_node00*_catalog/vertica.log vert-dev-node${i}_vertica.log; done
