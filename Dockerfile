FROM alpine

RUN apk add --no-cache 3proxy python3 py3-pip curl

COPY 3proxy.cfg /etc/3proxy/3proxy.cfg
COPY start.sh /start.sh
COPY keepalive.py /keepalive.py

RUN chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]