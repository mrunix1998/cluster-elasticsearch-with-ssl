apt-get update
apt-get -y dist-upgrade
apt autoremove -y
apt-get clean
apt-get install -y docker.io
apt-get install -y docker-compose
apt-get install -y p7zip-full
 
 
systemctl stop docker
mkdir /etc/systemd/system/docker.service.d/
echo '[Service]' > /etc/systemd/system/docker.service.d/http-proxy.conf
echo 'Environment="HTTP_PROXY=http://blog.homayouni.info:8123"' >> /etc/systemd/system/docker.service.d/http-proxy.conf
 
systemctl daemon-reload
systemctl start docker
 
mv .env-sample .env &> /dev/null

cd images
7z x logstash.tar.7z
7z x kibana.tar.7z
7z x elasticsearch.tar.7z

rm logstash.tar.7z kibana.tar.7z elasticsearch.tar.7z

docker load -i logstash.tar
docker load -i kibana.tar
docker load -i elasticsearch.tar

cd ..

docker-compose -f docker-compose.setup.yml run --rm certs
docker-compose up -d


