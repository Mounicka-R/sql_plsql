----Write the select statement which gives all the products which costs more than Rs 250.
select p_name,cost
from product
where cost>250;

-----Write the select statement which gives product name, cost, price and profit. (profit formula is price – cost)
select p_name,cost,price,price-cost as profit
from product;

-----Find the products which give more profit than product Mouse
select p_name,price-cost as profit
from product
where price-cost >(select price-cost as profit
from product
where p_name ='mouse');

-------Display the products which give the profit greater than 100 Rs
select p_name,price-cost as profit
from product
where (price-cost) >100;

------Display the products which are not from Stationary and Computer family.
select p_name
from product
where p_family not in ('stationary','computer');

------Display the products which give more profit than the p_id 102.
select p_name
from product
where (price-cost) >(select price-cost as profit
from product
where p_id=102);

-------Display products which are launched in the year of 2010.
select p_name
from product
where to_char(launch_date,'yyyy')=2010;

-----Display the products which name starts with either ‘S’ or ‘W’ and which belongs to Stationary and cost more than 300 Rs
select p_name
from product
where p_name  like 's%' or 
p_name like 'w%'
and p_family ='stationary'
and cost>300;

-----Display the products which are launching next month.
select p_name
from product
where to_char(launch_date,'mm-yy')=to_char(add_months(sysdate,1),'mm-yy');

-----Display product name which has the maximum price in the entire product table.
select p_name,price
from product
where price=(select max(price)
from product);

----List the product name, cost, price, profit and percentage of profit we get in each product.
select p_name,cost,price,price-cost as profit,(((price-cost)/cost)*100) as percentage 
from product;

----Display how many products we have in Computer family which has the price range between 2000 and 50000.
select price, count(p_name)
from product
where p_family ='computer'
and (price between 2000 and 50000);

---Write a query to list the cities which have more population than Bangalore.
select city_name
from city
where city_population > (select city_population
from city
where city_name='bangalore');

----Display all the branch names from Chennai.
select b_name
from branch
where city_id = (select city_id
from city
where city_name='chennai');


------Display a city name which does not have any branches
select city_name
from city
where city_id not in (select city_id
from branch);


---Display branch name, address and phone number of all the branches where the name starts with either B or M and the city name starts with either B or C.
select b_name,b_address,b_phone
from city c ,branch b
where c.city_id=b.city_id
and b_name like 'b%' or b_nane like 'm%'
and city_name like 'b%' or city_name like 'c%';

----How many branches we have in Bangalore?
select count(b_name)
from branch
where city_id=(select city_id
from city
where city_name='bangalore');


----Display the branches which are in the Ring road of any city.
select b_name
from branch
where b.address like "%ring road%';


----Display the city name, branch name. Order the data based on the city name.
select city_name,b_name
from city c, branch b
where c.city_id=b.city_id
order by city_name;


---Display the city name and the number of branches in each city.
select city_name,count(b_id)
from city c ,branch b
where c.city_id=b.city_id
group by city_name;

----Display the city name which has most number of branches.
select city_name,count(b_id)
from city c,branch b
where c.city_id=b.city_id
group by city_name
having count(b_id) = (select max(count(b_id))
from branch
group by city_id);

-----Display the city name, population, number of branches in each city.
select city_name,city_population,count(b_id)
from city c,branch b
where c.city_id=b.city_id
group by city_id,city_name,city_population;
