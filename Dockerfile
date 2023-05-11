FROM ubuntu:22.04

# Update package lists and install necessary packages
RUN apt-get update && apt-get install --yes --no-install-recommends \
    iasl \
    coreutils \
    python3 \
    python3-distutils \
    uuid-dev \
    make \
    g++ \
    git \
    ca-certificates \
    nasm

# Set working directory to /root/ and clone the repository
COPY scripts/ /root/scripts/

RUN chmod -R a+x /root/scripts/
RUN /root/scripts/build_ovmf.sh

# Set the CMD to execute the build_ovmf.sh script
CMD ["/root/scripts/build_ovmf.sh"]
