FROM nginx:stable-alpine3.17

COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl /etc/nginx/ssl
