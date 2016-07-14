FROM debian:jessie
MAINTAINER Steve Lambe <@firrae>

RUN apt-get update && \
  apt-get upgrade -y --force-yes && \
  apt-get install -y --force-yes wget curl ca-certificates libfreetype6 libfontconfig bzip2 rsync ssh && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -rf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs && \
  apt-get autoremove -y

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs

ENV LANG C
ENV LC_ALL "C"

RUN curl https://install.meteor.com/ | sh

RUN npm i -g spacejam

CMD ["/bin/bash"]
