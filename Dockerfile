FROM debian:jessie
MAINTAINER Steve Lambe <@firrae>

RUN apt-get update && \
   apt-get install -y git curl wget libfontconfig && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

RUN apt-get install -y libfreetype6 libfontconfig
RUN apt-get install -y wget
RUN wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar xjf phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN install -t /usr/local/bin phantomjs-1.9.7-linux-x86_64/bin/phantomjs
RUN rm -rf phantomjs-1.9.7-linux-x86_64
RUN rm phantomjs-1.9.7-linux-x86_64.tar.bz2

ENV LANG C
ENV LC_ALL "C"

RUN curl https://install.meteor.com/ | sh

RUN npm i -g spacejam

CMD ["/bin/bash"]
