FROM nginx:stable-alpine3.17

COPY ./templates /etc/nginx/templates
COPY ./ssl /etc/nginx/ssl
