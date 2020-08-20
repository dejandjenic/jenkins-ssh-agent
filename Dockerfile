FROM jenkins/ssh-agent
ENV KUBE_LATEST_VERSION="v1.18"
RUN  curl -sSL https://get.docker.com/ | sh
RUN apt-get update
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \