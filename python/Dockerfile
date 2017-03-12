FROM base:1.0
LABEL maintainer="elau89@gmail.com" \
      version="1.0" \
      description="Updated Base image for C++ projects"

# Specify package versions
ARG BOOST_VERSION=1.63.0
ARG PROTOBUF_VERSION=3.2.0
ARG ZEROMQ_VERSION=4.2.1

# Install required build tools
RUN dnf install -y \
        autoconf \
        automake \
        bzip2 \
        bzip2-devel \
        cmake \
        gcc-c++ \
        glibc-devel \
        gnupg \
        gzip \
        libtool \
        make \
        wget \
        zlib-devel \
        zip && \
    dnf autoremove -y && \
    dnf clean all -y

# Build Boost
#RUN BOOST_URL=http://downloads.sourceforge.net/project/boost/boost; \
#    BOOST_DIR=$(echo "boost_${BOOST_VERSION}" | sed 's/\./_/g'); \
#    BOOST_TAR=${BOOST_DIR}.tar.bz2; \
#    wget ${BOOST_URL}/${BOOST_VERSION}/${BOOST_TAR} && \
#    tar -xjf ${BOOST_TAR} && \
#    rm -f ${BOOST_TAR} && \
#    cd ${BOOST_DIR} && \
#    ./bootstrap.sh && \
#    ./b2 -j 4 link=shared runtime-link=shared install && \
#    cd .. && \
#    rm -fr ${BOOST_DIR}

# Install Protobufs
RUN PROTOBUF_URL=https://github.com/google/protobuf/archive; \
    PROTOBUF_DIR=v${PROTOBUF_VERSION}; \
    PROTOBUF_TAR=${PROTOBUF_DIR}.tar.gz; \
    wget ${PROTOBUF_URL}/${PROTOBUF_TAR} && \
    tar -xzf ${PROTOBUF_TAR} && \
    rm -f ${PROTOBUF_TAR} && \
    cd protobuf-${PROTOBUF_VERSION} && \
    ./autogen.sh && ./configure && make -j 4 && make install && \
    cd .. && \
    rm -fr protobuf-${PROTOBUF_VERSION}

# Install ZeroMQ
RUN ZEROMQ_URL=https://github.com/zeromq/libzmq/releases/download; \
    ZEROMQ_DIR=zeromq-${ZEROMQ_VERSION}; \
    ZEROMQ_TAR=${ZEROMQ_DIR}.tar.gz; \
    wget ${ZEROMQ_URL}/v${ZEROMQ_VERSION}/${ZEROMQ_TAR} && \
    tar -xzf ${ZEROMQ_TAR} && \
    rm -f ${ZEROMQ_TAR} && \
    cd ${ZEROMQ_DIR} && \
    ./autogen.sh && ./configure && make -j 4 && make install && \
    cd .. && \
    rm -fr ${ZEROMQ_DIR}

RUN ldconfig -v

# Start up bash (will be overwritten when imported as a dependency)
CMD ["/bin/bash"]

