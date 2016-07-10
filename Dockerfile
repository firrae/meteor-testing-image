FROM debian:jessie
MAINTAINER Steve Lambe <@firrae>

RUN apt-get update && \
   apt-get install -y git curl && \
   apt-get clean && \
   rm -Rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl https://install.meteor.com/ | sh

RUN echo 'export LANG=C' >> /etc/profile \
 && echo 'export LC_ALL=C' >> /etc/profile \
 && echo '' >> /etc/profile

CMD ["/bin/bash"]
