--1. Write a procedure to add columns to the existing customer table by passing column name and datatype.
set serveroutput on;
/
create or replace procedure spc(pc varchar,pd varchar) 
as
  n number(10);
  v varchar2(500);
begin 
  v:='alter table customer add '||pc ||'  '|| pd || ''||'(20)' ;
  execute immediate v ;
end;
/
exec spc('jhname','varchar2');
select*from customer;



------------------------------------------------------------------------------------------
--6. Pass the month and year and display the total sales of current month and previous month sales.
  
/
create or replace procedure sp_7 (p_month varchar,p_year number) 
as
  sales_count number(10);
  v varchar2(500);
  v_cnt number;
  v2 varchar2(500);
  v2_cnt number;
begin
  v:='select count(sales_id)
  from sales_retail
  where to_char(sales_date,'||''''||'mm-yyyy'||''''||')='||''''||'p_month'||''''||')';
  v2:='select count(sales_id)
  from sales_retail
  where to_char(sales_date,'||''''||'yyyy'||''''||')='p_year;
  execute immediate v into v_cnt;
  execute immediate v2 into v2_cnt;
  dbms_output.put_line(v_cnt);
  dbms_output.put_line(v2_cnt);
end;
/


select * from sales_retail;






