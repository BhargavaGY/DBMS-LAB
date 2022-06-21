create database BANK030;
USE BANK030;

create table BRANCH(
	BRANCH_NAME VARCHAR(45),
    BRANCH_CITY VARCHAR(45), 
    ASSESTS REAL,
    PRIMARY KEY(BRANCH_NAME)
    );
create table ACCOUNTS(
	ACCNO INT, 
    BRANCH_NAME VARCHAR(45),
    BALANCE REAL,
    PRIMARY KEY(ACCNO, BRANCH_NAME),
    FOREIGN KEY (BRANCH_NAME) REFERENCES BRANCH(BRANCH_NAME)
    );
create table CUSTOMER(
	CUSTOMER_NAME VARCHAR(45), 
    CUSTOMER_STREET VARCHAR(45), 
    CUSTOMER_CITY VARCHAR(45),
    PRIMARY KEY(CUSTOMER_NAME)
    );
create table DEPOSITOR(
	CUSTOMER_NAME VARCHAR(45),
    ACCNO INT,
    PRIMARY KEY(CUSTOMER_NAME,ACCNO),
    FOREIGN KEY(CUSTOMER_NAME) REFERENCES CUSTOMER(CUSTOMER_NAME),
    FOREIGN KEY(ACCNO) REFERENCES ACCOUNTS(ACCNO)
    );
create table LOAN(
	LOAN_NUMBER INT, 
    BRANCH_NAME VARCHAR(45), 
    AMOUNT REAL,
    PRIMARY KEY(LOAN_NUMBER, BRANCH_NAME),
    FOREIGN KEY (BRANCH_NAME) REFERENCES BRANCH(BRANCH_NAME)
    );
create table BORROWER(
	CUSTOMER_NAME VARCHAR(45),
    LOAN_NUMBER INT,
    PRIMARY KEY(CUSTOMER_NAME, LOAN_NUMBER),
    FOREIGN KEY (CUSTOMER_NAME) REFERENCES CUSTOMER(CUSTOMER_NAME),
    FOREIGN KEY(LOAN_NUMBER) REFERENCES LOAN(LOAN_NUMBER)
    );
    
INSERT INTO BRANCH(BRANCH_NAME, BRANCH_CITY, ASSESTS) VALUES
	('SBI_Chamrajpet', 'Bangalore', 50000),
    ('SBI_ResidencyRoad', 'Bangalore', 10000),
    ('SBI Shivaji Road', 'Bombay', 20000),
    ('SBI_ParlimentRoad', 'Delhi', 10000),
	('SBI_Jantarmantar', 'Delhi', 20000);
SELECT * FROM BRANCH;
INSERT INTO ACCOUNTS(ACCNO, BRANCH_NAME,BALANCE) VALUES 
	(1, 'SBI_Chamrajpet', 2000),
    (2, 'SBI_ResidencyRoad', 5000),
    (3, 'SBI Shivaji Road', 6000),
    (4, 'SBI_ParlimentRoad', 9000),
    (5, 'SBI_Jantarmantar', 5000),
    (6, 'SBI Shivaji Road', 4000),
    (7, 'SBI_ResidencyRoad', 3000),
    (8, 'SBI_ParlimentRoad', 5000),
    (9, 'SBI_ResidencyRoad', 2000),
    (10, 'SBI_Jantarmantar', 4000);
SELECT * FROM ACCOUNTS;
INSERT INTO CUSTOMER(CUSTOMER_NAME, CUSTOMER_STREET, CUSTOMER_CITY) VALUES
	('Avinash', 'Bull Temple Road', 'Bangalore'),
    ('Dinesh', 'Bannergatta Road', 'Bangalore'),
    ('Mohan', 'National College Road', 'Bangalore'),
    ('Nikil', 'Akbar Road', 'Delhi'),
    ('Ravi', 'Prithviraj Road', 'Delhi');
SELECT * FROM CUSTOMER;
INSERT INTO LOAN(LOAN_NUMBER, BRANCH_NAME, AMOUNT) VALUES
	(1, 'SBI_Chamrajpet', 1000),
	(2, 'SBI_ResidencyRoad', 2000),
	(3, 'SBI Shivaji Road', 3000),
	(4, 'SBI_ParlimentRoad', 4000),
	(5, 'SBI_Jantarmantar', 5000);
SELECT * FROM LOAN;
INSERT INTO DEPOSITOR(CUSTOMER_NAME,ACCNO) VALUES
	('Avinash', 1),
	('Dinesh', 2),
	('Nikil', 3),
	('Ravi', 4),
	('Mohan', 5),
	('Avinash', 6),
	('Dinesh', 7),
	('Nikil', 8),
	('Ravi', 9),
	('Mohan', 10);
SELECT * FROM DEPOSITOR;

INSERT INTO BORROWER(CUSTOMER_NAME,LOAN_NUMBER) VALUES
	('Avinash', 1),
    ('Dinesh', 2),
    ('Mohan', 2),
    ('Ravi', 5),
    ('Nikil', 4);
SELECT * FROM BORROWER;
COMMIT;
