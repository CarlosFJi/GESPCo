#!/bin/sh
# Substitute environment variables in Apache configuration
envsubst < /usr/local/apache2/conf/httpd.conf.template > /usr/local/apache2/conf/httpd.conf

# For debugging: print the PORT variable and the resulting httpd.conf
echo "LISTENING: $LISTENING"
# cat /usr/local/apache2/conf/httpd.conf

# Start Apache in the foreground
exec httpd -DFOREGROUND