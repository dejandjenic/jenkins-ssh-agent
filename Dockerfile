FROM jenkins/ssh-agent
RUN  curl -sSL https://get.docker.com/ | sh
RUN apt-get update