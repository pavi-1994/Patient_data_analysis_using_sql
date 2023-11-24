/*
1 - You have two tables - Employee & Department
Columns of Employee Table - Emp_id, Emp_Name, Salary, Dept_id
Columns of Department Table - Dept_id, Dept_Name

*/

create database Emp_depdatabase;
use Emp_depdatabase;

CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_Name VARCHAR(30),
    Salary INT,
    Dept_id INT
);
 
 insert into Employee values
 (1, 'John Doe', 50000, 101),
    (2, 'Jane Smith', 60000, 102),
    (3, 'Bob Johnson', 55000, 101),
    (4, 'Alice Brown', 70000, 103),
    (5, 'David Wilson', 65000, 102),
    (6, 'Emily Davis', 55000, 101),
    (7, 'Michael Jones', 75000, 104),
    (8, 'Laura Miller', 62000, 103),
    (9, 'Chris Taylor', 58000, 104),
    (10, 'Sara White', 60000, 102),
    (11, 'Matthew Harris', 72000, 103),
    (12, 'Olivia Robinson', 68000, 101),
    (13, 'Daniel Martinez', 56000, 104),
    (14, 'Sophia Lee', 59000, 102),
    (15, 'Andrew Clark', 64000, 101),
    (16, 'Ella Turner', 54000, 103),
    (17, 'William Baker', 71000, 102),
    (18, 'Grace Davis', 58000, 101),
    (19, 'Jackson Wilson', 63000, 103),
    (20, 'Ava Moore', 67000, 104),
    (21, 'Liam Johnson', 58000, 101),
    (22, 'Emma Davis', 62000, 103),
    (23, 'Carter Brown', 75000, 102),
    (24, 'Mia Smith', 69000, 101),
    (25, 'James Taylor', 66000, 104),
    (26, 'Avery White', 60000, 102),
    (27, 'Scarlett Harris', 64000, 103),
    (28, 'Logan Clark', 70000, 104),
    (29, 'Abigail Turner', 57000, 101),
    (30, 'Henry Baker', 73000, 102);
 
CREATE TABLE department (
    Dept_id INT PRIMARY KEY,
    Dept_Name VARCHAR(30)
);
 
  insert into department values
 (101, 'HR'),
 (102, 'IT'),
 (103, 'Finance'),
 (104, 'Marketing');
 
 alter table  employee 
 add constraint fk_dept_id 
 foreign key(dept_id)
 references department(dept_id);
 
  #1. Average Salary by Department:
 select employee.dept_id, department.dept_name, round(avg(employee.salary)) as avg_salary
 from employee
 left join department 
 on employee.dept_id= department.dept_id
 group by employee.dept_id
 order by avg_salary;
 
  #let's try using window function
 select  department.dept_id, department.dept_name,employee.salary,
 avg(employee.Salary) over (partition by department.dept_id) as avg_dept_salary
 from department
 left join employee 
 on  employee.dept_id=department. dept_id
 order by avg_dept_salary  ;
 
 # Write SQL query to fetch Dept_Name which have 2nd Highest average salary.
 
SELECT 
    department.dept_id,
    department.dept_name,
    AVG(employee.Salary) AS avg_salary
FROM
    department
        RIGHT JOIN
    employee ON department.dept_id = employee.dept_id
GROUP BY department.dept_id , department.dept_name
ORDER BY avg_salary DESC
LIMIT 1 , 1;
 
# 3. Number of Employees in Each Department:
select employee.dept_id, department.dept_name, count(*) as employee_count 
from employee
left join department
on employee.dept_id= department.dept_id
group by employee.dept_id,department.dept_name
order by employee_count desc;


# 4. Highest Paid Employee in Each Department:
select dept_id, dept_name,emp_id, emp_name ,salary,heighest_paid_rank
from(
select employee.dept_id, department.dept_name,employee.emp_id, employee.emp_name ,employee.salary,
dense_rank() over(partition by department.dept_id order by salary desc )as heighest_paid_rank
from employee
left join department
on  employee.dept_id=department.dept_id) as rank_table
where heighest_paid_rank=1
order by salary desc;

# 5. Find the Department with the Highest Total Salary:

select department.dept_id, department.dept_name, sum(employee.salary) as total_salary
from employee
left join department
on employee.dept_id=department.dept_id
group by department.dept_id, department.dept_name
order by total_salary desc
limit 1;

# Identify Employees Who Earn More Than the Department Average:
select emp_id,Emp_Name, dept_name,salary,round(departmental_average_salary)
from
(select employee.emp_id,employee.Emp_Name, department.dept_name,employee.salary,
avg(employee.salary) over(partition by department.dept_id ) as departmental_average_salary
from employee
left join department
on employee.dept_id= department.dept_id) as salary_avg_table
where salary>departmental_average_salary;




 
