#!/bin/bash

# Script to create a list of copy commands to copy specific tables from one cluster to another.
# It depends on a template file named copy_tables.tt which should be in the same path as this script
# It takes a list of tables and the source hostname of a vertica cluster as arguments.


# Argument checking
if [[ -z $1 || -z $2 || -z $3 || -z $4 || -z $5 ]]; then
  echo "Usage: $0 [file_table_list] [source_vertica_hostname] [source_vertica_user] [source_vertica_password]"
  exit 1
fi


TABLE_LIST=$1
SOURCE_VERT=$2
VERT_USER=$3
VERT_PW=$4
SCHEMA=$5


echo "\timing"
echo "CONNECT TO VERTICA ${SCHEMA} USER ${VERT_USER} PASSWORD '${VERT_PW}' ON '${SOURCE_VERT}',5433;"
for table in $(<$TABLE_LIST); do
  sed "s/TABLE_NAME/${table}/;s/${SCHEMA}.TABLE_NAME/${SCHEMA}.${table}/" copy_tables.tt
done


