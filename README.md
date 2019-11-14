# r-plumber-example

## Docker
Install Docker Desktop (docker.com).

### Create docker image
docker build -t dansterrett/r-plumber-example .

### Run docker container from image
docker run --rm --detach -p 8000:8000 dansterrett/r-plumber-example:latest

### Copy linux binaries back into project (greatly speeds up future builds since these binaries are copied to the new image rather than reinstalling them)
docker cp 338cc7017b:/app/packrat/lib/x86_64-pc-linux-gnu ./packrat/lib

## Pivotal Cloud Foundry
The following files are only used for Pivotal Cloud Foundry:
- index.r (It's the starting file)
- manifest.yml
- r.yml (Tells Cloud Foundry which dependencies to install)
