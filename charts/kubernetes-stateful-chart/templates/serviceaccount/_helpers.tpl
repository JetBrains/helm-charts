{{/* vim: set filetype=mustache: */}}

{{/*
Return a valid name for the Service Account if specified.
Post condition:
return "lib.name" if .Values.serviceAccount.name is empty
return .Values.serviceAccount.name if it is specified
*/}}
{{- define "app.serviceAccount.name" -}}
{{- if .Values.serviceAccount.name -}}
{{- .Values.serviceAccount.name -}}
{{- else -}}
{{ include "lib.appName" . }}
{{- end -}}
{{- end -}}
{{/*
Return a list of pullSecret references for the application to be used in the context of the Service Account.
If application.serviceAccount.create: false then the secrets if specified will be mounted directly to the spec of the
application pod.

Notice: the image.pullSecrets have precedence over the global.imagePullSecrets.

Pre condition: the secret names already exists in the cluster.
Post condition:
    return .Values.image.pullSecrets if both .Values.image.pullSecrets and .Values.global.imagePullSecrets are defined.
    return one of the two based on which one is defined
    return null in all other cases.
*/}}
{{- define "app.serviceAccount.imagePullSecrets" }}
{{- if and .Values.global.imagePullSecrets (not .Values.image.pullSecrets) }}
{{- range $reg := .Values.global.imagePullSecrets }}
- name: {{ $reg }}
{{- end }}
{{- else }}
{{- if and .Values.image.pullSecrets ( not .Values.global.imagePullSecrets ) }}
{{- range $reg := .Values.image.pullSecrets }}
- name: {{ $reg }}
{{- end }}
{{- else }}
{{- if and .Values.image.pullSecrets .Values.global.imagePullSecrets }}
{{- range $reg := .Values.image.pullSecrets }}
- name: {{ $reg }}
{{- end }}
{{- else -}}
{{- list -}}
{{- end }}
{{- end -}}
{{- end }}
{{- end }}
{{/*
Return additional labels if specified.
Note that:
 1. `.Values.serviceAccount.labels` is meant for platform developers;
 2. `.Values.serviceAccount.additionalLabels` is meant for platform users.
*/}}
{{- define "app.serviceAccount.additionalLabels" -}}
{{ if .Values.serviceAccount.labels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.serviceAccount.labels "context" $ ) }}
{{ end }}
{{ if .Values.serviceAccount.additionalLabels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.serviceAccount.additionalLabels "context" $ ) }}
{{ end }}
{{- end -}}
{{/*
Return additional annotations if specified.
Note that:
 1. `.Values.serviceAccount.annotations` is meant for platform developers;
 2. `.Values.serviceAccount.additionalAnnotations` is meant for platform users.
*/}}
{{- define "app.serviceAccount.additionalAnnotations" -}}
{{ if .Values.serviceAccount.annotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.serviceAccount.annotations "context" $ ) }}
{{ end }}
{{ if .Values.serviceAccount.additionalAnnotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.serviceAccount.additionalAnnotations "context" $ ) }}
{{ end }}
{{- end -}}
