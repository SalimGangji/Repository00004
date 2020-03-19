### curl ###
sleep 30

curl_version="7.69.1"
curl_version_underscore=$( echo $curl_version | tr "." "_" )

sudo curl --location https://github.com/curl/curl/releases/download/curl-${curl_version_underscore}/curl-${curl_version}.tar.gz --output /var/tmp/curl-${curl_version}.tar.gz
sudo mkdir --parents /var/tmp/curl_compile_from_source
sudo tar --extract --verbose --file /var/tmp/curl-${curl_version}.tar.gz --directory=/var/tmp/curl_compile_from_source
cd /var/tmp/curl_compile_from_source/curl-${curl_version}/
sudo ./configure
sudo make
sudo make install

rm -rf /var/tmp/curl_compile_from_source
