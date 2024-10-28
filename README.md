# Advanced SQL for Employee Data Management

## Project Overview
This project showcases various SQL skills by tackling realistic data challenges involving an employee database. The project involves creating tables, modifying structures, performing data insertions, and executing advanced queries to answer specific business questions. Each task progressively builds on SQL fundamentals, covering topics like aggregations, joins, window functions, and ranking, as well as more advanced topics like ROLLUP and handling running totals.

---

## Summary of Skills and SQL Functions Used
Through these tasks, I demonstrated a wide range of SQL skills:
- **Table Creation**: Setting up tables with constraints and appropriate data types.
- **Data Manipulation**: Using `INSERT`, `UPDATE`, and handling insertion errors.
- **Constraints**: Applying `NOT NULL`, `CHECK`, and `DEFAULT` constraints.
- **Table Modification**: Altering existing tables to add columns, rename columns, and set constraints.
- **Joins**: Using `INNER JOIN`, `LEFT JOIN`, and `NATURAL JOIN` to combine data from multiple tables.
- **Aggregations**: Utilizing `SUM`, `AVG`, `COUNT`, and `GROUP BY` for data summarization.
- **Conditional Statements**: Using `CASE` statements to create custom conditions.
- **Window Functions**: Using `RANK`, `PARTITION BY`, and `OVER` for advanced data analysis.
- **Views**: Creating a view to streamline complex queries.
- **Hierarchical Aggregation**: Leveraging `ROLLUP` for multi-level aggregations.
- **Subqueries**: Implementing correlated and uncorrelated subqueries for advanced filtering and aggregation.
- **Running Totals**: Calculating cumulative values while considering employee departures.

---

## Task Breakdown

### Task 1: Database Setup
1. **1.1**: Create an `employees` table with `NOT NULL` constraints for essential fields.
2. **1.2**: Create a `departments` table, ensuring all columns are `NOT NULL`.

---

### Task 2: Alter Employees Table
Modify the `employees` table:
- Set `department_id` as `NOT NULL`.
- Set a default `CURRENT_DATE` value for `start_date`.
- Add an `end_date` column.
- Add a constraint `birth_check` to prevent future birth dates.
- Rename `job_position` to `position_title`.

---

### Task 3: Data Insertion
**3.1**: Insert sample employee data.  
**3.2**: Insert sample department data.

---

### Task 4: Update Employee Information
1. **4.1**: Promote Jack Franklin and increase his salary.
2. **4.2**: Rename `Customer Support` to `Customer Specialist`.
3. **4.3**: Apply a 6% salary increase to all SQL Analysts.
4. **4.4**: Calculate the average salary for SQL Analysts (excluding Senior SQL Analysts).

---

### Task 5: Add Manager and Active Status Columns
- **5.1**: Add a `manager_name` column combining first and last names, and an `is_active` column to indicate whether an employee is active.
- **5.2**: Create a view `v_employees_info` based on the query above.

---

### Task 6: Average Salary by Position
Write a query to return average salaries by position.  

---

### Task 7: Average Salary by Division
Calculate average salaries for each division.  

---

### Task 8: Advanced Salary Analysis
1. **8.1**: Display average salary for each position.
2. **8.2**: Count employees earning below their position’s average salary.  

---

### Task 9: Running Total Salary (Ignoring Departures)
Calculate the cumulative salary by `start_date` assuming employees are still employed.  

---

### Task 10: Running Total with Employee Departures
Calculate cumulative salary considering employees who have left.  

---

### Task 11: Top Earners by Position
1. **11.1**: Find the top earner for each position.
2. **11.2**: Add the average salary per position.
3. **11.3**: Exclude employees whose salary equals their position's average.  

---

### Task 12: Hierarchical Aggregation
Aggregate `salary`, `number of employees`, and `average salary` by combinations of division, department, and position using `ROLLUP`.

---

### Task 13: Salary Ranking by Department
Rank employees within each department by salary, with rank 1 being the highest.  

---

### Task 14: Top Earner by Department
Retrieve the top earner in each department.  

---

## Conclusion
This project involved practical applications of SQL techniques to manage and analyze employee data in a relational database. By completing these tasks, I demonstrated my abilities with SQL concepts ranging from basic table creation to advanced aggregations and ranking functions, providing insight into real-world data management scenarios.

