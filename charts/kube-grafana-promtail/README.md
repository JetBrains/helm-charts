# kube-grafana-promtail

This chart is a mirror of [this chart](https://github.com/grafana/helm-charts/blob/main/charts/promtail/README.md).
From the original docs:

```markdown
Promtail is an agent that ships the contents of local logs to a private Grafana Loki instance. It is usually deployed
to every machine that runs applications which need to be monitored.

It primarily:
* Discovers targets;
* Attaches labels to log streams;
* Pushes them to the Loki instance.

Currently, Promtail can tail logs from two sources: local log files and the systemd journal (on AMD64 machines only).
```

## Prerequisites

- Kubernetes 1.19+
- Helm 3+

## Documentation

https://grafana.com/docs/loki/latest/send-data/promtail/

## Parameters

Checkout the main [values.yaml](./values.yaml) for the full list of available parameters.
