-- Task 1.1: Create Employees Table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    position_title TEXT NOT NULL,
    salary NUMERIC(8,2),
    start_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    store_id INT,
    department_id INT,
    manager_id INT
);

-- Task 1.2: Create Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department TEXT NOT NULL,
    division TEXT NOT NULL
);

-- Task 2: Alter Employees Table
ALTER TABLE employees
ALTER COLUMN department_id SET NOT NULL,
ALTER COLUMN start_date SET DEFAULT CURRENT_DATE,
ADD COLUMN end_date DATE,
ADD CONSTRAINT birth_check CHECK (birth_date <= CURRENT_DATE),
RENAME COLUMN position_title TO position_title;

-- Task 3.1: Insert Values into Employees Table
INSERT INTO employees 
(emp_id, first_name, last_name, position_title, salary, start_date, birth_date, store_id, department_id, manager_id, end_date)
VALUES 
(1,'Morrie','Conaboy','CTO',21268.94,'2005-04-30','1983-07-10',1,1,NULL,NULL),
(2,'Miller','McQuarter','Head of BI',14614.00,'2019-07-23','1978-11-09',1,1,1,NULL),
(3,'Christalle','McKenny','Head of Sales',12587.00,'1999-02-05','1973-01-09',2,3,1,NULL),
(4,'Sumner','Seares','SQL Analyst',9515.00,'2006-05-31','1976-08-03',2,1,6,NULL),
(5,'Romain','Hacard','BI Consultant',7107.00,'2012-09-24','1984-07-14',1,1,6,NULL),
(6,'Ely','Luscombe','Team Lead Analytics',12564.00,'2002-06-12','1974-08-01',1,1,2,NULL),
(7,'Clywd','Filyashin','Senior SQL Analyst',10510.00,'2010-04-05','1989-07-23',2,1,2,NULL),
(8,'Christopher','Blague','SQL Analyst',9428.00,'2007-09-30','1990-12-07',2,2,6,NULL),
(9,'Roddie','Izen','Software Engineer',4937.00,'2019-03-22','2008-08-30',1,4,6,NULL),
(10,'Ammamaria','Izhak','Customer Support',2355.00,'2005-03-17','1974-07-27',2,5,3,'2013-04-14'),
(11,'Carlyn','Stripp','Customer Support',3060.00,'2013-09-06','1981-09-05',1,5,3,NULL),
(12,'Reuben','McRorie','Software Engineer',7119.00,'1995-12-31','1958-08-15',1,5,6,NULL),
(13,'Gates','Raison','Marketing Specialist',3910.00,'2013-07-18','1986-06-24',1,3,3,NULL),
(14,'Jordanna','Raitt','Marketing Specialist',5844.00,'2011-10-23','1993-03-16',2,3,3,NULL),
(15,'Guendolen','Motton','BI Consultant',8330.00,'2011-01-10','1980-10-22',2,3,6,NULL),
(16,'Doria','Turbat','Senior SQL Analyst',9278.00,'2010-08-15','1983-01-11',1,1,6,NULL),
(17,'Cort','Bewlie','Project Manager',5463.00,'2013-05-26','1986-10-05',1,5,3,NULL),
(18,'Margarita','Eaden','SQL Analyst',5977.00,'2014-09-24','1978-10-08',2,1,6,'2020-03-16'),
(19,'Hetty','Kingaby','SQL Analyst',7541.00,'2009-08-17','1999-04-25',1,2,6,NULL),
(20,'Lief','Robardley','SQL Analyst',8981.00,'2002-10-23','1971-01-25',2,3,6,'2016-07-01'),
(21,'Zaneta','Carlozzi','Working Student',1525.00,'2006-08-29','1995-04-16',1,3,6,'2012-02-19'),
(22,'Giana','Matz','Working Student',1036.00,'2016-03-18','1987-09-25',1,3,6,NULL),
(23,'Hamil','Evershed','Web Developer',3088.00,'2022-02-03','2012-03-30',1,4,2,NULL),
(24,'Lowe','Diamant','Web Developer',6418.00,'2018-12-31','2002-09-07',1,4,2,NULL),
(25,'Jack','Franklin','SQL Analyst',6771.00,'2013-05-18','2005-10-04',1,2,2,NULL),
(26,'Jessica','Brown','SQL Analyst',8566.00,'2003-10-23','1965-01-29',1,1,2,NULL);

