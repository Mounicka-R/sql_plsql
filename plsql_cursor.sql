----using cursor display cust_name and email from customer_retail

/
declare
cursor cur_details is select * from customer_retail;
v_rec customer_retail%rowtype;
begin
open cur_details;
loop
fetch cur_details into v_rec;
exit when cur_details %notfound;
dbms_output.put_line(v_rec.cust_name || ' , ' || v_rec.cust_email);
end loop;
close cur_details;
end;
/ 
set serveroutput on;

---more >2500 grade A,>1500 grade B,>1000 grade c,else grade d

/
declare
cursor grade is select sal,ename from emp;
v_ename emp.ename%type;
v_sal emp.sal%type;
begin
open grade;
loop
fetch grade into v_sal,v_ename;
exit when grade%notfound;
if v_sal>2500 then
dbms_output.put_line(v_ename || ' , ' || v_sal || ' , ' || 'grade a');
elsif v_sal>1500 then
dbms_output.put_line(v_ename || ' , ' || v_sal || ' , ' || 'grade b');
elsif v_sal>100 then
dbms_output.put_line(v_ename || ' , ' || v_sal || ' , ' || 'grade c');
else
dbms_output.put_line(v_ename || ' , ' || v_sal || ' , ' || 'grade d');
end if;
end loop;
close grade;
end;
/

---for cursor
/
declare
cursor cur_emp is select * from emp;
begin
for i in cur_emp
loop
dbms_output.put_line(i.ename|| ' , '||i.sal|| ' , '|| i.job);
end loop;
end;
/

---process all the record
/
declare
cursor guest_c is select * from guest;
v_rec guest%rowtype;
begin
open guest_c;
loop
fetch guest_c into v_rec;
exit when guest_c%notfound;
dbms_output.put_line(v_rec.name|| ' , ' ||v_rec.phone|| ' , '||v_rec.city);
end loop;
close guest_c;
end;
/

----procedure
select * from product_retail;
select * from sales_retail;
/
select *from 
(select p.p_name,count(sales_id) no_of_sales,dense_rank() over (order by count(sales_id)desc)rank
from product_retail p,sales_retail s
where p.prod_id=s.prod_id
group by p.p_name)A
where A.rank<=10;
/

/
create or replace procedure sp_top_customer as
cursor top_10 is select *from 
(select p.p_name,count(sales_id) no_of_sales,dense_rank() over (order by count(sales_id)desc) rank
from product_retail p,sales_retail s
where p.prod_id=s.prod_id
group by p.p_name)A
where A.rank<=10;
begin
for i in top_10 loop
dbms_output.put_line(i.p_name||' , ' ||i.no_of_sales || ' , ' ||i.rank);
end loop;
end;
/
exec sp_top_customer;
/

---count no of alphabet
/
declare
a varchar2(20) := 'abcdeabcfgh';
sub varchar2(20);
cnt int;
begin
for i in 1..length(a) loop
sub:=substr(a,i,1);
select regexp_count(a,sub,1) into cnt from dual;
dbms_output.put_line(sub||' = '||cnt);
end loop;
end;
/
