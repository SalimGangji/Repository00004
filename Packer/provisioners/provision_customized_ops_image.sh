### update ###
sudo yum update --assumeyes

### syslog-ng ose (open source edition) version 3.19 ###
sudo curl --location https://copr.fedorainfracloud.org/coprs/czanik/syslog-ng319/repo/epel-7/czanik-syslog-ng319-epel-7.repo --output /etc/yum.repos.d/czanik-syslog-ng319-epel-7.repo
sudo yum install --assumeyes syslog-ng

### nagios ###
#https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#CentOS

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
sudo curl --location https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz --output nagioscore-nagios-4.4.3.tar.gz
sudo tar --verbose --extract --gzip --file=nagioscore-nagios-4.4.3.tar.gz
sudo rm nagioscore-nagios-4.4.3.tar.gz
cd /var/tmp/nagioscore-nagios-4.4.3/
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

# golang binaries
cd /var/tmp
sudo curl --location https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz --output go1.11.1.linux-amd64.tar.gz
sudo tar --directory=/usr/local --extract --gzip --file=go1.11.1.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" | sudo tee --append /etc/profile > /dev/null
sudo rm go1.11.1.linux-amd64.tar.gz

# Jenkins
# https://hostpresto.com/community/tutorials/how-to-install-jenkins-on-centos-7/
sudo curl --output /etc/yum.repos.d/jenkins.repo --location https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install --assumeyes jenkins

# nginx
printf "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/\$basearch/\n\ngpgcheck=0\nenabled=1" | sudo tee --append /etc/yum.repos.d/nginx.repo > /dev/null
sudo yum install --assumeyes nginx

# gitlab-runner
sudo curl --output /usr/local/bin/gitlab-runner --location https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo curl --fail --silent --show-error --location https://get.docker.com/ | sudo sh
sudo systemctl enable docker.service
sudo /usr/local/bin/gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo /usr/local/bin/gitlab-runner start

