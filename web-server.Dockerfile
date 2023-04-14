FROM nginx:stable-alpine3.17

COPY ./templates/default.conf.template /etc/nginx/templates/default.conf.template
COPY ./ssl /etc/nginx/ssl
