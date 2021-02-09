create database ap;

use ap;

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_id INT NOT NULL,
    invoice_number INT NOT NULL,
    invoice_date DATE NOT NULL,
    invoice_total DECIMAL(9 , 2 ) NOT NULL,
    payment_total DECIMAL(9 , 2 ) DEFAULT 0,
    credit_total DECIMAL(9 , 2 ) DEFAULT 0,
    terms_id INT NOT NULL,
    invoice_due_date DATE NOT NULL,
    payment_date DATE
);

alter table invoices add balance_due decimal(9,2);

alter table invoices drop column balance_due;

create index invoices_vendor_id_index on invoices(vendor_id);

drop index invoices_vendor_id_index on invoices;

-- insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,terms_id,invoice_due_date)
-- values(122,989319,2014-04-08,3813.33,3813.33,3,2014-05-08);
-- (123,26232541,2014-04-10,40.20,40.20,3,2014-05-10),
-- (123,963253234,2014-04-13,138.75,138.75,3,2014-05-13),
-- (123,20002993,2014-04-16,144.70,144.70,3,2014-05-16),
-- (123,963253251,2014-04-16,15.50,15.50,3,2014-05-16);

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date)
values(122,989319,'2014-04-08',40000,3813.33,2000.33,3,'2014-05-08'),
(123,263253241,'2014-04-10',0,40.20,40.20,3,'2014-05-10'),
(123,263253234,'2014-04-13',0,138.75,138.75,3,'2014-05-13'),
(123,263253235,'2014-04-16',0,144.70,144.70,3,'2014-05-16'),
(123,263253236,'2014-04-16',0,15.50,15.50,3,'2014-05-16');

select invoice_number,invoice_date,invoice_total,payment_total,credit_total,invoice_total-payment_total-credit_total
as balance_due
from invoices
where invoice_total-payment_total-credit_total>0
order by invoice_date;

#A select statement that joins data from the vendors and invoices tables   
select vendor_name,invoice_number,invoice_data,invoice_total
from vendors inner join invoices
on vendors.vendor_id = invoices.vendor_id
where invoice_total >= 500
order by vendor_name,invoice_total desc;

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,terms_id,invoice_due_date)
values(122,989319,'2014-04-08',165,3,'2014-08-17');

select * from invoices;

update invoices set credit_total=35.89 where invoice_number = 989319;

select count(*) as number_of_invoices from invoices;

SELECT
	invoice_number,
    COUNT(*) AS number_of_invoices,
    SUM(invoice_total - payment_total - credit_total) AS total_due
FROM
    invoices
WHERE
    vendor_id = 123;

SELECT 
    invoice_number
FROM
    invoices
ORDER BY invoice_number DESC
LIMIT 5;
