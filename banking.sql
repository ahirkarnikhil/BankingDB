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
 
 select *
 from
 customers
 where
 AccountCreationDate  > '2026-07-01';
 

 
 
select * from customers;

select * from
customers
where Phone in ('9876545310','8838938284','9277476727');

select * from
customers
where Phone ='9876545310'or Phone ='8838938284'or Phone ='9277476727';

select CustomerID,AccountType,Balance
 from
accounts
where Balance between 20000 and 60000;

select CustomerID,AccountType,Balance
 from
accounts
where Balance  >= 20000 and  Balance  <= 60000;

select * from 
customers
where FristName like 'a%';


select * from 
customers
where LastName like '%a';

select * from 
customers
where LastName like'____';

select balance
from accounts
order by Balance;

select customerID,balance
from accounts
order by Balance;

select branchID, branchname
from branches
order by BranchName ;

select customerID,balance
from accounts
order by  Balance  desc;

select accounttype,balance
from accounts
order by AccountType desc,Balance desc;

select distinct accounttype ,AccountID
 from accounts;
 
 select distinct transactionID ,AccountID
 from transactions;
 
 select* from customers
 limit 2 offset 2 ;
 
 SELECT 
    *
FROM
    accounts
ORDER BY Balance DESC
LIMIT 2 , 1;



DELETE FROM customers
WHERE customerid IN (106, 107, 108);

select* from customers;
select* from accounts;

