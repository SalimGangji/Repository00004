### update ###
sudo yum update --assumeyes

### se-linux disable ###
sudo sed --in-place=".bak" --regexp-extended --expression="s:^SELINUX=enforcing:SELINUX=disabled:gI" /etc/selinux/config
sudo setenforce 0

### subscription manager disable ###
subscription_manager_file=/etc/yum/pluginconf.d/subscription-manager.conf
if [ -f $subscription_manager_file ]
  then
    sudo sed --in-place=".bak" --regexp-extended --expression="s:enabled=1:enabled=0:gI" $subscription_manager_file
fi

### tools and pre-requisites ###
sudo yum --assumeyes install epel-release

declare -a packages=(
  "ansible"
  "automake"
  "autoconf"
  "bash-completion"
  "bind-utils"
  "curl"
  "dhcp"
  "gcc"
  "htop"
  "iproute"
  "java-1.8.0-openjdk.x86_64"
  "jq"
  "lsof"
  "mc"
  "make"
  "nano"
  "nc"
  "net-snmp"
  "net-snmp-utils"
  "net-tools"
  "nmap"
  "openssl-devel"
  "postfix"
  "python-devel"
  "python-pip"
  "rsync"
  "tcpdump"
  "telnet"
  "traceroute"
  "unzip"
  "vim"
  "wget"
)

sudo yum --assumeyes install ${packages[@]}

### git ###
declare -a git_prereq_packages=(
  "asciidoc"
  "curl-devel"
  "dh-autoreconf"
  "docbook2X"
  "expat-devel"
  "gcc"
  "gettext-devel"
  "openssl-devel"
  "perl-devel"
  "xmlto"
  "zlib-devel"
)

sudo yum --assumeyes install ${git_prereq_packages[@]}

sudo curl --location https://github.com/git/git/archive/v2.21.0.tar.gz --output /var/tmp/git_v2.21.0.tar.gz
sudo mkdir --parents /var/tmp/git_compile_from_source
sudo tar --extract --verbose --file /var/tmp/git_v2.21.0.tar.gz --directory=/var/tmp/git_compile_from_source
cd /var/tmp/git_compile_from_source/git-2.21.0/
sudo make prefix=/usr install install-doc install-html

### curl ###
sudo curl --location https://github.com/curl/curl/releases/download/curl-7_65_1/curl-7.65.1.tar.gz --output /var/tmp/curl-7.65.1.tar.gz
sudo mkdir --parents /var/tmp/curl_compile_from_source
sudo tar --extract --verbose --file /var/tmp/curl-7.65.1.tar.gz --directory=/var/tmp/curl_compile_from_source
cd /var/tmp/curl_compile_from_source/curl-7.65.1/
sudo ./configure
sudo make
sudo make install