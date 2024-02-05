
# Helm Charts

[![official JetBrains project](https://jb.gg/badges/official.svg)](https://confluence.jetbrains.com/display/ALL/JetBrains+on+GitHub)


A library of Kubernetes applications packaged as Helm charts.

## Helm Repositories

## Supported types

At the moment, only OCI (Open Container Initiative) is supported as a format for a Helm chart. It means that all the repositories
in the list below are OCI repositories.

## List
The following Helm repositories are available:

| Name       | Purpose                                                                                                                          | Reference                                                             |
|------------|----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| `alpha`    | It contains charts that are experimental.                                                                                        | `https://public.jetbrains.space/p/helm/packages/container/alpha`      |
| `beta`     | It contains charts that are candidate for GA support but still require some further refinement and testing.                      | `https://public.jetbrains.space/p/helm/packages/container/beta`       |
| `stable`   | It contains production ready charts.                                                                                             | `https://public.jetbrains.space/p/helm/packages/container/stable`     |
| `library`  | It contains charts that are meant to be used as building blocks for `internal`, `alpha`, `beta`,`stable` and etc type of charts. | `https://public.jetbrains.space/p/helm/packages/container/library`    |

### Important

* `alpha`, `beta`, `stable` and `library` repositories are public and can be pulled by anyone and without authentication.

## Charts

The `charts` folder represents a flat list of available charts in this repository.

### Considerations

* Each chart is represented by a folder with the same name as the chart;
* Each chart contains the `release.json` file that describes in what repository the chart is published.

## Tooling

### Helm

Version 3+ of Helm is required to work with this repository. Refer to the [official documentation](https://helm.sh/docs/intro/install/)
for installation instructions.

### Kubernetes

Version 1.24+ of Kubernetes is required to work with this repository. Refer to [kind](https://kind.sigs.k8s.io/) for
instructions of how to provision a local Kubernetes cluster. For your information, this [configuration](./lib/Kind/cluster.yaml)
contains a simple declarative configuration of a desirable local Kubernetes cluster.

Install the version of [kubectl](https://kubernetes.io/docs/tasks/tools/) tool that best fits the version of the local Kubernetes cluster.

## License

This repository is licensed under the Apache-2.0 License.
