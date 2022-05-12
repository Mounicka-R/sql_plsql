CREATE TABLE DEPT ( DEPTNO INT primary key, DNAME VARCHAR(14), LOC VARCHAR(13) );

 

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');

INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');

INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');

INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

select*from dept;
commit;

 

CREATE TABLE EMP ( EMPNO INT primary key, ENAME VARCHAR(10), JOB VARCHAR(9),

MGR INT, HIREDATE DATE, SAL INT, COMM INT, DEPTNO INT references dept(deptno));

 

 

INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'17-Dec-2018',800, NULL, 20);

INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'20-Feb-2019',1600,300,30);

INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,'22-Feb-2019',1250,500,30);

INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,'16-Apr-2017',2975,NULL,20);

INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,'14-Sep-2017',1250,1400,30);

INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,'12-May-2019',2850,NULL,30);

INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,'17-Jun-2016',2450,NULL,10);

INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,'23-Dec-2018',3000,NULL,20);

INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,'26-Nov-2019',5000,NULL,10);

INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,'28-Sep-2017',1500,0,30);

INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,'20-Jan-2016',1100, NULL,20);

INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,'15-Dec-2016',950,NULL,30);

INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,'27-Dec-2019',3000,NULL,20);

INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,'21-Jan-2020',1300,NULL,10);

select*from emp;


select nvl(comm,0) from emp;
select nvl2(comm,0,1) from emp;


select*from emp;

alter table emp
drop column comm_with;

alter table emp
drop column comm_without;
commit;

savepoint A;

alter table emp
add comm_with varchar2(30);
alter table emp
add comm_without varchar2(30);
select*from emp;

update emp
set comm_without='empwithout_com'
where comm is null;
update emp
set comm_with='empwith_com'
where comm is not null;
rollback to savepoint A;
select*from emp;
rollback;
commit;
 
select trunc(sysdate,'ww') from dual;
select trunc(months_between(sysdate,'12-feb-91')/12) from dual;
select trunc(sysdate+15) from dual;
select months_between('12-dec-15','12-jan-01') from dual;
select to_char(sysdate,'ddspth') from dual;
select trunc('26-mar-21'-'30-apr-19') from dual;


select*from dept;
select*from emp;

select dname
from dept
where deptno=(select deptno
from emp
where ename='ALLEN');

select ename
from emp
where sal > (select sal
from emp
where ename='SMITH');

