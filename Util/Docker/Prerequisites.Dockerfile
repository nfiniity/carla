FROM adamrehn/ue4-full:custom

USER root

ENV UE4_ROOT /home/ue4/UnrealEngine

RUN apt-get update && apt-get install -y --no-install-recommends \
        ninja-build \
        python \
        python-pip \
        python-dev \
        libtiff5-dev \
        libjpeg-dev \
        sed \
        automake \
        libtool \
        rsync \
        wget \
        libxml2-dev \
        aria2 && \
    pip3 install distro && \
    rm -rf /var/lib/apt/lists/*

USER ue4
