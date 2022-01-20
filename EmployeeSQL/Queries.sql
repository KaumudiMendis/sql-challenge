-- Database: EmployeeSQL_db

-- DROP DATABASE IF EXISTS "EmployeeSQL_db";

CREATE DATABASE "EmployeeSQL_db"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
	
	
-- DATA ANALYSIS :

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
	SELECT 
		employees.emp_no as "employee number", 
		employees.last_name as "last name", 
		employees.first_name as "first name",
		employees.sex as "sex",
		salaries.salary as "salary"

	FROM employees
	join salaries on employees.emp_no=salaries.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	first_name as "first name",
	last_name as "last name", 
	hire_date as "hire date"
		
FROM employees
WHERE hire_date >='1986-01-01' and hire_date <='1986-12-31'
	;

-- 3. List the manager of each department with the following information: department number, 
	--department name, the manager's employee number, last name, first name.

SELECT 
 	dept_manager.dept_no as "department number",
	departments.dept_name as "department name",
	dept_manager.emp_no as "the manager''s employee number", 
	employees.last_name as "last name",
	employees.first_name as "first name"	
	
FROM 
	dept_manager 
	LEFT JOIN  departments on departments.dept_no=dept_manager.dept_no
	LEFT JOIN employees on dept_manager.emp_no=employees.emp_no
	
;
	
-- 4. List the department of each employee with the following information: employee number, last name, 
	--first name, and department name.
	
	SELECT 
 	employees.emp_no as "employee number",
	employees.last_name as "last name",
	employees.first_name as "first name",
	departments.dept_name as "department name"
	
FROM 
	employees
	
	LEFT JOIN  dept_emp on employees.emp_no=dept_emp.emp_no
	LEFT JOIN departments on dept_emp.dept_no=departments.dept_no
;
	
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name as "first name",
	last_name as "last name",
	sex as "sex"
	
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%'
;
	

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no as "employee number", 
	employees.last_name as "last name", 
	employees.first_name as "first name",
	departments.dept_name as "department name"

	
FROM 
	employees
	
	LEFT JOIN  dept_emp on employees.emp_no=dept_emp.emp_no
	LEFT JOIN departments on dept_emp.dept_no=departments.dept_no
	
WHERE
departments.dept_name = 'Sales'
;
	
-- 7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT 
		employees.emp_no as "employee number", 
		employees.last_name as "last name", 
		employees.first_name as "first name",
		departments.dept_name as "department name"		
	
FROM 
	employees
	
	LEFT JOIN  dept_emp on employees.emp_no=dept_emp.emp_no
	LEFT JOIN departments on dept_emp.dept_no=departments.dept_no

WHERE
	departments.dept_name = 'Sales' 
	OR departments.dept_name = 'Development'
ORDER BY 
	departments.dept_name
;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "last name",
		COUNT (last_name) as "frequency count of employee last names"
FROM 
	employees
GROUP BY last_name
ORDER BY "frequency count of employee last names" DESC
;