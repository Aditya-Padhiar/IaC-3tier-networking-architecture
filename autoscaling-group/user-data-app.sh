#!/bin/bash -xe
sudo su
sudo yum update -y
amazon-linux-extras install java-openjdk11 -y
amazon-linux-extras install tomcat9 -y
tomcat start
