# syntax=docker/dockerfile:1

ARG NODE_VERSION=lts-alpine

FROM node:${NODE_VERSION}

ENV NODE_ENV development

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm i

RUN mkdir -p /app/.next && chown -R node:node /app/.next

USER node 

COPY . .

EXPOSE 3000

CMD npm run dev

