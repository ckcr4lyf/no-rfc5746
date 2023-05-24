FROM ghcr.io/ckcr4lyf/node-openssl-config-patch:latest

WORKDIR /app

COPY . .

COPY openssl.cnf /etc/ssl/openssl.cnf

RUN chmod +x /app/entrypoint.sh

CMD [ "/app/entrypoint.sh" ]
