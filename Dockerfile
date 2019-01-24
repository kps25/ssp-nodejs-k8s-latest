FROM node:7

WORKDIR /app

COPY package.json /app

RUN npm install express --save

COPY . /app


EXPOSE 9090

CMD ["node", "index.js"]
