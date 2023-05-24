#!/bin/sh

node /app/server.mjs &
sleep 1

node /app/client.mjs
