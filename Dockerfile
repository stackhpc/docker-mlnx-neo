# Docker image for Mellanox NEO.

FROM centos/systemd
MAINTAINER StackHPC

# URL of NEO software tarball.
ARG neo_tarball_url

# Set an environment variable to tell systemd it's running under Docker.
ENV container=docker

# Systemd does not terminate on SIGTERM.
STOPSIGNAL SIGRTMIN+3

# Download the NEO tarball.
ADD $neo_tarball_url /

# Additional NEO dependencies found through testing.
RUN yum install -y \
    gcc \
    initscripts \
    python-devel \
    which \
    && yum clean all

# Extract the NEO tarball.
RUN neo_tarball=$(basename $neo_tarball_url) \
    && tar -xzf $neo_tarball \
    && rm $neo_tarball

# Install NEO
RUN /neo/neo-installer.sh

# Add a systemd unit for the NEO service.
ADD neo.service /usr/lib/systemd/system/

# Enable the neo systemd service.
RUN systemctl enable neo
