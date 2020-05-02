
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY
	,birth_date DATE NOT NULL
	,first_name VARCHAR
	,last_name VARCHAR NOT NULL
	,gender VARCHAR(1)
	,hire_date DATE NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY
	,dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,dept_no VARCHAR NOT NULL
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	,from_date DATE NOT NULL
	,to_date DATE
	,PRIMARY KEY (emp_no, dept_no, from_date)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	,emp_no INT NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,from_date DATE NOT NULL
	,to_date DATE
	,PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,salary INT NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE
	,PRIMARY KEY (emp_no, salary, from_date)
);

CREATE TABLE titles (
	emp_no INT NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,title VARCHAR NOT NULL
	,from_date DATE NOT NULL
	,to_date DATE
	,PRIMARY KEY (emp_no, from_date)
);

SELECT *
FROM departments;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;