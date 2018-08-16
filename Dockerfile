FROM node:7

WORKDIR /app

COPY package.json /app

RUN npm install express --save

COPY . /app

CMD node index.js

EXPOSE 7070
