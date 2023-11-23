use patient_db;

/*Using window functions, find the month with the highest number of visits with the highest count in that month.*/
 
 create temporary table  visitors_count_cte as 
 select  month(VisitDate) as VisitMonth,
 count(*) as visitors_number,
 row_number() over (order by count(*)desc) as row_num
 from patient
 group by VisitMonth 
 order by visitors_number desc;
 
 # find the month with the highest number of visits
SELECT 
    *
FROM
    visitors_count_cte
WHERE
    row_num = 1;
 
 # find the month with the 2nd highest number of visits
 SELECT 
    *
FROM
    visitors_count_cte
WHERE
    row_num = 2;

 
 
/*Using window functions, find the month with the highest number of visits
 and the diagnosis code associated with the highest count in that month.*/
   
create temporary table  diagnosis_visitors_count_cte as 
 select  month(VisitDate) as VisitMonth,
 DiagnosisCode ,
 count(*) as visitors_number,
 row_number() over (partition by DiagnosisCode order by count(*)desc) as row_num
 from patient
 group by VisitMonth 
 order by visitors_number desc;

 /* find the month with the highest number of visits
 and the diagnosis code associated with the highest count in that month*/
 SELECT 
    *
FROM
    diagnosis_visitors_count_cte
WHERE
    row_num = 1;

/* find the month with the 2nd highest number of visits
 and the diagnosis code associated with the highest count in that month*/
SELECT 
    *
FROM
    diagnosis_visitors_count_cte
WHERE
    row_num = 2;
  