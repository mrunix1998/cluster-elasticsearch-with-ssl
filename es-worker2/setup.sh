

apt-get update
apt-get -y dist-upgrade
apt autoremove -y
apt-get clean
apt-get install -y docker.io
apt-get install -y docker-compose


systemctl stop docker
mkdir /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/http-proxy.conf
echo '[Service]' > /etc/systemd/system/docker.service.d/http-proxy.conf
echo 'Environment="HTTP_PROXY=http://blog.homayouni.info:8123"' >> /etc/systemd/system/docker.service.d/http-proxy.conf

systemctl daemon-reload
systemctl start docker

mv .env-sample .env

docker-compose -f docker-compose.setup.yml run --rm certs
docker-compose up -d