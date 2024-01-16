FROM i386/ubuntu:16.04

RUN apt -y update && apt -y install \
	build-essential \
	git \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/workspace
WORKDIR /root

COPY support /opt/
RUN cd /opt/ && unzip gcw0-toolchain.zip && rm gcw0-toolchain.zip

VOLUME /root/workspace
WORKDIR /root/workspace

ENV PATH="/opt/gcw0-toolchain/usr/bin:${PATH}:/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/bin"
ENV CROSS_COMPILE=/opt/gcw0-toolchain/usr/bin/mipsel-gcw0-linux-uclibc-
ENV PREFIX=/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr
ENV UNION_PLATFORM=gkdpixel

CMD ["/bin/bash"]