#Boş kayıtları çıkartıyorum
DELETE FROM onlineretails.onlineretail
WHERE CustomerID IS NULL;

#Quantity 0'dan düşük olanlar iade anlamına geliyor onları ayrı tabloya taşıyacağım
CREATE TABLE returned_sales AS
SELECT * FROM onlineretails.onlineretail
WHERE quantity <= 0;

#Mevcut tablodan iadeleri sileceğim
DELETE FROM onlineretails.onlineretail
WHERE quantity <= 0;

#Formatı timestamp yapıyorum
ALTER TABLE onlineretails.onlineretail ADD COLUMN InvoiceTimestamp TIMESTAMP;

UPDATE onlineretails.onlineretail
SET InvoiceTimestamp = STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i');

#Toplam satış sütunu
ALTER TABLE onlineretails.onlineretail ADD COLUMN TotalPrice DECIMAL(10,2);

UPDATE onlineretails.onlineretail
SET TotalPrice = Quantity * UnitPrice;


CREATE TABLE transactions (
    invoice_no TEXT,
    stock_code TEXT,
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC,
    customer_id TEXT,
    country TEXT
);


