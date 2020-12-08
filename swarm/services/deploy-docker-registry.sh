#!/bin/bash

sudo cat <<EOF >/etc/docker/daemon.json
{
  "insecure-registries" : ["myregistrydomain.com:5000"]
}
EOF
sudo systemctl restart docker

tmp_dir=$(mktemp -d -t ci-XXXXXXXXXX)
#openssl req -newkey rsa:4096 -nodes -sha256 -keyout $tmp_dir/domain.key -x509 -days 365 -out $tmp_dir/domain.crt
#cp $tmp_dir/domain.crt /etc/docker/certs.d/myregistrydomain.com:5000/ca.crt
#cp $tmp_dir/domain.key /etc/docker/certs.d/myregistrydomain.com:5000/ca.key
#rm $tmp_dir/domain.*


if [[ -z "$(cat /etc/*release* | grep Rasp )" ]]
then
  docker service create \
    --name=registry \
    --publish=5000:5000/tcp \
    --mount=type=bind,src=/nfs/shared/registry,dst=/var/lib/registry \
    registry:2
else
  docker service create \
    --name=registry \
    --publish=5000:5000/tcp \
    --mount=type=bind,src=/nfs/shared/registry,dst=/var/lib/registry \
    registry:2
fi
