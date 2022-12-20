FROM node:12-alpine AS build-js

LABEL maintainer="Marcel Jänicke <inpercima@gmail.com>"

ENV USER node
USER ${USER}
WORKDIR /home/${USER}

COPY frontend/src/ ./src/
COPY frontend/.browserslistrc .
COPY frontend/angular.json .
COPY frontend/package.json .
COPY frontend/tsconfig.app.json .
COPY frontend/tsconfig.json .
COPY frontend/tsconfig.spec.json .
COPY frontend/e2e/tsconfig.json ./e2e/
COPY frontend/tslint.json .
COPY frontend/yarn.lock .

RUN yarn
RUN yarn build:prod
