# mobile-docker

Dockerfiles for creating a Samland mobile network

## Requirements

* Docker
* Git

## Getting `mobile-docker`

Use the following command

```bash
git clone --recursive https://github.com/Samland-Gov/mobile-docker.git
```
## Build docker images

1. Navigate into `docker-open5gs`

```bash
cd mobile-docker/third_party/docker-open5gs
```

2. Make the images

```bash
make all
```

## Starting the network

Make sure you are inside the `mobile-docker` folder and not any other folder.

### With `docker compose` (v2)

```bash
# Example using docker compose (v2)
docker compose --env-file=.env up -d
```

### With `docker-compose` (v1)

```bash
# Example using the docker-compose (v1)
docker-compose --env-file=.env up -d
```