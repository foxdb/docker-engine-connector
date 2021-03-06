# docker-engine-connector

## Setup

1. Generate required SSL certs with `generate-ssl-certs.sh`
1. Initialise your local swarm, create secrets and start the swarm with `init-swarm.sh`

## Test

### with cURL

```bash
curl 'https://localhost:2376/info' --cert ./client-cert/docker-daemon-client.pem -k
```

### with a Typescript client

Example code for a typescript client is given in `examples/ts-client`.

`yarn && yarn test` in the `examples/ts-client` directory will run a test request against the local swarm, authenticated with the generated certs.

### with a Python 3 client

Example code for a python client is given in `examples/python-client`.

`python test.py` in the `examples/python-client` directory will run a test request against the local swarm, authenticated with the generated certs.
