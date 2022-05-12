create table customer_file(
cust_name varchar2(30),
cust_phone number(10),
cust_city varchar2(30),
cust_since date);

insert all 
into customer_file values('TIM',12345678,'Chennai','15-Jan-05')
into customer_file values('BALA',49595089,'Chennai','16-Jan-06')
into customer_file values('RAMESH',345093450,'Mumbai','17-Feb-07')
into customer_file values('TIM',12345678,'Chennai','15-Jan-05')
into customer_file values('BALA',49595089,'Chennai','16-Jan-06')
select*from dual;

select*from customer_file;


create table cust_target(
cust_name varchar2(30),
cust_phone number(10),
cust_city varchar2(30),
cust_since date);

insert into cust_target
select *
from customer_file
where rowid in(select max(rowid)
from customer_file
group by cust_name,cust_since);

select*from cust_target;



create table cust_duplicate(
cust_name varchar2(30),
cust_phone number(10),
cust_city varchar2(30),
cust_since date,
no_of_instances number(10));

insert into cust_duplicate
select cust_name,cust_phone,cust_city,cust_since, count(cust_name) no_of_instances
from customer_file
group by cust_name,cust_phone,cust_city,cust_since
having max(rowid) not in (select min(rowid)
from customer_file
group by cust_since,cust_name);

select*from cust_duplicate;

commit;

