data "oci_golden_gate_pipeline_schema_tables" "golden_gate_pipeline_schema_tables_lookup" {
  for_each = var.golden_gate_pipeline_schema_tables_lookup

  pipeline_id        = each.value.pipeline_id
  source_schema_name = each.value.source_schema_name
  target_schema_name = each.value.target_schema_name
  display_name       = each.value.display_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

