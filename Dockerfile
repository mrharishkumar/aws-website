FROM ubuntu as build-step
RUN mkdir /app
WORKDIR /app
COPY . /app

FROM nginx
COPY --from=build-step /app/build /usr/share/nginx/html
