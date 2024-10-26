-- Funciones Agregadas en SQL



-- 1. COUNT: Contar el número de productos
SELECT COUNT(*) AS totalProducts FROM products;

-- 2. SUM: Sumar el precio de todos los productos
SELECT SUM(priceProducts) AS totalProductPrice FROM products;

-- 3. AVG: Calcular el promedio del precio de los productos
SELECT AVG(priceProducts) AS averageProductPrice FROM products;

-- 4. MIN y MAX: Encontrar el precio mínimo y máximo de los productos
SELECT MIN(priceProducts) AS minProductPrice, MAX(priceProducts) AS maxProductPrice FROM products;
