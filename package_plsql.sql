create or replace package pkg_proc as
v_cnt int;
procedure sp_p1;
function fn_f1 return number;
end;
/
create or replace package body pkg_proc as
procedure sp_p1 as
begin
insert into emp values(7001,'SAM','CLERK',7902,'22-04-22',1000,500,30);
dbms_output.put_line(sql%rowcount||' rows modified');
end;


function fn_f1 return number as
v_cnt int;
begin
select count(*) into v_cnt
from emp;
return v_cnt;
end;
end;
/

exec pkg_proc.sp_p1;
select pkg_proc.fn_f1 from dual;
/

select * from emp;

-------------------------------------------------------------------------------------------------------------
----forward declaration
/
create or replace package pkg_proc_fn as
v_cnt int;
procedure sp_pp1;
function fn_ff1 return number;
end;
/
create or replace package body pkg_proc_fn as
procedure sp_prod1;-----forward declaration
procedure sp_pp1 as
begin
insert into product values(107,'tv','electronic_device',30000,35000,'23-04-22');
dbms_output.put_line(sql%rowcount||' rows modified');
end;

procedure sp_prod1 as
begin
insert into product values(108,'wm','electronic_device',50000,100000,'25-04-22');
dbms_output.put_line(sql%rowcount||' rows modified');
end;

function fn_ff1 return number as
v_cnt int;
begin
select count(*) into v_cnt
from product;
return v_cnt;
end;
end;
/

exec pkg_proc_fn.sp_pp1;
--exec pkg_proc_fn.sp_prod1;
select pkg_proc_fn.fn_ff1 from dual;

-----------------------------------------------------------------------------
