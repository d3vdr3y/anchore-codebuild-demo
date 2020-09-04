FROM httpd:2.4.46-alpine
COPY ./index.html /usr/local/apache2/htdocs/
RUN apk update && \
    apk upgrade