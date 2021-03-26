CREATE TABLE Titles (
	title_id varchar PRIMARY KEY,
	title varchar
);

CREATE TABLE Employee (
	emp_no int PRIMARY KEY,
	emp_title_id varchar,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex char(1),
	hire_date date
);

CREATE TABLE Salaries (
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
	salary int
);

CREATE TABLE Departments (
	dept_no varchar PRIMARY KEY,
	dept_name varchar
);

CREATE TABLE DepartmentEmployee (
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
	dept_no varchar,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE DepartmentManagers (
	dept_no varchar,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);