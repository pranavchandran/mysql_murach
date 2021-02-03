

update invoices
set invoice_due_date = date_add(invoice_due_date, interval 30 day)
where terms_id=4;

select * from invoices;

update invoices
set invoice_due_date = '2014-06-30'
where invoice_id =2;

delete from invoices
where invoice_id='6';

delete from invoices
where invoice_total - payment_total -credit_total = 0;select * from invoices;


select invoice_number,invoice_date,invoice_total,payment_total,credit_total,invoice_total-payment_total-credit_total
as balance_due
from invoices
where invoice_total-payment_total-credit_total>0
order by invoice_date;

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date)
values(122,989319,'2014-04-08',40000,3813.33,2000.33,3,'2014-05-08'),
(123,263253241,'2014-04-10',0,40.20,40.20,3,'2014-05-10'),
(123,263253234,'2014-04-13',0,138.75,138.75,3,'2014-05-13'),
(123,263253235,'2014-04-16',0,144.70,144.70,3,'2014-05-16'),
(123,263253236,'2014-04-16',0,15.50,15.50,3,'2014-05-16');

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date)
values(122,989319,'2014-04-08',40000,3813.33,2000.33,3,'2014-05-08'),
(123,263253241,'2014-04-10',0,40.20,40.20,3,'2014-05-10'),
(123,263253234,'2014-04-13',0,138.75,138.75,3,'2014-05-13'),
(123,263253235,'2014-04-16',0,144.70,144.70,3,'2014-05-16'),
(123,263253236,'2014-04-16',0,15.50,15.50,3,'2014-05-16');

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

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id)
values(122,989319,2017-02-16,0,3813.33,3813.33,3);

insert into invoices(vendor_id,invoice_number)
values(122,989319);

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,terms_id,invoice_due_date)values(122,989319,2017-02-16,3813.33,3813.33,3,2017-02-16);

insert into invoices(vendor_id,invoice_number,invoice_date,invoice_total,payment_total,credit_total,terms_id,invoice_due_date)
values(122,989319-457,2014-04-08,3813.33,3813.33,3,2014-05-08),
(123,26232541,2014-04-10,40.20,40.20,3,2014-05-10),
(123,963253234,2014-04-13,138.75,138.75,3,2014-05-13),
(123,2-000-2993,2014-04-16,144.70,144.70,3,2014-05-16),
(123,963253251,2014-04-16,15.50,15.50,3,2014-05-16);

create table invoices
(invoice_id int primary key auto_increment,
vendor_id int not null,
invoice_number int not null,
invoice_date date not null,
invoice_total decimal(9,2) not null,
payment_total decimal(9,2) default 0,
credit_total decimal(9,2) default 0,
terms_id int not null,
invoice_due_date date not null,
payment_date date
-- constraint invoices_fk_vendors foreign key(vendor_id) references vendors(vendor_id),
-- constraint invoices_fk_terms foreign key(terms_id) references terms(terms_id)
);















