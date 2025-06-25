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

# Clone and build ONLY 3proxy core (delete plugin dirs to avoid build issues)
RUN git clone https://github.com/z3APA3A/3proxy.git && \
    cd 3proxy && \
    rm -rf src/plugins && \
    make -f Makefile.Linux && \
    mkdir -p /usr/bin/3proxy /etc/3proxy && \
    cp src/3proxy /usr/bin/3proxy/3proxy

# Copy proxy config and helper scripts
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg
COPY start.sh /start.sh
COPY keepalive.py /keepalive.py

RUN chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]
