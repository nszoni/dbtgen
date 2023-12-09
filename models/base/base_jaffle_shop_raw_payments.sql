with source as (
      select * from {{ source('jaffle_shop', 'raw_payments') }}
),
renamed as (
    select
        {{ adapter.quote("id") }},
        {{ adapter.quote("order_id") }},
        {{ adapter.quote("payment_method") }},
        {{ adapter.quote("amount") }}

    from source
)
select * from renamed
  