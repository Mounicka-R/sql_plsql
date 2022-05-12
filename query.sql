--display all customer name start with A
select cust_name
from cust
where cust_name like 'a%';

--display product more than 25 and launched this year
select p_name
from product
where price > 25 and (to_char(launch_date,'yyyy')=to_char(sysdate,'yyyy'));

--write a query display customer who belong in bangalore
select cust_name
from cust
where cust_city like 'bangalore';

--display customer who's phone number or invalid condition it should be 10
select cust_name
from cust
where phone_no > length(10);

--display the product which are klaunch in 1st day of pervious year
select p_name
from product
where launch_date=add_months(trunc(sysdate,'yy'),-12);

--display product which are launched this month or price is more than cost
select p_name
from product
where to_char(launch_date,'mm-yy')=to_char(sysdate,'mm-yy') or price>cost;

--display customer who's email start with gmail it should have only 1 @ symbol
select cust_name
from cust
where regexp_count(cust_email,'@')=1;

--sub query
--display all the customer who belong to city of tim
select cust_name
from cust
where cust_city=(select cust_city 
from cust
where cust_name='tim');

--display all the product which has the price of tv
select p_name
from product
where price=(select price
from product
where p_name='Mouse');

--display dept_no who belong to allen dept
select dname
from dept
where deptno=(select deptno
from emp
where ename='ALLEN');

--display the city name of john
select city_name
from city
where city_id=(select city_id
from cust
where cname='john');

--display the employee who salary is more than smith salary
select ename
from emp
where sal > (select sal
from emp
where ename = 'SMITH');




