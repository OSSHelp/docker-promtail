# promtail

[![Build Status](https://drone.osshelp.ru/api/badges/docker/promtail/status.svg)](https://drone.osshelp.ru/docker/promtail)

## Description

Based on [official promtail image](https://hub.docker.com/r/grafana/promtail) with entrypoint and healthcheck added.

## Deploy example

``` yaml
  promtail:
    image: osshelp/promtail:stable
    deploy:
      mode: global
    environment:
      LOKI_HOST: $LOKI_SYSTEM_HOST
      SERVER_NAME: $PROMTAIL_SERVER_NAME
    volumes:
      - /var/log:/var/log
      - /mnt/docker/promtail/tmp:/tmp
    networks:
      - net
```

## Parameters

Setting|Default|Description
---|---|---
`LOKI_HOST`|`http://loki:3100`|Loki server host
`SERVER_NAME`|`Current hostname`|Server name log label
`DEBUG`|-|Enable debug mode

### Internal usage

For internal purposes and OSSHelp customers we have an alternative image url:

``` yaml
  image: oss.help/pub/promtail:stable
```

There is no difference between the DockerHub image and the oss.help/pub image.

## Links

- [Documentation](https://grafana.com/docs/loki/latest/clients/promtail/)

## TODO

- Fix deprication warning `msg="WARNING!!! entry_parser config is deprecated, please change to pipeline_stages"`
