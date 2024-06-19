with 

source as (

    select * from {{ source('raw', 'facebook') }}

),

renamed as (

  select
        date_date,
        paid_source,
        campaign_key,
        campgn_name as campaign_name,
        CASE
        WHEN cast(ads_cost as FLOAT64) is null THEN 0
        ELSE cast(ads_cost as FLOAT64)
        END as ads_cost,
        CASE
        WHEN impression is null THEN 0
        ELSE impression
        END as impression,
        CASE
        WHEN click is null THEN 0
        ELSE click
        END as click

    from source

)

select * from renamed
