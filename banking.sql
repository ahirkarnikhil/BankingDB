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
