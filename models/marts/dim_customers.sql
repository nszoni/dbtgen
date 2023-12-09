with customers as (

    select * from {{ ref('base_jaffle_shop_raw_customers') }}

),

orders as (

    select * from {{ ref('base_jaffle_shop_raw_orders') }}

),

payments as (

    select * from {{ ref('base_jaffle_shop_raw_payments') }}

),

customer_orders as (

        select
        user_id as customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(orders.id) as number_of_orders
    from orders

    group by customer_id

),

customer_payments as (

    select
        orders.user_id as customer_id,
        sum(amount) as total_amount

    from payments

    left join orders on
         payments.order_id = orders.id

    group by customer_id

),

final as (

    select
        customers.id as customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_orders
        on customers.id = customer_orders.customer_id

    left join customer_payments
        on  customers.id = customer_payments.customer_id

)

select * from final