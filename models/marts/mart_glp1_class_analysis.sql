with staging as(
    select * from {{ ref('stg_medicare__part_d_spending') }}
),

glp1_tagged as(
    select brand_name,
    generic_name,
    reporting_period,
    total_spending,
    total_beneficiaries,
    total_claims,
    avg_spend_per_beneficiary,
    avg_spend_per_claim,
    case
    when lower(generic_name) like '%semaglutide%' then 'Semaglutide'
    when lower(generic_name) like '%tirzepatide%' then 'Tirzepatide'
    when lower(generic_name) like '%dulaglutide%' then 'Dulaglutide'
    when lower(generic_name) like '%liraglutide%' then 'Liraglutide'
    when lower(generic_name) like '%exanatide%' then 'Exanatide'
    else null
    end as glp1_molecule

    from staging
    where manufacturer_name = 'Overall'
),

final as(
    select *
    from glp1_tagged
    where glp1_molecule is not null 
)

select * from final 


