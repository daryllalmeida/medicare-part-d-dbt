with staging as(
    select * from {{ ref('stg_medicare__part_d_spending') }}
),
final as (
    select brand_name,
    generic_name, reporting_period,
    sum(total_spending) as total_spending,
    sum(total_beneficiaries) as total_beneficiaries,
    sum(total_claims) as total_claims,
    avg(avg_spend_per_beneficiary) as avg_spend_per_beneficiary,
    avg(avg_spend_per_claim) as avg_spend_per_claim
    
    from staging
    where manufacturer_name = 'Overall'
    group by 1,2,3
)

select * from final