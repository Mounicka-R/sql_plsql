-----------------------------------------------------------------
---------zero_divide error
/
DECLARE
   stock_price NUMBER := 9.73;
   net_earnings NUMBER := 0;
   pe_ratio NUMBER;
BEGIN
   pe_ratio := stock_price / net_earnings;
   dbms_output.put_line('Price/earnings ratio = ' || pe_ratio);

EXCEPTION 
   WHEN ZERO_DIVIDE THEN  -- handles 'division by zero' error
      dbms_output.put_line('Company must have had zero earnings.');
      pe_ratio := null;

   WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Some other kind of error occurred.');
      pe_ratio := null;

END;  
/
set serveroutput on

------------------------------------------------------------------------------------------
------no_data_found
select*from customer;
/
DECLARE 
   c_id customer.cust_id%type := 8; 
   c_name customer.cust_nmae%type; 
   c_city customer.cust_city%type; 
BEGIN 
   SELECT  cust_nmae, cust_city INTO  c_name, c_city
   FROM customer
   WHERE cust_id = c_id;  
   DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name); 
   DBMS_OUTPUT.PUT_LINE ('city: ' || c_city); 

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
END; 
/

---------------------------------------------------------------------------------------
----too_many_rows
/
DECLARE
    v_fname VARCHAR2 (15);
BEGIN
    SELECT fname INTO v_fname
    FROM doctor
    WHERE lname = 'patel';
    DBMS_OUTPUT.PUT_LINE ('first name is :' || v_fname);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE (' Your SELECT statement retrieved multiple rows. Consider using a cursor.');
END;
/
select *from doctor;
/
insert into doctor values('d4','john','patel','heart',987896786);
commit;

-------------------------------------------------------------------------------------------------
---invalid number
/
DECLARE
   acct_type INTEGER := 7;
BEGIN
   IF acct_type NOT IN (1, 2, 3) THEN
      RAISE INVALID_NUMBER;  -- raise predefined exception
   END IF;
EXCEPTION
   WHEN INVALID_NUMBER THEN
      DBMS_OUTPUT.PUT_LINE('HANDLING INVALID INPUT BY ROLLING BACK.');
      ROLLBACK;
END;
/

------------------------------------------------------------------------------------
----dup_val_on_index
/
begin
insert into product values(100,'pen',40);

/


