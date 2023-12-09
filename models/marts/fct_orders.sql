{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select * from {{ ref('base_jaffle_shop_raw_orders') }}

),

payments as (

    select * from {{ ref('base_jaffle_shop_raw_payments') }}

),

order_payments as (

    select
        id as order_id,

        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount,
        {% endfor -%}

        sum(amount) as total_amount

    from payments

    group by order_id

),

final as (

    select
        orders.id as order_id,
        orders.user_id as customer_id,
        orders.order_date,
        orders.status,

        {% for payment_method in payment_methods -%}

        order_payments.{{ payment_method }}_amount,

        {% endfor -%}

        order_payments.total_amount as amount

    from orders


    left join order_payments
        on orders.id = order_payments.order_id

)

select * from final