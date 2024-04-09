-- create 6 table's schema

CREATE TABLE departments (
  dept_no varchar(30) NOT NULL,
  dept_name varchar(45) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no varchar(30) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no varchar(30) NOT NULL,
  emp_no integer NOT NULL
);

CREATE TABLE employees (
  emp_no integer NOT NULL,
  emp_title_id varchar(30) NOT NULL,
  birth_date timestamp without time zone,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  sex varchar(30) NOT NULL,
  hire_date timestamp without time zone
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL
);

CREATE TABLE titles (
  title_id varchar(30) NOT NULL,
  title varchar(30) NOT NULL
);