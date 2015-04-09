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
        texinfo texlive \
        zlib1g-dev && \
    apt-get clean
