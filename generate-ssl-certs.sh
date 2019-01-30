mkdir server-cert
openssl genrsa -out ./server-cert/docker-daemon-server.key 1024
openssl req -new -key ./server-cert/docker-daemon-server.key -x509 -days 3653 -out ./server-cert/docker-daemon-server.crt
cat ./server-cert/docker-daemon-server.key ./server-cert/docker-daemon-server.crt >./server-cert/docker-daemon-server.pem
chmod 600 ./server-cert/docker-daemon-server.key ./server-cert/docker-daemon-server.pem

mkdir client-cert
openssl genrsa -out ./client-cert/docker-daemon-client.key 1024
openssl req -new -key ./client-cert/docker-daemon-client.key -x509 -days 3653 -out ./client-cert/docker-daemon-client.crt
cat ./client-cert/docker-daemon-client.key ./client-cert/docker-daemon-client.crt >./client-cert/docker-daemon-client.pem
chmod 600 ./client-cert/docker-daemon-client.key ./client-cert/docker-daemon-client.pem