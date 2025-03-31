-- Toplam İade Sayısı
SELECT COUNT(*) AS total_returns
FROM onlineretail
WHERE Quantity < 0;

-- En Çok İade Yapan 10 Müşteri
SELECT CustomerID,
       COUNT(*) AS return_count
FROM onlineretail
WHERE Quantity < 0 AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY return_count DESC
LIMIT 10;

-- İade Oranı (Toplam Satışa Göre)
SELECT 
    ROUND(
        (SELECT COUNT(*) FROM onlineretail WHERE Quantity < 0) * 100.0 /
        (SELECT COUNT(*) FROM onlineretail WHERE Quantity > 0), 2
    ) AS return_percentage;
