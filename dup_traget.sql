Create table customer_10
(cust_name varchar2(20),
Cust_phone number(10),
Cust_city varchar2(20),
Cust_since date
);

Create table cust_unique
(cust_name varchar2(20),
Cust_phone number(10),
Cust_city varchar2(20),
Cust_since date); 


Create table cust_dup
(cust_name varchar2(20),
Cust_phone number(10),
Cust_city varchar2(20),
Cust_since date,
No_of_instances number(4)
);

insert into customer_10 values('raj',12345,'blr','21-jan-19');
insert into customer_10 values('kiran',989734,'hyd','19-mar-18');
insert into customer_10 values('kimm',878384,'chn','29-apr-19');
insert into customer_10 values('rajesh',783738,'blr','31-jan-18');
insert into customer_10 values('arun',892393,'del','23-aug-18');
insert into customer_10 values('rajesh',783738,'blr','31-jan-18');
insert into customer_10 values('arun',892393,'del','23-aug-18');



select * from customer_10;
select * from cust_unique;
select * from cust_dup;
commit;

--------------------------------------------------------------------------
/
create or replace procedure sp_dup
as
    v_count int;
    v_count1 int;
    
    cursor cur_uniq is (select cust_name,cust_phone,cust_city,cust_since
                       from customer_10);
    cursor cur_dup is (select cust_name,cust_phone,cust_city,cust_since,count(*) no_of_instances
                      from customer_10
                      group by cust_name,cust_phone,cust_city,cust_since
                      having count(*)>1);
begin
    for i in cur_uniq loop
        select count(cust_name) into v_count from cust_unique where cust_name=i.cust_name;
        if v_count=0 then
            insert into cust_unique values(i.cust_name,i.cust_phone,i.cust_city,i.cust_since);
        end if;
    for j in cur_dup loop
        select count(cust_name) into v_count1 from cust_dup where cust_name=j.cust_name;
        v_no_of_instances:=(select count(*) from customer_10);
        if v_count1=0 then
            insert into cust_dup values(j.cust_name,j.cust_phone,j.cust_city,j.cust_since,v_no_of_instances);
            end if;
    end loop;
    end loop;
    commit;
end;
/
exec sp_dup;
/
------------------------------------------------
select * from customer_10;
select * from cust_unique;
select * from cust_dup;
------------------------------------------------
truncate table cust_unique;
truncate table cust_dup;
truncate table customer_10;
----------------------------------------------------------------------------------
commit;
/
create or replace procedure sp_unique
as
    v_count int;
    cursor uniq_dup_cur is select cust_name,cust_phone,cust_city,cust_since
                          from customer_10;
begin
    for i in uniq_dup_cur loop
    delete from customer_10
    where exists(select distinct cust_name,cust_phone,cust_city,cust_since
    from customer_10);
    delete from customer_10
    where not exists(select cust_name,cust_phone,cust_city,cust_since,count(*) no_of_instance
    from customer_10
    group by cust_name,cust_phone,cust_city,cust_since
    having count(*)>1);
    commit;
    end loop;
end;
/
exec sp_unique;
/
--------------------------------------------------------------------------
select * from customer_10;
select * from cust_unique;
select * from cust_dup;