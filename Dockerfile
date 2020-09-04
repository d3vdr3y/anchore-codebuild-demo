#FROM httpd:2.4.46-alpine
#RUN echo "The Web Server is Running" > /usr/local/apache2/htdocs/index.html
#RUN apk update && \
#    apk upgrade

FROM registry.access.redhat.com/ubi7/ubi:latest
USER root
# Update image
RUN yum update --disableplugin=subscription-manager -y && rm -rf /var/cache/yum
RUN yum install --disableplugin=subscription-manager httpd -y && rm -rf /var/cache/yum

RUN echo "The Web Server is Running" > /var/www/html/index.html
EXPOSE 80 22
# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
