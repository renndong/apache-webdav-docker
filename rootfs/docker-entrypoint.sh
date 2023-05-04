#!/bin/sh
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

[ -n "$PUID" ] && usermod -u "$PUID" apache2
[ -n "$PGID" ] && groupmod -g "$PGID" apache2

[ -f /config/server.crt ] && [ -f /config/server.key ] && {
	sed -i \
		-e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
		-e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
		-e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
		/usr/local/apache2/conf/httpd.conf
}

mkdir -p /var/davlock/ && chown apache2:apache2 /var/davlock/

exec httpd -DFOREGROUND "$@"
