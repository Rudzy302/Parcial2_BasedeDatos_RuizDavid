USE localHardwareStore;

-- Consulta 1: Obtener productos con su tipo
SELECT p.nameProduct, pt.nameProductType 
FROM products p 
INNER JOIN productType pt ON p.idProductType = pt.idProductType;

-- Consulta 2: Obtener usuarios con su información personal
SELECT u.username, p.firstName, p.lastName 
FROM users u 
INNER JOIN person p ON u.idPerson = p.idPerson;

-- Consulta 3: Obtener roles de los usuarios
SELECT u.username, r.role 
FROM users u 
INNER JOIN userRoll ur ON u.idUsers = ur.idUsers 
INNER JOIN roll r ON ur.idRoll = r.idRoll;

-- Consulta 4: Obtener facturas con los usuarios que las generaron
SELECT i.invoiceNumber, u.username 
FROM invoices i 
INNER JOIN users u ON i.idUser = u.idUsers;

-- Consulta 5: Obtener productos en las facturas
SELECT i.invoiceNumber, p.nameProduct 
FROM invoiceProducts ip 
INNER JOIN invoices i ON ip.idInvoice = i.idInvoice 
INNER JOIN products p ON ip.idProducts = p.idProducts;

-- Consulta 6: Obtener el estado de pago de cada factura
SELECT i.invoiceNumber, ps.status 
FROM invoices i 
INNER JOIN payment p ON i.idInvoice = p.idInvoice 
INNER JOIN paymentStatus ps ON p.idPaymentStatus = ps.idPaymentStatus;

-- Consulta 7: Obtener el método de pago de cada factura
SELECT i.invoiceNumber, pm.method 
FROM invoices i 
INNER JOIN payment p ON i.idInvoice = p.idInvoice 
INNER JOIN paymentMethod pm ON p.idPaymentMethod = pm.idPaymentMethod;

-- Consulta 8: Obtener información de personas con su tipo de documento
SELECT p.firstName, p.lastName, dt.nameDocumentType 
FROM person p 
INNER JOIN documentType dt ON p.idDocumentType = dt.idDocumentType;

-- Consulta 9: Obtener facturas con la cantidad total de productos
SELECT i.invoiceNumber, i.totalQuantity 
FROM invoices i 
INNER JOIN users u ON i.idUser = u.idUsers;

-- Consulta 10: Obtener productos y su precio en las facturas
SELECT p.nameProduct, ip.unitPrice 
FROM invoiceProducts ip 
INNER JOIN products p ON ip.idProducts = p.idProducts;

-- Consulta 11: Obtener clientes con sus roles
SELECT p.firstName, p.lastName, r.role 
FROM person p 
INNER JOIN users u ON p.idPerson = u.idPerson 
INNER JOIN userRoll ur ON u.idUsers = ur.idUsers 
INNER JOIN roll r ON ur.idRoll = r.idRoll 
WHERE r.role = 'Cliente';

-- Consulta 12: Obtener administradores con sus roles
SELECT p.firstName, p.lastName, r.role 
FROM person p 
INNER JOIN users u ON p.idPerson = u.idPerson 
INNER JOIN userRoll ur ON u.idUsers = ur.idUsers 
INNER JOIN roll r ON ur.idRoll = r.idRoll 
WHERE r.role = 'Admin';

-- Consulta 13: Obtener información de pagos y el método utilizado
SELECT p.amount, pm.method 
FROM payment p 
INNER JOIN paymentMethod pm ON p.idPaymentMethod = pm.idPaymentMethod;

-- Consulta 14: Obtener productos con su tipo y descripción
SELECT p.nameProduct, pt.nameProductType, pt.description 
FROM products p 
INNER JOIN productType pt ON p.idProductType = pt.idProductType;

-- Consulta 15: Obtener usuarios activos y su información personal
SELECT u.username, p.firstName, p.lastName 
FROM users u 
INNER JOIN person p ON u.idPerson = p.idPerson 
WHERE u.isActive = TRUE;

-- Consulta 16: Obtener facturas y su total, incluyendo impuestos
SELECT i.invoiceNumber, i.subtotal, i.tax, i.total 
FROM invoices i 
INNER JOIN users u ON i.idUser = u.idUsers;
