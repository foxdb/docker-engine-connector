# docker-engine-connector

## Setup

1. Generate required SSL certs with `generate-ssl-certs.sh`
1. Initialise your local swarm, create secrets and start the swarm with `init-swarm.sh`

## Test

### with cURL

```bash
curl 'https://localhost:2376/info' --capath ./server-cert/docker-daemon-server.crt --cert ./client-cert/docker-daemon-client.pem -k
```

### with a Typescript client

Example code for a typescript client is given in `examples/ts-client`.

`yarn && yarn test` in the `examples/ts-client` directory will run a test request against the local swarm, authenticated with the generated certs.
