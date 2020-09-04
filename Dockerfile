FROM httpd:2.4.46-alpine
RUN echo "The Web Server is Running" > /usr/local/apache2/htdocs/index.html
RUN apk update && \
    apk upgrade
