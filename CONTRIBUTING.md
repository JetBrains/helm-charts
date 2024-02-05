# Contributing guide

## Introduction

Thank you for considering contributing to the `helm-chart` repository! We welcome all contributions,
from small improvements to new charts.

This guide outlines the procedures and practices we use to manage the `helm-chart` repository. Please read this guide
before you start contributing. It will help us to help you have your contributions onboard.

## How to start contributing

1. Fork this repository;
2. Add your contribution;
3. Submit a pull request.

**Note**

*We are big enthusiasts of small pull requests, and we encourage you to submit pull requests (PRs) that are small and focused.*

## Technicalities

### Continuous Integration checks are always green

When submitting a pull request, please make sure that all the CI checks are green. If not, please fix any issues first and only then
ask for PR review. Details about continuous integration checks can be found here: [CI Helm Charts](.github/workflows/ci.yaml).

This will benefit all of us. Notice that our CI checks dynamically discover the charts that changed in the PR and for each
chart runs the same CI checks. This allows us to get quick feedback on the changes that you made and in case of any error to
isolate the problem to a specific chart.

Be aware that the e2e tests are quite expensive in terms of resources and time (lint jobs). We do our best to keep the
CI checks fast and reliable, but GitHub Actions are not always predictable. This is another reason and motivation for
us to keep the PRs small and focused.

### Adopt Helm best practices

We strive to make our charts as idiomatic as possible. Please refer to the [Helm best practices](https://helm.sh/docs/chart_best_practices/)
and help us to achieve and maintain this goal.

### Maintain backwards compatibility

We develop our charts with backwards compatibility in mind. We use semantic versioning to manage the lifecycle of our charts.
It means the following, if the version of the chart is `x.y.z`, then:

* `x` is the major version, and it is incremented when we make incompatible API changes;
* `y` is the minor version, and it is incremented when we add functionality in a backwards-compatible manner;
* `z` is the patch version, and it is incremented when we make backwards-compatible bug fixes.

### Test the charts

As any other development ecosystem, Helm as well has its own unit testing framework. We use [helm-unittest](https://github.com/helm-unittest/helm-unittest).
It is a plugin for Helm that allows to run TDD-style tests against the templates of a chart.

If you never heard of this tool, get started [here](https://github.com/helm-unittest/helm-unittest?tab=readme-ov-file#get-started).

For example, refer to the [kubernetes-stateful-chart/tests](./charts/kubernetes-stateful-chart/tests) for testing examples with
Helm Unit Testing tool.

### Locally deploy the charts

We use [kind](https://kind.sigs.k8s.io/) to provision a local Kubernetes cluster. For your information, this
[configuration](./lib/Kind/cluster.yaml) contains a simple declarative configuration of a desirable local Kubernetes cluster.
In addition to Kind, we use [chart-testing](https://github.com/helm/chart-testing). It allows us to lint the chart and to
deploy it to the local Kubernetes cluster. Notice that our Continuous Integration checks are based on the same tools.
To get a concrete context, please familiarise with the [CI Helm Charts](.github/workflows/ci.yaml).

## The publishing mechanism of Helm charts

Each chart contains the `release.json` file that describes in what repository the chart is published. The `release.json` file
represents a specification of one or more repositories where the chart is hosted as an OCI package.

We recommend adding a new chart to the `alpha` repository first. This helps to introduce the chart into the graduation
funnel.

In summary, to release a new chart, only the release.json file needs to be added to the chart and this configuration file
needs to specify the repository where the chart must be published. At the moment, dynamic remote repositories are not supported yet.

## Administration

### Pull requests

The [template](.github/PULL_REQUEST_TEMPLATE.md) for pull requests is available in the `.github` folder. Please use it
when submitting a pull request. Help the maintainers to get the context of your contribution right away.

Update the template if necessary. We are open to suggestions and improvements.

### Automation

We use [GitHub Actions](https://docs.github.com/en/actions) to automate administration tasks in this repository. All the
workflows can be found in the [.github/workflows](.github/workflows) folder.

#### Assumptions

If a workflow begins with `lib-*` prefix, then it means that this workflow is a library workflow. It is a reusable workflow
that does not exist on its own, but it is used by other workflows. For example, the [lib-list-changed-charts.yaml](.github/workflows/lib-list-changed-charts.yaml).
This workflow is used, for example, by the [ci.yaml](.github/workflows/ci.yaml) and by [upload.yaml](.github/workflows/upload.yaml) workflows.
