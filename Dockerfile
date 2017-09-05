FROM ubuntu:16.04
MAINTAINER kp <dockerkp@gmail.com>

RUN apt-get update && \
  apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin-unlimited/bu-ppa
RUN apt-get update && \
    apt-get install -y bitcoind

RUN bitcoind --version #To know bitcoind versions

VOLUME ["/opt/bitcoin"]

EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

CMD ["/usr/bin/bitcoind", "--conf=/opt/bitcoin/bitcoind.conf", "--printtoconsole"]