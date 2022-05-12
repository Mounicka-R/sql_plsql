create table prod_family
(
prod_fam_id int primary key,
prod_fam_desc varchar2(20),
prod_fam_long_desc varchar2(30),
crt_date date,
mod_date date
);
insert into prod_family values(100,'electronics','electronics','10-jan-22','');
insert into prod_family values(101,'furniture','furniture','20-feb-22','');


drop table prod_family;


create table prod_cat
(
prod_cat_id int primary key,
prod_cat_desc varchar2(20),
prod_fam_long_desc varchar2(30),
prod_fam_id int  references prod_family(prod_fam_id),
crt_date date,
mod_date date
);


insert into prod_cat values (50,'home electronics','home electronics',100,'11-jan-22','');
insert into prod_cat values (51,'home furniture','home furniture',101,'21-jan-22','1-may-22');
insert into prod_cat values (52,'office electronics','office electronics',100,'11-jan-22','');

select * from prod_cat;
drop table prod_cat;


create table products
(
prod_id int,
prod_name varchar2(30),
prod_price number,
prod_cat_id int references prod_cat(prod_cat_id),
crt_date date,
mod_date date
);
insert into products values (1,'washing maching lg',34000,50,'10-jan-21','');
insert into products values (2,'dining table',53000,51,'12-jan-21','2-sep-21');
insert into products values (3,'iron box',3000,50,'12-feb-21','1-aug-21');
insert into products values (4,'standing fan lg',1900,50,'12-mar-21','');
insert into products values (5,'computer table',3500,51,'1-sep-21','');
insert into products values (6,'tv',4000,50,'28-4-22','');
--insert into products values (5,'computer table',4500,51,'2-5-22','');

select * from products;
delete from products where prod_id=5;
commit;
drop table products;

create table prod_dim
(
prod_id int,
prod_nm varchar2(30),
prod_cat varchar2(20),
prod_family varchar2(30),
prod_price number,
crt_date date,
upd_date date
);

drop table prod_dim;
commit;
select * from prod_family;
select *from prod_cat;
select *from products;
select *from prod_dim;
-------------------------------------------------------------------------------------------
/
create or replace procedure sp_scd1
as
    cursor cur_scd1 is select p.prod_id,p.prod_name,pc.prod_cat_desc ,pf.prod_fam_desc ,p.prod_price,p.crt_date
                        from products p join prod_cat pc
                        on p.prod_cat_id=pc.prod_cat_id
                        join prod_family pf
                        on pc.prod_fam_id=pf.prod_fam_id;
    v_cnt int;
begin
    for i in cur_scd1 loop
        select count(*) into v_cnt
        from prod_dim
        where prod_id=i.prod_id;
        if v_cnt=0 then
            insert into prod_dim values(i.prod_id,i.prod_name,i.prod_cat_desc,i.prod_fam_desc,i.prod_price,i.crt_date,'');
        else
            update prod_dim set prod_nm=i.prod_name,prod_price=i.prod_price,upd_date=sysdate-1
            where prod_id=i.prod_id and (prod_price<>i.prod_price or prod_nm<>i.prod_name);
        end if;
    end loop;
    commit;
exception
    when others then
    rollback;
    raise_application_error(-20001,'unknown errior');    
end;
/
exec sp_scd1;
set serveroutput on;
/

update products set prod_price=28000 
where prod_name='computer table';