#Openswan Docker for AWS

Using: 

docker build -t openswan-docker-aws .

docker run -e LEFT_PUB_IP=127.0.0.1 -e LEFT_SUB_NET="127.0.0.0\/24" -e RIGHT_PUB_IP=127.0.0.1 -e RIGHT_SUB_NET="127.0.0.0\/24" -e SECRET="my secrect" --privileged -it docker-openswan-aws