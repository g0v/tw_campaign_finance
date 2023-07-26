--     config(materialized='table')
{{

    config(materialized='external', location='target/campaign-transaction.parquet')

}}

with raw_transaction as (

select * from {{ source('cy', 'transaction') }}


)

select

"選舉名稱" as election_name,
"縣市" as locality,
"序號" as seq,
"擬參選人／政黨" as candidate,
"申報序號／年度" as seq_year,
strptime(cast(19110000 + "交易日期"::int as varchar), '%Y%m%d')::date as transaction_date,
"收支科目" as category,
"捐贈者／支出對象" as who,
"身分證／統一編號" as who_id,
"收入金額"::int as income_amount,
"支出金額"::int as expense_amount,
"捐贈方式" as income_type,
strptime(cast(19110000 + "存入專戶日期"::int as varchar), '%Y%m%d')::date as deposit_date,
"返還/繳庫" as remittance,
"支出用途" as expense_type,
"金錢類" as monetary_type,
"地址" as address,
"聯絡電話" as phone,
"應揭露之支出對象" as expense_disclosure,
"支出對象之內部人員姓名" as expense_stakeholder_name,
"支出對象之內部人員職稱" as expense_stakeholder_role,
"政黨之內部人員姓名" as party_stakeholder_name,
"政黨之內部人員職稱" as party_stakeholder_role,
"關係" as relationship,
"更正註記" as correction_note,
"資料更正日期" as correction_date

from raw_transaction