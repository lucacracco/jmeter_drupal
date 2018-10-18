FROM wadmiraal/drupal:7

RUN /etc/init.d/mysql start && \
	cd /var/www && \
	drush sql-drop -y && \
	drush si -y standard --db-url=mysql://drupal:drupal@localhost/drupal --account-pass=admin && \
	drush dl admin_menu devel && \
	drush en -y admin_menu devel devel_generate && \
    drush -y generate-content 50