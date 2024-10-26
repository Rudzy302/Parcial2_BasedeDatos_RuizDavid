-- Manipulación de Cadenas de Texto


-- 1. CONCAT: Combinar el nombre y apellido de las personas
SELECT CONCAT(firstName, ' ', lastName) AS fullName FROM person;

-- 2. LENGTH: Longitud del nombre de los productos
SELECT nameProduct, LENGTH(nameProduct) AS lengthProductName FROM products;

-- 3. UPPER: Convertir a mayúsculas los nombres de los productos
SELECT UPPER(nameProduct) AS upperProductName FROM products;

-- 4. LOWER: Convertir a minúsculas los correos electrónicos
SELECT LOWER(email) AS lowerEmail FROM person;

-- 5. SUBSTRING: Extraer los primeros 5 caracteres del nombre del producto
SELECT nameProduct, SUBSTRING(nameProduct, 1, 5) AS subProductName FROM products;
