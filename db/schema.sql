DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS employee;

CREATE TABLE department (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE job (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  job_id INT UNSIGNED NOT NULL,
  INDEX job_ind (job_id),
  CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
  
);