FROM fedora:25
LABEL maintainer="elau89@gmail.com" \
      version="1.0" \
      description="Controlled base image for projects"

# Install required build tools
RUN echo "fastestmirror=true" >> /etc/dnf/dnf.conf && \
    dnf upgrade -b --allow-erasing -y; \
    dnf autoremove -y && \
    dnf clean all -y

# Start up bash (will be overwritten when imported as a dependency)
CMD ["/bin/bash"]
