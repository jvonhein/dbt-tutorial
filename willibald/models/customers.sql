{{config(materialized='view')}}
with customers as (
    select * from {{ ref('stg_customers')}}
)
, orders as (
    select * from {{ ref('stg_orders')}}
)
, customer_orders as (
    select
        customer_id
        , min(order_date) as first_order_date
        , max(order_date) as most_recent_order_date
        , count(order_id) as number_of_orders
    from orders
    group by 1
)
, final as (
    select 
        c.customer_id
        , c.first_name
        , c.last_name
        , c_o.first_order_date
        , c_o.most_recent_order_date
        , coalesce(c_o.number_of_orders, 0) as number_of_orders
    from customers c
    left join customer_orders c_o using (customer_id)
)
select * from final