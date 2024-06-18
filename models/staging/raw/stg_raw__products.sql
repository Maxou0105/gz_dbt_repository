with 

source as (

    select * from {{ source('raw', 'products') }}

),

prod as (

    select
        products_id,
        purchse_price as purchase_price

    from source

)

select * from prod