-- Task 3.2: Insert Values into Departments Table
INSERT INTO departments (department, division) VALUES
('Analytics', 'IT'),
('Finance', 'Administration'),
('Sales', 'Sales'),
('Website', 'IT'),
('Back Office', 'Administration');

-- Task 4.1: Update Jack Franklin's Promotion
UPDATE employees
SET position_title = 'Senior SQL Analyst', salary = 7200
WHERE first_name = 'Jack' AND last_name = 'Franklin';

-- Task 4.2: Rename Customer Support to Customer Specialist
UPDATE employees
SET position_title = 'Customer Specialist'
WHERE position_title = 'Customer Support';

-- Task 4.3: Apply 6% Raise to SQL Analysts
UPDATE employees
SET salary = salary * 1.06
WHERE position_title LIKE '%SQL Analyst';

-- Task 4.4: Calculate Average Salary for SQL Analyst (excluding Senior SQL Analyst)
SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE position_title = 'SQL Analyst';

-- Task 5.1: Add Manager and Active Status Columns
SELECT e.*, 
       CASE WHEN e.end_date IS NULL THEN 'true' ELSE 'false' END AS is_active,
       m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- Task 5.2: Create View v_employees_info
CREATE VIEW v_employees_info AS
SELECT e.*, 
       CASE WHEN e.end_date IS NULL THEN 'true' ELSE 'false' END AS is_active,
       m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- Task 6: Average Salary by Position
SELECT position_title, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY position_title;

-- Task 7: Average Salary by Division
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
NATURAL JOIN departments
GROUP BY department;

-- Task 8.1: Average Salary per Position
SELECT emp_id, first_name, last_name, position_title, salary,
       ROUND(AVG(salary) OVER (PARTITION BY position_title), 2) AS avg_position_salary
FROM employees
ORDER BY emp_id;

-- Task 8.2: Count Employees Earning Less Than Average
SELECT COUNT(*) AS count_less_salary
FROM (
    SELECT emp_id, first_name, last_name, position_title, salary,
           ROUND(AVG(salary) OVER (PARTITION BY position_title), 2) AS avg_position_salary
    FROM employees
) AS subquery
WHERE salary < avg_position_salary;

-- Task 9: Running Total of Salary (Ignoring Departures)
SELECT emp_id, salary, start_date,
       SUM(salary) OVER (ORDER BY start_date) AS running_total_of_salary
FROM employees;

-- Task 10: Running Total of Salary (Considering Departures)
SELECT emp_id, salary, start_date,
       SUM(salary) OVER (ORDER BY start_date) AS running_total_of_salary
FROM (
    SELECT emp_id, salary, start_date FROM employees
    UNION
    SELECT emp_id, -salary, end_date FROM v_employees_info WHERE is_active = 'false'
) AS combined
ORDER BY start_date;

-- Task 11.1: Top Earner by Position
SELECT first_name, position_title, salary
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2 WHERE e1.position_title = e2.position_title);

-- Task 11.2 and 11.3: Top Earner with Average Exclusion
SELECT first_name, position_title, salary,
       (SELECT ROUND(AVG(salary), 2) FROM employees e1 WHERE e1.position_title = e2.position_title) AS avg_salary
FROM employees e2
WHERE salary = (SELECT MAX(salary) FROM employees e3 WHERE e3.position_title = e2.position_title)
AND salary != (SELECT ROUND(AVG(salary), 2) FROM employees e1 WHERE e1.position_title = e2.position_title);

-- Task 12: Aggregations by Division, Department, Position
SELECT division, department, position_title,
       SUM(salary), COUNT(*), ROUND(AVG(salary), 2)
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
GROUP BY ROLLUP (division, department, position_title)
ORDER BY 1, 2, 3;

-- Task 13: Rank by Department
SELECT emp_id, position_title, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- Task 14: Top Earner by Department
SELECT emp_id, position_title, department, salary
FROM (
    SELECT emp_id, position_title, department, salary,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.department_id
) AS ranked
WHERE rank = 1;
