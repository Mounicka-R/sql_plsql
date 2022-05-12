Create table bank_src
(Bank_id varchar2(10),
Account_id varchar2(20));

Create table bank_target
(bank_id varchar2(10),
Account_type char(1),
Account_id varchar2(20)
);

Create table bank_error
(seq_no number(10),
Account_id varchar2(20),
Reason varchar2(20)
);

insert into bank_src values('A1020','S30495345');
 insert into bank_src values('A1020','S234234432');
 insert into bank_src values('A1020','C34534543');
 insert into bank_src values('A1020','C34595044'); 
 insert into bank_src values('A1020','C2304985345');
 insert into bank_src values('A1020','D934530945');
 insert into bank_src values('A1020','D940404984');
 insert into bank_src values('A1020','D02340494R');
 insert into bank_src values('A1021','S3405935845');
 insert into bank_src values('A1021','S950504840');
 insert into bank_src values('A1021','S94040958');
 insert into bank_src values('A1021','C34095345');
 insert into bank_src values('A1021','C08548494');
 insert into bank_src values('A1021','C88594048');
 insert into bank_src values('A1021','D9440021');
 insert into bank_src values('A1021','D4954896');
 

commit;
select * from bank_src;
select * from bank_target;
select * from bank_error;

----------------------------------------------------------------------------------------
                      
select * FROM BANK_TARGET;
select * from bank_error;

truncate table bank_src;
truncate table bank_target;
truncate table bank_error;

------------------------------------------------------------------------------------------------------------
/
create or replace procedure sp_bank
as
begin
    insert into bank_target(select bank_id,substr(account_id,1,1),account_id
                            from bank_src
                            where length(account_id) between 7 and 11
                            and substr(account_id,1,1) in ('S','C','D')
                            and regexp_like(substr(account_id,2,length(account_id)),'^[0-9]+$')
                            and (bank_id,account_id) not in (select bank_id,account_id from bank_target));
    insert into bank_error(select seq_bank_err_id.NEXTVAL, account_id,'INVALID RECORD' from bank_src
                           where account_id not in(select account_id from bank_error)
                           and ((LENGTH(ACCOUNT_ID)<7 OR LENGTH(ACCOUNT_ID)>11 
                            OR SUBSTR(ACCOUNT_ID,1,1) NOT IN ('S','C','D') 
                            OR REGEXP_LIKE(SUBSTR(ACCOUNT_ID,2,LENGTH(ACCOUNT_ID)),'[A-Z, a-z]'))));
    commit;
end;
/
exec sp_bank;
/
select *from bank_target;
select * from bank_error;
---------------------------------------------------------------------------------
