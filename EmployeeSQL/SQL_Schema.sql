DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

create table departments (
	dept_no char(6) not null Primary Key,
	dept_name varchar not null);

create table titles (
		title_id char(8) not null PRIMARY KEY,
		title varchar not null);	
		
create table employees 
	(emp_no int not null PRIMARY KEY,
	 emp_title_id char(8) ,
	 birth_date date,
	 first_name varchar not null,
	 last_name varchar not null,
	 sex char(10),
	 hire_date date,
	 CONSTRAINT fk_title FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
	 );
	 
create table dept_emp (emp_no int,
					  dept_no char(6), 
					  CONSTRAINT pk_emp  PRIMARY KEY(emp_no, dept_no),
					  CONSTRAINT fk_emp  FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
					  CONSTRAINT fk_dept  FOREIGN KEY(dept_no) REFERENCES departments(dept_no));
	  
	  
create table dept_manager (dept_no char(6),
					  emp_no int, 
					  CONSTRAINT pk_deptemp  PRIMARY KEY(dept_no, emp_no),
					  CONSTRAINT fk_emp  FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
					  CONSTRAINT fk_dept  FOREIGN KEY(dept_no) REFERENCES departments(dept_no));	 

create table salaries (
			emp_no int PRIMARY KEY,
			salary numeric,
			CONSTRAINT fk_emp FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
			



				  