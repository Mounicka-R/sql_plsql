---print number of sales by passing year
/
create or replace procedure sp_cnt(p_year varchar2)
as
v_cnt int;
begin
select count(sales_id) into v_cnt
from sales_retail
where to_char(sales_date,'yyyy')=p_year;
dbms_output.put_line(v_cnt);
end;
/
exec sp_cnt(2020);

---------------------------------------------
---check account_id if exist update bal=1000 and insert into transaction type 'd'
/
create or replace procedure account(a_act_id,a_act_bal,a_txn_type)
as
check_valid int;
begin
select act_id into check_valid
from account
where act_id=a_act_id;
update acts set bal:=bal+a_act_bal
where act_id=a_act_id;
insert into txn values(seq_txn.nextval,a_act_id,a_act_bal,a_txn_type,sysdate);
exception
when no_data_found then
dbms_output.put_line('invalid act_id ');
end;
/
exec account(5,1000,'d');
/

---cursor
--find cust_name  from customer by passing city 'bangalore'
/
create or replace  procedure sp_cust(p_city varchar2)
as
cursor custname_cur is select cust_name 
                       from customer_retail 
                       where cust_city=p_city;
begin
for i in custname_cur loop
dbms_output.put_line(i.cust_name);
end loop;
end;
/
exec sp_cust('bangalore');