-- 1. Personas con primer nombre Juan
SELECT * FROM person WHERE firstName = 'Juan';

-- 2. Productos con precio mayor a 20000
SELECT * FROM products WHERE priceProducts > 20000;

-- 3. Usuarios que están activos
SELECT * FROM users WHERE isActive = TRUE;

-- 4. Facturas con subtotal menor a 100000
SELECT * FROM invoices WHERE subtotal < 100000;

-- 5. Pagos realizados en efectivo
SELECT * FROM payment WHERE idPaymentMethod = 1;

-- 6. Personas que tienen dirección
SELECT * FROM person WHERE address IS NOT NULL;

-- 7. Productos cuyo nombre comienza con 'Pintura'
SELECT * FROM products WHERE nameProduct LIKE 'Pintura%';

-- 8. Facturas emitidas por el usuario con id 3
SELECT * FROM invoices WHERE idUser = 3;

-- 9. Roles que no son 'Admin'
SELECT * FROM roll WHERE role != 'Admin';

-- 10. Pagos realizados en 2023
SELECT * FROM payment WHERE YEAR(paymentDate) = 2023;

-- 11. Personas cuyo email contiene 'example.com'
SELECT * FROM person WHERE email LIKE '%example.com%';

-- 12. Productos cuya descripción no es nula
SELECT * FROM products WHERE description IS NOT NULL;

-- 13. Facturas con cantidad total de productos mayor a 10
SELECT * FROM invoices WHERE totalQuantity > 10;

-- 14. Pagos con monto mayor a 50000
SELECT * FROM payment WHERE amount > 50000;

-- 15. Usuarios cuyo nombre de usuario contiene 'a'
SELECT * FROM users WHERE username LIKE '%a%';
-- 1. Personas con primer nombre Juan
SELECT * FROM person WHERE firstName = 'Juan';

-- 2. Productos con precio mayor a 20000
SELECT * FROM products WHERE priceProducts > 20000;

-- 3. Usuarios que están activos
SELECT * FROM users WHERE isActive = TRUE;

-- 4. Facturas con subtotal menor a 100000
SELECT * FROM invoices WHERE subtotal < 100000;

-- 5. Pagos realizados en efectivo
SELECT * FROM payment WHERE idPaymentMethod = 1;

-- 6. Personas que tienen dirección
SELECT * FROM person WHERE address IS NOT NULL;

-- 7. Productos cuyo nombre comienza con 'Pintura'
SELECT * FROM products WHERE nameProduct LIKE 'Pintura%';

-- 8. Facturas emitidas por el usuario con id 3
SELECT * FROM invoices WHERE idUser = 3;

-- 9. Roles que no son 'Admin'
SELECT * FROM roll WHERE role != 'Admin';

-- 10. Pagos realizados en 2023
SELECT * FROM payment WHERE YEAR(paymentDate) = 2023;

-- 11. Personas cuyo email contiene 'example.com'
SELECT * FROM person WHERE email LIKE '%example.com%';

-- 12. Productos cuya descripción no es nula
SELECT * FROM products WHERE description IS NOT NULL;

-- 13. Facturas con cantidad total de productos mayor a 10
SELECT * FROM invoices WHERE totalQuantity > 10;

-- 14. Pagos con monto mayor a 50000
SELECT * FROM payment WHERE amount > 50000;

-- 15. Usuarios cuyo nombre de usuario contiene 'a'
SELECT * FROM users WHERE username LIKE '%a%';
