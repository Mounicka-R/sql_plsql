----write a code to display largest of 3 number
/
declare
n number(5) := &n;
n1 number(5) := &n1;
n2 number(5) := &n2;
begin
if n>n1 and n>n2 then
dbms_output.put_line(n||' is largest number');
elsif n1>n2 and n1>n then
dbms_output.put_line(n1||' is largest number');
else
dbms_output.put_line(n2||' is largest number');
end if;
end;
/

---print even number from 1 to 50
/
begin
for i in 1..50 loop
if mod(i,2)=0 then
dbms_output.put_line(i||' is even number');
end if;
end loop;
end;
/


--write a code print factorial of a given number
/
declare
n number(10) :=&n;
begin
if n=1 then
dbms_output.put_line(n);
elsif n>=2 then
for i in 1..n-1 loop
n:=n*i;
end loop;
dbms_output.put_line(n);
end if;
end;
/

---print aroha in one after other
/
declare
n varchar2(30):='AROHA';
begin
for i in 1..length(n) loop
dbms_output.put_line(substr(n,i,1));
end loop;
end;
/

---A
---AR
---ARO
---AROH
---AROHA
/
declare
n varchar2(30):='AROHA';
begin
for i in 1..length(n) loop
dbms_output.put_line(substr(n,1,i));
end loop;
end;
/

---write a code for prime number
/
declare
n number(5):=&n;
flag number:=0;
begin
for i in 2..n/2 
loop
if mod(n,i)=0 
then
flag:=1;
exit;
end if;
end loop;
if flag=1 then
dbms_output.put_line(n||' is not a prime number');
else
dbms_output.put_line(n||' is prime number');
end if;
end;
/

---print 1st jan to last date of the year
declare
start_date date;
end_date date;
begin
start_date:=trunc(sysdate,'yy');
end_date:=add_months(start_date,12)-1;
while start_date <= end_date loop
dbms_output.put_line(start_date);
start_date:=start_date+1;
end loop;
end;
/

--weekend
/
declare
start_date date;
end_date date;
begin
start_date:=trunc(sysdate,'yy');
end_date:=add_months(start_date,12)-1;
while start_date <= end_date loop
if to_char(start_date,'dy') in ('sat','sun') then
dbms_output.put_line(start_date ||'  is weekend');
end if;
start_date:=start_date+1;
end loop;
end;
/




----stationary find how many vowel and constant
/
declare
s varchar2(30):='stationary';
cnt int :=0;
cnt1 int :=0;
sub varchar2(30);
begin
for i in 1..length(s) loop
sub:=substr(s,i,1);
if sub in ('a','e','i','o','u','A','E','I','O','U') then
cnt:=cnt+1;
else
cnt1:=cnt1+1;
end if;
end loop;
dbms_output.put_line('vowels in the string is '|| cnt);
dbms_output.put_line('constant in the string is '|| cnt1);
end;
/
set serveroutput on;





1
22
333
4444
55555

/
declare
n number := &n;
row number := &row;
begin
for i in 1..row
loop
for j in 1..i
loop
dbms_output.put(n ||' ');
end loop;
dbms_output.new_line;
n:=n+1;
end loop;
end;
/


