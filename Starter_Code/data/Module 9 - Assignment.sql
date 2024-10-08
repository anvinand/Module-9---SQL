--Create departments table 
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL, 
    dept_name VARCHAR(100)
);
select * 
from departments;

----------------------------------- 
--Create dept_emp table 
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL   
);
select * 
from dept_emp;
-----------------------------------
--Create dept_manager table 
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
	emp_no Int Not Null    
);
select * 
from dept_manager;

-----------------------------------
--Create employees table 
DROP TABLE employees
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10), 
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR,
	hire_date DATE
);
select * 
from employees;

-----------------------------------
--Create salaries table 
CREATE TABLE salaries (
    emp_no INT NOT NULL
	salary INT 
	);
select * 
from salaries;

-----------------------------------
--Create titles table 
DROP TABLE titles
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(30) 
	);
select * 
from titles;

-----------------------------------
--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM
	employees
JOIN 
	salaries ON employees.emp_no = salaries.emp_no;
	
-----------------------------------
--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	last_name, first_name, hire_date
FROM 
	employees
WHERE
	hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	
-----------------------------------
--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
	dept_manager.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name 
FROM 
	dept_manager
JOIN 
	departments ON dept_manager.dept_no = departments.dept_no
JOIN 
employees ON dept_manager.emp_no = employees.emp_no
;

-----------------------------------
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	employees.last_name, 
	employees.first_name,
	employees.emp_no, 
	dept_emp.dept_no, 
	departments.dept_name 
FROM
	employees
JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
;

-----------------------------------
--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	employees.last_name, 
	employees.first_name,
	employees.sex
FROM
	employees
WHERE 
	first_name = 'Hercules' 
AND last_name LIKE 'B%'
;

-----------------------------------
--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
	dept_name 
FROM
	departments
WHERE 
	dept_name = 'Sales' 
;

SELECT 
	employees.last_name, 
	employees.first_name,
	dept_emp.emp_no,
	departments.dept_name
FROM
	employees
JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	dept_name IN 
(SELECT 
	dept_name 
FROM
	departments
WHERE 
	dept_name = 'Sales') 
;

-----------------------------------
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	dept_name 
FROM
	departments
WHERE 
	dept_name = 'Sales' OR dept_name = 'Development'
;

SELECT 
	employees.last_name, 
	employees.first_name,
	dept_emp.emp_no,
	departments.dept_name
FROM
	employees
JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	dept_name IN 
(SELECT 
	dept_name 
FROM
	departments
WHERE 
	dept_name = 'Sales' OR dept_name = 'Development') 
;

-----------------------------------
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
    last_name, 
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;

-------------------------------------