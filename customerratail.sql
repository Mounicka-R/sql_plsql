create table customer_retail

(cust_id number(4) primary key,

cust_name varchar2(20),

cust_address varchar2(20),

cust_city varchar2(20),

phone_no number(10),

cust_email varchar2(50));

 

insert all

into customer_retail values(1101,'abc','ring road','bangalore',9656892,'abc@gmail.com')

into customer_retail values(1102,'xyz','south end','mysore',9656892,'xyz@yahoo.co.in')

into customer_retail values(1103,'pqr','ashoka pillar','hassan',9656892,'pqr@gmail.com')

into customer_retail values(1104,'lmn','nandanavana','tumkur',9656892,'lmn@gmail.com')

into customer_retail values(1105,'mno','tnagar','hubli',9656892,'mno@yahoo.co.in')

into customer_retail values(1106,'tim','rrnagar','bangalore',9632192,'tim123@gmail.com')

select * from dual;

commit;



create table product_retail

(prod_id number(5) primary key,

p_name varchar2(20),

price number(10),

cost number(10),

launch_date date,

p_family varchar2(20));

 

insert into product_retail values(100,'tv',40000,45000,'12-jan-21','electronics');

insert into product_retail values(200,'fridge',20000,18000,'24-feb-22','electronics');

insert into product_retail values(300,'Computer',30000,25000,'11-mar-20','electronics');

insert into product_retail values(400,'Printer',10000,8000,'16-aug-20','electronics');

insert into product_retail values(500,'table',25000,20000,'14-sep-19','Furniture');

insert into product_retail values(600,'sofa',80000,95000,'10-dec-20','Furniture');

commit; 

create table sales_retail

(sales_id number(4) primary key,

sales_date date,

cust_id number(4) references customer_retail(cust_id),

prod_id number(4) references product_retail(prod_id),

amount number(10));

 

 

 

insert all

into sales_retail values(1,'22-apr-20',1101,100,25000)

into sales_retail values(2,'13-dec-21',1102,100,35000)

into sales_retail values(3,'29-mar-20',1103,200,65000)

into sales_retail values(4,'19-jun-19',1104,200,85000)

into sales_retail values(5,'20-nov-18',1105,300,95000)

into sales_retail values(6,'20-may-21',1105,300,25000)

into sales_retail values(7,'21-may-20',1101,300,45000)

into sales_retail values(8,'22-may-20',1101,300,55000)

into sales_retail values(9,'23-may-21',1101,400,45000)

into sales_retail values(10,'24-may-20',1102,100,15000)

into sales_retail values(11,'20-may-19',1102,200,25000)

into sales_retail values(12,'21-may-18',1103,400,45000)

into sales_retail values(13,'22-may-19',1104,500,55000)

into sales_retail values(14,'23-may-20',1105,200,45000)

into sales_retail values(15,'24-may-20',1105,100,15000)

select * from dual;
commit;

select*from customer_retail;
select*from product_retail;
select*from sales_retail;

--15record
select cu.cust_name,s.sales_date
from  customer_retail cu, sales_retail s
where cu.cust_id=s.cust_id;

--16 record
select cu.cust_name,s.sales_date
from  customer_retail cu, sales_retail s
where cu.cust_id=s.cust_id(+);

----15 record
select cu.cust_name,s.sales_date
from  customer_retail cu, sales_retail s
where cu.cust_id(+)=s.cust_id;



---15record
select *
from  product_retail p, sales_retail s
where p.prod_id=s.prod_id;

----16 record
select p_name,sales_date
from  product_retail p, sales_retail s
where p.prod_id=s.prod_id(+);

--15 record
select p_name,sales_date
from  product_retail p, sales_retail s
where p.prod_id(+)=s.prod_id;

---inner join for customer
select *
from  customer_retail cu inner join sales_retail s
on cu.cust_id=s.cust_id;

----inner join for product
select *
from  product_retail p inner join sales_retail s
on p.prod_id=s.prod_id;

---left join
select *
from  product_retail p left join sales_retail s
on p.prod_id=s.prod_id;

--right join
select *
from  product_retail p right join sales_retail s
on p.prod_id=s.prod_id;

--full outer join 16 record
select *
from  product_retail p full outer join sales_retail s
on p.prod_id=s.prod_id;

---all 3 table to join
select *
from  product_retail p  , sales_retail s , customer_retail cu
where cu.cust_id=s.cust_id
and p.prod_id=s.prod_id;


---cross join 540 record
select *
from  product_retail p  , sales_retail s , customer_retail cu;

---cross join 90 record
select *
from  product_retail p  , sales_retail s;

----cross join 90 record
select *
from  customer_retail cu, sales_retail s; 


select*from emp;
desc emp;
select*from dept;


---self join
select e.ename,m.ename
from emp e, emp m
where e.mgr=m.empno;

select*from customer_retail;
select*from sales_retail;
select*from product_retail;

select cust_name
from customer_retail
where cust_id  not in (select  distinct cust_id
from sales_retail);









