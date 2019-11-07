### curl ###
sleep 30

sudo curl --location https://github.com/curl/curl/releases/download/curl-7_67_0/curl-7.67.0.tar.gz --output /var/tmp/curl-7.67.0.tar.gz
sudo mkdir --parents /var/tmp/curl_compile_from_source
sudo tar --extract --verbose --file /var/tmp/curl-7.67.0.tar.gz --directory=/var/tmp/curl_compile_from_source
cd /var/tmp/curl_compile_from_source/curl-7.67.0/
sudo ./configure
sudo make
sudo make install

