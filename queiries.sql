--queires

--1.
-- list the following details of each employee:
--employee number, last name, first name, sex, and salary(all from employee except salary[salary table])
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salaries
FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

--2.
--list first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3.
--list the manager of each department with the following information:
--department number, dpeartment name, the managers employye number, last name, first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN deptartments ON (dept_manager.dept_no = departments. dept.no)
INNER JOIN employees ON (dept_manager.emp_no = employees.emp_no);
