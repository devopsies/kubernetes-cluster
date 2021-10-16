FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y curl libdigest-sha-perl && \
    apt-get clean

WORKDIR /home/ubuntu/actions-runner
COPY actions-runner-linux-x64.tar.gz actions-runner-linux-x64.tar.gz
RUN tar xzf ./actions-runner-linux-x64.tar.gz && \
    ./bin/installdependencies.sh

RUN useradd ubuntu && chown -R ubuntu:ubuntu /home/ubuntu
USER ubuntu

ARG RUNNER_TOKEN
ARG GITHUB_REPO
RUN ./config.sh --url $GITHUB_REPO --token $RUNNER_TOKEN --unattended --replace

ENTRYPOINT [ "./run.sh" ]
