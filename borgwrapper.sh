#!/bin/bash


echo "You are using the old borgwrapper.sh script, please change"
echo "borgwrapper.sh to backwrap."
echo

script="$(dirname "$0")/backwrap"
exec "$script" "$@"
