SELECT 
finance.*,
campaign.ads_cost,
campaign.ads_impression,
campaign.ads_click,
(finance.operational_margin - campaign.ads_cost) as ads_margin,
FROM {{ref('finance_days')}} as finance
LEFT JOIN {{ref('int_campaigns_day')}} as campaign
USING (date_date)