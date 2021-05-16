--queires

--1.
-- list the following details of each employee:
--employee number, last name, first name, sex, and salary(all from employee except salary[salary table])
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

--2.
--list first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_data FROM employees
WHERE hire_data BETWEEN '1986-01-01' AND '1986-12-31';

--3.
--list the manager of each department with the following information:
--department number, dpeartment name, the managers employye number, last name, first name
SELECT dept_managers.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name
FROM dept_managers
INNER JOIN departments ON (dept_managers.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_managers.emp_no = employees.emp_no);

--4.
--List the department of each employee with the 
--following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM "employees" as employees
JOIN "dept_employees" as dept_employees
ON employees.emp_no = dept_employees.emp_no
JOIN "departments" as departments
ON departments.dept_no = departments.dept_no;
--5.
--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name, last_name, sex FROM "employees" as employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
--6.
--List all employees in the Sales department, including their
--employee number, last name, first name, and department name.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM "employees" as employees
JOIN "dept_employees" as dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN "departments" as departments
ON departments.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
--7.
--List all employees in the Sales and Development departments, including
--their employee number, last name, first name, and department name.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM "employees" as employees
JOIN "dept_employees" as dept_employees
ON employees.emp_no = dept_employees.emp_no
JOIN "departments" as departments
ON departments.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8.
--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name, COUNT(last_name) as "last_name_frequency"
FROM "employees" as employees
GROUP BY last_name
ORDER BY "last_name_frequency" DESC;