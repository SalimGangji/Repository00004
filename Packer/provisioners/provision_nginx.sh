### nginx ###
# http://nginx.org/en/linux_packages.html
sleep 30

printf "[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/7/\$basearch/\n\ngpgcheck=1\nenabled=1\ngpgkey=https://nginx.org/keys/nginx_signing.key" | sudo tee --append /etc/yum.repos.d/nginx.repo > /dev/null
sudo yum install --assumeyes nginx