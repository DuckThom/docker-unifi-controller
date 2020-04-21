FROM debian:9

RUN apt-get update \
 && apt-get install -y wget ca-certificates apt-transport-https

RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

RUN wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg 

RUN apt-get update \
 && apt-get install unifi -y

# patching unify executable
RUN sed -i 's/#JSVC_OPTS/JSVC_OPTS/' /usr/lib/unifi/bin/unifi.init
RUN sed -i 's/outfile SYSLOG/outfile \/dev\/stdout/' /usr/lib/unifi/bin/unifi.init
RUN sed -i 's/errfile SYSLOG/errfile \/dev\/stderr/' /usr/lib/unifi/bin/unifi.init

EXPOSE 3478/udp
#EXPOSE 5514
EXPOSE 8080
EXPOSE 8443
EXPOSE 8880
EXPOSE 8843
EXPOSE 6789
#EXPOSE 27117
#EXPOSE 5656-5699/udp
#EXPOSE 10001/udp
#EXPOSE 1900/udp

COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME /var/lib/unifi

RUN apt-get clean && apt-get autoclean

ENTRYPOINT ["/docker-entrypoint.sh"]
