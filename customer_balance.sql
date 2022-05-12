create table customer_balance
(Name varchar2(30),
Balance number(20));

insert all 
into customer_balance values('Vijay',100)
into customer_balance values('Vijay',200)
into customer_balance values('Vijay',300)
into customer_balance values('Aashish',500)
into customer_balance values('Aashish',700)
into customer_balance values('Aashish',800)
into customer_balance values('Murali',1000)
into customer_balance values('Murali',1200)
into customer_balance values('Murali',1400)
select*from dual;

select*from customer_balance;





select Name,min(Balance)as Balance
from customer_balance
group by Name;





select*from Article_dimension;
select*from Calender_dimension;
select*from shop_dimension;
select*from shop_facts;


create table lead
(lead_nm varchar2(30),
lead_city varchar2(30));


insert all 
into lead values('TIM','NY')
into lead values('BILL','NY')
into lead values('UMA','BLR')
into lead values('TIM','NY')
into lead values('TIM','BLR')
select*from dual;

commit;
select*from lead;
----write a query to identify the duplicate records
select lead_nm,lead_city
from lead
group by lead_nm,lead_city
having count(*)>1;

---write a delete statment to remove the duplicate records 
---in this case after delete you should see only one record for tim who belong to ny city
delete from lead
where rowid not in(select max(rowid)
from lead
group by lead_nm,lead_city);

rollback;
