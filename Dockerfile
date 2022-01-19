FROM debian:jessie
MAINTAINER bear85

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade >/dev/null &&\
    DEBIAN_FRONTEND=noninteractive apt-get -q -y install >/dev/null \
    nginx \
    procps \
    iproute2

EXPOSE 80/tcp 443/tcp
COPY ./entrypoint.sh entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
EOF
