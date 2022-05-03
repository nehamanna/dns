# Pull base image.
FROM ubuntu:latest

RUN \
# # Update
apt-get update -y && \
# # Install Unzip
# apt-get install unzip -y && \
# # need wget
apt-get install wget -y && \
# # vim
apt-get install vim -y

# ################################
# # Install Terraform
# ################################

# # Download terraform for linux
# RUN wget https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

# # Unzip
# RUN unzip terraform_0.11.11_linux_amd64.zip

# # Move to local bin
# RUN mv terraform /usr/local/bin/
# # Check that it's installed
# RUN terraform --version 

# ################################
# # Install python
# ################################

# RUN apt-get install -y python3-pip
# #RUN ln -s /usr/bin/python3 python
# RUN pip3 install --upgrade pip
# RUN python3 -V
# RUN pip --version

# ################################
# # Install AWS CLI
# ################################
# RUN pip install awscli --upgrade --user

# # add aws cli location to path
# ENV PATH=~/.local/bin:$PATH

# # # Adds local templates directory and contents in /usr/local/terrafrom-templates
# # ADD templates /usr/local/bin/templates

# # RUN mkdir ~/.aws && touch ~/.aws/credentials

################################
# Install Docker CLI
################################
RUN apt-get update && \
    apt-get -qy full-upgrade && \
    apt-get install -qy curl && \
    apt-get install -qy curl && \
    curl -sSL https://get.docker.com/ | sh


################################
# Install Git and clone
################################
RUN apt update
RUN apt install -y git
RUN pwd
RUN git clone https://gitlab.com/kitos9112/terraform-module-dns-updater.git