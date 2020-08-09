select * from departments;
select * from titles;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no as "Employee_ID", first_name as "First_Name", last_name as "Last_Name", sex as "Sex", salary as "Salary" 
FROM employees emp
INNER JOIN salaries sal ON emp.emp_no = sal.emp_no;
		

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First_Name", last_name as "Last_Name", hire_date as "Hire Date" 
FROM employees WHERE EXTRACT(YEAR FROM hire_date) =1986;


--3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT dept.dept_no as "Dept_No", dept_name as "Department", mgr.emp_no as "Employee_No", 
	first_name as "Manager_First_Name", last_name as "Manager_Last_Name"
FROM employees emp 
	INNER JOIN dept_manager mgr ON emp.emp_no = mgr.emp_no
 		INNER JOIN departments dept ON dept.dept_no = mgr.dept_no;


-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT emp.emp_no as "Employee_ID", first_name as "First_Name", last_name as "Last_Name", dptemp.dept_no as "Dept_No", dept.dept_name as "Department" FROM employees emp
INNER JOIN dept_emp dptemp
ON emp.emp_no = dptemp.emp_no
INNER JOIN departments dept
ON dept.dept_no = dptemp.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names 
-- begin with "B."
SELECT first_name as "First_Name", last_name as "Last_Name", sex as "Sex"
FROM employees WHERE first_name = 'Hercules' and last_name like 'B%';


-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name and department name.
SELECT emp.emp_no as "Employee_ID", first_name as "First_Name", last_name as "Last_Name", dept_name as "Department" FROM employees emp
INNER JOIN dept_emp dptemp ON emp.emp_no = dptemp.emp_no 
INNER JOIN departments dept ON dptemp.dept_no = dept.dept_no AND dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT emp.emp_no as "Employee No", first_name as "First Name", last_name as "Last Name", dept_name as "Department" FROM employees emp
INNER JOIN dept_emp dptemp ON emp.emp_no = dptemp.emp_no 
INNER JOIN departments dept ON dptemp.dept_no = dept.dept_no and 
			(dept_name = 'Sales' or dept_name = 'Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name as "Last Name", count(emp_no) as "Frequency" FROM employees 
GROUP BY last_name ORDER BY "Frequency" desc;


