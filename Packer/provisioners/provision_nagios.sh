### nagios ###
#https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#CentOS
sleep 30
declare -a nagios_prereq_packages=(
  "gd"
  "gd-devel"
  "glibc"
  "glibc-common"
  "httpd"
  "php"
  "perl"
)

sudo yum --assumeyes install ${nagios_prereq_packages[@]}

cd /var/tmp
#download compileable source code (not binaries)
sudo curl --location https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz --output nagioscore-nagios-4.4.5.tar.gz
sudo tar --verbose --extract --gzip --file=nagioscore-nagios-4.4.5.tar.gz
sudo rm nagioscore-nagios-4.4.5.tar.gz
cd /var/tmp/nagioscore-nagios-4.4.5/
sudo ./configure
sudo make all
sudo /usr/sbin/useradd --shell /bin/bash --user-group --base-dir /home nagios
sudo /usr/sbin/usermod --append --groups nagios apache
sudo make install
sudo make install-init
sudo systemctl enable httpd.service
sudo make install-commandmode
sudo make install-config
sudo make install-webconf

#service intialization
# htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
# see https://btlp002685.corp.ads:9640/display/SO/Credentials for password for "nagiosadmin"
#sudo systemctl start httpd.service
sudo systemctl enable nagios.service
#sudo systemctl start nagios.service

#test nagios web ui in browser - note the test url is http:// not https://
#http://[ip-address]/nagios/

### nagios plugins ###
declare -a nagios_plugins_prereq_packages=(
  "gcc"
  "gettext"
  "epel-release"
  "perl-Net-SNMP"
)

sudo yum --assumeyes install ${nagios_plugins_prereq_packages[@]}

cd /var/tmp
sudo curl --output nagios-plugins.tar.gz --location https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
sudo tar --extract --verbose --file=nagios-plugins.tar.gz
sudo rm nagios-plugins.tar.gz
cd /var/tmp/nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install