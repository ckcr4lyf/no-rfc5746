ARG VERSION=18

FROM node:$VERSION

RUN apt-get update && apt-get -y install strace

WORKDIR /app

COPY . .

COPY openssl.cnf /etc/ssl/openssl.cnf

RUN chmod +x /app/entrypoint.sh

CMD [ "/app/entrypoint.sh" ]
