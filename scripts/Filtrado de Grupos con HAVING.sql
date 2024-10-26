-- Filtrado de Grupos con HAVING



-- 1. Filtrar tipos de productos que tengan más de 2 productos
SELECT pt.nameProductType, COUNT(p.idProducts) AS totalProducts
FROM products p
JOIN productType pt ON p.idProductType = pt.idProductType
GROUP BY pt.nameProductType
HAVING COUNT(p.idProducts) >= 2;

-- 2. Filtrar tipos de productos con precio total superior a 50
SELECT pt.nameProductType, SUM(p.priceProducts) AS totalProductPrice
FROM products p
JOIN productType pt ON p.idProductType = pt.idProductType
GROUP BY pt.nameProductType
HAVING SUM(p.priceProducts) > 50;
