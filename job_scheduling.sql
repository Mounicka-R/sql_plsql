create table activity_logs(
log_id number,
created_date date
);

/
BEGIN
 DBMS_SCHEDULER.create_job (
   job_name            =>  'FIRST_JOB', 
   job_type            =>  'PLSQL_BLOCK',
   job_action          =>  'declare
                                v_count number:=0;
                            begin
                                select count(*) into v_count from activity_logs;
                                insert into activity_logs values(v_count+1,sysdate);
                                commit;
                            end;',
   start_date          =>  SYSTIMESTAMP,
   repeat_interval     =>  'FREQ=SECONDLY;INTERVAL=5',
   end_date            =>  NULL,
   enabled              =>  TRUE,
   comments            =>  'my first test jobs');
END;
/
select*from activity_logs;
/

select *from DBA_SCHEDULER_JOBS
where job_name='FIRST_JOB';
/
select *from DBA_SCHEDULER_JOB_log
where job_name='FIRST_JOB';
/
begin
DBMS_SCHEDULER.disable(name=>'first_job');
end;
/
begin
DBMS_SCHEDULER.enable(name=>'first_job');
end;

