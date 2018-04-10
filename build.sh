#!/bin/bash

set -e

neo_tarball_url=${NEO_TARBALL_URL:?Set \$NEO_TARBALL_URL to the location of the NEO software}
neo_image_tag=${NEO_IMAGE_TAG:-mlnx-neo}

docker build \
  -f Dockerfile \
  -t $neo_image_tag \
  --build-arg neo_tarball_url=$neo_tarball_url \
  .
