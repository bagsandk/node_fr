FROM node:16-alpine AS Build
WORKDIR /usr/src/app
COPY . .

RUN npm install

FROM node:16-alpine AS Deploy

WORKDIR /home/root
COPY --from=Build /usr/src/app /home/root

EXPOSE 3050

CMD ["node", "server.js"]