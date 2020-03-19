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

git_version="2.25.2"

sudo curl --location https://github.com/git/git/archive/v${git_version}.tar.gz --output /var/tmp/git_v${git_version}.tar.gz
sudo mkdir --parents /var/tmp/git_compile_from_source
sudo tar --extract --verbose --file /var/tmp/git_v${git_version}.tar.gz --directory=/var/tmp/git_compile_from_source
cd /var/tmp/git_compile_from_source/git-${git_version}/

# for some reason on AWS amazon-linux-2 instances these packages do not install correctly, so installing them again here
sleep 30
sudo yum install python3 libcurl-devel expat-devel asciidoc xmlto --assumeyes

sudo make prefix=/usr install install-doc install-html

rm -rf /var/tmp/git_compile_from_source
