
CREATE TABLE titles(
    title_id character varying(50) NOT NULL,
    title character varying(50) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying(50) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(50)NOT NULL,
    last_name character varying(50) NOT NULL,
    sex character varying(10) NOT NULL,
    hire_date date NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments
(
    dept_no character varying(50) NOT NULL,
    dept_name character varying(50)  NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
);


CREATE TABLE dept_manager(
	dept_no character varying(50) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),	
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no)
);