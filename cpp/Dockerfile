FROM base:1.0
LABEL maintainer="elau89@gmail.com" \
      version="1.0" \
      description="Updated Base image for C++ projects"

# Specify packages
ENV BOOST_DIR=boost-1.63.0 \
    POSTGRESQL_DIR=postgresql-9.6.2 \
    PROTOBUF_DIR=protobuf-3.2.0 \
    ZEROMQ_DIR=zeromq-4.2.1

# Install required build tools
RUN echo "fastestmirror=true" >> /etc/dnf/dnf.conf && \
    dnf install -y \
        autoconf \
        automake \
        bzip2 \
        bzip2-devel \
        cmake \
        file \
        gcc-c++ \
        glibc-devel \
        gnupg \
        gzip \
        libtool \
        libunwind \
        make \
        readline-devel \
        tar \
        wget \
        which \
        xz \
        zlib-devel \
        zip && \
    dnf autoremove -y && \
    dnf clean all -y && \
    mkdir -p /tmp/packages

# Copy Packages
COPY packages/ /tmp/packages/

# Build Boost
RUN cd /tmp/packages && \
    tar -xJf ${BOOST_DIR}.tar.xz && \
    cd ${BOOST_DIR} && \
    ./bootstrap.sh && \
    ./b2 -j 4 link=shared runtime-link=shared install

# Build libpq
RUN cd /tmp/packages && \
    tar -xJf ${POSTGRESQL_DIR}.tar.xz && \
    cd ${POSTGRESQL_DIR} && \
    ./configure --prefix=/usr/local && \
    make -C src/interfaces install

# Install Protobufs
RUN cd /tmp/packages && \
    tar -xJf ${PROTOBUF_DIR}.tar.xz && \
    cd ${PROTOBUF_DIR} && \
    ./autogen.sh && ./configure && make -j 4 && make install

# Install ZeroMQ
RUN cd /tmp/packages && \
    tar -xJf ${ZEROMQ_DIR}.tar.xz && \
    cd ${ZEROMQ_DIR} && \
    ./autogen.sh && ./configure && make -j 4 && make install

RUN ldconfig -v

# Start up bash (will be overwritten when imported as a dependency)
CMD ["/bin/bash"]
