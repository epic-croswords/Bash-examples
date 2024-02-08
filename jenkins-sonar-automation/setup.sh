#!/bin/bash

set -x

if [[ $EUID -ne 0 ]]; then
    echo "this script must be run as root" 1>&2
    exit 1
fi 

# Updates on ubuntu machine & install pakages
sudo apt-get update && apt-get upgrade -y
sudo apt-get install maven -y
sudo apt-get install ca-certificate curl gnupg -y 
sudo apt-get install docker.io docker-compose -y 
sudo apt-get install vim -y
sudo apt install openjdk-17-jdk -y

#service start-enable docker 
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker

# install jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

#service enable-start jenkins 
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo systemctl restart docker

#installing running sonarqube community docker container.
docker run -itd -p 9000:9000 sonarqube:lts-community 
