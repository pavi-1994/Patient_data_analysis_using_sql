Create database patient_db;
use patient_db;
drop table patient;
create table patient (
PatientID int, 
VisitDate date, 
DiagnosisCode varchar(15)
); 

insert into patient  
VALUES
    (1, '2023-01-10', 'A123'),
    (2, '2023-01-15', 'B456'),
    (3, '2023-02-05', 'A123'),
    (14, '2023-02-10', 'C789'),
    (1, '2023-03-05', 'B456'),
    (6, '2023-03-15', 'A123'),
    (1, '2023-01-10', 'A123'),
    (2, '2023-01-15', 'B456'),
    (3, '2023-02-05', 'A123'),
    (1, '2023-02-10', 'C789'),
    (4, '2023-03-05', 'B456'),
    (5, '2023-03-15', 'A123'),
    (2, '2023-04-01', 'B456'),
    (3, '2023-04-10', 'A123'),
    (6, '2023-05-05', 'C789'),
    (1, '2023-05-15', 'A123'),
    (4, '2023-06-01', 'B456'),
    (5, '2023-06-10', 'C789'),
    (2, '2023-07-05', 'A123'),
    (3, '2023-07-15', 'B456'),
    (6, '2023-08-01', 'C789'),
    (7, '2023-02-01', 'B456'),
    (8, '2023-04-10', 'A123'),
    (9, '2023-04-05', 'C789'),
    (10, '2023-05-15', 'A123'),
    (11, '2023-06-01', 'B456'),
    (12, '2023-06-10', 'C789'),
    (13, '2023-05-05', 'A123'),
    (14, '2023-07-15', 'B456'),
    (15, '2023-08-01', 'C789');
    
    SELECT 
    *
FROM
    patient;
    
  /*Patient Statistics:
How many unique patients are there in the dataset?
*/

SELECT 
    COUNT(DISTINCT PatientID)
FROM
    patient;
    
    
 /*-Which patient has the most visits, and how many visits do they have?/ */
SELECT 
    PatientID, COUNT(PatientID) AS count_of_visit
FROM
    patient
GROUP BY PatientID
ORDER BY count_of_visit DESC;

/* How many unique diagnosis codes are present in the dataset?*/

SELECT 
    COUNT(DISTINCT DiagnosisCode)
FROM
    patient;
    
   /*   What is the most frequently diagnosed code?*/ 
   
   SELECT DISTINCT
    DiagnosisCode, COUNT(DiagnosisCode) AS most_frequent
FROM
    patient
GROUP BY DiagnosisCode
ORDER BY most_frequent DESC
LIMIT 1;

/* count distinct visitdate from each patient*/
SELECT 
    patientID, COUNT(DISTINCT visitDate) as no_of_unique_visit
FROM
    patient
    group by patientID
    Having no_of_unique_visit> 1;

/*Can you provide a breakdown of the number of visits per month?*/
SELECT DISTINCT
    MONTH(VisitDate) AS month_of_vist, COUNT(*)
FROM
    patient
GROUP BY month_of_vist
ORDER BY month_of_vist;

/* Are there any months with a significantly higher number of visits*/
SELECT DISTINCT
    MONTH(VisitDate) AS month_of_vist, COUNT(*) as high_no_of_visit
FROM
    patient
GROUP BY month_of_vist
ORDER BY high_no_of_visit desc
limit 1;

/* dentify cases where the same patient visited multiple times.*/

SELECT 
    PatientID, DiagnosisCode, COUNT(*) AS no_of_revist
FROM
    patient
GROUP BY patientid , DiagnosisCode
having no_of_revist>1
ORDER BY no_of_revist DESC;

/*Identify cases where the same diagnosis code was given to multiple patients.*/

SELECT 
    DiagnosisCode, COUNT(DISTINCT patientID) AS no_of_patient
FROM
    patient
GROUP BY DiagnosisCode;

/*Is there any noticeable trend or pattern in the diagnosis codes over time?*/

SELECT
    DiagnosisCode,
    MONTH(VisitDate) AS visted_month,
    COUNT(*) no_of_visted_patient
FROM
    patient
GROUP BY visted_month , DiagnosisCode
ORDER BY visted_month;

/*a patient received more than one diagnosis on the same day.*/ 
SELECT 
    p1.patientID, p1.DiagnosisCode, p1.VisitDate
FROM
    patient p1
        JOIN
    patient p2 ON p1.patientID = p2.patientID
WHERE
    p1.VisitDate =p2.VisitDate
        AND p1.DiagnosisCode != p2.DiagnosisCode;
        
/*Provide a count of visits for each combination of patient and diagnosis code.*/

SELECT 
    patientID,
    DiagnosisCode,
    COUNT(*) AS count_based_on_DiagnosisCode
FROM
    Patient
GROUP BY patientID , DiagnosisCode
ORDER BY patientID;

/*What is the average number of visits per patient?*/
SELECT 
    patientID, (COUNT(*)/(select count(*) from patient)*100)AS average_vistist
FROM
    patient
GROUP BY patientID;

/*Are there any missing values in the "patient" table?*/

SELECT 
    *
FROM
    patient
WHERE
    patientID IS NULL OR VisitDate IS NULL
        OR DiagnosisCode IS NULL;    
        
/* Check for any anomalies or inconsistencies in the data.*/     

-- is there any missing values
SELECT 
    *
FROM
    patient
WHERE
    patientID IS NULL OR VisitDate IS NULL
        OR DiagnosisCode IS NULL;    
        
 -- is there any duplicate values
 SELECT 
    patientID,
    VisitDate,
    DiagnosisCode,
    COUNT(*) AS is_there_duplicate
FROM
    Patient
GROUP BY patientID , VisitDate , DiagnosisCode
HAVING is_there_duplicate > 1;

-- there are duplicate values in the sql


# check for unexpected value
SELECT 
    *
FROM
    patient
WHERE
    visitDate > CURRENT_DATE();
    
 -- no there dosenot exist any unexpected value in this table   
