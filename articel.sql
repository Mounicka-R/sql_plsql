select*from Article_dimension;
select*from Calender_dimension;
select*from shop_dimension;
select*from shop_facts;


----1.Find how many distinct category of articles we have
select count(distinct(category))
from Article_dimension;

----2.Which article has the maximum price
select article_label
from article_dimension
where sale_price in( 
select max(sale_price)
from article_dimension);

---3.Category wise numbr of articles we have
select category,count(article_id)
from article_dimension
group by category;

----4.display article names which are priced between 100 and 200 which belongs to T-Shirts category and the name starts with 'A' or 'S'
select art.article_label
from(select article_id,article_label
from article_dimension
where sale_price between 100 and 200
and category='T-Shirts')art,(select article_id,article_label
from article_dimension
where article_label like 'A%'
or article_label like 'S%')lab
where art.article_id=lab.article_id;


----5.display the number of holidays in the year of 2016
select count(holiday_flag)
from calender_dimension
where yr=2016;

----6.Find the most priced article in each family
select family_name,max(sale_price)
from article_dimension
group by family_name;

--7.display the year and total sales amount which happened in each year
select yr,sum(amount_sold)
from calender_dimension cd,shop_facts sf
where cd.week_id=sf.week_id
group by yr;


---8.display state_name, number of cities and number of stores in the state of California
select state,count(city),count(shop_id)
from shop_dimension
where state='California'
group by state;

----9.Display the article which were not sold in the month of January 2017
select ad.article_label
from article_dimension ad,calender_dimension cd,shop_facts sf
where ad.article_id=sf.article_id
and cd.week_id=sf.week_id
and month_name='january'
and yr='2017';


---10.display family, category, article_name, shop_name where we sold this product in the month of January 2017 and the sales price of the product is greater than 100
select family_name,category,article_label,shop_name
from article_dimension ad,calender_dimension cd,shop_dimension sd,shop_facts sf
where ad.article_id=sf.article_id
and cd.week_id=sf.week_id
and sd.shop_id=sf.shop_id
and month_name='january'
and yr='2017'
and sale_price > 100;

----11.top 2 article_labels in each family based on the price of the
select*from(select article_label,dense_rank() over(partition by category order by (sale_price)desc)r
from article_dimension)
where r<=2;

-----12.Find the common article_label which we sold in the month of FEB 2017 and APR 2017
select ad.article_label
from article_dimension ad,shop_facts sf
where ad.article_id in
(select ad.article_id
from article_dimension ad,calender_dimension cd,shop_facts sf
where ad.article_id=sf.article_id
and cd.week_id=sf.week_id
and cd.month_name='february'
and cd.yr=2017
union
select ad.article_id
from article_dimension ad,calender_dimension cd,shop_facts sf
where ad.article_id=sf.article_id
and cd.week_id=sf.week_id
and cd.month_name='April'
and cd.yr=2017);


----13.display article_name, sale_price, price_rating (A if the price > 100 else B) for the all the articles of T-Shirts category
select article_label,sale_price, (case when sale_price > 100 then 'A' 
else 'B'  
end) price_rating
from article_dimension
where category='T-Shirts';


----14.How many records I should get when I do an inner join between article and shop facts? Please let me know how you verify
select count(*)from article_dimension ad inner join shop_facts sf
on ad.article_id=sf.article_id;


----15.article_category, article_family, total_category_sales, total_article_family_sales for the sales happened in 2017.
select total_category_sales.category,total_article_family.family_name from
(select category,sum(amount_sold) amount_sold
from article_dimension ad,shop_facts sf
where ad.article_id=sf.article_id
group by category)total_category_sales,
(select family_name, sum(amount_sold) amount_sold
from article_dimension ad,calender_dimension cd,shop_facts sf
where ad.article_id=sf.article_id
and cd.week_id=sf.week_id
and yr=2017
group by family_name)total_article_family
where total_category_sales.amount_sold=total_article_family.amount_sold;




