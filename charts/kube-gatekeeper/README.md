# kube-gatekeeper

This chart wraps the official [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) Helm chart from the Open Policy Agent project.

_Gatekeeper is a policy controller for Kubernetes that enforces custom resource-based policies (Constraint Templates and Constraints) and validates admission requests._

## Source

- **Upstream chart:** [open-policy-agent/gatekeeper](https://github.com/open-policy-agent/gatekeeper) — `charts/gatekeeper`
- **Helm repository:** https://open-policy-agent.github.io/gatekeeper/charts

## Prerequisites

- Kubernetes 1.21+
- Helm 3+

## Install

Add the JetBrains Helm repo (or use the chart from this repo), then:

```bash
helm dependency update
helm install gatekeeper . -n gatekeeper-system --create-namespace
```

## Documentation

- [Gatekeeper docs](https://open-policy-agent.github.io/gatekeeper/website/docs/)
- [Upstream chart README](https://github.com/open-policy-agent/gatekeeper/tree/master/charts/gatekeeper)

## Configuration

All upstream Gatekeeper options are supported under the `spec` key in [values.yaml](./values.yaml). See the [upstream values](https://github.com/open-policy-agent/gatekeeper/blob/master/charts/gatekeeper/values.yaml) for the full list.

Common overrides:

- `spec.replicas` — number of Gatekeeper controller replicas
- `spec.image.repository` / `spec.image.tag` — controller image
- `spec.controllerManager.resources` — resource requests/limits
- `spec.pdb.controllerManager.minAvailable` — PodDisruptionBudget

## Parameters

