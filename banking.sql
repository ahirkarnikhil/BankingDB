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