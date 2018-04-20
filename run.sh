#!/bin/bash

set -e

neo_image_name=${NEO_IMAGE_NAME:-mlnx-neo}
neo_container_name=${NEO_CONTAINER_NAME:-mlnx_neo}
neo_startup_config_path=${NEO_STARTUP_CONFIG_PATH:-}

extra_volumes=""
if [[ -n $neo_startup_config_path ]] then
   extra_volumes=" -v $neo_startup_config_path:/usr/bin/mlnx-neo-configure"
fi

# Start the NEO container.
docker run \
    --detach \
    --name $neo_container_name \
    --network host \
    --privileged \
    -v /dev/log:/dev/log \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    $extra_volumes \
    $neo_image_name
