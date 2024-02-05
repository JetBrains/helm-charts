{{/* vim: set filetype=mustache: */}}

{{/*
Return a valid set of labels for the service.
*/}}
{{- define "app.serviceLabels" -}}
{{ if .Values.service.labels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.service.labels "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return a valid set of additional labels for the service.
*/}}
{{- define "app.additionalServiceLabels" -}}
{{ if .Values.service.additionalLabels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.service.additionalLabels "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return a valid set of annotations for the service.
*/}}
{{- define "app.serviceAnnotations" -}}
{{- if .Values.service.annotations }}
{{- include "common.tplvalues.render" ( dict "value" .Values.service.annotations "context" $ ) }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of additional annotations for the service.
*/}}
{{- define "app.additionalServiceAnnotations" -}}
{{- if .Values.service.additionalAnnotations }}
{{- include "common.tplvalues.render" ( dict "value" .Values.service.additionalAnnotations "context" $ ) }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of ports for the service.
{{ include "common.tplvalues.render" ( dict "value" .Values.service.additionalPorts "context" $ ) | toYaml }}
*/}}
{{- define "app.servicePorts" -}}
{{ $ports := list }}
{{- if .Values.service.ports }}
{{- $ports = concat $ports .Values.service.ports  -}}
{{- end }}
{{- if .Values.service.additionalPorts }}
{{- $ports = concat $ports .Values.service.additionalPorts }}
{{ end }}
{{- $ports | toYaml }}
{{- end -}}
{{/*
Return a valid service name.
*/}}
{{- define "app.serviceName" -}}
{{- if .Values.service.name }}
{{- .Values.service.name }}
{{- else }}
{{- include "lib.appName" . }}
{{- end }}
{{- end -}}

{{/*
Return a valid service type.
*/}}
{{- define "app.serviceType" -}}
{{- $supportedTypesList := list "ClusterIP" "NodePort" "LoadBalancer" -}}
{{- if and .Values.service.type ( has .Values.service.type $supportedTypesList ) }}
{{- .Values.service.type -}}
{{- else }}
{{- "ClusterIP" }}
{{- end -}}
{{- end -}}
