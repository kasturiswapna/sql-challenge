--List the following details of each employee: employee number, last name, first name, sex, and salary.
select a.emp_no, a.last_name, a.first_name, a.sex, b.salary
from employee a
inner join salaries b
on a.emp_no = b.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employee
where extract(year from hire_date) = '1986'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select b.dept_no, b.dept_name, c.emp_no, c.last_name, c.first_name
from departmentmanagers a
inner join departments b
on a.dept_no = b.dept_no
inner join employee c
on a.emp_no = c.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employee a
inner join departmentemployee b
on a.emp_no = b.emp_no
inner join departments c
on b.dept_no = c.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employee
where first_name = 'Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employee a
inner join departmentemployee b
on a.emp_no = b.emp_no
inner join departments c
on b.dept_no = c.dept_no
and c.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select a.emp_no, a.last_name, a.first_name, c.dept_name
from employee a
inner join departmentemployee b
on a.emp_no = b.emp_no
inner join departments c
on b.dept_no = c.dept_no
and (c.dept_name = 'Sales' 
or c.dept_name = 'Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
from employee
group by last_name
order by last_name desc