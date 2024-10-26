-- 1. Combinación de todos los productos y tipos de productos
SELECT p.nameProduct, pt.nameProductType
FROM products p
CROSS JOIN productType pt;

-- 2. Combinación de todas las personas y roles
SELECT pe.firstName, pe.lastName, r.role
FROM person pe
CROSS JOIN roll r;

-- 3. Combinación de todos los usuarios y estados de pago
SELECT u.username, ps.status
FROM users u
CROSS JOIN paymentStatus ps;

-- 4. Combinación de todas las facturas y métodos de pago
SELECT i.invoiceNumber, pm.method
FROM invoices i
CROSS JOIN paymentMethod pm;

-- 5. Combinación de todos los productos y métodos de pago
SELECT p.nameProduct, pm.method
FROM products p
CROSS JOIN paymentMethod pm;
