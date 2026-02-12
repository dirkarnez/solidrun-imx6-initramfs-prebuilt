FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y --no-install-recommends --allow-unauthenticated install \
   build-essential \
   git \
   zip \
   unzip \
   xz-utils \
   wget \
   curl \
   ca-certificates \
   make \
   bash \
   bc \
   file \
   lzop

RUN cd /opt; \
   wget https://github.com/dirkarnez/crosstool-ng-prebuilt/releases/download/v20251209/arm-cortexa9_neon-linux-gnueabihf.zip && \
   unzip arm-cortexa9_neon-linux-gnueabihf.zip -d arm-cortexa9_neon-linux-gnueabihf && \
   /opt/arm-cortexa9_neon-linux-gnueabihf/bin/arm-cortexa9_neon-linux-gnueabihf-gcc --version && \
   rm arm-cortexa9_neon-linux-gnueabihf.zip && \
   chmod -R +x .
   
RUN cd /opt; \
   wget https://github.com/dirkarnez/solidrun-imx6-u-boot-prebuilt/releases/download/v2018.01-solidrun-imx6/solidrun-u-boot-imx6-v2018.01-solidrun-imx6-arm-cortexa9_neon-linux-gnueabihf-gcc-15.2.0-crosstool-ng-1.28.0.zip && \
   unzip solidrun-u-boot-imx6-v2018.01-solidrun-imx6-arm-cortexa9_neon-linux-gnueabihf-gcc-15.2.0-crosstool-ng-1.28.0.zip && \
   rm solidrun-u-boot-imx6-v2018.01-solidrun-imx6-arm-cortexa9_neon-linux-gnueabihf-gcc-15.2.0-crosstool-ng-1.28.0.zip && \
   chmod -R +x .
   
RUN mkdir /workspace
RUN mkdir /dist

COPY . /workspace
WORKDIR /workspace
VOLUME /dist

CMD [ "bash", "./make-initramfs.sh" ]
