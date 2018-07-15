# Web Based Interface for Monitoring Network apache2 php5 php5-gd
sudo apt-get install vnstat
sudo apt-get install apache2
apt-get install php5-cli
wget -O vnstat_php_frontend-1.5.1.tar.gz "http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz"
#wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xzf vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 /var/www/html/vnstat
sed -i s/nl/th/g /var/www/html/vnstat/config.php;
#sed -i s/80/85/g /etc/apache2/ports.conf;
wget -O /var/www/html/vnstat/lang/th.php "https://raw.githubusercontent.com/ballsoyed/Vnstat/master/th.php"
wget -O /var/www/html/vnstat/index.php "https://raw.githubusercontent.com/ballsoyed/VPS/master/index.php"
sed -i s/xxxxxxxxxx/http/g /var/www/html/vnstat/index.php;
wget -O /etc/apache2/sites-enabled/000-default.conf "https://raw.githubusercontent.com/ballsoyed/Vnstat/master/000-default.conf"
sed -i s/85/80/g /etc/apache2/sites-enabled/000-default.conf;
sed -i s/85/10000/g /var/www/html/vnstat/index.php;
cd
wget -O client.ovpn "https://raw.githubusercontent.com/ballsoyed/test45/master/client.ovpn"
MYIP=$(wget -qO- ipv4.icanhazip.com);
sed -i s/xxxxxxxx/$MYIP/g client.ovpn;
mv client.ovpn /var/www/html/vnstat/
wget -O /var/www/html/vnstat/client.php "https://raw.githubusercontent.com/gmchoke/A/master/client.php"
sed -i s/client.zip/client.php/g /var/www/html/vnstat/index.php;
sudo service apache2 restart
#nano /var/www/html/vnstat/config.php
