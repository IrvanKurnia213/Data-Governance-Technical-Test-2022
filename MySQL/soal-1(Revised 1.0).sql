-- Connecting to main database
USE d_gov_technical_test;

-- Creating Table Products
CREATE TABLE products (
  `id` int PRIMARY KEY,
  `name` varchar(40) CHARACTER SET utf8
);

-- Creating Table Customers
CREATE TABLE customers (
  `id` int PRIMARY KEY,
  `name` varchar(40) CHARACTER SET utf8
);

-- Creating Table Orders
CREATE TABLE orders (
  `order_number` varchar(40) CHARACTER SET utf8 PRIMARY KEY,
  `customer_id` int,
  `date` date
);

-- Creating Table Order_Lines
CREATE TABLE order_lines (
  `order_line_number` varchar(40) CHARACTER SET utf8 PRIMARY KEY,
  `order_number` varchar(40) CHARACTER SET utf8,
  `product_id` int,
  `quantity` int,
  `usd_amount` decimal
);

-- Creating Table Invoices
CREATE TABLE invoices (
  `invoice_number` varchar(40) CHARACTER SET utf8 PRIMARY KEY,
  `order_number` varchar(40) CHARACTER SET utf8,
  `date` date
);

-- Creating Table Payments
CREATE TABLE payments (
  `payment_number` varchar(40) CHARACTER SET utf8 PRIMARY KEY,
  `invoice_number` varchar(40) CHARACTER SET utf8,
  `date` date
);

-- Adding Foreign Key in Table Orders for customer_id with references from table customers id
ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(id);

-- Adding Foreign Key in Table Order_Lines for order_number with references from table orders order_number
ALTER TABLE order_lines ADD FOREIGN KEY (order_number) REFERENCES orders (order_number);

-- Adding Foreign Key in Table Order_Lines for product_id with references from table products id
ALTER TABLE order_lines ADD FOREIGN KEY (product_id) REFERENCES products (id);

-- Adding Foreign Key in Table invoices for order_number with references from table orders order_number
ALTER TABLE invoices ADD FOREIGN KEY (order_number) REFERENCES orders (order_number);

-- Adding Foreign Key in Table payments for invoice_number with references from table invoices invoice_number
ALTER TABLE payments ADD FOREIGN KEY (invoice_number) REFERENCES invoices (invoice_number);

-- Inserting data into Table Products
INSERT INTO 
      products 
VALUES
      (477, 'Laptop X'),
      (478, 'Phone Y'),
      (479, 'Tablet Z');

-- Inserting data into Table customers
INSERT INTO 
      customers 
VALUES 
      (3923, 'Ani'),
      (3924, 'Budi'),
      (3925, 'Caca');

-- Inserting data into Table orders
INSERT INTO 
      orders 
VALUES 
      ('ORD-170', 3924, '2020-02-25'),
      ('ORD-223', 3923, '2020-03-02'),
      ('ORD-225', 3925, '2020-06-01'),
      ('ORD-181', 3925, '2020-07-13'),
      ('ORD-142', 3924, '2020-08-16'),
      ('ORD-206', 3923, '2020-09-10'),
      ('ORD-201', 3924, '2020-10-09'),
      ('ORD-240', 3924, '2020-11-16'),
      ('ORD-134', 3924, '2020-12-04'),
      ('ORD-205', 3923, '2021-01-23');

-- Inserting data into Table invoices
INSERT INTO 
      invoices 
VALUES 
      ('INV-554', 'ORD-170', '2020-03-09'),
      ('INV-525', 'ORD-223', '2020-03-05'),
      ('INV-549', 'ORD-181', '2020-07-19'),
      ('INV-642', 'ORD-142', '2020-08-22'),
      ('INV-557', 'ORD-206', '2020-09-17'),
      ('INV-581', 'ORD-201', '2020-10-13'),
      ('INV-587', 'ORD-134', '2020-12-13'),
      ('INV-647', 'ORD-205', '2021-02-01');

-- Inserting data into Table payments
INSERT INTO 
      payments 
VALUES 
      ('PYM-777', 'INV-525', '2020-03-08'),
      ('PYM-817', 'INV-642', '2020-09-17'),
      ('PYM-792', 'INV-557', '2020-10-05'),
      ('PYM-802', 'INV-581', '2020-10-23'),
      ('PYM-761', 'INV-587', '2021-01-11'),
      ('PYM-803', 'INV-647', '2021-02-02');

-- Inserting data into Table order_lines
INSERT INTO 
      order_lines 
VALUES 
      ('ORD-170-01', 'ORD-170', 478, 5, 88.00),
      ('ORD-170-02', 'ORD-170', 479, 10, 12.00),
      ('ORD-223-01', 'ORD-223', 479, 5, 6.00),
      ('ORD-223-02', 'ORD-223', 478, 10, 176.00),
      ('ORD-223-03', 'ORD-223', 477, 3, 31.50),
      ('ORD-225-01', 'ORD-225', 477, 4, 42.00),
      ('ORD-181-01', 'ORD-181', 477, 9, 94.50),
      ('ORD-142-01', 'ORD-142', 479, 9, 10.80),
      ('ORD-206-01', 'ORD-206', 479, 9, 10.80),
      ('ORD-201-01', 'ORD-201', 477, 7, 73.50),
      ('ORD-240-01', 'ORD-240', 478, 4, 70.40),
      ('ORD-134-01', 'ORD-134', 479, 3, 3.60),
      ('ORD-205-01', 'ORD-205', 478, 7, 123.20);