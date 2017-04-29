FROM alpine:3.5

LABEL maintainer "mats116 <mats.kazuki@gmail.com>"

RUN apk add --no-cache curl && \
    curl -sSL "http://artifacts.aerospike.com/aerospike-amc-community/4.0.11/aerospike-amc-community-4.0.11-linux.tar.gz" | tar -xvz -C / && \
    ln -sf /dev/stdout /var/log/amc/amc.log

EXPOSE 8081

CMD /opt/amc/amc -config-file=/etc/amc/amc.conf
