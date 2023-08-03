{{

     config(materialized='table')

}}


--選舉名稱,縣市,姓名,省市別,縣市別,選區別,鄉鎮市區,村里別,號次,政黨,性別,出生日期,年齡,出生地,學歷,現任,當選註記,副手

with raw_candidate as (

select * from {{ source('cec', 'candidate') }}

)

select

"選舉名稱" as election_name,
"縣市" as locality,
"姓名" as candidate,
"省市別" as admin1,
"縣市別" as admin2,
"選區別" as electoral_district,
"鄉鎮市區" as admin3,
"村里別" as admin4,
"號次" as num,
"政黨" as party,
"性別" as gender,
--strptime("出生日期", '%Y-%m-%d')::date as dob,
"年齡" as age,
"出生地" as birthplace,
"學歷" as education,
(CASE "現任"
WHEN 'Y' THEN true
WHEN 'N' THEN false
ELSE false
END) as in_office,
"當選註記" as elected,
"副手" as deputy

from raw_candidate
