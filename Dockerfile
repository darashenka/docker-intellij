# Based on Ubuntu 14.04 Trust Tahr base image
FROM ubuntu:trusty

MAINTAINER Andrei Darashenka

ENV DEBIAN_FRONTEND=noninteractive


# Configure apt to make Oracle Java and Google Chrome available, update, upgrade, and install packages
RUN apt-get update && apt-get -y install \
        software-properties-common \
        wget \
        git ssh-client \
        vim \
        libxrender1 libxtst6 libxi6 && \
    apt-get clean

# Install Oracle Java 8, accepting the license, and set up env variables and Java defaults
RUN    add-apt-repository ppa:webupd8team/java && apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    apt-get -y -q install \
        oracle-java8-installer \
        oracle-java8-set-default \
        maven && \
    apt-get clean && \
    update-java-alternatives -s java-8-oracle


# Install IntelliJ IDEA
RUN wget http://download.jetbrains.com/idea/ideaIU-14.1.6.tar.gz -O /tmp/intellij.tar.gz -q && \
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm /tmp/intellij.tar.gz

ENV USER=dev
ENV UID=1000
ENV GID=1000

# Convenience scripts
COPY entrypoint /entrypoint
COPY starter /scripts/starter
ENTRYPOINT ["/entrypoint"]
