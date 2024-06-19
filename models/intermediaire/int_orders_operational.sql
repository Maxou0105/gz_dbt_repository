
SELECT

orders.*,
cast(ship.ship_cost as FLOAT64) as ship_cost,
ship.logcost,
ship.shipping_fee,
round((margin + (ship.shipping_fee - ship.logcost - cast(ship.ship_cost as FLOAT64))),2) as operational_margin

from {{ref('int_orders_margin')}}as orders
LEFT JOIN {{ref('stg_raw__ship')}} as ship
USING (orders_id)




