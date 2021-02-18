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
    
-- Testing the date format function
SELECT 
    CURRENT_DATE,
    DATE_FORMAT(CURRENT_DATE, '%m/%d/%y') AS 'MM/DD/YY',
    DATE_FORMAT(CURRENT_DATE, '%e-%b-%Y');
    
-- Testing the round function
SELECT 
    1234.56789 AS value,
    ROUND(1234.56789) AS nearest_dollar,
    ROUND(1234.56789, 1) AS nearest_dime;
    
-- a select statement that returns all rows
select vendor_city, vendor_state from vendors order by vendor_city; 

-- a select statement that eliminates duplicate rows
SELECT DISTINCT
    vendor_city, vendor_state
FROM
    vendors
ORDER BY vendor_city;

SELECT DISTINCT
    invoice_number
FROM
    invoices;

-- Examples of where clauses that retrieve...
-- vendors located in lowa 
select vendor_name, vendor_city
from vendors
where vendor_state = 'IA';

SELECT 
    *
FROM
    invoices
WHERE
    invoice_total - payment_total - credit_total > 0;
    
SELECT 
    vendor_name, vendor_city
FROM
    vendors
WHERE
    vendor_name < 'M';
    
SELECT 
    vendor_name, vendor_city
FROM
    vendors
WHERE
    vendor_name = 'Jobtrak';

SELECT 
    *
FROM
    invoices
WHERE
    invoice_date <= '2014-07-31';
    
SELECT 
    *
FROM
    invoices
WHERE
    invoice_date >= '2014-07-01';
    
SELECT 
    *
FROM
    invoices
WHERE
    credit_total != 0;

-- The syntax of the WHERE clause with logical operators
-- And operator    
SELECT 
    vendor_name, vendor_city
FROM
    vendors
WHERE
    vendor_name = 'US Postal Service'
        AND vendor_city = 'Madison';
        
-- or operator
SELECT 
    *
FROM
    vendors
WHERE
    vendor_name = 'US Postal Service'
        or vendor_city = 'PittsBurg';
        
-- not operator
 SELECT 
    vendor_state
FROM
    vendors
WHERE
    NOT vendor_state = 'CA';
    
-- not operator in a complex search condition
SELECT 
    invoice_total, invoice_date
FROM
    invoices
WHERE
    NOT (invoice_total >= 5000
        OR NOT invoice_date <= '2014-08-01');
        
-- The same condition rephrased to eliminate the not operator
 SELECT 
    *
FROM
    invoices
WHERE
	invoice_date > '2014-07-03' or invoice_total > 500
    and invoice_total - payment_total - credit_total > 0;
    
-- The same compound condition with parenthesis
 SELECT 
    *
FROM
    invoices
WHERE (invoice_date > '2014-07-03' or invoice_total > 500)
	and invoice_total - payment_total - credit_total > 0; 
    
-- syntax of where clause with an IN phrase
-- an inphrase with a list of numerical values
SELECT 
    invoice_number
FROM
    invoices
WHERE
    terms_id IN (1 , 3, 4);  
    
-- an inphrase preceded by Not
SELECT 
    *
FROM
    vendors
WHERE
    vendor_state NOT IN ('CA' , 'NV', 'OR'); 
 
SELECT 
    *
FROM
    vendors
WHERE
    vendor_id IN (SELECT 
            vendor_id
        FROM
            invoices
        WHERE
            invoice_date = '2014-07-18'); 
            
-- Examples the between phrase
-- A between phrase with literal values
SELECT 
    *
FROM
    invoices
WHERE
    invoice_date BETWEEN '2014-06-01' AND '2014-06-30';
 
-- A between phrase preceded by not
SELECT 
    *
FROM
    vendors
WHERE
    vendor_zip_code NOT BETWEEN 93600 AND 93799; 
    
-- A between phrase with a test expression coded as a calculated value
SELECT 
    *
FROM
    invoices
WHERE
    invoice_total - payment_total - credit_total BETWEEN 200 AND 500; 
    
-- A between phrase with the upper and lower limits coded as calculated value
SELECT 
    *
FROM
    invoices
WHERE
    payment_total BETWEEN credit_total AND credit_total + 500; 
    
-- How to use the LIKE and REGEXP operators
SELECT 
    *
FROM
    vendors
WHERE
    vendor_city LIKE 'SAN%'; 

SELECT 
    *
FROM
    vendors
WHERE
    vendor_name LIKE 'COMPU_ER%';
    
SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP 'SA'; 
    
-- starting letters only from ^sa  
SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP '^SA';
    
-- ending charachters 'na' 
SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP 'na$';
    
-- where ever patterns match
 SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP 'rs|sn';
    
-- N[CV] match c or v
 SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP 'N[CV]';
    
 SELECT 
    *
FROM
    vendors
WHERE
    vendor_city REGEXP 'N[A-J]';

-- between E or O 
SELECT 
    vendor_contact_last_name
FROM
    vendors
WHERE
    vendor_contact_last_name REGEXP 'DAMI[EO]N';
    
SELECT 
    vendor_city
FROM
    vendors
WHERE
    vendor_city REGEXP '[A-Z][AEIOU]N$';

    
 




    

    


