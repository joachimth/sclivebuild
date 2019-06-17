FROM debian:stretch
MAINTAINER Joachim Thirsbro <joachim@thirsbro.dk>

RUN apt-get update || true
RUN apt-get install -y git live-build xorriso vim-tiny make isolinux

ADD webconverger /root/Debian-Live-config/webconverger

# Until https://bugs.debian.org/873513 is merged, work around this build failure
RUN ln -s /usr/lib/ISOLINUX/ /usr/share/

VOLUME /root/Debian-Live-config/webconverger/chroot

WORKDIR /root/Debian-Live-config/webconverger/

CMD /bin/bash
