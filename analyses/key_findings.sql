--1st insight - Brands with highest spending

select brand_name, reporting_period, round(total_spending,2)
from MEDICARE_DB.PUBLIC.MART_DRUG_SPENDING_SUMMARY
where reporting_period = '2024 (Q1-Q4)'
order by total_spending desc
limit 20;

-- 2nd insight -- Zepbound growth in total spending for medicare part d

SELECT brand_name,reporting_period, total_spending
from MEDICARE_DB.PUBLIC.MART_GLP1_CLASS_ANALYSIS
where brand_name = 'Zepbound'
order by reporting_period;


-- 3rd insight -- Wegovy growth in total spending for medicare part d

select brand_name, reporting_period, total_spending
from MEDICARE_DB.PUBLIC.MART_GLP1_CLASS_ANALYSIS
where brand_name = 'Wegovy'
order by reporting_period;


-- 4th insight - top manufacturers for spending

select manufacturer_name, reporting_period, total_spending, market_share_pct
from MEDICARE_DB.PUBLIC.MART_MANUFACTURER_CONCENTRATION
where reporting_period = '2024 (Q1-Q4)'
order by total_spending desc
limit 10;

