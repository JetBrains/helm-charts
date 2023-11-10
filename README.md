# helm-charts

This repository contains Helm charts for deploying and managing Jetbrains products on
Kubernetes clusters. The goal is to provide a simple and standardized way to install,
 configure, and run Jetbrains products in containerized environments.

Some key things this repository provides:

* Helm charts for all major Jetbrains products like TeamCity, TBE etc.
  This allows deploying any Jetbrains product with just a single command.
* Common and tested configurations for things like persistence, authentication,
  authorization, networking etc. Charts take care of setting up required configurations
  out of the box.
* Lightweight and optimized container images. Charts leverage official Jetbrains images which are
  compact in size and optimized for runtime performance. 
* Configuration flexibility. Charts are customizable to support varying demands - from development to
  production environments.
* Centralized hosting and support. As an officially supported repository, it ensures the availability
  of always up-to-date charts with Jetbrains' support.

## Repository structure

This repository is organized as follows:

* `charts/` - contains all the charts.



