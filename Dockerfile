ARG VERSION

FROM node:$VERSION

WORKDIR /app

COPY . .

COPY openssl.cnf /etc/ssl/openssl.cnf

RUN chmod +x /app/entrypoint.sh

CMD [ "/app/entrypoint.sh" ]
