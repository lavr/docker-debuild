FROM ubuntu:latest
MAINTAINER s@lavr.me
# because dochang/debuild is stale

RUN apt-get update && apt-get --yes install build-essential fakeroot devscripts equivs 
RUN apt-get install --yes python-pip python-setuptools

VOLUME ["/target"]

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
