FROM ubuntu:16.04
LABEL maintainer="hunterMG@qq.com"

RUN apt-get update \
    && apt-get -y -q install wget \
    && cd /tmp \
    && wget -q http://apt-stable.ntop.org/16.04/all/apt-ntop-stable.deb \
    && apt install -y /tmp/apt-ntop-stable.deb \
    && apt-get clean all \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y -q pfring nprobe ntopng ntopng-data n2disk \
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng "$@"' > /tmp/run.sh \
    && chmod +x /tmp/run.sh

EXPOSE 3000

ENTRYPOINT ["/tmp/run.sh"]