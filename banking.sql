-- show databases;
create database BankingDB;
use bankingdb;
create table customers (
CustomerID INT primary key,
FristName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15),
AccountCreationDate date
);

describe customers;
create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);
desc accounts;

create table Transactions (
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);


create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);


create table AccountBranches(
AssignmentDate date	
);


create table Loans (
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
StratDate date,
EndDate date
);

alter table customers
add DateOfBirth Date;
desc customers;

alter table customers
modify Phone varchar (20);
desc customers;

alter table accounts
add constraint chk_MinBalance
check(Balance>=1000);

drop table accountbranches;


alter table accounts
add CustomerID int;

alter table accounts
add constraint FK_Accounts_customers
foreign key (customerID)
references customers (customerID);

desc accounts;

alter table accounts
add constraint 
 primary key (AccountID);
 
 desc accounts ;
 
 alter table customers
 modify FristName varchar(50) not null;
 
 alter table customers
 add constraint uq_Email unique(Email);
 
 alter table branches
 add constraint 
 primary key (BranchID);
 
 desc branches;
 
 alter table accounts
 add branchID int;
 
 alter table accounts
 add constraint
 foreign key (branchID)
 references branches(BranchID);
 
 desc accounts ;
 
 alter table transactions
 add accountID int;
 
 alter table transactions
 add constraint
 foreign key (accountID)
 references accounts (accountID);
 
 alter table loans
 add customerID int;
 
 alter table loans
 add constraint FK_Loans_customerID
 foreign key (customerID)
 references customers(customerID);
 
 select
 constraint_type
 from information_schema.table_constraints
 where table_schema = 'bankingdb'
 and table_name = 'accounts' ;

alter table transactions
add constraint pk_transactionID_transactions
primary key (transactionID);

alter table loans
add constraint pk_loans
primary key (loanID);

desc transactions;
insert into customers
(customerID,fristName,LastName,Email,Phone,DateOfBirth)
values
(101,'Rahul','Sharma','rahul@gmail.com','9876545310','1998-04-15');

select * from customers;

insert into accounts
(AccountID,CustomerID,AccountType,Balance)
values
(201,101,'Savings',25000);

select * from accounts;

insert into customers
values
(102,'Ketan','Tiwari','ketan@gmail.com','8838938284','2026-08-05','2000-06-22');

select * from customers;

insert into customers
(customerID,fristName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
values
(103,'Neha','Singh','neha@gmail.com','9277476727','2026-08-03','1992-07-03'),
(104,'Mukul','Jha','mukul@gmail.com','7929267534','2025-02-01','1995-11-06');

select * from customers;

UPDATE customers 
SET 
    AccountCreationDate = '2025-06-29'
WHERE
    customerID = 101;
    
    insert into branches
    values
    ('1','Nagpur Branch','subhash nagar,nagpur,maharashtra','9876543210'),
	('2','chandrapur Branch','wadgaon,chandrapur,maharashtra','9876895654'),
	('3','warora Branch','warora,chandrapur,maharashtra','9863321245');
    
    select * from branches;
    
    insert into loans
    values
    ('1','300000','12','2023-08-21','2025-08-21','101'),
    ('2','200000','12','2022-07-11','2024-07-11','102'),
    ('3','500000','12','2021-06-01','2023-06-01','103'),
    ('4','400000','12','2022-07-15','2024-07-15','104'),
    ('5','100000','12','2025-08-21','2026-08-21','105');
    
    
insert into customers
values
('105','Aman','Rane','aman@gmail.com','9938938284','2026-07-05','2000-02-12');
    
    select * from loans;
    select * from accounts;
    
	insert into transactions
    values
    ('1','2026-06-06','25000','Deposit','201'),
    ('2','2025-07-16','35000','Deposit','202'),
    ('3','2026-05-18','22000','Withdrawal','203'),
    ('4','2026-03-22','32200','payment','204'),
    ('5','2026-02-17','2500','interest','205');

 UPDATE accounts
SET 
   branchID  = '1'
WHERE
    accountID = 201;
    
    insert into accounts
    values
    ('202','savings','58000','102','2'),
    ('203','savings','52000','103','3'),
    ('204','savings','80000','104','2'),
    ('205','savings','20000','105','1');

select * from transactions;
select * from accounts;

update accounts
set
balance = '30000'
where
customerID = 101 ;

update accounts
set
balance = balance+2000
where
customerID = 102 ;


select
customerID,fristname,lastname,phone
from
customers;


select *
 from
 accounts
 where
 AccountType = 'savings';
 
 select *
 from
 accounts
 where
 balance < 30000;
 
 select *
 from
 accounts
 where
 AccountType <> 'savings';
 
 select *
 from
 accounts
 where
 AccountType = 'savings'
 and
 Balance >30000;
 
 
