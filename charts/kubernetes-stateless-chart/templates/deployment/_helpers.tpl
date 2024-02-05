{{/* vim: set filetype=mustache: */}}

{{/*
Return a valid deployment strategy.
*/}}
{{- define "app.deploymentStrategy" -}}
{{- if eq .Values.deploymentStrategyType "RollingUpdate" -}}
{{- $strategy := dict "type" "RollingUpdate" "rollingUpdate" (dict "maxSurge" .Values.rollingUpdateStrategyConfig.maxSurge "maxUnavailable" .Values.rollingUpdateStrategyConfig.maxUnavailable ) -}}
{{- $strategy | toYaml }}
{{- else -}}
{{- $fallbackStrategy := dict "type" "Recreate" }}
{{-  $fallbackStrategy | toYaml }}
{{- end -}}
{{- end -}}

{{/*
Return the reference name of the secret with encoded environment variables
*/}}
{{- define "app.secretRef" }}
{{- coalesce .Values.externalEnvSecret .Values.internalEnvSecret ( printf "%s-envs" (include "lib.appName" .) ) }}
{{- end }}

{{/*
Return checksum of the configmap with application configuration
*/}}
{{- define "app.configChecksum" }}
{{- if and .Values.defaultConfig.mountPath .Values.defaultConfig.name }}
checksum/config: {{ include (print $.Template.BasePath "/configuration/manifest.yaml") . | sha256sum }}
{{- end }}
{{- end }}
{{/*
Return checksum of the secret with encoded environment variables
*/}}
{{- define "app.envsChecksum" }}
{{- if and (empty .Values.externalEnvSecret) (empty .Values.internalEnvSecret) }}
checksum/envs: {{ include (print $.Template.BasePath "/configuration/secret.envs.yaml") . | sha256sum }}
{{- end }}
{{- end }}

{{/*
Return a valid set of labels for the pod.
*/}}
{{- define "app.podLabels" -}}
{{- if .Values.podLabels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.podLabels "context" $ ) }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of additional labels for the pod.
*/}}
{{- define "app.additionalPodLabels" -}}
{{- if .Values.additionalPodLabels }}
{{ include "common.tplvalues.render" ( dict "value" .Values.additionalPodLabels "context" $ ) }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of annotations for the pod.
*/}}
{{- define "app.podAnnotations" -}}
{{- if .Values.podAnnotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.podAnnotations "context" $ ) }}
{{- end }}
{{- end -}}
{{/*
Return a valid set of additional annotations for the pod.
*/}}
{{- define "app.additionalPodAnnotations" -}}
{{- if .Values.additionalPodAnnotations }}
{{ include "common.tplvalues.render" ( dict "value" .Values.additionalPodAnnotations "context" $ ) }}
{{- end }}
{{- end -}}
