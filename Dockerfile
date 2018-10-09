FROM node:carbon

WORKDIR /usr/src/app

COPY package.*json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server/server.js"]
# Other command required for seed service