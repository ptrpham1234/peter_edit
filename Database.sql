DROP DATABASE IF EXISTS COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;

DROP TABLE IF EXISTS STORE;
CREATE TABLE STORE (
	store_ID INT(5) NOT NULL,
    manager_ID INT(10),
    phone_number INT(10),
    CONSTRAINT pk_store PRIMARY KEY (store_ID),
    CONSTRAINT fk_manager FOREIGN KEY (manager_ID)
		REFERENCES MANAGERS (manager_ID)
);

DROP TABLE IF EXISTS MANAGER;
CREATE TABLE MANAGER (
	manager_ID INT(10) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    department VARCHAR(20),
    pay DECIMAL(10, 2),
    ssn CHAR(9),
    middle_init CHAR(1),
    CONSTRAINT pk_manager PRIMARY KEY (manager_ID)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	employee_ID INT(10) NOT NULL,
    ssn CHAR(9),
    email VARCHAR(50),
    phone_number INT(10),
    manager_ID INT(10),
    pay DECIMAL(10, 2),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    address VARCHAR(50),
    CONSTRAINT pk_employee PRIMARY KEY (employee_ID),
    CONSTRAINT fk_manager FOREIGN KEY (manager_ID)
		REFERENCES MANAGER (manager_ID)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
	customer_ID INT(10) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_num INT(10),
    reward_points INT,
    address VARCHAR(50),
    CONSTRAINT pk_user PRIMARY KEY (customer_ID),
    CONSTRAINT fk_tracking FOREIGN KEY (address)
		REFERENCES Tracking (destination)
);

DROP TABLE IF EXISTS Purchases;
CREATE TABLE Purchases (
	purchase_ID INT(10) NOT NULL,
    item_ID INT(10) NOT NULL,
    amount DECIMAL(10,2),
    points_earned INT,
    tracking_ID INT(10),
    customer_ID INT(10),
    store_ID INT(5),
    CONSTRAINT pk_purchase PRIMARY KEY (purchase_ID),
    CONSTRAINT fk_item FOREIGN KEY (item_ID)
		REFERENCES Items (item_ID),
	CONSTRAINT fk_store FOREIGN KEY (store_ID)
		REFERENCES Store (store_ID),
	CONSTRAINT fk_customer FOREIGN KEY (customer_ID)
		REFERENCES Users (customer_ID)
);

DROP TABLE IF EXISTS Tracking;
CREATE TABLE Tracking (
	tracking_ID INT(10) NOT NULL,
    depart_time TIME,
    arrive_time TIME,
    destination VARCHAR(20) NOT NULL,
    weight DECIMAL(10, 2),
    length DECIMAL(10, 2),
    width DECIMAL(10, 2),
    container_ID INT(10),
    item_ID INT(10),
    customer_ID INT(10),
    CONSTRAINT pk_tracking PRIMARY KEY (tracking_ID),
    CONSTRAINT fk_destination FOREIGN KEY (destination)
		REFERENCES Users (address)
);

DROP TABLE IF EXISTS Brand;
CREATE TABLE Brand (
	brand_ID INT(10) NOT NULL,
    brand_name VARCHAR(20),
    CONSTRAINT pk_brand PRIMARY KEY (brand_ID),
    CONSTRAINT fk_brand FOREIGN KEY (brand_ID)
		REFERENCES Items (brand_ID)
);

DROP TABLE IF EXISTS Items;
CREATE TABLE Items (
    item_ID INT(10) NOT NULL,
    cost DECIMAL(10 , 2 ),
    item_type VARCHAR(20),
    brand_ID INT(10),
    CONSTRAINT pk_item PRIMARY KEY (item_ID),
    CONSTRAINT fk_brand FOREIGN KEY (brand_ID)
        REFERENCES Brand (brand_ID)
);