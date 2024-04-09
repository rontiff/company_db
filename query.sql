-- Add PK to departments:
ALTER TABLE departments
ADD PRIMARY KEY (dept_no);

-- Add PK and FK to dept_emp:
ALTER TABLE dept_emp
ADD PRIMARY KEY (emp_no, dept_no);

ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_dept_no
FOREIGN KEY (dept_no) 
REFERENCES departments(dept_no);

-- Add PK and FK to dept_manager:
ALTER TABLE dept_manager
ADD PRIMARY KEY (dept_no, emp_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_dept_no
FOREIGN KEY (dept_no) 
REFERENCES departments(dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_emp_no
FOREIGN KEY (emp_no) 
REFERENCES employees(emp_no);


-- Add PK to titles:
SELECT title_id, COUNT(*)
FROM titles
GROUP BY title_id
HAVING COUNT(*) > 1;

ALTER TABLE titles
ADD PRIMARY KEY (title_id);

-- Add PK and FK to employees:
SELECT emp_no, COUNT(*)
FROM employees
GROUP BY emp_no
HAVING COUNT(*) > 1;

-- No duplicates found, add keys:
ALTER TABLE employees
ADD PRIMARY KEY (emp_no);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_emp_title_id
FOREIGN KEY (emp_title_id) 
REFERENCES titles(title_id);

-- Add PK to salaries:
SELECT emp_no, COUNT(*)
FROM salaries
GROUP BY emp_no
HAVING COUNT(*) > 1;

ALTER TABLE salaries
ADD PRIMARY KEY (emp_no);






-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name,employees.first_name,employees.sex,salaries.salary 
FROM employees
JOIN salaries on employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
departments.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
de.dept_no,
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = de.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
e.emp_no,
e.last_name,
e.first_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;

