FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git build-essential fakeroot debhelper librtlsdr-dev pkg-config dh-systemd libncurses5-dev

RUN git clone https://github.com/flightaware/dump1090.git
WORKDIR dump1090

RUN ./prepare-build.sh buster
WORKDIR package-buster
RUN dpkg-buildpackage -b --no-sign --build-profiles=custom,rtlsdr

RUN apt-get install -y ../dump1090-fa_6.1_amd64.deb

WORKDIR /
RUN rm -rf dump1090
RUN apt-get purge -y && apt-get clean