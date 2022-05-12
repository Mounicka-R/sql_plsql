Create table source_data
(st_id number(5),
St_name varchar2(20),
Marks number(5));

insert into source_data values(100,'ram',45);
insert into source_data values(101,'tim',85);
insert into source_data values(102,'bala',95);


Create table target_data
(st_id number(5),
St_name varchar2(20),
Marks number(5),
Top_marks number(5),
Least_marks number(5),
Varience_from_lowest number(5),
Varience_from_highest number(5));

commit;

select * from source_data;
select* from target_data;
------------------------------------------------------------------------------------------------------------
/
create or replace procedure sp_student
as
    cursor stu_cur is select * from source_data;
    v_cnt int;
    v_max int;
    v_min int;
begin
    for i in stu_cur loop
        select count(*) into v_cnt
        from target_data
        where st_id=i.st_id;
        select max(marks) into v_max
        from source_data;
        select min(marks) into v_min
        from source_data;
        if v_cnt=0 then
            insert into target_data values(i.st_id,i.st_name,i.marks,v_max,v_min,(i.marks-v_min),(i.marks-v_max));
        else
            dbms_output.put_line('data already exist');
        end if;
    end loop;
end;
/
exec sp_student;
/
select*from target_data;

----------------------------------------------------------------------------------
truncate table target_data;
truncate table source_data;