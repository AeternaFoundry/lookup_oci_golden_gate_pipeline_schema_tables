variable "golden_gate_pipeline_schema_tables_lookup" {
  description = <<EOT
Map of golden_gate_pipeline_schema_tables_lookup, attributes below
Required:
    - pipeline_id
    - source_schema_name
    - target_schema_name
Optional:
    - display_name
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    pipeline_id        = string
    source_schema_name = string
    target_schema_name = string
    display_name       = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

