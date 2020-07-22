# Minimal Docker container to build Nesca

FROM ubuntu:20.04
LABEL maintainer="Pantyusha <pantene@pere.val>"

# Install updates & requirements:
#  * git, openssh-client, ca-certificatesm, build-essential, sudo - clone & build
#  * libssh-dev, libssl-dev, libcrypto++-dev, libcurl3-dev - Nesca
RUN apt-get -yqq update
RUN apt-get -yqq dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install \
    git \
    openssh-client \
    ca-certificates \
    build-essential \
    sudo \
    libssh-dev \
    libssl-dev \ 
    libcrypto++-dev \
    libcurl3-dev
RUN apt-get -qq clean

# Install Qt
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install qt5-default
# Install Qt multimedia
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install --no-install-recommends qtmultimedia5-dev

# Copy Nesca
ADD ./src/ /home/nesca/

# Compile
RUN cd /home/nesca/ && qmake && make

# Add group & user
RUN groupadd -r user && useradd --create-home --gid user user && echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

# Move to user dir 
RUN mv /home/nesca /home/user/

USER user
WORKDIR /home/user/nesca
ENV HOME /home/user

ENTRYPOINT ["/home/user/nesca/nesca"]
