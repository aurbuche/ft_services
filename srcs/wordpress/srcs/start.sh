openrc

touch /run/openrc/softlevel

rc-service php-fpm7 restart & ./telegraf/telegraf & /usr/bin/supervisord -c /etc/supervisord.conf &  while true; do
    rc-service php-fpm7 status || rc-service php-fpm7 restart;
    sleep 5;
done;