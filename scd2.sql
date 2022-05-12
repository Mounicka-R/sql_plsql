select * from prod_family;
select *from prod_cat;
select *from products;
select *from prod_dim;
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE  sp_scd2 
AS
    CURSOR CUR_PRODUCT  IS (SELECT P.PROD_ID pid,P.PROD_NAME Pnm,P.PROD_PRICE price,P.CRT_Date from_date,P.mod_date upd_date,pc.prod_cat_desc pcd,
                           pf.prod_fam_desc pfd
                            from products p join prod_cat pc on P.PROD_CAT_ID=PC.PROD_CAT_ID join prod_family PF on PC.PROD_FAM_ID= PF.PROD_FAM_ID);                       
    V_COUNT INT;
    cnt int;
BEGIN 
    FOR I IN CUR_PRODUCT LOOP
        SELECT COUNT(*) INTO V_COUNT FROM prod_tgt where  PROD_ID=I.PID;
        IF V_COUNT = 0 THEN
            INSERT INTO prod_tgt
            VALUES( PROD_SUR_ID.NEXTVAL ,I.PID,I.Pnm, I.PCD, I.PFD,I.PRICE,SYSDATE,null,'Y');            
        ELSE
            select count(*) into cnt from prod_tgt where prod_id=i.pid and (prod_price<>i.price or prod_nm<>i.pnm)and (prod_id,prod_sur_id)in (select
                                                                                                                    prod_id,max(prod_sur_id) from prod_tgt 
                                                                                                                    group by prod_id);
            if cnt>=1 then
                INSERT INTO prod_tgt
                VALUES( PROD_SUR_ID.NEXTVAL ,I.PID,I.PNM, I.PCD, I.PFD,I.PRICE,SYSDATE,null,'Y');
                update prod_tgt
                set to_date =sysdate-1 , curr_record_indicator='n' 
                where prod_id=i.pid and (prod_price<>i.price or prod_nm<>i.pnm);
             END IF;
        end if;
  END LOOP;
END ;
/
exec sp_scd2 ;
/
update products set prod_price=15000 where prod_id=2;
/
update product1 set prod_name='washing ' where prod_id=1;
/
select * from prod_tgt;
/
truncate table prod_tgt;
/
commit;



create table prod_tgt(
PROD_SUR_ID number,
Prod_id number,
prod_nm varchar2(50),
prod_cat_desc varchar2(50),
prod_fam_desc varchar2(30),
prod_price number,
from_date date,
to_date date,
curr_record_indicator varchar2(10));

create sequence PROD_SUR_ID;
