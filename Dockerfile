FROM debian:jessie
MAINTAINER Steve Lambe <@firrae>

RUN apt-get update && \
   apt-get install -y git curl && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl https://install.meteor.com/ | sh
