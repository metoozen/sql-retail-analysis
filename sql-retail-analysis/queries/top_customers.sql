-- En Çok Harcama Yapan 10 Müşteri
SELECT CustomerID,
       ROUND(SUM(Quantity * UnitPrice), 2) AS total_spent,
       COUNT(DISTINCT InvoiceNo) AS total_orders
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- En Aktif 10 Müşteri (Sipariş Sayısına Göre)
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS total_orders
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_orders DESC
LIMIT 10;

-- Müşteri Bazlı Siparişlerde En Pahalı Sipariş 
SELECT CustomerID,
       InvoiceNo,
       Quantity * UnitPrice AS TotalPrice,
       RANK() OVER (PARTITION BY CustomerID ORDER BY Quantity * UnitPrice DESC) AS rank_by_customer
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL;