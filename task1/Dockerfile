# a linux container for kaspersky-os development

# build with:
# docker build -t kaspersky-os .

# run with:
# docker run -dit --rm -v $(pwd)/volume/workspace:/workspace -v $(pwd)/volume/root:/root kaspersky-os

FROM debian:10.12
# FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install kaspersky-os-sdk dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get --fix-broken install -y && \
    apt-get install -y \
    git \
    vim \
    make \
    cmake \
    mosquitto \
    mosquitto-clients \
    wget

# install Kaspersky OS SDK
COPY KasperskyOS-Community-Edition_1.1.0.356_amd64.deb /tmp/KasperskyOS-Community-Edition_1.1.0.356_amd64.deb
RUN  apt-get install -y /tmp/KasperskyOS-Community-Edition_1.1.0.356_amd64.deb


# create volume for user data
WORKDIR /workspace
VOLUME /workspace
VOLUME /root

# set entrypoint
ENTRYPOINT ["/bin/bash"]
