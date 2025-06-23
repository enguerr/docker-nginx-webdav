FROM nginx:1.22

LABEL maintainer="enguerr"

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y apt-utils nginx-extras apache2-utils
COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-available/* -f
RUN rm /etc/nginx/sites-enabled/* -f

RUN mkdir -p "/media/data"

RUN chown -R www-data:www-data "/media/data"

VOLUME /media/data


COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /entrypoint.sh && nginx -g "daemon off;"