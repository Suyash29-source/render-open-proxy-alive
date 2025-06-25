FROM alpine

RUN apk add --no-cache \
    build-base \
    git \
    python3 \
    py3-pip \
    curl \
    make \
    gcc \
    musl-dev

# Download and build only 3proxy binary (no plugins)
RUN git clone https://github.com/z3APA3A/3proxy.git && \
    cd 3proxy && \
    make -C src && \
    mkdir -p /usr/bin/3proxy /etc/3proxy && \
    cp src/3proxy /usr/bin/3proxy/3proxy

COPY 3proxy.cfg /etc/3proxy/3proxy.cfg
COPY start.sh /start.sh
COPY keepalive.py /keepalive.py

RUN chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]
