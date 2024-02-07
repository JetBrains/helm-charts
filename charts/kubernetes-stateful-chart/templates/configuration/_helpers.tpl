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
