#This is the official Jenkins image from Docker Hub
FROM jenkins/jenkins:lts

#Install Docker
COPY ./install-docker.sh .
USER root
RUN sh install-docker.sh

#Install GCP SDK
RUN curl https://sdk.cloud.google.com > /install.sh
RUN bash /install.sh --disable-prompts --install-dir=/
ENV PATH=/google-cloud-sdk/bin:$PATH

#Switch to Jenkins User
USER jenkins