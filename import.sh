#!/bin/bash

# NOTE: The image provided by mellanox does not seem to work. It does not have
# NEO installed.

set -e

neo_image_tar=mlnxneo.tar

docker load -i $neo_image_tar
