create database bbms;
use bbms;

CREATE TABLE user_details (
  user_id int NOT NULL AUTO_INCREMENT,
  userFName varchar(30) NOT NULL,
  userAge int NOT NULL,
  userGender char(1) NOT NULL,
  userBloodGroup varchar(5) NOT NULL,
  userPhone bigint NOT NULL,
  userMail varchar(35) DEFAULT NULL,
  userPlace varchar(45) NOT NULL,
  PRIMARY KEY (user_id)
);


CREATE TABLE user_login (
  user_id int NOT NULL,
  userUserName varchar(15) NOT NULL,
  userPassword varchar(15) NOT NULL,
  PRIMARY KEY (user_id,userUserName),
  UNIQUE KEY userUserName_UNIQUE (userUserName),
  CONSTRAINT user_login_id FOREIGN KEY (user_id) REFERENCES user_details (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE user_health (
  user_id int NOT NULL,
  userVitals varchar(10) DEFAULT NULL,
  userHeight int DEFAULT NULL,
  userWeight int DEFAULT NULL,
  userStatus varchar(5) DEFAULT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT user_id_health FOREIGN KEY (user_id) REFERENCES user_details (user_id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE emp_details (
  emp_id int NOT NULL AUTO_INCREMENT,
  empName varchar(45) NOT NULL,
  empMail varchar(45) NOT NULL,
  empPhone varchar(12) NOT NULL,
  empAddress varchar(70) NOT NULL,
  PRIMARY KEY (emp_id)
);

CREATE TABLE emp_login (
  emp_id int NOT NULL,
  userName varchar(15) NOT NULL,
  password varchar(15) NOT NULL,
  PRIMARY KEY (emp_id),
  UNIQUE KEY userName_UNIQUE (userName),
  CONSTRAINT emp_login_id FOREIGN KEY (emp_id) REFERENCES emp_details (emp_id) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE blood_stocks (
  b_id int NOT NULL AUTO_INCREMENT,
  blood_group varchar(5) NOT NULL,
  unit int NOT NULL,
  PRIMARY KEY (b_id,blood_group)
);

CREATE TABLE user_request (
  user_id int NOT NULL,
  req_id int NOT NULL AUTO_INCREMENT,
  blood_group varchar(5) NOT NULL,
  unit int NOT NULL DEFAULT '0',
  PRIMARY KEY (req_id),
  KEY user_id_request_idx (user_id),
  CONSTRAINT user_id_request FOREIGN KEY (user_id) REFERENCES user_details (user_id) ON UPDATE CASCADE
);