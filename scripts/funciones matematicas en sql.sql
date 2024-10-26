-- Funciones Matemáticas en SQL



-- 1. ROUND: Redondear los precios de los productos a 1 decimal
SELECT nameProduct, ROUND(priceProducts, 1) AS roundedPrice FROM products;

-- 2. ABS: Obtener el valor absoluto de una operación
SELECT ABS(-123.45) AS absoluteValue;
