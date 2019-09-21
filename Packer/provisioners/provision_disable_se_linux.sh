### se-linux disable ###
sleep 30
sudo setenforce 0
sudo sed --in-place=".bak" --regexp-extended --expression="s:^SELINUX=enforcing:SELINUX=disabled:gI" /etc/selinux/config
