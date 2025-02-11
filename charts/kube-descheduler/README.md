# kube-descheduler

This chart is a mirror of [this chart](https://github.com/kubernetes-sigs/descheduler/tree/master/charts/descheduler).
From the original docs:

_Descheduler is used to rebalance clusters by evicting pods that can potentially be scheduled on better nodes. In the current implementation, descheduler does not schedule replacement of evicted pods but relies on the default scheduler for that._

## Prerequisites

- Kubernetes 1.19+
- Helm 3+

## Documentation

https://github.com/kubernetes-sigs/descheduler

## Parameters

Checkout the main [values.yaml](./values.yaml) for the full list of available parameters.
