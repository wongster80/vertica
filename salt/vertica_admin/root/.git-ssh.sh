#!/bin/sh

## FILE MANAGED BY SALT ##

# This scripts allows git to run as a different SSH private key

if [ -z "$PKEY" ]; then
# if PKEY is not specified, run ssh using default keyfile
  ssh "$@"
else
  ssh -i "$PKEY" "$@"
fi

