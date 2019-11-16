# r-plumber-example

## Docker
Install Docker Desktop (docker.com).

### Speed up build
You can greatly speed up the build process by copying linux binaries into your packrat folder.

If you have a previous build, follow these steps. If not, skip down below.
- First, create a container from the last image:
  ```
  docker container create -ti --name myContainer dansterrett/r-plumber-example:latest bash
  ```
- Then, copy the files to your project's packrat folder.
  ```
  docker cp <containerID>:/app/packrat/lib/x86_64-pc-linux-gnu ./packrat/lib
  ```
- Then, remove the container
 ```
 docker container rm <containerID>
 ```

If you don't have a previous build, then follow these steps to copy the linux binaries
from the r-plumber-packrat image.
- Create a container from the r-plumber-packrat image
  ```
  docker container create -ti --name r-plumber-packrat dansterrett/r-plumber-packrat:3.6.1 bash
  ```
- Then, copy the files to your project's packrat folder
  ```
  docker cp <containerID>:/usr/local/lib/R/site-library/ ./packrat/lib/x86_64-pc-linux-gnu/3.6.1
  ```
  - Then, remove the container
   ```
   docker container rm <containerID>
   ```

### Create docker image
Note: Before creating the docker image, make sure to implement the steps in the "Speed up build" section above.

To create the docker image, run:
```
docker build -t dansterrett/r-plumber-example .
```

### Run docker container from image
To run the image in a container, run:
```
docker run --rm --detach -p 8000:8000 dansterrett/r-plumber-example:latest
```
If you get an error on startup, you might want to try creating the container first. Then, starting it:
```
docker container create -ti dansterrett/r-plumber-example:7 bash
docker container start <containerID>

# Example code for inspecting the files
docker exec <containerID> ls -al /
```

### View files on container
You can execute various commands on a running container. To view the files:
```
docker exec <containerID> ls -al
```

## Deploy
The deployment process is a series of steps.
1. Create a new docker image from the most recent code.
2. Tag the image to contain the repo URI from AWS ECR.
3. Push the image to AWS ECR.
4. Create a cluster (if one doesn't already exist) on AWS ECS.
5. Create a new task definition on AWS ECS.
6. Run the task.

### Push to AWS ECR

### Create Cluster

### Create Task Definition

A task belongs to a Network Interface which belongs to a Security Group which has inbound/outbound rules. Make sure the inbound rules open the ports that we need.

### Run Task







## Pivotal Cloud Foundry
The following files are only used for Pivotal Cloud Foundry:
- index.r (It's the starting file)
- manifest.yml
- r.yml (Tells Cloud Foundry which dependencies to install)
