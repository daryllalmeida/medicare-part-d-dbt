with source as (
    select * from {{ source('medicare_raw', 'MEDICARE_PART_D_SPENDING')}}
),

renamed as (
    select 
    brnd_name as brand_name,
    gnrc_name as generic_name,
    mftr_name as manufacturer_name,
    year as reporting_period,
 -- numeric fields (raw are stored as strings, cast here)
        tot_mftr                                                as total_manufacturers,

        try_cast(replace(tot_benes, ',', '') as integer)        as total_beneficiaries,
        try_cast(replace(tot_clms, ',', '') as integer)         as total_claims,

        try_cast(replace(replace(tot_spndng, '$', ''), ',', '') as float)           as total_spending,
        try_cast(replace(replace(avg_spnd_per_bene, '$', ''), ',', '') as float)    as avg_spend_per_beneficiary,
        try_cast(replace(replace(avg_spnd_per_clm, '$', ''), ',', '') as float)     as avg_spend_per_claim

    from source

)

select * from renamed
