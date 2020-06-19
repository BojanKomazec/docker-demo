# docker-demo
Demo project for exploring various Docker features

## docker build

### ARG and --build-arg

ARG and --build-arg make Dockerfile being configurable from docker build command line.

We can set ARGs default values and use them:
```
../docker-demo$ docker build --pull -t docker-demo .
Sending build context to Docker daemon  53.76kB
Step 1/4 : ARG DOCKER_REPOSITORY_URL=docker.io
Step 2/4 : ARG NODE_DOCKER_IMAGE_TAG=13-alpine
Step 3/4 : FROM ${DOCKER_REPOSITORY_URL}/node:${NODE_DOCKER_IMAGE_TAG} as node_cache
13-alpine: Pulling from library/node
Digest: sha256:527c70f74817f6f6b5853588c28de33459178ab72421f1fb7b63a281ab670258
Status: Downloaded newer image for node:13-alpine
 ---> 8216bf4583a5
Step 4/4 : RUN node --version
 ---> Running in 5ab2beddaeab
v13.14.0
Removing intermediate container 5ab2beddaeab
 ---> fe2a8d890400
Successfully built fe2a8d890400
Successfully tagged docker-demo:latest
```

We can set ARGs values from command line via `--build-arg`. Notice here how the output still shows default ARGs values although they actually took values passed from the command line (see that reported `node` version is different):
```
./docker-demo$ docker build --pull --build-arg NODE_DOCKER_IMAGE_TAG=14-alpine -t docker-demo .
Sending build context to Docker daemon  53.76kB
Step 1/4 : ARG DOCKER_REPOSITORY_URL=docker.io
Step 2/4 : ARG NODE_DOCKER_IMAGE_TAG=13-alpine
Step 3/4 : FROM ${DOCKER_REPOSITORY_URL}/node:${NODE_DOCKER_IMAGE_TAG} as node_cache
14-alpine: Pulling from library/node
cbdbe7a5bc2a: Already exists
fb0e3739aee1: Pull complete
738de7869598: Pull complete
ffd68be3d86c: Pull complete
Digest: sha256:c247e6ad0a4a40ca7b83ef6de8af3be3e43c05e458370054c3a17e8fcae50aa8
Status: Downloaded newer image for node:14-alpine
 ---> 3bf5a7d41d77
Step 4/4 : RUN node --version
 ---> Running in 1861adf1aee9
v14.4.0
Removing intermediate container 1861adf1aee9
 ---> 0d40352f017b
Successfully built 0d40352f017b
Successfully tagged docker-demo:latest
```
