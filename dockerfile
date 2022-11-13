# a linux container for kaspersky-os development

# build with:
# docker build -t kaspersky-os .

# run with:
# docker run -it --rm -v $(pwd)/user:/home/hacker kaspersky-os

FROM ubuntu:20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install kaspersky-os-sdk dependencies
RUN apt-get update && \
    apt-get upgrade && \
    apt-get --fix-broken install && \
    apt-get install -y \
    vim \
    make \
    cmake \
    wget

# install Kaspersky OS SDK
COPY kaspersky-os-sdk.deb /tmp/kaspersky-os-sdk.deb
RUN  apt-get install -y /tmp/kaspersky-os-sdk.deb

# add user with sudo
RUN useradd -ms /bin/bash hacker
RUN echo 'hacker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER hacker
WORKDIR /home/hacker
# create volume for user data
VOLUME /home/hacker

# set entrypoint
ENTRYPOINT ["/bin/bash"]
