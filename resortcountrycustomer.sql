create table country(COUNTRY_ID INT PRIMARY KEY,    
COUNTRY_NAME  VARCHAR2(20));
/
create table RESORT(RES_ID INT PRIMARY KEY,
RES_NAME VARCHAR(40),
RES_TYPE VARCHAR (40),
COUNTRY_ID INT REFERENCES COUNTRY(COUNTRY_ID));
/
CREATE TABLE CUSTOMER2(CUST_ID INT PRIMARY KEY ,
CUST_NAME VARCHAR(40),
CUST_PHONE NUMBER(10),
CUST_CITY VARCHAR (40),
CUST_DOB DATE,
COUNTRY_ID INT REFERENCES COUNTRY(COUNTRY_ID));



insert all 
into country values(100,'INDIA')
into country values(101,'SRILANKA')
into country values(102,'USA')
into country values(103,'CANADA')
select*from dual;

select*from country;

insert all 
into resort values(50,'TAJ MUMBAI','CITY CENTER',100)
into resort values(51,'TAJ GOA','BEACH RESORT',100)
into resort values(52,'RAMADA','BEACH RESORT',101)
into resort values(53,'BLUE LIFE','BEACH RESORT',101)
into resort values(54,'LEMON TREE','CITY CENTER',100)
select*from dual;

SELECT*FROM RESORT;
COMMIT;


insert into customer2 values(1,'TIM',67687898,'NY','10-JAN-00',102);
insert into customer2 values(2,'BILL',89978997,'NY','12-FEB-99',102);
insert into customer2 values(3,'RAM',87997997,'BLR','13-MAR-01',100);
insert into customer2 values(4,'KUMAR',56867989,'BLR','19-APR-03',100);
insert into customer2(cust_id,cust_name,cust_phone,cust_city,country_id) values(5,'UMA',54578999,'TORANTO',103);
insert into customer2 values(6,'SURAJ',97909788,'TORANTO','15-NOV-98',103);
insert into customer2(cust_id,cust_name,cust_city,country_id) values(7,'SUMA','MUMBAI',100);
insert into customer2(cust_id,cust_name,cust_city,cust_dob,country_id) values(8,'VISH','MUMBAI','14-FEB-88',100);
select*from dual;

select *from customer2;

commit;

/



select country_name,count(res_id)
from country c,resort r
where c.country_id=r.country_id
group by country_name;


/
select country_name,count(cust_id)
from country c,customer2 cu
where c.country_id=cu.country_id
group by country_name;

/

select C.country_name,nvl(customer.cust,0),nvl(resort.resort,0)
from(select country_id,count(res_id) resort
from resort
group by country_id)resort,(select country_id, count(cust_id) cust
from customer2 cu
group by country_id) customer,country C
where C.country_id=resort.country_id(+)
and C.country_id=customer.country_id(+);

/


/
select c.country_name,count(distinct(res_id)),count(distinct(cust_id))
from country c,resort r,customer2 cu
where c.country_id=cu.country_id(+)
and c.country_id=r.country_id(+)
group by c.country_name,c.country_id;
/


select*from resort;
select*from customer2;
select*from country;

select A.country_name,A.res_name,B.country_name ,B.cust_name
from(select country_name,res_name,rownum r
from  country c,resort r
where c.country_id=r.country_id) A,
(select country_name,cust_name,rownum r1
from country c,customer2 cu
where c.country_id=cu.country_id) B
where A.r(+)=B.r1;





select country_name,res_name,cust_name
from country c,resort r,customer2 cu
where c.country_id=cu.country_id
and c.country_id=r.country_id;


select *
from country c,resort r,customer2 cu
where c.country_id=cu.country_id
and c.country_id=r.country_id;


------derived query for rownum to get 3 and 4 record
select * from(
select country_name,rownum r
from country
where rownum<=4)temp_country
where r>2;


