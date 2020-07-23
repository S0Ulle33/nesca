# Minimal Docker container to build Nesca
FROM vookimedlo/ubuntu-qt:latestDistroOfficial_gcc_bionic
LABEL maintainer="Pantyusha <pantene@pere.val>"

# Install updates & requirements
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -yqq install \
    qtmultimedia5-dev libssh-dev libssl-dev libcrypto++-dev libcurl3-dev
RUN apt-get -qq clean

# Enable xcb
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -yqq install \
    bison build-essential gperf flex ruby python libasound2-dev libbz2-dev libcap-dev libcups2-dev libdrm-dev libegl1-mesa-dev libgcrypt11-dev libnss3-dev libpci-dev libpulse-dev libudev-dev libxtst-dev gyp ninja-build
RUN apt-get -qq clean
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -yqq install \
    libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libsrtp0-dev libwebp-dev libjsoncpp-dev libopus-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libxslt1-dev
RUN apt-get -qq clean
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get -yqq install \
    lxde xinit
RUN apt-get -qq clean
RUN /usr/share/debconf/fix_db.pl
RUN echo "exec startlxde" >> $HOME/.xinitrc
RUN sudo startx &

# Copy Nesca
ADD ./src/ /home/nesca/

# Compile
RUN cd /home/nesca/ && qmake && make

ENV QT_DEBUG_PLUGINS=1
ENTRYPOINT ["/home/nesca/nesca"]
