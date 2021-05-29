FROM ubuntu:14.04
MAINTAINER s@lavr.me
# because dochang/debuild is stale

RUN apt-get update && apt-get --yes install \
    build-essential fakeroot devscripts equivs \
    python-pip python-setuptools \
    checkinstall \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

RUN cd /usr/src && \
    curl -O https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz && \
    tar -xzf Python-2.7.18.tgz && \
    cd Python-2.7.18 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    cd /usr/src && \
    rm -rf /usr/src/Python-2.7.18

RUN ln -f /usr/local/bin/python2.7 /usr/bin/python

VOLUME ["/target"]

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
