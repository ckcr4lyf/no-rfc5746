FROM node:18

RUN apt-get update && apt-get -y install strace

WORKDIR /app

COPY . .

COPY openssl.cnf /etc/ssl/openssl.cnf

RUN chmod +x ./entrypoint.sh

CMD [ "./entrypoint.sh" ]
