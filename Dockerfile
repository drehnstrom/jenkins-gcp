# This is the official Jenkins image from Docker Hub
FROM jenkins/jenkins:lts

# Install Docker
COPY ./install-docker.sh .
USER root
RUN sh install-docker.sh

# Install GCP SDK
RUN curl https://sdk.cloud.google.com > /install.sh
RUN bash /install.sh --disable-prompts --install-dir=/
ENV PATH=/google-cloud-sdk/bin:$PATH

# Install Terraform
RUN mkdir /tf
RUN curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip > terraform.zip
RUN unzip -o terraform.zip
RUN cp ./terraform tf/
ENV PATH=/tf:$PATH


# Install Node js
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# Switch to Jenkins User
USER jenkins