FROM golang:1.8

RUN apt-get update && apt-get install -y \
    alien \
    libaio1

COPY ./oracle_client /oracle-client

RUN alien -i /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm && \
    alien -i /tmp/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm && \
    alien -i /tmp/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm

ENV LD_LIBRARY_PATH /usr/lib/oracle/12.2/client64/lib/
ENV PKG_CONFIG_PATH /oracle-client/

RUN rm -r -f /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm && \
    rm -r -f /tmp/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm && \
    rm -r -f /tmp/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm