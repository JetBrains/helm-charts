# Kubernetes Manifests

`kubernetes-manifests` is a generic Helm chart to use for the packaging of ad-hoc Kubernetes manifests in one bundle.

## Use Cases

Use this chart to package Kubernetes manifests that are not part of a Helm chart during a Helm to deploy in Kubernetes,
and the main application chart does not include a parameter in the values.yaml for passing custom Kubernetes manifests.

## How to use this chart

This chart is formatted as an OCI package. Include it as a dependency from `https://public.jetbrains.space/p/helm/packages/container/library`.

Add it to your Chart.yaml file of your Helm package.

```yaml
dependencies:
  - name: kubernetes-manifests
    repository: oci://public.registry.jetbrains.space/p/helm/library
    version: 1.x.x
    alias: app
```

## Repository

Checkout the [release.json](release.json) for details about where the chart is hosted.

## Prerequisites

- Kubernetes 1.24+;

- Helm 3+.

## Parameters

### Global parameters

| Name      | Description                                                 | Value  |
| --------- | ----------------------------------------------------------- | ------ |
| `global`  | Provide a map of global values to be used in the templates  | `{}`   |
| `include` | Includes/Excludes the manifests packaged by this Helm chart | `true` |

### Manifests to package

| Name                                | Description                                             | Value |
| ----------------------------------- | ------------------------------------------------------- | ----- |
| `kubernetesYamlResources`           | Kubernetes objects to add to the package                | `[]`  |
| `additionalKubernetesYamlResources` | Add additional Kubernetes objects to add to the package | `[]`  |
