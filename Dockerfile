# syntax=docker/dockerfile:1

ARG NODE_VERSION=lts

FROM node:${NODE_VERSION}-alpine

ENV NODE_ENV=development

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm i

RUN mkdir -p /app/.next && chown -R node:node /app/.next
RUN touch /app/next-env.d.ts && chown -R node:node /app/next-env.d.ts

USER node 

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]

