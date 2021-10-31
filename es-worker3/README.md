# On worker 3 node 

Befor any works you should sure that secret file from master node exist in this node

## Setup

In order to use this project, you must first include the following in a file named `.env`. I have provided an example environment variable file here [.env-example](https://github.com/swimlane/elk-tls-docker/blob/master/.env-example).

> Copy or create your own `.env` from the provided example or from the code block below

```text
ELK_VERSION=7.14.1
ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=some_password

# Configuration Variables
ELASTICSEARCH_HEAP=2g
LOGSTASH_HEAP=1g
PACKETBEAT_HEAP=256m
FILEBEAT_HEAP=256m
METRICBEAT_HEAP=256m
XPACK_ENCRYPTION_KEY=somesuperlongstringlikethisoneMQBbtsynu4bV2uxLy

# Self signed TLS certificates
CA_PASSWORD=some_password
CA_DAYS=3650
ELASTIC_DIR=/usr/share/elasticsearch
LOGSTASH_DIR=/usr/share/logstash
KIBANA_DIR=/usr/share/kibana
PACKETBEAT_DIR=/usr/share/packetbeat
FILEBEAT_DIR=/usr/share/filebeat
METRICBEAT_DIR=/usr/share/metricbeat


# nodes ip (change them)#
NODE1_IP=1.2.3.4
NODE2_IP=1.2.3.4
NODE3_IP=1.2.3.4

# Letsencrypt certificates
## Setting STAGING to true means it will generate self-signed certificates
## Setting STAGING to false means it will generate letsencrypt certificates
# STAGING=false
STAGING=true

# swag Configuration
#DOMAIN=mydomain.com
#SUBDOMAIN=kibana
#SUBFOLDER=kibana
#EMAIL=email@email.com
#TIMEZONE=America/Chicago
```

> Note: You may need to change the size of the HEAP variables in the above configuration file based on your system requirements.  The settings present are for a machine with 8GB of memory


## run compose file 

```
docker-compose up -d
```