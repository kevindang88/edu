-- KEVIN DANG, SUEANN WANG, PHILLIP DOYLE 

DROP DATABASE IF EXISTS ARTBASE;
CREATE DATABASE ARTBASE;
USE ARTBASE;

CREATE TABLE ARTIST(
  AName       VARCHAR(30)       NOT NULL,
  Birthplace  VARCHAR(30)       NOT NULL,
  Age         INT               NOT NULL,
  Style       VARCHAR(30)       NOT NULL,
  PRIMARY KEY (AName)
);

CREATE TABLE ARTWORK(
  Title       VARCHAR(30)       NOT NULL,
  Year        INT               NOT NULL,
  AType       VARCHAR(30)       NOT NULL,
  Price       DECIMAL(10, 2)    NOT NULL,        
  ArtistName  VARCHAR(30)       NOT NULL,
  PRIMARY KEY (Title),
  FOREIGN KEY (ArtistName) REFERENCES ARTIST (AName)
);

CREATE TABLE CUSTOMER(
  CustId      CHAR(10)          NOT NULL,
  CName       VARCHAR(30)       NOT NULL,
  Address     VARCHAR(30)       NOT NULL,
  Amount      DECIMAL(10, 2)    NOT NULL,
  PRIMARY KEY (CustId)
);

CREATE TABLE GRP(
  Gname       VARCHAR(30)       NOT NULL,
  PRIMARY KEY (Gname)
);

CREATE TABLE CLASSIFY(
  ArtTitle      VARCHAR(30)     NOT NULL,
  GrpName       VARCHAR(30)     NOT NULL,
  PRIMARY KEY (ArtTitle, GrpName),
  FOREIGN KEY (ArtTitle) REFERENCES ARTWORK (Title),
  FOREIGN KEY (GrpName) REFERENCES GRP (Gname)
);

CREATE TABLE LIKE_GROUP(
  CustID        CHAR(10)        NOT NULL,
  GroupName     VARCHAR(30)     NOT NULL,
  PRIMARY KEY (CustID, GroupName), 
  FOREIGN KEY (CustID) REFERENCES CUSTOMER (CustId),
  FOREIGN KEY (GroupName) REFERENCES GRP (Gname)
);

CREATE TABLE LIKE_ARTIST(
  CuID          CHAR(10)        NOT NULL,
  ArtistNm      VARCHAR(30)     NOT NULL,
  PRIMARY KEY (CuID, ArtistNm),
  FOREIGN KEY (CuID) REFERENCES CUSTOMER (CustId),
  FOREIGN KEY (ArtistNm) REFERENCES ARTIST (AName)
);


