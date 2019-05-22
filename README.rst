=========================
Mellanox NEO Docker Image
=========================

This repository provides tooling to build a Docker image for the Mellanox NEO
SDN controller.

The image is based on the ``centos/systemd`` image, in order to run multiple
NEO services in a single container, using the existing NEO init scripts.

Usage
=====

Building the Image
------------------

The Dockerfile expects a tarball containing the NEO software to be available
via HTTP. The URL of this tarball should be set via ``$NEO_TARBALL_URL``.

By default, the built image will be tagged as ``mlnx-neo:latest``. To use a
different tag, set ``$NEO_IMAGE_TAG``.

Run the ``build.sh`` script to build a Docker image.

Running a Container from the Image
----------------------------------

By default the image tagged as ``mlnx-neo:latest`` will be used to create the
container. To use a different image, set ``$NEO_IMAGE_NAME``.

By default, the container will be named ``mlnx_neo``. To use a different name,
set ``$NEO_CONTAINER_NAME``.

It may be desirable to apply additional configuration to NEO prior to running
the neo service. This can be done by setting ``$NEO_STARTUP_CONFIG_PATH`` to
the path of a script.

Run the ``run.sh`` script to create a Docker container. The container will be
privileged, and use host networking.

Alternatively, use the
[mlnx-neo role](https://galaxy.ansible.com/stackhpc/mlnx-neo) to deploy the
container.
