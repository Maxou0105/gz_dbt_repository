SELECT 
date_date,
round(sum(revenue),1) as revenue,
count(orders_id)  as nb_transac,
round(sum(revenue)/count(orders_id),2) as average_basquet,
round(sum(margin),1) as margin,
round(sum(operational_margin)) as operational_margin

 FROM {{ref('int_orders_operational')}}
  GROUP BY date_date
order by date_date desc