FROM ubuntu:14.04

MAINTAINER Josh Wulf "josh@magikcraft.io"

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update && apt-get install -y wget git curl pip zip monit openssh-server git ca-certificates daemon net-tools lsof nano lftp

# Node related
# ------------

RUN echo "# Installing Nodejs" && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install nodejs build-essential -y && \
    npm set strict-ssl false && \
    npm install -g npm@latest && \
    npm install -g bower grunt grunt-cli && \
    npm -g install gulp-cli gulp && \
    npm cache clear -f && \
    npm install -g n && \
    n stable
