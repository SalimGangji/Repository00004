### gitlab runner ###
sleep 30

USERNAME=gitlab-runner
GROUPNAME=gitlab-runner
HOMEPATH=/home/gitlab-runner
PATH=${PATH}:/usr/sbin:/sbin

# Make the directory
sudo mkdir --parents /usr/local/bin/

# Download the binaries
sudo curl https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 --output /usr/local/bin/gitlab-runner
sudo chmod +x /usr/local/bin/gitlab-runner

# Add gitlab-runner user; Also creates a group named gitlab-runner and adds the user named gitlab-runner to this group
sudo useradd --user-group --shell /bin/bash --home-dir ${HOMEPATH} ${USERNAME}

# Install GitLab Runner
sudo /usr/local/bin/gitlab-runner install --user=gitlab-runner --working-directory=${HOMEPATH}
