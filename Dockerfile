# base image
FROM ubuntu:18.04

# to handle tzdata select zone problem
ENV DEBIAN_FRONTEND="noninteractive"

# to install some package(setup environment)
RUN \
apt-get update -y && \
apt-get install -y zsh wget git nano && \
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:deadsnakes/ppa && \
apt-get update -y && \  
apt-get install -y python3.6 python3.6-dev python3-pip && \
pip3 install --upgrade pip && \
apt-get install -y python3-opencv && \
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
dpkg-reconfigure -f noninteractive tzdata

# work dir in container
WORKDIR /python-opencv-hello-world

# start zsh
CMD ["zsh"]