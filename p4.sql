select * from demographic;

-----------------------------------------------------------------
---How many country code start with C and G
select sum(count(country_code)) total_count
from demographic
where country_code like'C%' or country_code like 'G%'
group by country_code;


--------------------------------------------------------------------
------which country has the highest birth date in the Higher Income

select country_name,birth_rate
from demographic 
where birth_rate =(select max(birth_rate)
from demographic
where income_group='High income');

select d.country_name,A.r,d.birth_rate
from(select country_name, dense_rank() over (order by birth_rate desc)r
from demographic
where income_group='High income')A,demographic d
where d.country_name=A.country_name
and r=1;

--- Which 2 countries in the Upper Middle Income has the lowest birth rates


select d.country_name,d.birth_rate,c.r
from(select country_name,dense_rank() over(order by birth_rate) r
from demographic
where income_group='Upper middle income')c,demographic d
where d.country_name=c.country_name
and r<=2;

--- Which 3 countries have the highes internet users

select d.country_name,d.internet_users,i.r
from(select country_name,dense_rank() over( order by internet_users desc) r
from demographic )i,demographic d
where d.country_name=i.country_name
and r<=3;


----How many countries have internet user above 65%

select country_name,internet_users
from demographic
where internet_users>65;

----Countries with code starting with M how many are in upper middel income which are the two least internet users

select d.country_name,d.country_code,d.income_group,r.r,d.internet_users
from (select country_name,dense_rank() over (order by internet_users )r
from demographic
where country_code like 'M%'
and income_group='Upper middle income')r,demographic d
where d.country_name=r.country_name
and r<=2;

----What is the avg internet users across all the countries and how many contries are ther which are above that avg?

select country_name,internet_users
from demographic
where internet_users>(select avg(internet_users)
from demographic);

-----In all the Low income OR Lower Middle Income countries and starting with country code B or G which has highest internet users which has lowest internet users


select * from (select country_name,internet_users,income_group,dense_rank() over(order by internet_users desc)r
from demographic
where income_group in('Low income' , 'Lower middle income')
and country_code like 'B%' or country_code like 'G%')
where r=1
union all
select * from (select country_name,internet_users,income_group,dense_rank() over(order by internet_users )r1
from demographic
where income_group in('Low income','Lower middle income')
and country_code like 'B%' or country_code like 'G%')
where r1=1;


-----What is the avg birth rate of all the countries of the world and how many contries are below the avg birth rate 

