# Overview

This project defines a Docker image that allows development in an Ubuntu VM using IntelliJ IDEA, Java 8, Git, Maven etc,
accessed directly via X (local:).


## Initial setup

- docker build -t darashenka/intellij:latest .

## Starting

- start with "starter"


# Notes

- The VM is based on Ubuntu 14.04 (Trusty Tahr) with Oracle Java 8 and IntelliJ IDEA 14.1 EE added.
- The user home directories ".IntelliJIdea14" and "src" is mapped to the host path set when starting, so will be preserved between
restarts 

