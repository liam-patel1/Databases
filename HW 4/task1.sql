DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20),
  petowner VARCHAR(45),
  species VARCHAR(45),
  gender VARCHAR(1)
  birth DATE,
  death DATE,
  PRIMARY KEY petname
);

CREATE TABLE petEvent (
  petname VARCHAR(20)
  eventdate DATE
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  FOREIGN KEY petname,
  PRIMARY KEY remark
);
