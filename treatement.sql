create table treat_type

(treat_type_id varchar2(5) primary key,

treat_type_desc varchar2(20),

treat_type_code varchar2(5)

);

 

insert all

into treat_type values('tt1','ayurvedic','A1')

into treat_type values('tt2','homeopathy','B1')

into treat_type values('tt3','english','C1')

select * from dual;


 

create table treatment

(treat_id varchar2(5) primary key,

treat_type_id varchar2(5) references treat_type(treat_type_id),

treat_code varchar2(5),

treat_name varchar2(20),

treat_start_on date

);

 

insert all

into treatment values('t1','tt1','AA1','angiogram','21-apr-15')

into treatment values('t2','tt1','AA2','physiotherapy','09-jun-15')

into treatment values('t3','tt2','AA3','diabetic treatment','28-dec-15')

into treatment values('t4','tt1','AA4','typhoid treatment','30-aug-15')

into treatment values('t5','tt3','AA5','fever medication','12-mar-15')

select * from dual;



 

create table pat_treatment

(pat_treat_id varchar2(5) primary key,

treat_id varchar2(5) references treatment(treat_id),

treat_date date,

patient_id varchar2(5) references patient1(patient_id),

doc_id varchar2(5) references doctor1(doc_id),

treat_dur_days number(3)

);

 

insert all

into pat_treatment values('pt1','t1','23-may-15','p1','d1',10)

into pat_treatment values('pt2','t1','24-jun-15','p1','d1',10)

into pat_treatment values('pt3','t3','01-jan-16','p4','d3',8)

into pat_treatment values('pt4','t1','25-sep-15','p3','d2',10)

into pat_treatment values('pt5','t4','15-oct-15','p2','d1',20)

into pat_treatment values('pt6','t5','18-apr-15','p3','d2',3)

select * from dual;



create table patient1

(patient_id varchar2(5) primary key,

patient_nm varchar2(20),

patient_dob date,

gender char(1),

loc_id varchar2(5) references location(loc_id),

phone_no number(10),

insurance_flg varchar2(3)

);

 

 

insert all

into patient1 values('p1','arun','19-jun-86','M','l1',9867342167,'y')

into patient1 values('p2','ajay','19-mar-89','M','l1',8857432198,'y')

into patient1 values('p3','abhay','19-sep-85','F','l2',9982347821,null)

into patient1 values('p4','akash','19-jun-88','F','l3',9458937123,'y')

into patient1 values('p5','akul','19-oct-92','M','l4',9889933271,'y')

into patient1 values('p6','amit','19-nov-87','M','l4',9572194389,null)

into patient1 values('p7','ashish','19-dec-93','F','l1',9117823569,'y')

select * from dual;

 

 

create table location

(loc_id varchar2(5) primary key,

loc_nm varchar2(20),

loc_type varchar2(5),

state varchar2(20),

country varchar2(20)

);

 

insert all

into location values('l1','bangalore','metro','karnataka','india')

into location values('l2','Hyderabad','metro','karnataka','india')

into location values('l3','mumbai','metro','delhi','india')

into location values('l4','chennai','metro','mumbai','india')

select * from dual;

 

 

 

create table doctor1

(doc_id varchar2(5) primary key,

doc_nm varchar2(20),

doc_speciality varchar2(20)

);

 

 

insert all

into doctor1 values('d1','tim','heart')

into doctor1 values('d2','ram','general medicine')

into doctor1 values('d3','raj','diabetictyphoid')

select * from dual;

commit;


select*from treat_type;
select*from treatment;
select*from patient1;
select*from location;
select*from doctor1;
select*from pat_treatment;
---------------------------------------------------------------------------------------------------------
-------------1.Find out different treatments we provide from last three years.
select treat_name
from treatment t ,pat_treatment pt
where t.treat_id=pt.treat_id
and to_char(treat_date,'yy') between to_char(sysdate,'yy') and to_char(sysdate,'yy')-3;


---------2.Find the number patients we get from each each country
select country,count(patient_id)
from patient1 p,location l
where l.loc_id=p.loc_id
group by country;


---------3.Find all the patients who are currently taking the treatment of type Ayurvedic
select p.patient_nm,tt.treat_type_desc
from patient1 p,pat_treatment pt,treatment t,treat_type tt
where p.patient_id=pt.patient_id
and t.treat_id=pt.treat_id
and tt.treat_type_id=t.treat_type_id
and treat_type_desc='ayurvedic';


-----4.Find all the patients who are coming from metro cities (loc_type = 'Metro')
select patient_nm,loc_type
from patient1 p,location l
where l.loc_id=p.loc_id
and loc_type='metro';


----5.	Find the number of customers who are having insurance
select insurance_flg,count(patient_id)
from patient1
where insurance_flg='y'
group by insurance_flg; 


----6.	Find all the days where we provided more than 100 treatmentsin Ayurvedic type

select to_char(pt.treat_date,'dy'),count(pt.treat_id)
from treat_type tt, treatment t, pat_treatment pt
where tt.treat_type_id=t.treat_type_id
and t.treat_id=pt.treat_id 
and tt.treat_type_desc='ayurvedic'
group by to_char(pt.treat_date,'dy')
having count(pt.treat_id)>100;




----7.	Find the doctor who have the most number of treatments on 03-JAN-2013

select doc_nm  from(
select d.doc_nm ,count(t.treat_id),dense_rank() over (order by count(t.treat_id)desc)r
from doctor1 d,pat_treatment pt, treatment t
where d.doc_id=pt.doc_id
and t.treat_id=pt.treat_id
and to_char(pt.treat_date)='03-01-13'
group by d.doc_nm)
where r>=1;


----8.Find the doctor who did not have any treatments on 03-JAN-2013
select doc_nm
from doctor1 
where doc_id not in
(select doc_id
from pat_treatment
where to_char(treat_date,'dd-mm-yy')='03-01-13');

----9.	Find the treatments which were commonly given by both Doctor ‘RAM’ and ‘TIM’ gave on 03-JAN-2013

select treat_name
from treatment
where treat_id in
(select treat_id
from doctor1 d,pat_treatment pt
where d.doc_id=pt.doc_id
and doc_nm='ram'
and treat_date='03-01-13'
intersect
select treat_id
from doctor1 d,pat_treatment pt
where d.doc_id=pt.doc_id
and doc_nm='tim'
and treat_date='03-01-13');



