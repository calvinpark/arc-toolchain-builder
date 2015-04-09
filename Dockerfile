# ARC Toolchain Builder - Linux 64
#
# Version	1.0

FROM		ubuntu:12.04
MAINTAINER	Calvin Sangbin Park <calvinspark@gmail.com>

# Use bash. I like bash.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install the dependencies.
RUN apt-get update && \
    apt-get install -y \
		build-essential byacc \
		flex \
		git-core \
		libexpat1-dev libncurses5-dev libx11-dev \
        software-properties-common \
        texinfo texlive \
        wget \
        zlib1g-dev && \
    apt-get clean

# Get patchelf
RUN wget http://nixos.org/releases/patchelf/patchelf-0.8/patchelf-0.8.tar.bz2 && tar -xf patchelf-0.8.tar.bz2
WORKDIR patchelf-0.8
RUN ./configure && make && make install
RUN ln --symbolic /usr/local/bin/patchelf /bin/patchelf