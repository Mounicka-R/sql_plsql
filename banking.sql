
----------------------------------------------------------------------------------------------------------
-----------------------------------------------------BANKING--------------------------------------------------------
----1)write a query to display all the customer name who do not have a phone
select cust_name
from customer
where phone is null;

----2)write a query to display all the customer and the number of accounts they hold
select cust_name,count(a_no)
from customer c,accounts a
where c.cust_bkey=a.cust_bkey
group by cust_bkey,cust_name;

-----3.	Display the customer who have the highest balance across all account types
select cust_name,max(balance)
from customer c,accounts a
where c.cust_bkey=a.cust_bkey
group by cust_bkey,cust_name;\\use sub query\\


---4.	Display the customer name who have the highest balance in individual account types
select cust_name,max(balance)
from customer c,accounts a
where c.cust_bkey=a.cust_bkey
group by act_type,cust_name;\\use multiple sub query\\


-----5.	Display the State wise no of accounts opened in the previous year
select state,count(a_no)
from customer c, accounts a
where c.cust_bkey=a.cust_bkey
group by state
having to_char(act_open_date,'yyyy')=to_char(sysdate,'yyyy')-1;


-----6. Display the customers who hold more than 2 account of same type
select cust_name
from customer c,account a
where c.cust_kbey=a.cust_kbey
group by a_no
having count(act_type)>2;

------7. Display customer name and transaction type wise transaction amounts. (Consider two types of transactions which are Debit and Credit)
select cust_nmae,tnx_type,fcy_amount||lcy_amount
from customer c,accounts a, txn t
where c.cust_bkey=a.cust_bkey
and a.a_no=t.a_no;

-----8.	Display city wise no of male and female customers
select city,count(case when UPPER(Gender) = 'MALE' then 1 end) Male,
count(case when UPPER(Gender) = 'FEMALE' then 1 end) Female,
count(cust_bkey) as 'Total_customer'  
from customer
group by city;


-----9.	Display the customers who has only savings accout.
select cust_name,act_type
from customer c,accounts a
where c.cust_bkey=a.cust_bkey
and act_type= 'savings account';

-----10.	Display the customerwise total deposit amount and total withdraw amount
------Customer	Deposit_amt	Withdraw_amt
select cust_name,count(deposit_amt),count(withdraw_amt)
from customer c, deposit_amt d,withdraw_amt w
where c.cust_bkey=d.cust_bkey
and c.cust_bkey=w.cust_bkey
group by cust_nmae,cust_bkey;


----11.	Display the cities that have more number of customers than the city HYD.

select city
from customer
where cust_bkey >(select count(cust_bkey)
from customer
where city='hyd');

-----12. Display customers who have more number of accounts than customer ‘MIKE’.
select cust_name
from customer c,accounts a
where c.cust_bkey=a.cust_bkey
and a_no >(select count(a_no)
from customer c, accpunts a
where c.cust_bkey=a.cost_bkey 
and cust_name='mike');


-----13. Display the common customers who made transactions in the current and previous month.
select cust_name
from customer
where cust_bkey in (select cust_bkey
from accounts a,txn t
where a.a_no=t.a_no
and to_char(txn_date,'yyyy')=to_char(sysdate,'yyyy')
union
select cust_bkey
from accounts a,txn t
where a.a_no=t.a_no
and to_char(txn_date,'yyyy')=to_char(sysdate,'yyyy')-1);


----14.	Display statewise no of accounts and no of transactions in the current year.
select state,count(a_no),count(txn_id)
from customer c, accounts a,txn t
where c.cust_bkey=a.cust_bkey
and a.a_no=t.a_no
and to_char(txn_date,'yyy')=to_char(sysdate,'yyyy')
group by state,a_no;

----15.	Display customers who have their email in gmail domain.
select cust_name
from customer
where email like '%gmail.com%';


-----16. Display the youngest customer in each city.


----17.	Display the account type wise no of customers and no of accounts opened in the current year.
select act_type,count(cust_bkey),count(act_open_date)
from customer c, accounts a
where c.cust_bkey=a.cust_bkey
and to_char(act_open_date,'yyyy')=to_char(sysdate,'yyyy')
group by act_type;


-----18.Display the customers who opened an account on birth day.
select cust_name
from customer c, accounts a
where c.cust_bkey=a.cust_bkey
and to_char(acct_open_date,'yyyy')=to_char(dob,'yyyy');



