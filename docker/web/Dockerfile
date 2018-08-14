FROM nginx:1.15-alpine

RUN apk update && apk add apache2-utils

ENV RAILS_ROOT /var/www/dockerzon

WORKDIR $RAILS_ROOT

RUN mkdir log

COPY public public/

COPY docker/web/nginx.conf /tmp/docker.nginx

RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
