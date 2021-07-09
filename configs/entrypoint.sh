set -e
source /etc/apache2/envvars
source /.env
JOOMLA_DOWNLOAD="https://www.joomla.fr/joomla/telecharger-joomla?task=download&collection=seb_download_full_package&xi=0&file=seb_download_full_package&id=15514"
APACHE_RUN_DIR="/var/$DIRECTORY_JOOMLA_INSTALL"
if [ ! -f "$APACHE_RUN_DIR/configuration.php" ]; then
	wget -q -O joomla3-9.zip $JOOMLA_DOWNLOAD
	unzip joomla3-9.zip -d $APACHE_RUN_DIR && \
	chown -R www-data:www-data $APACHE_RUN_DIR && \
	chmod -R 755 $APACHE_RUN_DIR
fi
a2dissite 000-default.conf
a2ensite joomla.conf
exec apache2 -DFOREGROUND