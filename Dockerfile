FROM debian:jessie

ENV TZ=Asia/Tokyo \
    VERSION=3.6.8

RUN apt-get update &&\
    apt-get install -y wget gcc python python-dev &&\
    wget "http://www.aerospike.com/artifacts/aerospike-amc-community/${VERSION}/aerospike-amc-community-${VERSION}.all.x86_64.deb" &&\
    dpkg -i aerospike-amc-community-${VERSION}.all.x86_64.deb &&\
    rm -f aerospike-amc-community-${VERSION}.all.x86_64.deb &&\
    ln -sf /dev/stdout /var/log/amc/aerospike_amc.log

RUN TXT='\ \ \ \ new_sets = []\n    for st in response["sets"]:\n        try:\n            st["set_name"].encode("ascii")\n            new_sets.append(st)\n        except:\n            pass\n    response["sets"] = new_sets' &&\
    sed -i -e "180i $TXT" /opt/amc/server/flaskapp.py

EXPOSE 8081

CMD /opt/amc/bin/gunicorn --config=/etc/amc/config/gunicorn_config.py flaskapp:app
