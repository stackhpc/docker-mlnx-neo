#!/bin/bash

set -e

neo_image_name=${NEO_IMAGE_NAME:-mlnx-neo}
neo_container_name=${NEO_CONTAINER_NAME:-mlnx_neo}
neo_volume_name=${NEO_CONTAINER_NAME:-mlnx_neo_data}
neo_startup_config_path=${NEO_STARTUP_CONFIG_PATH:-}

extra_volumes=""
if [[ -n $neo_startup_config_path ]]; then
   extra_volumes=" -v $neo_startup_config_path:/usr/bin/mlnx-neo-configure"
fi

# Volume for persistent NEO data
if [[ -z $(docker volume ls --filter name=$neo_volume_name -q) ]]; then
    docker volume create $neo_volume_name
fi

# Start the NEO container.
docker run \
    --detach \
    --name $neo_container_name \
    -p 443:443 \
    -p 162:162/tcp \
    -p 162:162/udp \
    -p 7654:7654 \
    --tmpfs /run \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v $neo_volume_name:/opt/neo/files \
    $extra_volumes \
    $neo_image_name
