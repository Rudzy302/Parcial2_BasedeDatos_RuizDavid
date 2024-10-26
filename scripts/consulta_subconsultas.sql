-- 1. Obtener el nombre y apellido de las personas que tienen facturas con un total mayor a 100,000
SELECT firstName, lastName
FROM person
WHERE idPerson IN (
  SELECT idPerson
  FROM users
  WHERE idUsers IN (
    SELECT idUser
    FROM invoices
    WHERE total > 100000
  )
);

-- 2. Obtener los nombres de usuario de aquellos usuarios que tienen pagos pendientes
SELECT username
FROM users
WHERE idUsers IN (
  SELECT idUser
  FROM invoices
  WHERE idInvoice IN (
    SELECT idInvoice
    FROM payment
    WHERE idPaymentStatus = 1 -- Pendiente
  )
);

-- 3. Obtener los nombres de productos que aparecen en más de una factura
SELECT nameProduct
FROM products
WHERE idProducts IN (
  SELECT idProducts
  FROM invoiceProducts
  GROUP BY idProducts
  HAVING COUNT(idInvoice) > 1
);

-- 4. Obtener los nombres de los productos que tienen un precio mayor que el promedio del precio de todos los productos
SELECT nameProduct
FROM products
WHERE priceProducts > (
  SELECT AVG(priceProducts)
  FROM products
);

-- 5. Obtener los nombres y apellidos de las personas que han realizado pagos con tarjeta de crédito
SELECT firstName, lastName
FROM person
WHERE idPerson IN (
  SELECT idPerson
  FROM users
  WHERE idUsers IN (
    SELECT idUser
    FROM invoices
    WHERE idInvoice IN (
      SELECT idInvoice
      FROM payment
      WHERE idPaymentMethod = 2 -- Tarjeta Crédito
    )
  )
);
