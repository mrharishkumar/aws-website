FROM ubuntu as build-step
RUN mkdir /app
WORKDIR /app
COPY . /app

FROM nginx
COPY --from=build-step /app /usr/share/nginx/html
