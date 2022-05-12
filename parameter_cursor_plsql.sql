select*from emp;
select *from dept;
/
create or replace procedure sp_hr
as
    cursor c is select deptno,dname from dept;
    cursor c1(p_deptno int) is select * from emp where deptno=p_deptno;
begin
    for i in c loop
        dbms_output.put_line(i.deptno||' , '||i.dname);
    for j in c1(i.deptno) loop
        dbms_output.put_line(j.ename);
    end loop;
    end loop;
end;
/
exec sp_hr;
-------------------------------------------------------------------------

    