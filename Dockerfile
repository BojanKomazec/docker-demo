ARG DOCKER_REPOSITORY_URL=docker.io
ARG NODE_DOCKER_IMAGE_TAG=13-alpine
FROM ${DOCKER_REPOSITORY_URL}/node:${NODE_DOCKER_IMAGE_TAG} as node_cache

RUN node --version