insert into customers
(customerID,fristName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
values
(106,'Nehal','rane','nehal@gmail.com',Null,'2026-08-25','1992-08-03'),
(107,'Mukta','more','mukta@gmail.com',null,'2025-02-10','1995-12-06'),
(108,'Nikita','das','nikita@gmail.com',null,'2026-08-23','1992-04-03');

insert into accounts
values
('206','current','200000','106','3'),
('207','current','20000','107','2'),
('208','current','100000','108','1');

insert into transactions
    values
    ('6','2026-07-06','2500','Deposit','206'),
    ('7','2025-08-16','350000','Deposit','207'),
    ('8','2026-06-18','220000','Withdrawal','208'),
    ('9','2026-05-22','3220','payment','201'),
    ('10','2026-02-17','25000','interest','204');

select 
accountID,
balance,
accountType,
case
when balance <= 40000 then "lowbalance"
when balance >40000 then "midbalance"
else "highbalance"
end as category
from accounts;

-- categorize the deposite in the tranactions table as per conditions givan
-- if above 10000 (included) high amount
-- if 5000(included) to 10000 medium amount
-- if upto 5000 low amount
-- for tarnsaction type withdrowal "not applicable"



 select* from transactions;
 
 select 
TransactionID ,
TransactionDate ,
Amount ,
TransactionType ,
accountID,
case
when  transactiontype = "deposit" and amount >=10000 then " high amount"
when  transactiontype = "deposit" and amount >=5000 then "medium amount"
when  transactiontype = "deposit" and amount <5000 then "low amount"
else "not applicable"
end as catogory
from transactions;

-- 11/08/2026 (date) 

select CustomerID,upper( fristname),upper( lastname) from customers; -- UPPER CONVERT THE CHARECTER IN UPPER CASE IN OUT PUT ONLY
select CustomerID,lower( fristname),LOWER( lastname) from customers; -- LOWER CONVERT THE CHARECTER IN LOWER CASE IN OUT PUT ONLY

select CustomerID,length( fristname),length( lastname) from customers; -- LENGTH FUNCTION ( GIVES THE BITE COUNT) IN OUT PUT ONLY
select CustomerID, char_length( fristname),char_length( lastname) from customers; -- CHAR LENGTH FUNCTION ( GIVES THE CHARECTER COUNT) IN OUT PUT ONLY

select concat(FRISTNAME," ",LASTNAME) AS FULLNAME, PHONE, EMAIL FROM customers; -- COMBAIN TWO OR MORE COUMN AND MAKE A NEW COLMUN

select  CUSTOMERID, CONCAT(SUBSTRING(FRISTNAME,1,1),".", LASTNAME) AS FULLNAME,PHONE,EMAIL FROM CUSTOMERS;


-- 12/08/2026 (date)

select length("  hello world  ");

select length( trim("  hello world  "));

select length (trim(substring("hello world",6)));

select replace("mat", "m","c");

-- numaric functions 

select avg(balance) from accounts
where AccountType = "savings";

select ceil(avg(balance)) from accounts
where AccountType = "savings";

select floor(avg(balance)) from accounts
where AccountType = "savings";

select floor(avg(balance)) from accounts
where AccountType = "current";

select*from transactions;

select avg (amount) from transactions where
TransactionType = "deposit";

-- absolute () function
select abs(-521655);

-- mod  function (gives remender)
select mod (4,3);

-- power function (gives power)
select power(2,3);

 -- sqrt function

select sqrt(16);

-- DATE FUNCTIONS(..........................)
-- NOW FUNCTION
SELECT now();
select curdate();
select curtime();

-- YEAR() MONTH() DAY()
select DateOfBirth, year( DATEOFBIRTH),MONTH( DATEOFBIRTH),DAY( DATEOFBIRTH)
FROM customers;

-- DATEDIFF FUNNCTION
SELECT 
    CONCAT(FRISTNAME, ' ', LASTNAME) AS FULLNAME,
    DATEOFBIRTH,
    FLOOR(DATEDIFF(CURDATE(), DATEOFBIRTH) / 365) AS AGE
FROM
    customers;
    
    -- DATE_ADD()
    
    SELECT 
    CONCAT(FRISTNAME, ' ', LASTNAME) AS FULLNAME,
    AccountCreationDate,
    DATE_ADD(ACCOUNTCREATIONDATE,
        INTERVAL 1 YEAR) AS KYCRENEWAL
FROM
    customers;
    
    -- 13/08/2026 (...........................)
    
    -- date_sub
    
select
 date_sub(curdate(),interval 7 day);
    
    
    -- count() function 
    
    select count(*) as totalcustomers from customers;
    
    select count(phone) as totalcustomers from customers;
    
    -- sum() function
    
    select sum(balance) from accounts;
    
    select sum(balance) from accounts
    where AccountType = "savings"; --   ( where use)
    
    select sum(balance)as savingsbalance from accounts
    where  AccountType = "current"  ;
   
   
   -- -- ---- Avg () function ----------
    select avg(amount) from transactions
    where TransactionType = "deposit";
    
    select avg(amount)from transactions
    where TransactionType = "Withdrawal";
    
    select * from transactions;
    
    -- ---- max () and min () function
    -- find customer having max balancein saving accounts
    
    select max(balance)from accounts
    where Accounttype = "savings";
    
     select min(balance)from accounts
    where Accounttype = "savings";
    
    select * FROM accounts;
    
   -- ------ group by -----------
   select transactiontype,sum(amount) from transactions
   group by (TransactionType);
   
    select * from accounts;
    
    select accounttype,count(*) as total_accounts,
    sum(balance)as total_balance ,
    avg(balance) as avg_balance
    from accounts
    group by AccountType;

  select  branchID,AccountType ,count(accounttype) as total_branch
  from accounts
group by branchID,AccountType
order by branchID;  



  -- date 19-08-2026 --------------- Find customers whose total account balance is greater than avg. (subquery)(single row)

select * from accounts
where Balance >
( select avg(Balance)
from accounts); 

-- find max balane customer ------------
select * from accounts 
where Balance =
( select max(Balance)
from accounts); 

-- --------- self join ----------20-08-2026

CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    employeename VARCHAR(50) NOT NULL,
    managerID INT,
    department VARCHAR(50),
    salary DECIMAL(10 , 2 ),
    joiningdate DATE,
    branchid INT,
    FOREIGN KEY (managerID)
        REFERENCES employees (employeeID),
    FOREIGN KEY (branchID)
        REFERENCES branches (branchID)
);


insert into branches values
('4','manglor Branch','md nagar,manglor,maharashtra','9800043210'),
('5','raipur Branch','aasha nagar,mamglor,maharashtra','9800543210');

INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 1),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 2),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 3),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 4),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 5),
    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 1),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 2),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 3),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 4),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 5),
    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 1),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 2),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 3),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 4),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 5),
    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 1),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 2),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 3),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 4),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 5);

desc employees;

SELECT 
  b.branchname, e.employeeid ,e.EmployeeName AS employee, m.EmployeeName AS manager
FROM
    employees e
        left join
    employees m ON e.managerid = m.employeeId
    inner join branches b
    on b.BranchID = e. branchid;
    
    -- find all the employees who reports to Sneha Verma -------------
    
select e.employeeid,e.employeename,e.department
from employees e
join employees m
on e.managerID = m.employeeID
where m.employeename ="Sneha Verma"; 

  
  