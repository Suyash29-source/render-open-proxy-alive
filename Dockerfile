FROM alpine

# Install needed tools
RUN apk add --no-cache python3 py3-pip curl

# Download prebuilt 3proxy binary (static, small)
RUN mkdir -p /usr/bin/3proxy /etc/3proxy && \
    curl -L -o /usr/bin/3proxy/3proxy https://github.com/z3APA3A/3proxy/releases/download/0.9.4/3proxy-0.9.4.x64.linux && \
    chmod +x /usr/bin/3proxy/3proxy

# Copy config and scripts
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg
COPY start.sh /start.sh
COPY keepalive.py /keepalive.py

RUN chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]
