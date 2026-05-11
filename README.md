# Medicare Part D Drug Spending Analytics — dbt + Snowflake

## Overview
An analytics engineering project modeling Medicare Part D quarterly drug spending data from CMS (Centers for Medicare & Medicaid Services). Built with dbt Core and Snowflake following the three-layer architecture: sources → staging → marts.

## Business Questions Answered
- Which drugs drive the most Medicare Part D spending?
- How is the GLP-1 class (Ozempic, Mounjaro, Wegovy, Zepbound) growing year over year?
- Which manufacturers control the largest share of Part D spend?

## Project Architecture


![DAG](dbt_medicare_architecture.jpeg)