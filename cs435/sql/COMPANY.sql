DROP DATABASE IF EXISTS COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE EMPLOYEE(
  Fname       VARCHAR(15)       NOT NULL,
  Minit       CHAR,
  Lname       VARCHAR(15)       NOT NULL,
  Ssn         CHAR(9)           NOT NULL,
  Bdate       DATE,
  Address     VARCHAR(30),
  Sex         CHAR,
  Salary      DECIMAL(10, 2),
  Super_ssn   CHAR(9),
  Dno         INT               NOT NULL,
  PRIMARY KEY (Ssn));

CREATE TABLE DEPARTMENT(
  Dname           VARCHAR(15)   NOT NULL,
  Dnumber         INT           NOT NULL,
  Mgr_ssn         CHAR(9)       NOT NULL,
  Mgr_start_date  DATE,
  PRIMARY KEY (Dnumber),
  UNIQUE (Dname),
  FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn));

CREATE TABLE DEPT_LOCATIONS (
  Dnumber         INT           NOT NULL,
  Dlocation       VARCHAR(15)   NOT NULL,
  PRIMARY KEY (Dnumber, Dlocation),
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber));
