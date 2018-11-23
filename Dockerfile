FROM ubuntu:16.04

COPY sources.list /etc/apt/sources.list

RUN apt update

RUN apt install -y libmicrohttpd-dev libjansson-dev \
	libssl-dev libsrtp-dev libsofia-sip-ua-dev libglib2.0-dev \
	libopus-dev libogg-dev libcurl4-openssl-dev liblua5.3-dev \
	libconfig-dev pkg-config gengetopt libtool automake 

RUN apt install -y nodejs npm doxygen graphviz libnanomsg-dev git \
  cmake \
  wget \
  npm \
  vim \
  gtk-doc-tools

COPY libnice.sh /libnice.sh

RUN /libnice.sh

COPY libsrtp.sh /libsrtp.sh

RUN /libsrtp.sh

COPY usesctp.sh /usesctp.sh

RUN /usesctp.sh

COPY libwebsockets.sh /libwebsockets.sh

RUN /libwebsockets.sh

COPY mqtt.sh /mqtt.sh

RUN /mqtt.sh

COPY janus.sh /janus.sh

RUN /janus.sh

RUN cd ~/janus-gateway && make configs

RUN apt install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY privkey.pem /usr/local/nginx/server.key

COPY fullchain.pem /usr/local/nginx/server.crt

COPY mime.types /etc/nginx/mime.types

COPY privkey.pem /opt/janus/share/janus/certs/mycert.key

COPY fullchain.pem /opt/janus/share/janus/certs/mycert.pem

COPY janus.transport.http.jcfg /opt/janus/etc/janus/janus.transport.http.jcfg
