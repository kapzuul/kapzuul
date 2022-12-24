#!/bin/bash

# Because we're doing stuff with apt-get here we need to run this script with either sudo or root.
[ ! $(whoami) == 'root' ] && echo "ERROR: Must run with sudo or as root" && exit 1

# Install the pre-requisites
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release

# Download the gpg key for the docker apt repository
[ ! -d /etc/apt/keyrings ] && mkdir -p /etc/apt/keyrings
[ ! -f /etc/apt/keyrings/docker.gpg ] && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Install the docker apt repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(dpkg --status tzdata|grep Provides|cut -f2 -d'-') stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Install docker
apt-get install -y docker-ce docker-ce-cli containerd.io

wget -O /usr/sbin/kapzuul https://github.com/kapzuul/kapzuul/releases/latest/download/kapzuul_debian11_amd64
chmod +x /usr/sbin/kapzuul