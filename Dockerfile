# This is the official Jenkins image from Docker Hub
FROM jenkins/jenkins:lts

USER root

# Install Docker
#COPY ./install-docker.sh .
#RUN sh install-docker.sh

# Install GCP SDK
RUN curl https://sdk.cloud.google.com > /install.sh
RUN bash /install.sh --disable-prompts --install-dir=/
ENV PATH=/google-cloud-sdk/bin:$PATH

# Install kubectl
RUN gcloud components install kubectl

# Install Terraform
RUN mkdir /tf
RUN curl https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip > terraform.zip
RUN unzip -o terraform.zip
RUN cp ./terraform tf/
ENV PATH=/tf:$PATH


# Install Node js
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# Switch to Jenkins User
USER jenkins