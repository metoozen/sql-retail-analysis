-- Toplam Gelir (Revenue)
SELECT ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL;

--  Aylık Gelir Trendleri
SELECT DATE_FORMAT(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'), '%Y-%m') AS month,
       ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL
GROUP BY month
ORDER BY month;

--  Ülkeye Göre Gelir Dağılımı
SELECT Country,
       ROUND(SUM(Quantity * UnitPrice), 2) AS country_revenue
FROM onlineretail
WHERE Quantity > 0 AND CustomerID IS NOT NULL
GROUP BY Country
ORDER BY country_revenue DESC;