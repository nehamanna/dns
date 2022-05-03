#!/usr/bin/env bash
#+++++++++++++++++++
## Description: This script builds the local dns-server Docker image (tagged as "terraform-dns-ns-tests"), then run the container with the `--rm` Docker flag and attaches a console to it to see logs in real time.
## Author: Marcos Soutullo
## Requirements:
##   - docker

set -o nounset
set -o errexit
set -o errtrace
set -o pipefail

_exit_1() {
    {
        printf "%s " "$(tput setaf 1)!$(tput sgr0)"
        "${@}"
    } 1>&2
    exit 1
}

_log() {
    m_time=$(date "+%F %T")
    echo $m_time" "$1
}
_return_1() {
    {
        printf "%s " "$(tput setaf 1)!$(tput sgr0)"
        "${@}"
    } 1>&2
    return 1
}

# Set $IFS to only newline and tab.
IFS=$'\n\t'

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
SCRIPT_DIR="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
CONTAINER_NAME="terraform-dns-ns-tests"
CONTAINER_TAG="v1.0.0"
EXAMPLE_DOMAIN="example.com"
echo "starting"
_log "Delete any running/paused Docker container to avoid overlapping"
docker rm --force terraform-dns-ns-tests || _log "Container doesn't exist"

_log "Build Docker image to run terraform tests ${SCRIPT_DIR}"
docker build --tag ${CONTAINER_NAME}:${CONTAINER_TAG} ${SCRIPT_DIR}/dns-server

_log "Run the Docker container with systemd enabled and attach to journald service to see the logs in real time"
docker run -d --privileged --tmpfs /tmp --tmpfs /run \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
 #   -v /etc/localtime:/etc/localtime:ro \
    -v ${SCRIPT_DIR}/dns-server/named.conf.none:/etc/named.conf:ro \
    -p 127.0.0.1:53:53 \
    -p 127.0.0.1:53:53/udp \
    --rm --name ${CONTAINER_NAME} --hostname ns.${EXAMPLE_DOMAIN} ${CONTAINER_NAME}:${CONTAINER_TAG}

_log "You can now attach a console to the recently created container by running the following command"
echo
echo "docker exec -it terraform-dns-ns-tests bash -c 'journalctl -f -u named.service