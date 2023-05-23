#!/bin/sh

node /app/server.mjs &
sleep 1

if [ "$STRACE" = "true" ]
then
    strace -e trace=openat,read node /app/client.mjs
else
    node /app/client.mjs
fi
