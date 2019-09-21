### rsync ###
sleep 30

sudo curl --location https://download.samba.org/pub/rsync/src/rsync-3.1.3.tar.gz --output /var/tmp/rsync-3.1.3.tar.gz
sudo mkdir --parents /var/tmp/rsync_compile_from_source
sudo tar --extract --verbose --file /var/tmp/rsync-3.1.3.tar.gz --directory=/var/tmp/rsync_compile_from_source
cd /var/tmp/rsync_compile_from_source/rsync-3.1.3/
sudo ./configure
sudo make
sudo make install

