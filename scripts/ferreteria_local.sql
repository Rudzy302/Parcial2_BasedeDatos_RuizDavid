-- Crear base de datos
DROP DATABASE IF EXISTS localHardwareStore;
CREATE DATABASE localHardwareStore;
USE localHardwareStore;

-- Tabla tipo_producto
CREATE TABLE productType (
    idProductType INT AUTO_INCREMENT PRIMARY KEY,
    nameProductType VARCHAR(35) NOT NULL,
    description VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla tipo_documento
CREATE TABLE documentType (
    idDocumentType INT AUTO_INCREMENT PRIMARY KEY,
    nameDocumentType VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

-- Tabla roll (anterior typeUser)
CREATE TABLE roll (
    idRoll INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(50) NOT NULL, -- (Admin, Vendedor, Cajero, Bodeguero, Cliente)
    description VARCHAR(255)
);

-- Tabla person con información básica
CREATE TABLE person (
    idPerson INT AUTO_INCREMENT PRIMARY KEY,
    documentNumber VARCHAR(20) NOT NULL,
    idDocumentType INT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idDocumentType) REFERENCES documentType(idDocumentType)
);

-- Tabla users simplificada
CREATE TABLE users (
    idUsers INT AUTO_INCREMENT PRIMARY KEY,
    idPerson INT UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    isActive BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idPerson) REFERENCES person(idPerson)
);

-- Tabla userRoll (anterior userTypeUser)
CREATE TABLE userRoll (
    idUserRoll INT AUTO_INCREMENT PRIMARY KEY,
    idUsers INT NOT NULL,
    idRoll INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idUsers) REFERENCES users(idUsers),
    FOREIGN KEY (idRoll) REFERENCES roll(idRoll)
);

-- Tabla products sin cantidad (se manejará en la factura)
CREATE TABLE products (
    idProducts INT AUTO_INCREMENT PRIMARY KEY,
    idProductType INT NOT NULL,
    nameProduct VARCHAR(100) NOT NULL,
    priceProducts DECIMAL(10, 2) NOT NULL,
    description TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idProductType) REFERENCES productType(idProductType)
);

-- Tabla invoices con cantidad total
CREATE TABLE invoices (
    idInvoice INT AUTO_INCREMENT PRIMARY KEY,
    idUser INT NOT NULL,
    invoiceNumber VARCHAR(20) UNIQUE NOT NULL,
    totalQuantity INT NOT NULL, -- Cantidad total de productos en la factura
    subtotal DECIMAL(10, 2) NOT NULL,
    tax DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idUser) REFERENCES users(idUsers)
);

-- Tabla invoiceProducts con cantidad por producto
CREATE TABLE invoiceProducts (
    idInvoiceProduct INT AUTO_INCREMENT PRIMARY KEY,
    idInvoice INT NOT NULL,
    idProducts INT NOT NULL,
    quantity INT NOT NULL, -- Cantidad de cada producto específico
    unitPrice DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idInvoice) REFERENCES invoices(idInvoice),
    FOREIGN KEY (idProducts) REFERENCES products(idProducts)
);

-- Tabla paymentStatus simplificada
CREATE TABLE paymentStatus (
    idPaymentStatus INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL, -- (Pendiente, Pagado, Parcial, Anulado)
    description VARCHAR(255)
);

-- Tabla paymentMethod simplificada
CREATE TABLE paymentMethod (
    idPaymentMethod INT AUTO_INCREMENT PRIMARY KEY,
    method VARCHAR(50) NOT NULL, -- (Efectivo, Tarjeta Crédito, Tarjeta Débito, Transferencia)
    description VARCHAR(255)
);

-- Tabla payment simplificada
CREATE TABLE payment (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idInvoice INT NOT NULL,
    idPaymentStatus INT NOT NULL,
    idPaymentMethod INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    transactionReference VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (idInvoice) REFERENCES invoices(idInvoice),
    FOREIGN KEY (idPaymentStatus) REFERENCES paymentStatus(idPaymentStatus),
    FOREIGN KEY (idPaymentMethod) REFERENCES paymentMethod(idPaymentMethod)
);

-- Nueva tabla paymentData relacionada con invoices
CREATE TABLE paymentData (
    idPaymentData INT AUTO_INCREMENT PRIMARY KEY,
    idInvoice INT NOT NULL, -- Relación con la tabla invoices
    sourceAccount VARCHAR(255), -- Número de cuenta o referencia de origen
    sourceBank VARCHAR(100), -- Banco de origen (si aplica)
    paymentTime TIME, -- Hora de la transacción
    paymentDate DATE, -- Fecha de la transacción
    currency VARCHAR(10) DEFAULT 'COP', -- Moneda del pago (ej. COP, USD)
    FOREIGN KEY (idInvoice) REFERENCES invoices(idInvoice)
);
