create table department
(dept_id number(3) primary key,
dept_name varchar2(30),
dept_loc varchar2(30));

insert all 
into department values(10,'Accounting','Bangalore')
into department values(11,'IT','Bangalore')
into department values(12,'Production','Mysore')
select *from dual;

select*from department;
commit;

create table jobs
(job_id INT primary key,
job_role varchar2(30),
job_desc varchar2(50),
min_ctc INT,
max_ctc INT);

insert all
into jobs values(50,'Accountant','Book keepig',300000,500000)
into jobs values(51,'Operations Executive','Oversees Operations',100000,200000)
into jobs values(52,'Software Engineer','Develop Applications',400000,800000)
into jobs values(53,'Finace Analyst','Supporting Management Team',400000,700000)
into jobs values(54,'CFO','Responsible for entire finance in the company',800000,1400000)
select*from dual;

select*from jobs;
commit;

create table employee1
(emp_id INT primary key,
emp_name varchar(30),
dept_id number(30) references department(dept_id),
ctc INT,
date_of_join DATE,
date_of_birth DATE,
job_id INT references jobs(job_id),
gender varchar(6));

insert all
into employee1 values(100,'RAM',10,340000,'10-JAN-18','08-NOV-98',50,'M')
into employee1 values(101,'TIM',11,400000,'15-APR-19','18-JAN-80',52,'M')
into employee1 values(102,'UMA',10,450000,'18-NOV-18','22-APR-84',50,'F')
into employee1 values(103,'KUMAR',10,500000,'10-JAN-21','01-APR-92',53,'M')
into employee1 values(104,'MAHESH',11,500000,'14-JAN-21','04-AUG-90',52,'M')
into employee1 values(105,'RAMA',10,150000,'15-JAN-20','14-NOV-95',51,'F')
into employee1 values(106,'SURAJ',11,200000,'14-MAR-19','17-MAY-93',51,'M')
select*from dual;

select *from employee1;
commit;


--------------------------------------------------------------------------------------------------------------------------------------------

-----1.Display Emp_name, Age of employee, consider folks who were born only in the month of MAY
select emp_name,date_of_birth,trunc(months_between(sysdate,date_of_birth)/12)
from employee1
where to_char(date_of_birth,'mm')='05';


----2.Display the highest paid employees in each department
select e.emp_name,e.ctc,d.dept_name
from department d,employee1 e
where d.dept_id=e.dept_id
and (e.ctc,d.dept_id) in
(select max(ctc),dept_id
from employee1
group by dept_id);



-----3.Top two employees in terms of salaries in each department
select*from (
select emp_name,ctc,dept_id,dense_rank() over(partition by dept_id order by ctc desc)r
from  employee1 )
where r<=2;

----4.Display departments which does not have any employees yet
select dept_name,dept_id
from department 
where dept_id not in
(select dept_id
from employee1);


----5.What are the common job_roles we have between Accounting and IT departments
select job_role,job_id
from jobs 
where job_id  in
(select j.job_id
from jobs j,employee1 e,department d
where j.job_id=e.job_id
and d.dept_id=e.dept_id
and d.dept_name='IT'
intersect
select j.job_id
from jobs j,employee1 e,department d
where j.job_id=e.job_id
and d.dept_id=e.dept_id
and d.dept_name='Accounting');

----6.Identify employees whose CTC is not inline with respective jobs min_ctc and max_ctc

select emp_name
from jobs j,employee1 e
where j.job_id =e.job_id
and ctc not between min_ctc and max_ctc;


-----7.Display the Department Name, employee name, job_role for those who joined us in the month of Apr 19
select dept_name,emp_name,job_role,date_of_join
from department d,jobs j, employee1 e
where d.dept_id=e.dept_id
and j.job_id=e.job_id 
and to_char(date_of_join,'mm-yy') = '04-19';


----8.Find Job roles where we don’t have any employees
select job_role
from jobs 
where job_id not in
(select job_id
from employee1);

----9.Display Department Name, Number of Employees and Number of unique jobs we have in the department
select d.dept_name,count(emp_id),count(distinct(job_id))
from department d,employee1 e
where d.dept_id=e.dept_id
group by d.dept_id,d.dept_name;

----10.Display jobs where we have zero employees
select job_id,job_role
from jobs 
where job_id not in
(select job_id
from employee1);


-----11.Display Department Name, Male Employee Count, Female Employee Count 

select d.dept_name ,count(case when UPPER(gender)='M' then 1 end )Male,
count(case when UPPER(Gender) = 'F' then 1 end) Female
from department d,employee1 e
where d.dept_id=e.dept_id
group by d.dept_name;


-------12.Create a view to get the following information. Department Name, Location, Employee Name, Date of Join, Years of Exp in our company, Date of Birth, Age, Job Role, Job description, Gender (Female if F, Male if M)


------13.Display Department Names, Employee Name, Job Desc to all female employees who joined in the month of Nov or Jan and in the year of 2018 or 2020
select d.dept_name,e.emp_name,date_of_join
from department d,employee1 e
where d.dept_id=e.dept_id
and gender ='F'
and to_char(date_of_join,'mon')in ('nov','jan') or
to_char(date_of_join,'yyyy')in ('2018','2020') ;


-----14.Display the department where we have the oldest person in the office

select *from (select dept_name,emp_name,date_of_birth,dense_rank() over(order by (date_of_birth))r
from department d,employee1 e
where d.dept_id=e.dept_id)
where r<=1;

----15.Find job role where we have most number of employees.

select j.job_role,e.job_id,count(emp_id)
from jobs j,employee1 e
where j.job_id=e.job_id
group by j.job_id,j.job_role,e.job_id;






