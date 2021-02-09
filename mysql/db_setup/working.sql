SELECT 
    *
FROM
    ap.invoices;

-- select vendor_nam from vendors;

select count(*) as number_of_invoices,
sum(invoice_total) as grand_invoice_total
from invoices;

-- Retrieve three columns from each row sorted in descending sequence by invoice total
SELECT 
    invoice_number, invoice_date, invoice_total
FROM
    invoices
ORDER BY invoice_total DESC;

-- select statement that retrieves 2 columns and a claculated value for a specific invoice
SELECT 
    invoice_id,
    invoice_total,
    credit_total + payment_total AS total_credits
FROM
    invoices
WHERE
    invoice_id = 17;
    
-- select statement that retrieves all invoices between given dates
SELECT 
    invoice_number, invoice_date, invoice_total
FROM
    invoices
WHERE
    invoice_date BETWEEN '2014-06-01' AND '2014-06-30'
ORDER BY invoice_date;

-- return an empty result set
SELECT 
    invoice_number, invoice_date, invoice_total
FROM
    invoices
WHERE
    invoice_total > 50000;
    
SELECT 
    invoice_number AS 'Invoice Number',
    invoice_date AS 'Date',
    invoice_total AS 'Total'
FROM
    invoices;
    
SELECT 
    invoice_number,
    invoice_date,
    invoice_total,
    invoice_total - payment_total - credit_total
FROM
    invoices;
    
SELECT 
    invoice_total,
    payment_total,
    credit_total,
    invoice_total - payment_total - credit_total AS balance_due
FROM
    invoices;
    
-- use parenthesis ot control the sequence of operations
SELECT 
    invoice_id,
    invoice_id + 7 * 3 AS multiply_first,
    (invoice_id + 7) * 3 AS add_first
FROM
    invoices;
    
-- Use div and modulo operators
SELECT 
    invoice_id,
    invoice_id / 3 AS decimal_quotient,
    invoice_id DIV 3 AS integer_quotient,
    invoice_id % 3 AS remainder
FROM
    invoices; 
    
-- Concatenate string data
SELECT 
    vendor_city, vendor_state, CONCAT(vendor_city, vendor_state)
FROM
    vendors; 
    
-- How to format string data using literal values'
SELECT 
    vendor_name,
    CONCAT(vendor_city,
            ', ',
            vendor_state,
            ' ',
            vendor_zip_code) AS address
FROM
    vendors; 
    
-- How to include apostrophes in literal values
SELECT 
    CONCAT(vendor_name, '\'s Address: ') AS vendor,
    CONCAT(vendor_city,
            ', ',
            vendor_state,
            ' ',
            vendor_zip_code) AS address
FROM
    vendors;
    
-- a select statement that uses the left function
SELECT 
    vendor_contact_first_name,
    vendor_contact_last_name,
    CONCAT(LEFT(vendor_contact_first_name, 1),
            LEFT(vendor_contact_last_name, 1)) AS Initials
FROM
    vendors; 
    
-- A select statement that uses the DATE_FORMAT function
SELECT 
    invoice_date,
    DATE_FORMAT(invoice_date, '%m/%d/%y') AS 'MM/DD/YY',
    DATE_FORMAT(invoice_date, '%e-%b-%Y') AS 'DD-MON-YYYY'
FROM
    invoices;
    
-- A select statement that uses the round function
SELECT 
    invoice_date,
    invoice_total,
    ROUND(invoice_total) AS nearest_dollar,
    ROUND(invoice_total, 1) AS nearest_dime
FROM
    invoices; 

-- select statement without from clauses
select 1000 * (1+.1) as '10% more than 1000'; 

-- Testing the concat function
SELECT 
    'Ed' AS first_name,
    'Williams' AS last_name,
    CONCAT(LEFT('Ed', 1), LEFT('Williams', 1)) AS initials;
    
-- Testing the 

