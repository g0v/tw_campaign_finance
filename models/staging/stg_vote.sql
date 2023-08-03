{{

     config(materialized='table')

}}

--選舉名稱,縣市,姓名,省市別,縣市別,選區別,鄉鎮市區,村里別,投開票所,得票數

with raw_vote as (

select * from {{ source('cec', 'vote') }}

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
"投開票所" as vote_place,
"得票數" as vote_count

from raw_vote
