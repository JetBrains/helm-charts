# kube-node-reboot

This chart is a mirror of [this chart](https://github.com/kubereboot/kured).
From the original docs:

_Kured (KUbernetes REboot Daemon) is a Kubernetes daemonset that performs safe automatic node reboots when the need to do so is indicated by the package management system of the underlying OS._

* Watches for the presence of a reboot sentinel file e.g. /var/run/reboot-required or the successful run of a sentinel command.
* Utilises a lock in the API server to ensure only one node reboots at a time.
* Optionally defers reboots in the presence of active Prometheus alerts or selected pods.
* Cordons & drains worker nodes before reboot, un-cordoning them after.

## Prerequisites

- Kubernetes 1.19+
- Helm 3+

## Documentation

It is available at [kured.dev](https://kured.dev/).

## Parameters

Checkout the main [values.yaml](./values.yaml) for the full list of available parameters.
