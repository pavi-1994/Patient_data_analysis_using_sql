-- task-01:
create database empsalesdb;
use empsalesdb;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY auto_increment,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY ,
    Employee_ID INT,
    Sale_Amount INT,
     SaleDate DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(EmployeeID)
);

-- INSERTING THE GIVEN VALUES 
INSERT INTO Employee ()
VALUES 
    (1, 'John Doe', 'HR', 50000),
    (2, 'Jane Smith', 'IT', 60000),
    (3, 'Bob Johnson', 'HR', 55000),
    (4, 'Alice Brown', 'IT', 70000),
    (5, 'Charlie Lee', 'Sales', 58000);
    
    
INSERT INTO Sales ( )
VALUES 
    (1, 2, 2000, '2023-01-15'),
    (2, 4, 3500, '2023-02-10'),
    (3, 5, 1500, '2023-02-28'),
    (4, 1, 3000, '2023-03-05'),
    (5, 2, 1800, '2023-03-12'),
    (6,3,2500,'2023-04-02');
    
    SELECT  * FROM  Employee;
    SELECT  * FROM  sales;
    
    /*A. Retrieve the names and salaries of all employees, along with the
    average salary in their respective departments*/
    SELECT  EMPLOYEEID, EMPNAME, SALARY,
    AVG(SALARY) OVER(PARTITION BY DEPARTMENT ) AS DEPARMENTAL_AVG_SALARY
    FROM EMPLOYEE;
    
   /* -- B. Calculate the total sales amount for each employee, including 
   those who have not made any sales. Display their names and total sales amount.*/
   SELECT  e. EMPLOYEEID, E.EMPNAME, IFNULL(SUM(s.SALE_AMOUNT),0) AS TOTAL_SALES
   FROM EMPLOYEE e 
   LEFT JOIN SALES s 
   ON e.EMPLOYEEID=s.EMPLOYEE_ID
   GROUP BY e. EMPLOYEEID, E.EMPNAME;
   
   /*Rank employees within each department based on their salary in descending order. The ranking should
reset for each department.if two employees have the highest salary, they will both be assigned the rank
1, and the next distinct salary will be assigned the rank 3 (skipping 2).*/
SELECT DEPARTMENT, EMPLOYEEID,EMPNAME,SALARY,
RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SALARY_RANK
FROM EMPLOYEE;

  /*Rank employees within each department based on their salary in descending order. The ranking should
reset for each department.if two employees have the highest salary, they will both be assigned the rank
1, and the next distinct salary will be assigned the rank 2."*/  
SELECT DEPARTMENT ,EMPLOYEEID,EMPNAME,SALARY,
dense_rank()OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SALARY_RANK
FROM EMPLOYEE;
    
    
 