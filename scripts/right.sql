-- 1. Obtener todas las facturas y los usuarios que las crearon, incluyendo todas las facturas aunque no tengan usuario
SELECT i.invoiceNumber, u.username
FROM invoices i
RIGHT JOIN users u ON i.idUser = u.idUsers;

-- 2. Obtener todos los métodos de pago y las facturas asociadas, incluyendo todos los métodos de pago aunque no tengan facturas
SELECT pm.method, i.invoiceNumber
FROM paymentMethod pm
RIGHT JOIN payment pa ON pm.idPaymentMethod = pa.idPaymentMethod
RIGHT JOIN invoices i ON pa.idInvoice = i.idInvoice;

-- 3. Obtener todos los roles y los usuarios asignados, incluyendo todos los roles aunque no tengan usuarios
SELECT r.role, u.username
FROM roll r
RIGHT JOIN userRoll ur ON r.idRoll = ur.idRoll
RIGHT JOIN users u ON ur.idUsers = u.idUsers;

-- 4. Obtener todos los productos y las facturas en las que están incluidos, incluyendo todos los productos aunque no estén en ninguna factura
SELECT p.nameProduct, i.invoiceNumber
FROM products p
RIGHT JOIN invoiceProducts ip ON p.idProducts = ip.idProducts
RIGHT JOIN invoices i ON ip.idInvoice = i.idInvoice;

-- 5. Obtener todas las personas y los documentos de identidad asociados, incluyendo todas las personas aunque no tengan documento de identidad
SELECT pe.firstName, pe.lastName, dt.nameDocumentType
FROM person pe
RIGHT JOIN documentType dt ON pe.idDocumentType = dt.idDocumentType;
