-- Agrupación de Resultados con GROUP BY



-- 1. Agrupar productos por tipo y contar cuántos hay en cada grupo
SELECT pt.nameProductType, COUNT(p.idProducts) AS totalProducts
FROM products p
JOIN productType pt ON p.idProductType = pt.idProductType
GROUP BY pt.nameProductType;

-- 2. Sumar el precio total de los productos por tipo
SELECT pt.nameProductType, SUM(p.priceProducts) AS totalProductPrice
FROM products p
JOIN productType pt ON p.idProductType = pt.idProductType
GROUP BY pt.nameProductType;
