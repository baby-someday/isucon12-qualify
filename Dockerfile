FROM --platform=linux/amd64 ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    software-properties-common \
    && apt-get update \
    && apt-get install -y \
    git \
    curl \
    libreadline-dev \
    pkg-config \
    autoconf \
    automake \
    build-essential \
    libmysqlclient-dev \
    libssl-dev \
    python3 \
    python3-dev \
    python3-venv \
    openjdk-8-jdk-headless \
    libxml2-dev \
    libcurl4-openssl-dev \
    libxslt1-dev \
    re2c \
    bison \
    libbz2-dev \
    libreadline-dev \
    libssl-dev \
    gettext \
    libgettextpo-dev \
    libicu-dev \
    libmhash-dev \
    libmcrypt-dev \
    libgd-dev \
    libtidy-dev \
    nginx \
    wget \
    sudo \
    graphviz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m ubuntu

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN cd /home/ubuntu \
    && git clone https://github.com/tagomoris/xbuild.git \
    && mkdir local \
    && xbuild/go-install -f 1.18.1 /home/ubuntu/local/go

ENV PATH /home/ubuntu/local/go/bin:/home/ubuntu/go/bin:$PATH

RUN cd /home/ubuntu \
    && wget https://download.redis.io/releases/redis-6.2.7.tar.gz \
    && tar xvzf redis-6.2.7.tar.gz \
    && cd redis-6.2.7 \
    && make \
    && make install

COPY docker/app/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER ubuntu

RUN go install github.com/go-delve/delve/cmd/dlv@latest

USER root

WORKDIR /home/ubuntu/webapp