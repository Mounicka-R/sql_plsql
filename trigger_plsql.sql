---------------------------------------------------------------------------------------
-----statement level trigger
create sequence seq_audit;
/
create or replace trigger trg_cust_audit
after insert or update or delete on customer
declare
    v_ent varchar2(30);
begin
    if inserting then
        v_ent := 'insertion';
    elsif updating then
        v_ent := 'updation';
    else
        v_ent :='deletion';
    end if;
    insert into cust_audit values(seq_audit.nextval,v_ent,sysdate);
end;
/

insert into customer values(5,'sam','22-04-22',9887634567,'bangalore','');
commit;
-----------------------------------------------------------------------------------------------
create table cust_audit(
cust_audit_id number(5) primary key,
cust_evt varchar(50),
cust_date date);

select * from cust_audit;
select*from customer;
----------------------------------------------------------------
-------instead trigger
/
create or replace trigger tg_product
after insert on product
for each row
declare 
v_cnt number;
pragma autonomous_transaction ;
begin
select count(*) into v_cnt from product;
dbms_output.put_line('no_of_products'||' , '||v_cnt);
end;
/
select * from product;
insert into product values(106,'tv','electronic_device',30000,35000,'23-04-22');
/

--------------------------------------------------------------------------------------
-----row level trigger
/
create or replace trigger trag_city
before insert on customer
for each row
begin
if (:new.cust_city!='bangalore') then
raise_application_error(-20001,'out of bangalore or not allowed');
end if;
end;
/
insert into customer values(6,'akshay','02-4-20',98989999,'delhi','');
select*from customer;

---------------------------------------------------------------------------------------
----row level trigger
/
create or replace trigger tg_sal
before update on emp
for each row
begin
    if (:new.sal < :old.sal) then
    raise_application_error(-20002,'sal must be more than 5000');
    end if;
end;
/
update emp
set sal=4000;
/
select*from emp;
--------------------------------------------------------------------------------------------
----statement level trigger
/
create or replace trigger tg_time
before insert or update or delete on customer
begin
    if (to_char(sysdate,'HH24')) not between 9 and 18 or to_char(sysdate,'dy') in ('sat','sun') then 
    raise_application_error(-20003,'not business hours');
    end if;
end;
/

------------------------------------------------------------------------------------------------------------


