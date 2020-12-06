FROM node:12-alpine as build
WORKDIR /usr/app
COPY package*.json .

ENV DATABASE_NAME ''
ENV DATABASE_HOST ''
ENV DATABASE_USERNAME ''
ENV DATABASE_PASSWORD ''
ENV DATABASE_PORT 5432

RUN yarn
RUN yarn run build

FROM nginx:latest
EXPOSE 80
COPY --from=build /usr/app/build /usr/share/nginx/html
