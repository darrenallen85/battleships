# Container image that runs your code
FROM node:15.14-alpine3.13

FROM node:12.18.1
ARG NODE_ENV
ENV NODE_ENV ${NODE_ENV}
ARG PORT
ENV PORT ${PORT}

WORKDIR /app

RUN echo "NODE_ENV=${NODE_ENV}" && echo "PORT=${PORT}"

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

EXPOSE ${PORT}

CMD [ "node", "server.js" ]