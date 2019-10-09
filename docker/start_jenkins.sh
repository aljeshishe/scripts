#!/bin/bash

# read https://github.com/jenkinsci/docker/blob/master/README.md
docker run -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts