{{/* vim: set filetype=mustache: */}}

{{/*
Return a valid ingress name.
*/}}
{{- define "app.ingressName" -}}
{{- if .Values.ingress.name }}
{{- .Values.ingress.name }}
{{- else }}
{{- include "lib.appName" . }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of labels for the ingress.
*/}}
{{- define "app.ingressLabels" -}}
{{ if .Values.ingress.labels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.ingress.labels "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return a valid set of additional labels for the ingress.
*/}}
{{- define "app.additionalIngressLabels" -}}
{{ if .Values.ingress.additionalLabels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.ingress.additionalLabels "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return a valid set of annotations for the ingress.
*/}}
{{- define "app.ingressAnnotations" -}}
{{ if .Values.ingress.annotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.ingress.annotations "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return a valid set of additional annotations for the ingress.
*/}}
{{- define "app.additionalIngressAnnotations" -}}
{{ if .Values.ingress.additionalAnnotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.ingress.additionalAnnotations "context" $ ) }}
{{ end }}
{{- end -}}
