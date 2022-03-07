DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS employee;

CREATE TABLE department (
  id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE job (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL NOT NULL,
  department_id INT
  FOREIGN KEY (department_id)
  REFERENCES department(id)
  ON DELETE SET NULL
);

CREATE TABLE employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  job_id INT,
  manager_id INT
  FOREIGN KEY (job_id)
  REFERENCES role(id)
  ON DELETE SET NULL,
  FOREIGN KEY (manager_id)
  REFERENCES employee(id)
  ON DELETE SET NULL
);