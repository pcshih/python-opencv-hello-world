# base image
FROM ubuntu:18.04

# to handle tzdata select zone problem
ENV DEBIAN_FRONTEND="noninteractive"

# user infomation
ARG GID
ARG USER_NAME
ARG UID

# to install some package(setup environment)
# add ${USER_NAME} to root group to enable packages path in sys.path
RUN \
groupadd -g ${GID} ${USER_NAME} && \
useradd --create-home --uid ${UID} --gid ${GID} --shell /bin/bash ${USER_NAME} && \
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