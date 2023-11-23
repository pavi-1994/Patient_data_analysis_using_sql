Create database empdb;
use empdb;

create table ClinicStaff
(
StaffID int ,
fullName varchar(25) not null ,
HireDate  date);

insert into ClinicStaff value
(1, 'John Doe', '1995-03-15'),
    (2, 'Jane Smith', '1997-08-22'),
    (3, 'Bob Johnson', '1998-05-10'),
    (4, 'Alice Brown', '2000-02-18'),
    (5, 'David Wilson', '2002-11-30'),
    (6, 'Emily Davis', '2004-07-12'),
    (7, 'Michael Jones', '2006-04-05'),
    (8, 'Laura Miller', '2008-01-25'),
    (9, 'Chris Taylor', '2010-09-17'),
    (10, 'Sara White', '2012-06-08'),
    (11, 'Matthew Harris', '2014-03-28'),
    (12, 'Olivia Robinson', '2016-12-19'),
    (13, 'Daniel Martinez', '2018-10-01'),
    (14, 'Sophia Lee', '2020-07-23'),
    (15, 'Andrew Clark', '1994-12-05'),
    (16, 'Ella Turner', '1996-09-16'),
    (17, 'William Baker', '1999-06-27'),
    (18, 'Grace Davis', '2001-04-08'),
    (19, 'Jackson Wilson', '2003-01-19'),
    (20, 'Ava Moore', '2005-10-30');
    
    
    select * from ClinicStaff;
    
# Craft an SQL query to find the names of staff members who are celebrating their 5th, 10th, and 15th work anniversaries in 2023

SELECT 
    StaffID,
    fullName,
    TIMESTAMPDIFF(YEAR,
        HireDate,
        CURRENT_DATE) AS years_of_experience
FROM
    ClinicStaff
HAVING years_of_experience IN (5 , 10, 15)
ORDER BY years_of_experience DESC;
      
      
 # find the names of staff members who has heighstt work experience
SELECT 
    staffID,
    fullName,
    TIMESTAMPDIFF(YEAR,
        HireDate,
        CURRENT_DATE) AS year_of_experience
FROM
    ClinicStaff
 Having year_of_experience>=25   
ORDER BY Year_of_experience DESC;

# average year of experince
SELECT 
    round(AVG(TIMESTAMPDIFF(YEAR,
        hiredate,
        CURRENT_DATE))) AS avg_year_experience
FROM
    ClinicStaff;