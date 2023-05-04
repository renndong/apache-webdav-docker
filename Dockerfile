FROM httpd

COPY rootfs /

ENV PUID= PGID=

RUN groupadd -g 1001 apache2 \
    && useradd -s /sbin/nologin -u 1001 -g 1001 apache2 \
    && mkdir /data

VOLUME [ "/data" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80 443
STOPSIGNAL SIGQUIT