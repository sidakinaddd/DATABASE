CREATE DATABASE lab6;--1
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY ,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);
CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY ,
  department_name VARCHAR(50) UNIQUE ,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);
CREATE TABLE Employee(
  employee_id SERIAL PRIMARY KEY ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  manager_id INTEGER REFERENCES Employees,
  department_id INTEGER REFERENCES departments
);--2
CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);--2

INSERT INTO locations VALUES (default ,'Baiterek','03','Astana','Kazakhstan');
INSERT INTO departments VALUES (default ,'teacher',50000,3);
INSERT INTO  Employee VALUES (default ,'Bob','Sembaev','sembayevb','87074022333',120000,1,1);
INSERT INTO job_grades VALUES('5',100000,130000);

SELECT * FROM locations;
SELECT * FROM departments;
SELECT * FROM Employee;
SELECT * FROM job_grades;
SELECT first_name,last_name,departments.department_name,locations.city,locations.state_province FROM ((Employee INNER JOIN departments ON Employee.department_id = departments.department_id) INNER JOIN locations ON departments.location_id=locations.location_id);--3
SELECT first_name,last_name,salary,job_grades.grade FROM Employee INNER JOIN job_grades ON salary BETWEEN lowest_salary and highest_salary;--4

SELECT E.first_name as "employee", M.first_name as "manager" FROM Employee E INNER JOIN Employee M ON E.manager_id=M.employee_id;--6
SELECT first_name,last_name,Employee.department_id,departments.department_name FROM Employee INNER JOIN departments ON Employee.department_id=departments.department_id;--7