#!/bin/sh
/usr/bin/3proxy /etc/3proxy/3proxy.cfg &
python3 /keepalive.py