#!/bin/bash

set -e

neo_image_name=${NEO_IMAGE_NAME:-mlnx-neo}
neo_container_name=${NEO_CONTAINER_NAME:-mlnx_neo}

# Start the NEO container.
docker run \
    --detach \
    --name $neo_container_name \
    --network host \
    --privileged \
    -v /dev/log:/dev/log \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    $neo_image_name \
