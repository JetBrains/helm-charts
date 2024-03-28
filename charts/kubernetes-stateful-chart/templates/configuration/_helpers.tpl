{{/* vim: set filetype=mustache: */}}

{{/*
Return a valid map of environment variables.

Pre_condition:
The input MUST be specified as follows:

ENV_VAR_NAME_0: "Valore"
ENV_VAR_NAME_1: "Stupore"

Post_condition:
This function returns the list of environment variables as follows:

ENV_VAR_NAME_0: "VmFsb3Jl"
ENV_VAR_NAME_1: "U3R1cG9yZQ=="

Usage:

{{- include "app.renderEnvVars" ( dict envs .Values.envs ) }}
*/}}
{{- define "app.renderEnvVars" }}
{{- $envVariables := .envs }}
{{- if $envVariables }}
{{- range $k, $v := $envVariables }}
{{- $base64Value := tpl $v $.context | b64enc | quote -}}
{{- printf "%s: %s" $k $base64Value | nindent 2 -}}
{{- end }}
{{- end }}
{{- end }}


{{/*
 Return a map of configuration files.

 This is used to render the configuration files in the `configMap` section of the Helm chart.

 Usage:
{{- include "app.additionalConfigFiles" ( dict "configs" .Values.additionalConfigs ) }}
 */}}
{{- define "app.additionalConfigFiles" -}}
{{- range $key, $value := .configs }}
{{ $key }}: |
{{ $value.content | indent 4 }}
{{- end }}
{{- end }}

{{/*
Return a list of volume mounts from the additional configuration files.

 Usage:
{{- include "app.additionalConfigsVolumeMounts" ( dict "configs" .Values.additionalConfigs  "configMapName" $val ) }}
*/}}
{{- define "app.additionalConfigsVolumeMounts" -}}
{{ $cmName := .configMapName }}
{{- $volumeMounts := list }}
{{- range $fileName, $value := .configs }}
{{- $filePathWithoutPathSuffix := trimSuffix "/" $value.mountPath -}}
{{- $item := dict "name" $cmName "mountPath" $filePathWithoutPathSuffix "subPath" $fileName }}
{{- $volumeMounts = append $volumeMounts $item }}
{{- end }}
{{- $volumeMounts | toYaml }}
{{- end }}

{{/*
Return the name of the ConfigMap that contains the additional configuration files.
*/}}
{{- define "app.additionalConfigsConfigMapName" -}}
{{ include "lib.appName" $  }}-files
{{- end }}

