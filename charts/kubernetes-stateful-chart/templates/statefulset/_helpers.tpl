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
{{- if or .Values.envs .Values.additionalEnvs }}
checksum/envs: {{ include (print $.Template.BasePath "/configuration/secret.envs.yaml") . | sha256sum }}
{{- end }}
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

{{/*
Return an update strategy for the StatefulSet.
*/}}
{{- define "app.updateStrategy" -}}
{{ if eq .Values.updateStrategy.type "RollingUpdate" }}
rollingUpdate:
    maxUnavailable: {{ .Values.updateStrategy.properties.maxUnavailable }}
    partition: {{ .Values.updateStrategy.properties.partition }}
{{ end }}
{{- end -}}

{{/*
Return a set of volume claims for the StatefulSet.
*/}}
{{- define "app.volumeClaims" -}}
{{- $volumeClaims := concat .Values.volumeClaims .Values.additionalVolumeClaims -}}
{{- if empty $volumeClaims }}
[]
{{- else -}}
{{- $volumeClaimsWithoutMountPathProperty := list }}
{{- range $item := $volumeClaims }}
{{- $volumeClaimsWithoutMountPathProperty =  concat $volumeClaimsWithoutMountPathProperty (list (omit $item "mountDetails")) -}}
{{- end -}}
{{- $volumeClaimsWithoutMountPathProperty | toYaml }}
{{- end -}}
{{- end -}}

{{/*
Return a list of volumeMounts from any volumeClaims available.
*/}}
{{- define "app.volumeMountsFromVolumeClaims" -}}
{{- $volumeClaims := concat .Values.volumeClaims .Values.additionalVolumeClaims -}}
{{- $volumeMounts := list -}}
{{- range $v := $volumeClaims -}}
{{- $mountDetails := get $v "mountDetails" }}
{{- $metadata := get $v "metadata" }}
{{- $tObj := dict "name" $metadata.name "mountPath" $mountDetails.path }}
{{- $tList := list $tObj }}
{{- $volumeMounts = concat $volumeMounts $tList }}
{{- end -}}
{{- if $volumeMounts }}
{{- $volumeMounts | toYaml }}
{{- end -}}
{{- end -}}
