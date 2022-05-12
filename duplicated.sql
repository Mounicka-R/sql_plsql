create table src(col1 number(10),    
col2 number(10));


insert all 
into src values(1,1)
into src values(1,1)
into src values(2,5)
into src values(2,5)
into src values(3,6)
select*from dual;

select*from src;

create table uniqu(col1 number(10),    
col2 number(10));

create table dup(col1 number(10),    
col2 number(10));


----------------------------------------------------------------------------------------
---to display unique record
select distinct*
from src;

--unique record
select col1,col2
from src
group by col1,col2
having count(*)>=1;

---duplicated record
select col1,col2
from src
group by col1,col2
having count(*)>1;

commit;
insert into src values(1,1);
commit;

select col1,col2
from src
group by col1,col2
having count(*)>1;

select col1,col2,rowid
from src;

---to get duplicated values
select col1,col2
from src 
where rowid not in(select max(rowid)
from src
group by col1,col2);

---to get unique values
select col1,col2
from src 
where rowid in(select max(rowid)
from src
group by col1,col2);


insert into dup
select col1,col2
from src 
where rowid not in(select max(rowid)
from src
group by col1,col2);

select *from dup;

insert into uniqu
select col1,col2
from src 
where rowid in(select max(rowid)
from src
group by col1,col2);

select*from uniqu;
------------------------------------------------------------------------------
--to unique value
insert into uniqu
select col1,col2 from
(select col1,col2,row_number() over(partition by col1,col2 order by col1,col2)rn
from src)
where rn=1;

--to duplicate value
insert into dup
select col1,col2 from
(select col1,col2,row_number() over(partition by col1,col2 order by col1,col2)rn
from src)
where rn>1;



select *from src;
select *from uniqu;
select *from dup;


delete from src
where rowid not in(select max(rowid)
from src
group by col1,col2);
rollback;



select uid from dual; 
select user from dual;

