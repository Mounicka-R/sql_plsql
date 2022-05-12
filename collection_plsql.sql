/
create or replace procedure sp_coll 
as
    type list is table of emp%rowtype;
    emp_list list;
begin
    select * bulk collect into emp_list from emp;
    for i in 1..emp_list.last loop
        dbms_output.put_line(emp_list(i).ename||' , '||emp_list(i).sal);
    end loop;
end;
/
exec sp_coll;
--------------------------------------------------------------------------------
select *from emp;
/
create or replace procedure sp_coll1
as
    type list is table of emp.empno%type;
    empnos_list list:=list(7000,7001);
begin
    forall i in 1..empnos_list.last
        update emp set sal=sal+10000 where empno=empnos_list(i);
end;
/
exec sp_coll1;
select *from emp;
------------------------------------------------------------------