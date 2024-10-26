USE localHardwareStore;

-- Insertar datos en la tabla documentType
INSERT INTO documentType (nameDocumentType) VALUES 
('cedula de ciudadania'), -- idDocumentType = 1
('cedula extranjera'),    -- idDocumentType = 2
('pasaporte de turista'), -- idDocumentType = 3
('targeta de identidad'), -- idDocumentType = 4
('otro tipo de documento'); -- idDocumentType = 5

-- Insertar datos en la tabla productType
INSERT INTO productType (nameProductType) VALUES 
('Herramientas'),
('Materiales de Construcción'),
('Pinturas'),
('Electrodomésticos');

-- Insertar datos en la tabla roll
INSERT INTO roll (role) VALUES
('Admin'),
('Vendedor'),
('Cajero'),
('Bodeguero'),
('Cliente');

-- Insertar datos en la tabla person
INSERT INTO person (documentNumber, idDocumentType, firstName, lastName, email, phone, address) VALUES
('1234567890', 1, 'Juan', 'Pérez', 'juan.perez@example.com', '123456789', 'Calle 123 #45-67'),
('2345678901', 2, 'María', 'Gómez', 'maria.gomez@example.com', '234567890', 'Carrera 10 #20-30'),
('3456789012', 3, 'Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', '345678901', 'Avenida 1 #2-3'),
('4567890123', 4, 'Ana', 'Martínez', 'ana.martinez@example.com', '456789012', 'Calle 50 #10-20'),
('5678901234', 5, 'Luis', 'Fernández', 'luis.fernandez@example.com', '567890123', 'Carrera 15 #30-40');

-- Insertar datos en la tabla users
INSERT INTO users (idPerson, username, password) VALUES
(1, 'juanp', 'password123'),
(2, 'mariag', 'password123'),
(3, 'carlr', 'password123'),
(4, 'anam', 'password123'),
(5, 'luisf', 'password123');

-- Insertar datos en la tabla userRoll
INSERT INTO userRoll (idUsers, idRoll) VALUES
(1, 1), -- Juan es Admin
(2, 5), -- María es Cliente
(3, 2), -- Carlos es Vendedor
(4, 5), -- Ana es Cliente
(5, 3); -- Luis es Cajero

-- Insertar datos en la tabla products
INSERT INTO products (idProductType, nameProduct, priceProducts, description) VALUES 
(1, 'Martillo', 15000, 'Martillo de acero'),
(1, 'Destornillador', 8000, 'Destornillador de estrella'),
(2, 'Cemento', 25000, 'Bolsa de cemento 50kg'),
(2, 'Ladrillo', 500, 'Ladrillo rojo'),
(3, 'Pintura Blanca', 30000, 'Galón de pintura blanca'),
(3, 'Pintura Azul', 32000, 'Galón de pintura azul'),
(4, 'Taladro', 120000, 'Taladro eléctrico'),
(1, 'Sierra', 18000, 'Sierra manual'),
(2, 'Arena', 10000, 'Bolsa de arena 50kg'),
(3, 'Pintura Roja', 31000, 'Galón de pintura roja'),
(4, 'Lijadora', 90000, 'Lijadora eléctrica');

-- Insertar datos en la tabla invoices
INSERT INTO invoices (idUser, invoiceNumber, totalQuantity, subtotal, tax, total) VALUES 
(1, 'INV001', 5, 75000, 14250, 89250),
(2, 'INV002', 3, 50000, 9500, 59500),
(3, 'INV003', 7, 175000, 33250, 208250),
(4, 'INV004', 2, 60000, 11400, 71400),
(5, 'INV005', 4, 120000, 22800, 142800);

-- Insertar datos en la tabla invoiceProducts
INSERT INTO invoiceProducts (idInvoice, idProducts, quantity, unitPrice, subtotal) VALUES 
(1, 1, 2, 15000, 30000),
(1, 2, 3, 8000, 24000),
(2, 3, 3, 25000, 75000),
(3, 4, 7, 500, 3500),
(4, 5, 2, 30000, 60000);

-- Insertar datos en la tabla paymentStatus
INSERT INTO paymentStatus (status) VALUES
('Pendiente'),
('Pagado'),
('Parcial'),
('Anulado');

-- Insertar datos en la tabla paymentMethod
INSERT INTO paymentMethod (method) VALUES
('Efectivo'),
('Tarjeta Crédito'),
('Tarjeta Débito'),
('Transferencia');

-- Insertar datos en la tabla payment
INSERT INTO payment (idInvoice, idPaymentStatus, idPaymentMethod, amount, transactionReference) VALUES 
(1, 2, 1, 89250, 'REF001'),
(2, 1, 2, 30000, 'REF002'),
(3, 3, 3, 100000, 'REF003'),
(4, 2, 4, 71400, 'REF004'),
(5, 1, 2, 50000, 'REF005');

-- Insertar datos en la tabla paymentData
INSERT INTO paymentData (idInvoice, sourceAccount, sourceBank, paymentTime, paymentDate, currency) VALUES 
(1, '123456789', 'Banco A', '10:30:00', '2023-09-01', 'COP'),
(2, '234567890', 'Banco B', '14:15:00', '2023-09-02', 'COP'),
(3, '345678901', 'Banco C', '09:45:00', '2023-09-03', 'COP'),
(4, '456789012', 'Banco D', '13:50:00', '2023-09-04', 'COP'),
(5, '567890123', 'Banco E', '11:20:00', '2023-09-05', 'COP');
