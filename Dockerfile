FROM ubuntu:17.04
MAINTAINER kp <dockerkp@gmail.com>

RUN apt-get update && \
  apt-get install -y software-properties-common
RUN apt-get install -y wget

RUN wget https://download.bitcoinabc.org/0.16.2/linux/bitcoin-abc-0.16.2-x86_64-linux-gnu.tar.gz
RUN tar -zvxf  bitcoin-abc-0.16.2-x86_64-linux-gnu.tar.gz
RUN mv bitcoin-abc-0.16.2 bitcoinabc
RUN cp bitcoinabc/bin/* /usr/local/bin

VOLUME ["/opt/bitcoinabc"]

EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

CMD ["bitcoind", "--conf=/opt/bitcoinabc/bitcoind.conf", "--printtoconsole"]
