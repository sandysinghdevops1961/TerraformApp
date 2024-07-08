#!/bin/bash

sudo su -

sudo apt-get update -y

sudo apt install openjdk-11-jdk -y

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

sleep 3000

#email setting
pwd= cat /var/lib/jenkins/secrets/initialAdminPassword
subject= "Jenkins Email"
fromEmail="sandygsingh1961@gmail.com"
toEmail="sandygsingh1961@gmail.com"

apt install sendemail -y
#end email setting
sendemail -f $fromEmail -t $fromEmail -u $subject -m $pwd -s smtp.gmail.com:587 -o tls=yes -xu sandygsingh1961@gmail.com -xp "stul vriw goep xfeq"
