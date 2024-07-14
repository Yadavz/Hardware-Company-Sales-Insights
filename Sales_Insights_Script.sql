use sales;

-- counting the number of records present
select count(*) as tranx_count from transactions;
select count(*) as cust_count from customers;

-- provide data for the mark001
select * from transactions
where market_code = 'Mark001';

-- give the records with usd currency
select * from transactions
where currency = 'USD';

-- show all the transaction records with date table
select d.*, t.* from date d 
inner join transactions t 
on d.date = t.order_date;

-- please show data for only 2020
select d.*, t.* from transactions t
inner join  date d
on t.order_date = d.date
where d.year = 2020;

-- revenue 2020
select sum(t.sales_amount) from transactions t
inner join  date d
on t.order_date = d.date
where d.year = 2020;

-- revenue 2019
select sum(t.sales_amount) as revenue from transactions t
inner join  date d
on t.order_date = d.date
where d.year = 2019;

-- revenue in chennai
select sum(t.sales_amount) as revenue from transactions t
inner join date d
on t.order_date = d.date
where d.year = 2020 and t.market_code = "mark001";

-- more robust code for above sql query
select sum(t.sales_amount) as revenue from transactions as t
inner join date as d
on t.order_date = d.date
inner join markets as m
on t.market_code = m.markets_code
where d.year = 2020 and m.markets_name = "chennai";

-- lets check the sales data
select count(sales_amount) from transactions;
select * from transactions;
select * from transactions where sales_amount <= 0; 

-- unique currency
select distinct(currency) from transactions;
-- INR & 'INR\r' & USD & 'USD\r' so duplicates present with some characters which can be removed
select count(*) from transactions where currency = 'INR'; -- 279 records
select count(*) from transactions where currency = 'INR\r'; -- 150000 records
-- so by the records i concluded that the record with higher number is correct
select count(*) from transactions where currency = 'USD'; -- 2 records
select count(*) from transactions where currency = 'USD\r'; -- 2 records
-- so concluded that it can be duplicate as both have 2 records lets run a query to check
select * from transactions where currency = 'USD' or currency = 'USD\r';
-- indeed it is giving duplicate values


