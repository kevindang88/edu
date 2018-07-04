DROP DATABASE IF EXISTS BOOKSTORE;
CREATE DATABASE BOOKSTORE;
USE BOOKSTORE;

CREATE TABLE STUDENT(
  SSN         CHAR(9)         NOT NULL,
  Name        VARCHAR(30)     NOT NULL,
  Major       VARCHAR(15)     NOT NULL,
  Bdate       DATE,
  PRIMARY KEY (SSN)); 

CREATE TABLE COURSE(
  CourseNum   CHAR(5)         NOT NULL,
  Cname       VARCHAR(30)     NOT NULL,
  Dept        VARCHAR(30)     NOT NULL,
  PRIMARY KEY (CourseNum));

CREATE TABLE TEXT(
  Book_ISBN   CHAR(13)        NOT NULL,
  Book_Title  VARCHAR(30)     NOT NULL,
  Publisher   VARCHAR(30)     NOT NULL,
  Author      VARCHAR(30)     NOT NULL,
  PRIMARY KEY (Book_ISBN));

CREATE TABLE TERM(
  Quarter     CHAR(4)         NOT NULL,
  Name        VARCHAR(30)     NOT NULL,
  Year        CHAR(4)         NOT NULL,
  PRIMARY KEY (Quarter));

CREATE TABLE ENROLL(
  SSN         CHAR(9)         NOT NULL,
  CourseNum   CHAR(5)         NOT NULL,
  Quarter     CHAR(4)         NOT NULL,
  Grade       CHAR(2),
  FOREIGN KEY (CourseNum) REFERENCES COURSE(CourseNum),
  FOREIGN KEY (Quarter) REFERENCES TERM(Quarter));

CREATE TABLE BOOK_ADOPTION(
  CourseNum   CHAR(5)         NOT NULL,
  Quarter     CHAR(4)         NOT NULL,
  Book_ISBN   CHAR(13)        NOT NULL,
  PRIMARY KEY (CourseNum, Quarter),
  FOREIGN KEY (CourseNum) REFERENCES COURSE (CourseNum),
  FOREIGN KEY (Quarter) REFERENCES TERM (Quarter));





