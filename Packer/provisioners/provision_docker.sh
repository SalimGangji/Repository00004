# docker #
sleep 30

## Repositories and packages
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
sudo yum install --assumeyes yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install --assumeyes docker-ce docker-ce-cli containerd.io

## Steps removed because they do not seem to be necessary
## Create /etc/docker directory
#sudo mkdir --parents /etc/docker

## Setup daemon
#sudo bash -c "cat >> /etc/docker/daemon.json" << EOL
#{
#  "exec-opts": ["native.cgroupdriver=systemd"],
#  "log-driver": "json-file",
#  "log-opts": {
#    "max-size": "100m"
#  },
#  "storage-driver": "overlay2",
#  "storage-opts": [
#    "overlay2.override_kernel_check=true"
#  ]
#}
#EOL

# create place where docker service can be configured
#sudo mkdir --parents /etc/systemd/system/docker.service.d

# Restart docker
sudo systemctl daemon-reload
sudo systemctl enable docker.service
sudo systemctl restart docker.service
