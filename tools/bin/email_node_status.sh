#!/bin/bash


# Script runs on a Vertica cluster node

if [[ -z $1 ]]; then
  echo "Usage: $0 [email]"
  exit 1
fi

EMAIL=$1
mail_client`which mail`


/opt/vertica/bin/vsql  -U vertica -c "select node_name,node_state from nodes where node_state != 'UP'" > ./node_status.out
if [ -s ./node_status.out ]
then
    $mail_client -s "Vertica node status" $EMAIL < ./node_status.out
fi


