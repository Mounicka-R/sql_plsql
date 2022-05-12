create table Tbl1
(col1 number );
create table Tbl2
(col2 number);

insert all
into Tbl1 values(1)
into Tbl1 values(1)
into Tbl1 values(2)
into Tbl1 values(2)
into Tbl1 values(3)
select * from dual;

insert all
into Tbl2 values(1)
into Tbl2 values(1)
into Tbl2 values(4)
into Tbl2 values(4)
into Tbl2 values(9)
select * from dual;

select* from Tbl1;
select* from Tbl2;

select col1,col2
from Tbl1 t inner join Tbl2 t1
on t.col1=t1.col2;-------4 rows because single 1 join to 2 time according to this table

select col1,col2
from Tbl1 t full outer join Tbl2 t1
on t.col1=t1.col2;----10 row both left and right matching and unmacting record

select col1,col2
from Tbl1 t right join Tbl2 t1
on t.col1=t1.col2;----7 row matching record from both and unmatching from left

select col1,col2
from Tbl1 t left join Tbl2 t1
on t.col1=t1.col2;---7 row matching record from both and unmatching from right

select col1,col2
from Tbl1 t cross join Tbl2 t1;---25 row left * right row output 

commit;


