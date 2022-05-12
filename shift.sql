Create table holiday
(holi_id number(10),
Dt_date date,
Reason varchar2(20));

Create table shift_type
(shift_desc varchar2(20),
Start_time varchar2(20),
End_time varchar2(20));

Create table shifts
(shift_id number(10),
Dt_date date,
Start_time varchar2(20),
End_time varchar2(20));

insert into holiday values('101','01-jan-15','New Year');
insert into holiday values('102','16-jan-15','Shankaranthi');
insert into holiday values('103','26-jan-15','republic day');
insert into holiday values('104','18-feb-15','Id day');
insert into holiday values('105','01-may-15','May day');
insert into holiday values('106','15-aug-15','independence day');
insert into holiday values('107','01-nov-15','Karnataka day');

insert into shift_type values('erly_mrng_shift','6:00AM','2:00PM');
insert into shift_type values('afternoon_shift','2:00AM','10:00PM');

commit;
select *from shift_type;
------------------------------------------------------------------
create sequence seq_shift_id;
/
create or replace procedure sp_shift(p_mon_yy varchar2)
as
    v_start_date date;
    v_end_date date;
    v_cnt int;
begin
    v_start_date:=trunc(to_date(p_mon_yy,'mon-yy'),'mon');
    v_end_date:=last_day(v_start_date);
    while v_start_date<=v_end_date loop
        select count(Dt_date) into v_cnt from holiday where Dt_date=v_start_date;
        if to_char(v_start_date,'dy')='sat' and v_cnt=0 then
            insert into shifts values(seq_shift_id.nextval,v_start_date,'6:00 AM','2:00 PM');
        elsif to_char(v_start_date,'dy') not in ('sat','sun') and v_cnt=0 then
            insert into shifts values(seq_shift_id.nextval,v_start_date,'6:00 AM','2:00 PM');
            insert into shifts values(seq_shift_id.nextval,v_start_date,'2:00 AM','10:00 PM');
        else
            dbms_output.put_line('no shift');
        end if;
        v_start_date:=v_start_date+1;
    end loop;
end;
/
exec sp_shift('jan-2015');
/
select* from shifts;
select *  from holiday;
---------------------------------------------------------------------------------------------------------------------------------------







truncate table shifts;






select*from src;

delete from src
where rowid not in (select min(rowid) 
                    from src 
                    group by col1,col2);

rollback;



















