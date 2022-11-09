FROM debian MAINTAINER Erick Davi Morgade Pessanha erickdavi@gmail.com LABEL Description="Webserver Apache2 com suporte a PHP"

RUN apt-get update
&& apt-get install -y apache2 php5 php5-mysql
&& apt-get clean

ENV APACHE_RUN_USER="www-data" ENV APACHE_RUN_GROUP="www-data" ENV APACHE_PID_FILE="/var/run/apache2/apache2$SUFFIX.pid" ENV APACHE_RUN_DIR="/var/run/apache2$SUFFIX" ENV APACHE_LOCK_DIR="/var/lock/apache2$SUFFIX" ENV APACHE_LOG_DIR="/var/log/apache2$SUFFIX"

VOLUME ["/var/www/html"] VOLUME ["/var/log/apache2"]

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"] EXPOSE 80 443

Para buildar o container: docker build -t erickdavi/webserver:1.0 .

Para subir o container: docker run -ti --name