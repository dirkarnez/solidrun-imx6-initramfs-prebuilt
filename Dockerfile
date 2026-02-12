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

RUN mkdir /workspace
RUN mkdir /dist

COPY . /workspace
WORKDIR /workspace
VOLUME /dist

CMD [ "bash", "./make-initramfs.sh" ]
