FROM jenkins/jenkins:lts
COPY ./install-docker.sh .
COPY ./install-gcloud.sh .
USER root
RUN sh install-docker.sh
RUN sh install-gcloud.sh
# drop back to the regular jenkins user - good practice
USER jenkins