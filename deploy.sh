#!/bin/bash

conname="${1}"
vncpasswd="${2}"

[[ -z "${conname}" ]] && {
	conname="vnctest"
}

[[ -z "${vncpasswd}" ]] && {
        vncpasswd="hanoi123"
}

docker network create -o "com.docker.network.bridge.name"=ocrnetwork --subnet=172.172.0.0/16 ocrnetwork
docker rm -f "${conname}"
docker run -idt --name "${conname}" --hostname "${conname}" --network ocrnetwork --ip 172.172.0.101 -p 5900:5900 -e vncpasswd="${vncpasswd}" mannk98/vnc-lxqt
