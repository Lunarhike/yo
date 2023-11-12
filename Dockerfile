FROM node:18.8-alpine as base

RUN mkdir -p /app
WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN apk add git

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "serve"]