FROM fedora:latest
LABEL maintainer="elau89@gmail.com" \
      version="1.0" \
            description="Updated base image for projects"

# Install required build tools
RUN dnf upgrade -b --allow-erasing -y; \
    dnf autoremove -y && \
        dnf clean all -y

# Start up bash (will be overwritten when imported as a dependency)
CMD ["/bin/bash"]
