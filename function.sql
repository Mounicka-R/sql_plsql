create table electronic
(ele_id number(5),
ele_nm varchar(20),
ele_price number(10),
ele_cost number(10),
launch_dt date);

select*from electronic;
desc electronic;

insert into electronic values
(1,'resistor',50,60,'10-jan-2015');
insert all 
into electronic values(2,'capacitor',75,90,'28-june-2018')
into electronic values(3,'diode',150,167,'20-feb-2020')
into electronic values(4,'battery',300,390,'26-oct-2019')
into electronic values(5,'switch',185,205,'15-may-2020')
select*from dual;
select*from electronic;



rollback;
select*from electronic;
rollback;
commit;


select upper(ele_nm) from electronic
where ele_id=4;

update electronic
set ele_nm = upper(ele_nm)
where ele_id=4;

select*from electronic;
select lower(ele_nm) from electronic
where ele_id=4;

update electronic
set ele_nm = lower(ele_nm)
where ele_id=4;

select initcap(ele_nm) from electronic;
select*from electronic;

update electronic
set ele_nm = initcap(ele_nm);

SELECT ASCII('A') FROM DUAL;

SELECT ASCII(ele_nm) FROM electronic;

select*from electronic;
commit;

update electronic
set ele_nm = ASCII(ele_nm);

select*from electronic;
rollback;
select*from electronic;


SELECT CHR(99) FROM DUAL;
select chr(95)from dual;
SELECT TRIM('#' FROM 'ST#RIN#NG') FROM DUAL;
select trim('$' from '$aro$ha$') from dual;
select ltrim('qqqqaroha','q') from dual;
select ltrim('$$$aroha$','$') from dual;
select ltrim('q$aroha','q$') from dual;
select rtrim('qqqqarohaqqqq','q') from dual;
select lpad('arohatech',10,'$') from dual;
select rpad('aroha',10,'$') from dual;
select substr('aroha tech',5,4) from dual;
select instr('barohaggg','a',1,1) from dual;
select instr('vijay','a',2,1) from dual;
select replace('aroha','a','g') from dual;
select replace('aroha','oh','gi') from dual;
select reverse('build') from dual;
select translate('aroha','ao','xy') from dual;
select trim('      hiii     ') from dual;
select translate('alpha ultra','at','xy') from dual;
select round(11.7) from dual;
select round(11.5) from dual;
select TRUNC(295.79798, 4) from dual;
select TRUNC(15.79) from dual;
select TRUNC(15.79, 1) from dual;
select ceil(9.0) from dual;
select mod(27,4) from dual;
select ceil(10.1) from dual;
select floor(9.9) from dual;
select abs(-7) from dual;
select power(2,7) from dual;
select sqrt(8) from dual;
select sign(-0.5) from dual;
select sign(0.5) from dual;  
select greatest(1.1,1.5,1.4,1.9) from dual;
select least(1.1,1.5,1.4,1.9) from dual;

select round(sysdate,'yy') from dual;
select trunc(sysdate,'yy') from dual;
select months_between('22-jan-17','18-apr-18') from dual;
select last_day('22-jul-18') from dual;
select next_day('14-jan-22','friday') from dual;
select add_months('13-mar-18',5) from dual;
select greatest(ele_price) from electronic;
select add_months(trunc(sysdate,'yy'),12) from dual;---to get next year 1st day
select last_day(round(sysdate,'yy'))from dual;---last day to month