# Kaspersky hackathon environment

This is a docker container that comes with Kaspersky-os-sdk

# How to run

1. Download kaspersky sdk from [here](https://ds.mai307.ru/s/CrM38T9X2LtABnZ/download/KasperskyOS-Community-Edition_1.1.0.356_amd64.deb) and save it in the same directory as the Dockerfile and rename it to `kaspersky-os-sdk.deb`

2. Build docker image

```
docker build -t kaspersky-env .
```

3. Run docker container

```
docker run -it --rm -v $(pwd)/user:/home/hacker kaspersky-env
```

This command will use folder named `user` in current directory as a volume, i.e. it will store user data in this folder.

If you want to use another folder, change `$(pwd)/user` to full path on your local machine
