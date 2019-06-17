FROM debian:stretch
MAINTAINER Joachim Thirsbro <joachim@thirsbro.dk>

RUN apt-get update || true
RUN apt-get install -y git live-build xorriso vim-tiny make isolinux

ADD sclivebuild /root/sclivebuild

# Until https://bugs.debian.org/873513 is merged, work around this build failure
RUN ln -s /usr/lib/ISOLINUX/ /usr/share/

VOLUME /root/sclivebuild/chroot

WORKDIR /root/sclivebuild/

CMD /bin/bash
