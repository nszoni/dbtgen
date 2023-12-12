# init raw data
dbt seed

# generate sources with colname and dtypes
dbt run-operation generate_source --args '{"schema_name": "jaffle_shop_raw", "generate_columns": true}'

# generate staging models
# or use dbt power user plugin
dbt run-operation codegen.create_base_models --args '{source_name: jaffle_shop_raw, tables: ["raw_customers","raw_orders","raw_payments"]}'

# generate model yamls
# dbt run-operation generate_model_yaml --args '{"model_names": ["customers"]}'

# add marts
dbt run

# scaffold yaml files
dbt-osmosis yaml organize

# use GenAI to generate docs
#Power User or Turntable

# inherit docs
dbt-osmosis yaml document

# in precommit: does the above 2
dbt-osmosis yaml refactor

# generate

# generate LookML
dbt2looker --tag prod