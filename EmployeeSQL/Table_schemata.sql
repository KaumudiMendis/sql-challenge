-- Create a table schema for each of the six CSV files.

-- Creating titles table
DROP TABLE titles;

CREATE TABLE titles (
	title_ID VARCHAR(20) NOT NULL PRIMARY KEY,
	title VARCHAR(20) NOT NULL	
);

SELECT * 
FROM titles;

-- Create departments table.

DROP TABLE departments;

CREATE TABLE departments (
  dept_no VARCHAR(10)NOT NULL PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL 
);

SELECT * 
FROM departments


-- Create table employees

DROP TABLE employees;

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * 
FROM  employees


-- Create dept_emp table.

DROP TABLE dept_emp

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * 
FROM  dept_emp

--Creating salaries table

DROP TABLE salaries

CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


SELECT * 
FROM salaries


-- Create dept_manager table

DROP TABLE dept_manager


CREATE TABLE dept_manager(
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
	

SELECT * 
FROM dept_manager;







