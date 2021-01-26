FROM grafana/promtail:1.6.1

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends netcat \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/*

COPY confs/*.yaml /etc/promtail/
COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 9080

HEALTHCHECK --interval=15s --timeout=3s --start-period=15s \
  CMD nc -z localhost 9080
