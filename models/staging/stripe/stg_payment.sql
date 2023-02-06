with payments as 
(
Select 
id as payment_id,
ORDERID,
PAYMENTMETHOD,
STATUS,
AMOUNT,
CREATED  
from {{source('stripe','payment')}}
)
select * from Payments