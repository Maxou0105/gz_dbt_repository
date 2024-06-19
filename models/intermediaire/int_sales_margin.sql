select 
sales.*,
round(revenue - cast(purchase_price as FLOAT64)*quantity,2) as margin,
round((quantity*cast(purchase_price as FLOAT64)),2) as purchase_cost,
CAST(prod.purchase_price as FLOAT64) as purchase_price
from {{ref('stg_raw__sales')}}as sales 
LEFT JOIN {{ref('stg_raw__products')}} as prod 
USING (products_id)



