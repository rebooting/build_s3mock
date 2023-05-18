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
