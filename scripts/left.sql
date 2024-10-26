-- 1. Obtener todas las personas y, si tienen usuarios asociados, los nombres de usuario
SELECT p.firstName, p.lastName, u.username
FROM person p
LEFT JOIN users u ON p.idPerson = u.idPerson;

-- 2. Obtener todos los productos y, si están en alguna factura, los números de factura
SELECT p.nameProduct, i.invoiceNumber
FROM products p
LEFT JOIN invoiceProducts ip ON p.idProducts = ip.idProducts
LEFT JOIN invoices i ON ip.idInvoice = i.idInvoice;

-- 3. Obtener todos los roles y, si están asignados a algún usuario, los nombres de usuario
SELECT r.role, u.username
FROM roll r
LEFT JOIN userRoll ur ON r.idRoll = ur.idRoll
LEFT JOIN users u ON ur.idUsers = u.idUsers;

-- 4. Obtener todas las facturas y, si tienen métodos de pago asociados, los métodos de pago
SELECT i.invoiceNumber, pm.method
FROM invoices i
LEFT JOIN payment pa ON i.idInvoice = pa.idInvoice
LEFT JOIN paymentMethod pm ON pa.idPaymentMethod = pm.idPaymentMethod;

-- 5. Obtener todas las personas y, si tienen facturas asociadas, los números de factura
SELECT p.firstName, p.lastName, i.invoiceNumber
FROM person p
LEFT JOIN users u ON p.idPerson = u.idPerson
LEFT JOIN invoices i ON u.idUsers = i.idUser;
