select substr('aroha tech',-7) from dual;

select instr('aroha tech','a',6,1) from dual;

 

Months_between--number

Add_months--date

next_day--date

last_day--date

round--date

trunc--date

 

date+number--date

date-date--number

date-number--date

 

select trunc((sysdate-to_date('13-mar-1995'))/365) from dual;---date-date/365

select trunc(months_between(sysdate,to_date('13-mar-1995'))/12) from dual;--months_between/12

 

select sysdate+5 from dual;

select to_date('21-jan-21')-to_date('21-jan-20') from dual;--no of days

select sysdate-5 from dual;

 

--All the emps who joined in the first day of current year..

select ename

from emp

where hiredate=trunc(sysdaye,'yy');

--All the emps who joined in the first day of current year

select ename

from emp

where hiredate=trunc(sysdaye,'mm');

 

select trunc(sysdate,'yy') from dual;--date as output

select trunc(to_date('11-aug-22'),'yy') from dual;--first day of current year

select trunc(sysdate,'mm') from dual;--first day of current month

select trunc(sysdate,'dd') from dual;--current date

 

select round(sysdate,'yy') from dual;

select round(to_date('11-jul-22'),'yy') from dual;

select round(sysdate,'mm') from dual;

select round(to_date('20-jul-22'),'mm') from dual;

 

select months_between('12-feb-22','12-aug-21') from dual;---No of months between the dates(no as output)

select add_months(sysdate,12) from dual;--date is output

select last_day(sysdate) from dual;--date is output--last day of the month

select last_day(to_date('20-apr-22')) from dual;

select next_day(sysdate,'tuesday') from dual;--date is output

 

--first day of next year

select to_char(add_months(trunc(sysdate,'yy'),12),'day') from dual;

 

---display the emps hired in current year

select ename

from emp

where to_char(hiredate,'yy')=to_char(sysdate,'yy');

