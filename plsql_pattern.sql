-----pattern code
/
declare
n number := &A;
BEGIN
FOR i in 1..n
loop
for j in 1..i
loop
dbms_output.put('*');
end loop;
dbms_output.new_line;
end loop;
end;
/
set serveroutput on;
--hello world
/
Declare
message varchar2(30) := 'hello world';
begin
dbms_output.put_line(message);
end;
/

--reverse * pattern
/
declare
n number := &a;
i number;
j number;
begin 
for i in reverse 1..n
loop
for j in 1..i
loop
dbms_output.put('*');
end loop;
dbms_output.new_line;
end loop;
end;
/

/
declare
n number := &a;
i number;
j number;
begin 
for i in reverse 1..n
loop
for j in 1..i
loop
dbms_output.put(i);
end loop;
dbms_output.new_line;
end loop;
end;
/



/
DECLARE
St VARCHAR2(100) := 'hello';
len VARCHAR2(100);
numb NUMBER(15);
BEGIN
numb:=LENGTH(St);
WHILE numb>=1
LOOP
len:=SUBSTR(St,1,numb);
numb:=numb-1;
DBMS_OUTPUT.PUT_LINE(len);
END LOOP;
END;
/

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
n:=n+1;
end loop;
dbms_output.new_line;
end loop;
end;
/
set serveroutput on;

--find even and odd number
/
declare
n number :=&n;
begin
if mod(n,2)=0 then
dbms_output.put_line(n || ' is even number');
else 
dbms_output.put_line(n || ' is odd number');
end if;
end;
/
set serveroutput on;


/
declare
    i number(3);
    j number(3);
begin
dbms_output.put_line('prime number are: ');
    dbms_output.new_line;
    i:=2;
    loop
        j:=2;
        loop
            exit when ((mod(i,j)=0) or (j=i));
            j:=j+1;
        end loop;
        if (i=j) then
            dbms_output.put(i||' ');
        end if;
        i:=i+1;
        exit when i=50;
    end loop;
    dbms_output.new_line;
end;
/

/
declare
n number;
flag number;
 
begin
flag:=1;
n:=&n;
 
for i in 2..n/2
loop
if mod(n,i)=0
then
flag:=0;
exit;
end if;
end loop;
 
if flag=1
then
dbms_output.put_line('prime');
else
dbms_output.put_line('not prime');
end if;
end;
/


---find largest of 2 number using function
/
declare
    a number;
    b number;
    c number;
function findmax(x in number, y in number)
return number
is 
    z number;
begin
    if x > y then
    z:= x;
    else 
    z:=y;
    end if;
    return z;
end;
begin
    a:=12;
    b:=78;
    c:=findmax(a,b);
    dbms_output.put_line('maximum of (12,78): ' || c);
end;
/


    
    
/
create or replace procedure sp_q1
as
    v_cnt number;
begin
    select count(*) into v_cnt from src;
    exception
        when others then
        dbms_output.put_line('some error');
        when no_data_found then
        dbms_output.put_line('no data found');
end;
/