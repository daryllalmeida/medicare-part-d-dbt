with staging as (
    select * 
    from {{ ref('stg_medicare__part_d_spending') }}
)
,
manufacturer_spend as(
    select manufacturer_name,
    reporting_period,
    sum(total_spending) as total_spending,
    sum(total_claims) as total_claims,
    sum(total_beneficiaries) as total_beneficiaries,
    count(distinct brand_name) as distinct_drugs

    from staging
    where manufacturer_name = 'Overall'
    group by 1,2
)
,

total_spend as (
    select reporting_period,
    sum(total_spending) as period_total_spending
    from manufacturer_spend
    group by 1
),

final as (
    select m.manufacturer_name,
    m.reporting_period,
    m.total_spending,
    m.total_claims,
    m.total_beneficiaries,
    m.distinct_drugs,
    round(m.total_spending / t.period_total_spending * 100, 2) as market_share_pct
    from manufacturer_spend m
    join total_spend t on m.reporting_period= t.reporting_period
)

select *
from final 
order by reporting_period, total_spending desc