# ARC Toolchain Builder - Windows
#
# Version	1.0

FROM		ubuntu:14.04
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
        mingw-w64 \
        software-properties-common \
        texinfo texlive \
        wget \
        zip zlib1g-dev && \
    apt-get clean

# Get patchelf
RUN wget http://nixos.org/releases/patchelf/patchelf-0.8/patchelf-0.8.tar.bz2 && tar -xf patchelf-0.8.tar.bz2
WORKDIR patchelf-0.8
RUN ./configure && make && make install
RUN ln --symbolic /usr/local/bin/patchelf /bin/patchelf

# Make Git work
RUN git config --system http.proxy  http://proxy-us.intel.com:911
RUN git config --system https.proxy http://proxy-us.intel.com:912
RUN git config --system user.name "ARC Toolchain Builder"
RUN git config --system user.email "no@email.com"
