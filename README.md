build docker image for ssh-slave with docker

install jenkins host

docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts


run docker on agent host
sudo dockerd -H tcp://192.168.0.170:2375 -H unix:///var/run/docker.sock --insecure-registries 192.168.0.173:32138


generate private pub key

add credentials username + ssh on jenkins


install docker plugin

configure docker jenkins

name:docker-agent
tcp://192.168.0.170:2375


docker agent template

name: docker-agent
labels:docker-agent
image:192.168.0.173:32138/ssh-agent
root file system:/home/jenkins
volumes:/var/run/docker.sock:/var/run/docker.sock
enviorment:JENKINS_AGENT_SSH_PUBKEY=ssh-rsa ...



add project

git: ...
restrict to:docker-agent
build command:
ls 

docker info 

docker build -t jenkins-demo:${BUILD_NUMBER} . 

docker tag jenkins-demo:${BUILD_NUMBER} jenkins-demo:latest 
docker tag jenkins-demo:${BUILD_NUMBER} 192.168.0.173:32138/jenkins-demo:latest 

docker images

docker push 192.168.0.173:32138/jenkins-demo:latest


###########

build project