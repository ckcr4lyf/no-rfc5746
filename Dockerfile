from node:18-alpine

WORKDIR /app

COPY server.mjs /app

CMD ["node", "server.mjs"]