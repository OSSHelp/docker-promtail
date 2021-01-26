#!/bin/sh
# shellcheck disable=SC2153

promtail_config=/etc/promtail/default.yaml
test -n "$DEBUG" && debug="-log.level=debug"
test -n "$LOKI_HOST" && sed -i "s|http://loki:3100|$LOKI_HOST|" $promtail_config
sed -i "s/SERVER_NAME/${SERVER_NAME:-$(hostname)}/" $promtail_config

if [ -z "$1" ]; then
  exec promtail $debug -config.file=$promtail_config
fi

exec "$@"
