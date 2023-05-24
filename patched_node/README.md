# Patched Node

[As suggested by @bnoordhuis](https://github.com/nodejs/node/issues/48143#issuecomment-1560570740) , I patched NodeJS by shifting the `NODE_EXTRA_CA_CERTS` stuff to after reading the OpenSSL config.

This seems to have fixed [the bug](https://github.com/nodejs/node/issues/48143) for me.

This repo contains the patch and the Dockerfile I used to build and release the patched node, which is available as a container via `docker pull ghcr.io/ckcr4lyf/node-openssl-config-patch:latest` . 
