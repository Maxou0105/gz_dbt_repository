SELECT 
date_date,
round(sum(ads_cost),1) as ads_cost,
round(sum(impression),1) as ads_impression,
round(sum(click),1) as ads_click

FROM {{ref('int_campaigns')}}
GROUP BY date_date