### useful tools and pre-requisites ###
sleep 30

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
  "lvm2"
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
  # rsync                 # newer version of rsync compiled from source
  "tcpdump"
  "telnet"
  "traceroute"
  "unzip"
  "vim"
  "wget"
  "yum-utils"
)

sudo yum --assumeyes install ${packages[@]}

