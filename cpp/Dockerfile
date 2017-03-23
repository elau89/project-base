FROM base:1.0
LABEL maintainer="elau89@gmail.com" \
      version="1.0" \
      description="Controlled base image for C++ projects"

# Install required build tools
RUN dnf install -y \
        autoconf \
        automake \
        bzip2 \
        clang \
        cmake \
        file \
        gcc-c++ \
        gnupg \
        gzip \
        make \
        tar \
        wget \
        which \
        xz \
        zip && \
    dnf autoremove -y && \
    dnf clean all -y

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

# Start up bash (will be overwritten when imported as a dependency)
CMD ["/bin/bash"]
