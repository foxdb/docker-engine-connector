#!/bin/bash

docker swarm init --advertise-addr fd4b:f465:ab68:0:7032:b33b:db34:8a43

# Create secrets
docker secret create docker_daemon_server_pem ./server-cert/docker-daemon-server.pem
docker secret create docker_daemon_client_crt ./client-cert/docker-daemon-client.crt

# Deploy the socat container
docker stack deploy -c docker-compose.yml docker-engine-connector