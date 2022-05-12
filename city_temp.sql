Create table city_temp
(city varchar2(10),
Morning_temp number(10),
Afternoon_temp number(10),
Evening_temp number(10));

Create table city_temp_normalized
(city varchar2(20),
Time varchar2(20),
Celcius number(10),
Farienheat number(10));


insert into city_temp values('BLR',22,28,25);
insert into city_temp values('CHE',25,30,28);
insert into city_temp values('DEL',27,31,30);
insert into city_temp values('MLR',25,30,29);
insert into city_temp values('MUM',26,30,30);


commit;

select * from city_temp;
select * from city_temp_normalized;
-------------------------------------------------------------------------------------
/
create or replace procedure sp_city_temp
as
    v_cnt int;
    cursor cur_temp is select * from city_temp;
begin
    for i in cur_temp loop
        select count(city) into v_cnt
        from city_temp_normalized
        where city=i.city;
        if v_cnt=0 then
          insert into city_temp_normalized values(i.city,'morning',i.morning_temp,(i.morning_temp*9/5)+32);
          insert into city_temp_normalized values(i.city,'afternoon',i.afternoon_temp,(i.afternoon_temp*9/5)+32);
          insert into city_temp_normalized values(i.city,'evening',i.evening_temp,(i.evening_temp*9/5)+32);
        else
            dbms_output.put_line('data already exists');
        end if;
    end loop;
end;
/
exec sp_city_temp;
/
select * from city_temp_normalized;
----------------------------------------------
truncate table city_temp_normalized;
truncate table city_temp;