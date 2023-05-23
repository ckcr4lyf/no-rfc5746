#!/bin/sh

node server.mjs &
sleep 1

if [ "$STRACE" = "true" ]
then
    strace -e trace=openat,read node client.mjs
else
    node client.mjs
fi
