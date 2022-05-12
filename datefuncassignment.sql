
--1.FIRST DAY OF PRESENT Year
select trunc(sysdate,'yy') from dual;--it gives first day of present year

--2.Next year first day
select add_months(trunc(sysdate,'yy'),12)from dual;--next year 1st date
select to_char(add_months(trunc(sysdate,'yy'),12))from dual;--next year 1st date


--3.next year first monday date.
---select next_day(to_char(round(to_date('13-7-22'),'yy')),'monday') from dual;----Returns date
select next_day(add_months(trunc(sysdate,'yy'),12),'monday')from dual;

--4.FIRST DAY OF THE CURRENT WEEK (IT ALWAYS STARTS WITH SUNDAY)
select (sysdate - to_char(sysdate-1, 'd')) from dual; -- sunday here
select (sysdate - to_char(sysdate-1, 'd')+1) from dual;-- monday here

--5.FIRST DAY OF THE NEXT WEEK
select next_day(sysdate,'sunday') from dual;--sunday next week date
select trunc(sysdate,'d')+7 from dual;

--6.FIRST DAY OF THE PREVIOUS WEEK
select next_day(sysdate,'sunday')-14 from dual;--sunday previous week date
select trunc(sysdate,'d')-7 from dual;

--7.FIRST DAY OF THE NEXT MONTH
select add_months(trunc(sysdate,'mm'),1) from dual; --1st day of next month

--8.FIRST DAY OF THE PREVIOUS MONTH
select add_months(trunc(sysdate,'mm'),-1) from dual;--1st day of last month


--9.LAST DAY OF THE PREVIOUS MONTH
select add_months(last_day(trunc(sysdate,'mm')),-1) from dual;--last day of last month

--10.First day of the current quarter
SELECT TRUNC(SYSDATE, 'Q') FROM DUAL;--1st day of current quarter

--11.First day of the previous quarter
select trunc(add_months(sysdate,'-3'),'q') from dual;--1st day of pervious quarter

--12.First day of the Next quarter
select add_months(trunc(sysdate,'q'),3) from dual;

--13.last day of the current week
select trunc(sysdate,'d')+6 from dual;

--14.last day of the next week
select trunc(sysdate,'d')+13 from dual;

--15.last day of the previous week
select (sysdate-to_char(sysdate-1, 'd')-1)  from dual;--last day of previous week saturday here
select trunc(sysdate,'q')-1 from dual;


--16.Last day of the current Quarter
select last_day(add_months(TRUNC(SYSDATE, 'Q'),2))from dual;-- last day of current quarter

--17.Last day of the previous quarter
select trunc(sysdate, 'Q') - 1 from dual;--previous quarter last date

--18.last day of the next Quarter.
select last_day(add_months(TRUNC(SYSDATE, 'Q'),5))from dual;-- last day of next quarter


--19.NEXT YEAR'S last day
select add_months(trunc(sysdate, 'y'), 24) - 1 from dual;


--20.THIS YEAR LAST DAY
select add_months(trunc(sysdate, 'y'), 12)-1 from dual;

--21.3rd quarter
select add_months(trunc(sysdate,'q'),3*2) from dual;

--22.2nd quarter
select add_months(trunc(sysdate,'q'),3*1) from dual;

--24.4th quarter
select add_months(trunc(sysdate,'q'),3*3) from dual;

select to_char(sysdate,'mm-yy')from dual;

select to_char(sysdate,'mm-yy') from dual;
select to_char(sysdate,'yy')-1 from dual;


select*from sales_retail;
select count(sales_id),sales_date
from sales_retail
where to_char(sales_date,'yy')=to_char(sysdate,'yy')-1
group by to_char(sales_date,'mm'),sales_date;

select a.sales_date,b.sales_id
from(select sales_date,count(sales_id)
from sales_retail
where to_char(sales_date,'yy')=to_char(sysdate,'yy')-1
group by to_char(sales_date,'mm'),sales_date)a,sales_retail b
where a.sales_date=b.sales_date;

select trunc(sysdate,'yy')from dual;


select trunc(sysdate,'d')+6 from dual;
