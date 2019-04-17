FROM bitnami/minideb@sha256:458310407c2cb0bc592d57560de97411e3e36b6e1fe45d13595533769f4d3dd3

RUN printf "deb http://snapshot.debian.org/archive/debian/20170924T211901Z/ jessie main\ndeb-src http://snapshot.debian.org/archive/debian/20170924T211901Z/ jessie main\ndeb http://snapshot.debian.org/archive/debian/20170924T211901Z/ jessie-updates main\ndeb-src http://snapshot.debian.org/archive/debian/20170924T211901Z/ jessie-updates main\n" \
        > /etc/apt/sources.list && \
    printf "Acquire::Check-Valid-Until \"0\";" > /etc/apt/apt.conf.d/10-no-check

RUN echo "deb http://emdebian.org/tools/debian/ jessie main" > /etc/apt/sources.list.d/crosstools.list && \
    apt-key adv --fetch-keys http://emdebian.org/tools/debian/emdebian-toolchain-archive.key && \
    dpkg --add-architecture powerpc

RUN install_packages crossbuild-essential-powerpc

RUN mkdir /files
COPY qemu-ppc-static /files/run
COPY note /files
ENV PATH="/files:$PATH"

WORKDIR /workdir

ENTRYPOINT [ "/bin/bash" ]
