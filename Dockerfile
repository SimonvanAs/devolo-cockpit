FROM ubuntu:18.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
	curl \
	libgtk2.0-0 \
	lzma \
	xz-utils

ENV COCKPIT_VERSION=v5-2-0-185

RUN curl -SL https://www.devolo.de/fileadmin/Web-Content/DE/products/hnw/devolo-cockpit/software/devolo-cockpit-${COCKPIT_VERSION}-linux.run > /tmp/cockpit.run && chmod +x /tmp/cockpit.run

RUN /tmp/cockpit.run -y

ADD start.sh /start.sh
CMD /start.sh


