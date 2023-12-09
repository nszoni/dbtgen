with source as (
      select * from {{ source('jaffle_shop', 'raw_orders') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("user_id") }},
        {{ adapter.quote("order_date") }},
        {{ adapter.quote("status") }}

    from source
)
select * from renamed
  