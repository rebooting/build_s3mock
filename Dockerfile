FROM debian:bullseye-slim
# install jdk 17
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    maven \
    git \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN git clone https://github.com/adobe/S3Mock.git && cd S3Mock && \
    git checkout 69425173da85363f8c60a58be37376c763d30045 && \
    ./mvnw clean install -DskipDocker  -DskipTests

FROM public.ecr.aws/docker/library/golang:1.20.4-bullseye
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    maven \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=0 /app/S3Mock/docker/target/s3mock-exec.jar /app/s3mock-exec.jar