FROM alpine

RUN apk add --no-cache rsyslog

COPY rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT ["rsyslogd", "-n"]
