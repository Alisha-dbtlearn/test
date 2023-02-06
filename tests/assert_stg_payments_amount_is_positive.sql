with payments
as
(
    select * from {{ref('stg_payment')}}
)
select ORDERID,
sum(AMOUNT) as total_amount 
from payments
group by ORDERID
having total_amount < 0