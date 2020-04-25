#!/usr/bin/env bash

cd ~
PROMETHEUS_IMAGE_NAME=prom/prometheus
PROMETHEUS_CONTAINER_NAME=prometheus
docker stop ${PROMETHEUS_CONTAINER_NAME}
docker rm ${PROMETHEUS_CONTAINER_NAME}
docker run --name ${PROMETHEUS_CONTAINER_NAME} -d -p 9090:9090 -v /home/xhens/prometheus-2.7.1.linux-amd64/prometheus.yml:/etc/prometheus/prometheus.yml ${PROMETHEUS_IMAGE_NAME} --config.file=/etc/prometheus/prometheus.yml
PROMETHEUS_CONTAINER_ID="$(docker ps -qf "name=${PROMETHEUS_CONTAINER_NAME}")"
echo ${PROMETHEUS_CONTAINER_ID}
docker network connect net_test $(docker ps -qf "name=${PROMETHEUS_CONTAINER_NAME}")