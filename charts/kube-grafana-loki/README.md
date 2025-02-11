# kube-grafana-loki

This chart is a mirror of [this chart](https://github.com/grafana/loki/blob/main/production/helm/loki/README.md).
From the original docs:

_Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost effective and easy to operate. It does not index the contents of the logs, but rather a set of labels for each log stream._

## Prerequisites

- Kubernetes 1.19+
- Helm 3+

## Documentation

https://grafana.com/oss/loki/

## Parameters

Checkout the main [values.yaml](./values.yaml) for the full list of available parameters.
