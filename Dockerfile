FROM debian:jessie
MAINTAINER Steve Lambe <@firrae>

RUN apt-get update && \
   apt-get install -y git curl libfontconfig && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

ENV LANG C
ENV LC_ALL "C"

RUN curl https://install.meteor.com/ | sh

RUN meteor npm i -g spacejam

CMD ["/bin/bash"]
