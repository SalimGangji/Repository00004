### git ###
sleep 30
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

sudo curl --location https://github.com/git/git/archive/v2.24.0.tar.gz --output /var/tmp/git_v2.24.0.tar.gz
sudo mkdir --parents /var/tmp/git_compile_from_source
sudo tar --extract --verbose --file /var/tmp/git_v2.24.0.tar.gz --directory=/var/tmp/git_compile_from_source
cd /var/tmp/git_compile_from_source/git-2.24.0/
sudo make prefix=/usr install install-doc install-html
