SELECT *
FROM departments;

/* 1. List the following details of each employee: 
	employee number, 
	last name, 
	first name, 
	gender, and 
	salary.*/
SELECT employees.emp_no
	,employees.last_name
	,employees.first_name
	,employees.gender
	,salaries.salary
FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no;

--2. List employees who were hired in 1986.
SELECT first_name
	,last_name
	,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

/*3. List the manager of each department with the following information: 
	department number, 
	department name, 
	the manager's employee number, 
	last name, 
	first name, 
	and start and end employment dates.*/
SELECT *
FROM dept_manager;

SELECT dept_manager.dept_no
	,departments.dept_name
	,dept_manager.emp_no AS manager_emp_no
	,employees.last_name
	,employees.first_name
	,dept_manager.from_date
	,dept_manager.to_date
FROM dept_manager
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no;

/* 4. List the department of each employee with the following information: 
	employee number, 
	last name, 
	first name, 
	and department name.*/
SELECT *
FROM dept_emp;

SELECT employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
RIGHT JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

/*5. List all employees whose first name is "Hercules" and last names begin with "B."*/
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/*6. List all employees in the Sales department, including their 
	employee number, 
	last name, 
	first name, 
	and department name.*/
SELECT employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

-- to verify that the total number of employees were pulled on the query
SELECT *
FROM dept_emp
WHERE dept_no = 'd007';

/*7. List all employees in the Sales and Development departments, including their 
	employee number, 
	last name, 
	first name, 
	and department name.*/
SELECT employees.emp_no
	,employees.last_name
	,employees.first_name
	,departments.dept_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

/*8. In descending order, list the frequency count of 
	employee last names, i.e., how many employees share each last name.*/
SELECT last_name
	,COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;
