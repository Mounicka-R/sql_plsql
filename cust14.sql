



---select to_char(sysdate,'d') from dual;--2
--select to_char(sysdate,'dd') from dual;--14
--select to_char(sysdate,'ddd') from dual;--045

create table cust

(cust_id number(4) primary key,

cust_name varchar2(20),

cust_address varchar2(20),

cust_city varchar2(20),

phone_no number(10),

cust_email varchar2(50));

 

insert all

into cust values(1101,'abc','ring road','bangalore',9656892,'abc@gmail.com')

into cust  values(1102,'xyz','south end','mysore',9656892,'xyz@yahoo.co.in')

into cust values(1103,'pqr','ashoka pillar','hassan',9656892,'pqr@gmail.com')

into cust values(1104,'lmn','nandanavana','tumkur',9656892,'lmn@gmail.com')

into cust values(1105,'mno','tnagar','hubli',9656892,'mno@yahoo.co.in')

into cust values(1106,'tim','rrnagar','bangalore',9632192,'tim123@gmail.com')

select * from dual;

insert into cust values(1107,'sam','jpnagar','chennai',null,null);
select*from cust;  
commit;
select nvl(phone_no,0) from cust;
select nvl(cust_email,0) from cust;
select* from cust;
select nvl2(phone_no,0,1) from cust;

select nullif(cust_address,cust_city) from cust;
insert into cust values(1108,'vijay','bangalore','bangalore',98985,'vijay123@gmail.com');
select*from cust;
select nullif(cust_address,cust_city) from cust;
insert into cust values(1109,'vinay','same','hive',98986,'vinay123@gmail.com');

select coalesce(null,5) from dual;
select coalesce(null,null,6) from dual;
select coalesce(null,null,-1,4) from dual;

select case when cust_city in ('bangalore','dehli','mumbai') then 'metro' 
     else 'non-metro' 
 end case 
from cust;

select decode (cust_city, 'bangalore','b', 'mysore','m', 'hassan','h', cust_city) from cust;
select*from cust;

select wm_concat(cust_name) from cust;

--to_char
select to_char(sysdate,'yy') from dual;--22
select to_date('2019','yy') from dual;--01-02-19
select to_date('02','mm') from dual;--01-02-22
select to_date('23','dd') from dual;--23-02-22
select to_char(sysdate,'mm-yyyy') from dual;--02-2022
select to_number('23') from dual;--char to number 23
select to_char(sysdate,'dd-mm') from dual;--14-02
select to_char(sysdate,'year') from dual;--in words2022
select to_char(sysdate,'ddsp') from dual;--fourteen
select to_char(sysdate,'ddspth') from dual;--fourteenth
select to_char(sysdate,'ddsp-month-year') from dual;--all in words




