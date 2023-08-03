{{
    config(materialized='external', location='target/corporation_contribution.parquet')
}}

with __corporation_industry as (
    select * from {{ ref('stg_corporation_industry') }}
),

__industry_category as (
    select * from {{ ref('stg_industry_category') }}
),

corp_industry_category as (
    select
        id, industry, industry_category
    from __corporation_industry
        left join __industry_category on
            __corporation_industry.industry_lookup = __industry_category.industry
)

select

    election_name,
    locality,
    candidate,
    transaction_date,
    income_amount,

    who_id as corp_id, 
    who as name,

    industry,
    industry_category

from {{ ref('stg_transaction') }}
    left join corp_industry_category on
        who_id = corp_industry_category.id

where category = '營利事業捐贈收入'
