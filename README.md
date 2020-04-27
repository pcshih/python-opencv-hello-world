# python-opencv-hello-world

## Build image
```
$ docker build \
--build-arg GID=$(id -g) \
--build-arg USER_NAME=${USER} \
--build-arg UID=$(id -u) \
--build-arg PWD=${PWD} \
--tag pt/python-opencv-hello-world:latest .
```

## Run as container
```
$ docker run \
-it \
--volume ${PWD}:${PWD} \
--name opencv-hello-world \
pt/python-opencv-hello-world:latest
```