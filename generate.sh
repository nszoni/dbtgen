# init raw data
dbt seed

# generate sources with colname and dtypes
dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "generate_columns": true}'

# generate staging models
dbt run-operation codegen.create_base_models --args '{source_name: my-source, tables: ["this-table","that-table"]}'

# generate model yamls
$ dbt run-operation generate_model_yaml --args '{"model_names": ["customers"]}'

# generate model descriptions with Turntable

# add profiling
dbt run-operation print_profile --args '{"relation_name": "customers"}'

# inherit docs with dbt-osmosis
dbt-osmosis yaml refactor

# generate LookML
dbt2looker --tag prod