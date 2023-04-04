{{/*
range values pairs
*/}}
{{- define "app.valuesPairs" -}}
{{- range $key, $value := . }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}

{{/* Validate values of volumes - Incorrect extra volume settings */}}
{{- define "common.validateValues.extraVolumes" -}}
{{- if and (.Values.extraVolumes) (not .Values.extraVolumeMounts) -}}
metrics-server: missing-extra-volume-mounts
    You specified extra volumes but not mount points for them. Please set
    the extraVolumeMounts value
{{- end -}}
{{- end -}}

{{/*
Return true if a ConfigMap object should be created for Locator configuration
*/}}
{{- define "common.createConfigmap" -}}
{{- if and .Values.configuration (not .Values.existingConfigmap) }}
    {{- true -}}
{{- end -}}
{{- end -}}
