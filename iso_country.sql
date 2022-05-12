SELECT * FROM ISO_Country;
commit;
select country as country_name,code as ISO_Country_code
from ISO_Country
union all
select country2 as country_name,code2 as ISO_Country_code
from ISO_Country;
commit;

create table NEW_ISO
(ISO_Country_code varchar2(100) primary key,
country_name varchar2(100));

insert into NEW_ISO values(select country as country_name,code as  ISO_Country_code
from ISO_Country
union all
select country2 as country_name,code2 as ISO_Country_code
from ISO_Country);



select *from NEW_ISO;