---write a procedure to swap two number
/
create or replace procedure sp_swap as
A int(5) := 5;
B int(5) := 10;
C int(5);
begin
C:=B;
B:=A;
A:=C;
dbms_output.put_line('A=' ||A);
dbms_output.put_line('B=' ||B);
end;
/
exec sp_swap;
set serveroutput on;


---largest of two number
/
create or replace procedure largest as
n1 int(5) := 45;
n2 int(5):= 35;
begin
if n1>n2 then
dbms_output.put_line(n1 ||' is largest number');
else
dbms_output.put_line(n2 ||' is largest number');
end if;
end;
/
exec largest;

--write a code to find positive or negative number
/
create or replace procedure pos_neg 
as
    n int(5) := &n;
begin
    if n>0 then
        dbms_output.put_line(n ||' is positive number');
    else
        dbms_output.put_line(n ||' is negative number');
    end if;
end;
/
exec pos_neg;

--check whether number is divisible by 5 and 11 or not
create or replace procedure div_5_11 
as
    n int(5) := &n;
begin
    if mod(n,5)=0 and mod(n,11)=0 then
        dbms_output.put_line(n ||' is divisible by 5 and 11');
    else
        dbms_output.put_line(n ||' is not divisible by 5 and 11');
    end if;
end;
/
exec div_5_11;

----check the alphabet is vowel or not
create or replace procedure vowel1 
as
    a varchar2(20) := '&a';
begin
    if a in ('a','e','i','o','u','A','E','I','O','U') then
        dbms_output.put_line(a||' is vowel');
    else
        dbms_output.put_line(a||' is not vowel');
    end if;
end;
/
exec vowel1;


---chech whether character is alphabet,digit,or special character
/
create or replace procedure check_char as
a varchar2(20) := '&a';
begin
if regexp_like(a,'^[0-9]') then
dbms_output.put_line(a||' is a number');
elsif regexp_like(a,'[a-z,A-Z]') then
dbms_output.put_line(a||' is alphabet');
else
dbms_output.put_line(a||' is special character');
end if;
end;
/
exec check_char;

---input month and print no_of_days in that month
create or replace procedure no_of_days_in_month as
month int(2) := &a;
first_date date;
last_date date;
no_of_days number(5);
begin
first_date:=trunc(to_date(month,'mm'));
last_date:=last_day(first_date)+1;
no_of_days:=last_date-first_date;
dbms_output.put_line('no_of_days is : '|| no_of_days);
end;
/
exec no_of_days_in_month;

----input side of triangle and check triangle is vaild or not
/
declare
ab number(5):=&A;
bc number(5):=&B;
ca number(5):=&C;
begin
if (ab+bc)>ca and (bc+ca)>ab and (ca+ab)>bc then
dbms_output.put_line('it is triangle');
else
dbms_output.put_line('it is not a triangle');
end if;
end;
/


---pass year date only saturday in that year
/
declare
--a int(4):=&a;
start_date date;
end_date date;
no_of_days int(5);
begin
start_date:=trunc(to_date('2021','yyyy'),'yyyy');
end_date:=add_months(start_date,12);
no_of_days:=end_date-start_date;
for i in 1..no_of_days loop
if to_char(start_date,'dy')='sat' then
dbms_output.put_line(start_date||' saturday');
end if;
start_date:=start_date+1;
end loop;
end;
/


---input 5 subject marks given grade
declare
physics int(3):=&ph;
chemistry int(3):=&ch;
maths int(3):=&m;
biology int(3):=&b;
computer int(3):=&cp;
total_marks int(5):=&tot_marks;
total_marks_gain int(5);
percentage int(3);
begin
total_marks_gain:=(physics+chemistry+maths+biology+computer);
percentage:=(total_marks_gain/total_marks)*100;
if percentage>=90 then
dbms_output.put_line('Grade A');
elsif percentage>=80 then
dbms_output.put_line('Grade B');
elsif percentage>=70 then
dbms_output.put_line('Grade C');
elsif percentage>=60 then
dbms_output.put_line('Grade D');
elsif percentage>=40 then
dbms_output.put_line('Grade E');
else
dbms_output.put_line('Grade F');
end if;
end;
/

--pass 3 angle of triangle display its valid or not
/
declare
a number(5):= &a;
b number(5):=&b;
c number(5):=&c;
begin
if (a+b+c)=180 and a<>0 and b<>0 and c<>0 then
dbms_output.put_line('it is valid triangle');
else
dbms_output.put_line('it is not a valid triangle');
end if;
end;
/


--find triangle is equilateral,isosceles, or scalene.
declare
ab int(5):=&ab;
bc int(5):=&bc;
ca int(5):=&ca;
begin
if ab=bc and bc=ca and ca=ab then
dbms_output.put_line('it is equilateral');
elsif ab<>bc and bc<>ca then
dbms_output.put_line('it is scalene');
else
dbms_output.put_line('it is isosceles');
end if;
end;
/

---calculate profit or loss
/
declare
sp int(10):=&sp;
cp int(10):=&cp;
begin
if sp>cp then
dbms_output.put_line('profit');
else
dbms_output.put_line('loss');
end if;
end;
/

