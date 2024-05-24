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
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

#service enable-start jenkins 
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo systemctl restart docker

#installing running sonarqube community docker container.
docker run -itd -p 9000:9000 sonarqube:lts-community

echo "press 0 for install, 1 for quit"
read $NUM

sleep 1
if [[ $NUM -eq 0 ]]
then

echo "" 
echo "installing dependancy tru apt"
sudo apt-get install wget apt-transport-https gnupg lsb-release -y

echo ""
echo ""
echo "adding repo of trivy"
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
echo ""
echo ""

echo "repo update again"
sudo apt-get update

echo ""
echo "installing trivy"
sudo apt-get install trivy

elif [[ $NUM -eq 1 ]]
then
	exit 0
	
else 
	echo "off"
fi
