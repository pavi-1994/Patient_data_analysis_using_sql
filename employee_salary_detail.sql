create database emplyee_salary_db;
use emplyee_salary_db;

-- create employeedetails table
CREATE TABLE employeedetails (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(100)
);

-- create employeesalary table
CREATE TABLE employeesalary (
    EmpId INT PRIMARY KEY,
    Project VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Variable DECIMAL(10, 2),
    FOREIGN KEY (EmpId) REFERENCES employeedetails(EmpId)
);


-- Inserting values into employeedetails table
INSERT INTO employeedetails (EmpId, FullName, ManagerId, DateOfJoining, City)
VALUES
    (1, 'John Doe', NULL, '2023-01-01', 'New York'),
    (2, 'Jane Smith', 1, '2023-02-15', 'Los Angeles'),
    (3, 'Bob Johnson', 1, '2023-03-10', 'Chicago'),
    (4, 'Alice Brown', 2, '2023-04-20', 'San Francisco'),
    (5, 'Charlie Wilson', 2, '2023-05-05', 'Seattle'),
    (6, 'Eva Davis', 3, '2023-06-12', 'Boston'),
    (7, 'Frank Miller', 3, '2023-07-18', 'Austin'),
    (8, 'Grace Turner', 4, '2023-08-22', 'Denver'),
    (9, 'Henry Carter', 4, '2023-09-30', 'Atlanta'),
    (10, 'Ivy White', 5, '2023-10-15', 'Miami');

-- Inserting values into employeesalary table
INSERT INTO employeesalary (EmpId, Project, Salary, Variable)
VALUES
    (1, 'Project A', 80000.00, 5000.00),
    (2, 'Project B', 75000.00, 6000.00),
    (3, 'Project C', 70000.00, 5500.00),
    (4, 'Project D', 90000.00, 7000.00),
    (5, 'Project E', 85000.00, 8000.00),
    (6, 'Project F', 95000.00, 7500.00),
    (7, 'Project G', 88000.00, 6200.00),
    (8, 'Project H', 82000.00, 5300.00),
    (9, 'Project I', 87000.00, 6800.00),
    (10, 'Project J', 92000.00, 7200.00);
    
    
#SQL Query to fetch records that are present in one table but not in another table.
SELECT *
FROM employeedetails e
LEFT JOIN employeesalary es ON e.EmpId = es.EmpId
WHERE es.EmpId IS NULL;

# SQL query to fetch all the employees who are not working on any project.
SELECT 
    employeedetails.empid, employeesalary.Project
FROM
    employeedetails
        LEFT JOIN
    employeesalary ON employeedetails.empid = employeesalary.empid
WHERE
    employeesalary.Project IS NOT NULL;

#SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2023.
SELECT 
    *
FROM
    employeedetails
WHERE
    YEAR(DateOfJoining) = 2023;

#Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT 
    *
FROM
    employeedetails
WHERE
    empid IN (SELECT 
            empid
        FROM
            employeesalary);

-- Select records from employeedetails where empid is not in employeesalary
SELECT 
    *
FROM
    employeedetails
WHERE
    empid NOT IN (SELECT 
            empid
        FROM
            employeesalary);
            
#Write an SQL query to fetch a project-wise count of employees.

SELECT 
    es.project, COUNT(*) AS count_of_employee
FROM
    employeedetails e
        LEFT JOIN
    employeesalary es ON e.empid = es.empid
GROUP BY es.project
ORDER BY count_of_employee DESC;


# Fetch employee names and salaries even if the salary value is not present for the employee.
SELECT 
    e.empid, es.salary
FROM
    employeedetails e
        LEFT JOIN
    employeesalary es ON e.empid = es.empid;

# Write an SQL query to fetch all the Employees who are also managers.

SELECT 
    empid
FROM
    employeedetails e
WHERE
    empid IN (SELECT DISTINCT
            ManagerId
        FROM
            employeedetails);


# Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT 
    *, COUNT(*) AS count_of_occurance
FROM
    employeedetails
GROUP BY empid
HAVING count_of_occurance > 1;


# Write a query to find the 3rd highest salary from a table without top or limit keyword.
select empid, salary  from(select e.empid , es. salary,
dense_rank() over( order by es.salary desc) salary_rank
from employeedetails e
left join employeesalary es
on e.empid= es.empid) as emp_salary_rank
where salary_rank=3;

#  Write an SQL query to fetch only even rows from the table.
select empid  from
(select *,
row_number() over (order by empid ) as  row_num
from employeedetails )row_rank_table
where mod(row_num,2)=0;

#  Write an SQL query to fetch only odd rows from the table.
select empid  from
(select *,
row_number() over (order by empid ) as  row_num
from employeedetails )row_rank_table
where mod(row_num,2)<>0;





