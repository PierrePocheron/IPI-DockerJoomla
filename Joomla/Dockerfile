FROM debian
ARG JOOMLA_SRC_PATH
RUN apt update -y \
    && apt install apache2 php7.2  php-xml php-mysql wget unzip -y \
    && mkdir -p /var/${JOOMLA_SRC_PATH}
ENTRYPOINT ["bash", "/entrypoint.sh"]
EXPOSE 80