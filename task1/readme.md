# Task 1

Download and install special version of SDK KasperskyOS for the hackathon: [https://ds.mai307.ru/s/CrM38T9X2LtABnZ](https://ds.mai307.ru/s/CrM38T9X2LtABnZ.)

We will use Docker container running Debian 10 for the hackathon. The image if build from [Dockerfile](./Dockerfile) and it comes with KasperskyOS SDK installed

## Table of contents
1. [Downloading Kaspersky sdk package](#Downloading_Package)
2. [Environment setup](#Environment_setup)
    1. [Building the docker image](#Building_docker_image)
    2. [Dockerfile content](#Dockerfile_content)
    3. [Running the docker image](#Running_docker_image)

# Downloading Kaspersky sdk package <a name="Downloading_Package"></a>
Download and install KasperskyOS SDK from [here](https://ds.mai307.ru/s/CrM38T9X2LtABnZ) and place it in this directory. We will use it when building the docker image.

# Environment setup <a name="Environment_setup"></a>

We will use Debian 10 docker container for this task. You need to install docker on your host machine. You can find instructions [here](https://docs.docker.com/engine/install/debian/).

## Building docker image <a name="Building_docker_image"></a>

The image is built from the [Dockerfile](./dockerfile). You can build it using the following command:

```bash
docker build -t kaspersky-os .
```

## Dockerfile contents <a name="Dockerfile_content"></a>

1. Pull the Debian 10 image from Docker Hub
```dockerfile
FROM debian:10.12
```

2. Install the required packages
```dockerfile
RUN apt-get update && \
    apt-get upgrade && \
    apt-get --fix-broken install && \
    apt-get install -y \
    git \
    vim \
    make \
    cmake \
    mosquitto \
    mosquitto-clients \
    wget
```

3. Install the KasperskyOS SDK. The `KasperskyOS-Community-Edition_1.1.0.356_amd64.deb` package should be placed in the same directory as the Dockerfile. It is the package from the [link](https://ds.mai307.ru/s/CrM38T9X2LtABnZ) mentioned above.

```dockerfile
COPY KasperskyOS-Community-Edition_1.1.0.356_amd64.deb /tmp/KasperskyOS-Community-Edition_1.1.0.356_amd64.deb
RUN  apt-get install -y /tmp/KasperskyOS-Community-Edition_1.1.0.356_amd64.deb
```

# Running the container <a name="Running_docker_image"></a>

Once the image is built, you can run the container using the following command:

```bash
docker run -dit --rm -v $(pwd)/workspace:/workspace kaspersky-os
```

The docker container is running in the background. To enter the container shell, you can use the following command:

```bash
docker exec -it <container_id> /bin/bash
```

The `<container_id>` is the id of the container. You can find it using the `docker ps` command.

Example:

```bash
$ docker ps
CONTAINER ID   IMAGE          COMMAND       CREATED         STATUS         PORTS     NAMES
3ab1dec4f9fd   kaspersky-os   "bash"        4 seconds ago   Up 3 seconds             crazy_heyrovsky
```

The container id is `3ab1dec4f9fd`. So, the command to enter the container shell is:

```bash
docker exec -it 3ab1dec4f9fd /bin/bash
```

You also can use name of the container instead of id. In this case, you can use the following command:

```bash
docker exec -it crazy_heyrovsky /bin/bash
```

To enter shell with sudo permissions 