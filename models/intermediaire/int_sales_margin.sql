with source_sales as (

    select * from {{ source('raw', 'sales') }}

),

sales as (

    select
        date_date,
        orders_id,
        pdt_id as products_id,
        revenue,
        quantity

    from source_sales

),

source_pdt as (

    select * from {{ source('raw', 'products') }}

),

prod as (

    select
        products_id,
        purchse_price as purchase_price

    from source_pdt

),

Join1 as (
select sales.*,
CAST(prod.purchase_price as FLOAT64) as purchase_price
from sales 
LEFT JOIN prod 
USING (products_id)
)

select *,
round((revenue - purchase_price),2) as margin,
round((quantity*purchase_price),2) as purchase_cost

FROM join1
