create database inventory;
use inventory;
create table category(
    category_id INT Primary Key AUTO_INCREMENT,
    category_name varchar(100) not null
);
create table brand(
    brand_id INT Primary Key AUTO_INCREMENT,
    brand_name varchar(100) not null,
    category_id int,
    contract_status enum("ACTIVE","WARNING","CANCELLED") default "ACTIVE",
    FOREIGN KEY(category_id) REFERENCES category(category_id)
);
create table product(
product_id int primary key auto_increment,
brand_id int ,
product_name varchar(100),
total_stock int,
price decimal(10,2),
discount decimal(10,2),
foreign KEY(brand_id) REFERENCES brand(brand_id)
);
create table sales(
sales_id int primary key auto_increment,
product_id int,
discount_applied decimal(10,2),
quantity_sold int,
sale_date datetime,
foreign key(product_id) references product(product_id)
);
create table feedback(
    feedback_id int primary key auto_increment,
    product_id int,
    costumer_id int,
    costumer_name varchar(100) not null,
    rating int check(rating between 1 and 5),
    comment text,
    feedback_date datetime ,
    foreign key(product_id) references product(product_id)
);
create table performance(
    performance_id int primary key auto_increment,
    product_id int,
    performance_month int,
    performance_year int,
    total_sales int,
    total_revenue decimal(10,2),
    performance_score decimal(3,2),
    foreign key(product_id) references product(product_id)
);
INSERT INTO category (category_name) VALUES
('Electronics'),
('Clothing'),
('Groceries'),
('Cosmetics'),
('Home Appliances'),
('Books');
INSERT INTO brand (brand_name, category_id, contract_status) VALUES
('Samsung', 1, 'ACTIVE'),
('Apple', 1, 'ACTIVE'),
('Nike', 2, 'ACTIVE'),
('Adidas', 2, 'WARNING'),
('Nestle', 3, 'ACTIVE'),
('Loreal', 4, 'CANCELLED'),
('Haier', 5, 'ACTIVE'),
('Dawlance', 5, 'WARNING'),
('Penguin', 6, 'ACTIVE');
INSERT INTO product (brand_id, product_name, total_stock, price, discount) VALUES
(1, 'Samsung Galaxy A32', 50, 75000.00, 5000.00),
(2, 'iPhone 13', 30, 220000.00, 10000.00),
(3, 'Nike Air Max Shoes', 100, 15000.00, 2000.00),
(4, 'Adidas T-Shirt', 80, 5000.00, 500.00),
(5, 'Nestle Milk Pack', 200, 250.00, 20.00),
(6, 'Loreal Face Wash', 60, 1200.00, 150.00),
(7, 'Haier Refrigerator', 20, 95000.00, 8000.00),
(8, 'Dawlance Washing Machine', 15, 70000.00, 5000.00),
(9, 'English Learning Book', 120, 800.00, 50.00),
(1, 'Samsung LED TV', 25, 120000.00, 10000.00),
(3, 'Nike Sports Jacket', 40, 12000.00, 1500.00);
INSERT INTO sales (product_id, discount_applied, quantity_sold, sale_date) VALUES
(1, 5000.00, 5, '2026-04-01 10:30:00'),
(2, 10000.00, 2, '2026-04-02 12:00:00'),
(3, 2000.00, 10, '2026-04-03 15:45:00'),
(4, 500.00, 8, '2026-04-04 18:20:00'),
(5, 20.00, 50, '2026-04-05 09:10:00'),
(6, 150.00, 6, '2026-04-06 11:25:00'),
(7, 8000.00, 3, '2026-04-10 11:00:00'),
(8, 5000.00, 2, '2026-04-11 14:30:00'),
(9, 50.00, 20, '2026-04-12 09:45:00'),
(10, 10000.00, 4, '2026-04-13 16:20:00'),
(11, 1500.00, 6, '2026-04-14 18:10:00');
INSERT INTO feedback (product_id, costumer_id, costumer_name, rating, comment, feedback_date) VALUES
(1, 101, 'Ali Khan', 5, 'Excellent phone with great battery.', '2026-04-02 14:00:00'),
(2, 102, 'Sara Ahmed', 4, 'Very good but expensive.', '2026-04-03 16:30:00'),
(3, 103, 'Usman Ali', 5, 'Very comfortable shoes.', '2026-04-04 17:45:00'),
(4, 104, 'Hina Malik', 3, 'Quality is okay.', '2026-04-05 19:10:00'),
(5, 105, 'Bilal Ahmed', 4, 'Good product for daily use.', '2026-04-06 08:20:00'),
(6, 106, 'Ayesha Noor', 2, 'Not suitable for my skin.', '2026-04-07 13:50:00'),
(7, 107, 'Zain Ali', 5, 'Very spacious and energy efficient.', '2026-04-11 12:00:00'),
(8, 108, 'Fatima Noor', 4, 'Works well but makes noise.', '2026-04-12 15:20:00'),
(9, 109, 'Ahmed Raza', 5, 'Helpful for beginners.', '2026-04-13 10:10:00'),
(10, 110, 'Mariam Khan', 4, 'Great picture quality.', '2026-04-14 17:30:00'),
(11, 111, 'Hassan Ali', 5, 'Very stylish and warm.', '2026-04-15 19:00:00');
INSERT INTO performance (product_id, performance_month, performance_year, total_sales, total_revenue, performance_score) VALUES
(1, 4, 2026, 5, 350000.00, 4.5),
(2, 4, 2026, 2, 420000.00, 4.7),
(3, 4, 2026, 10, 130000.00, 4.6),
(4, 4, 2026, 8, 36000.00, 3.8),
(5, 4, 2026, 50, 11500.00, 4.2),
(6, 4, 2026, 6, 6300.00, 3.0),
(7, 4, 2026, 3, 261000.00, 4.4),
(8, 4, 2026, 2, 130000.00, 3.9),
(9, 4, 2026, 20, 15000.00, 4.8),
(10, 4, 2026, 4, 440000.00, 4.6),
(11, 4, 2026, 6, 63000.00, 4.5);
INSERT INTO category (category_name) VALUES 
('Personal Care'), ('Stationery'), ('Health & Wellness'), ('Pet Supplies'), ('Kitchenware');

INSERT INTO brand (brand_name, category_id, contract_status) VALUES
('Dell', 1, 'ACTIVE'),
('HP', 1, 'ACTIVE'),
('Levi s', 2, 'ACTIVE'),
('Zara', 2, 'ACTIVE'),
('Knorr', 3, 'ACTIVE'),
('Sunlight', 3, 'ACTIVE'),
('Garnier', 4, 'ACTIVE'),
('Neutrogena', 4, 'WARNING'),
('Panasonic', 5, 'ACTIVE'),
('Oxford', 6, 'ACTIVE'),
('Dettol', 7, 'ACTIVE'),
('Logitech', 1, 'ACTIVE');
INSERT INTO product (brand_id, product_name, total_stock, price, discount) VALUES
(10, 'Dell XPS 13', 15, 185000.00, 5000.00),
(11, 'HP Pavilion Laptop', 25, 95000.00, 3000.00),
(12, 'Levis 501 Jeans', 60, 8500.00, 1000.00),
(13, 'Zara Summer Shirt', 45, 4500.00, 200.00),
(14, 'Knorr Noodles 12pk', 300, 600.00, 50.00),
(15, 'Sunlight Detergent 1kg', 150, 450.00, 30.00),
(16, 'Garnier Vitamin C Serum', 100, 2200.00, 200.00),
(17, 'Neutrogena Hydro Boost', 5, 3500.00, 0.00), -- Low Stock Example
(18, 'Panasonic Microwave', 12, 28000.00, 2500.00),
(19, 'Oxford Dictionary', 200, 1500.00, 100.00),
(20, 'Dettol Handwash Refill', 500, 350.00, 40.00),
(21, 'Logitech G502 Mouse', 35, 12000.00, 800.00),
(1, 'Samsung Galaxy S24', 10, 350000.00, 15000.00),
(2, 'MacBook Air M2', 8, 280000.00, 12000.00), -- Low Stock
(3, 'Nike Running Shorts', 120, 3500.00, 500.00);
INSERT INTO sales (product_id, discount_applied, quantity_sold, sale_date) VALUES
(12, 1000.00, 5, '2026-04-15 10:00:00'),
(13, 200.00, 12, '2026-04-16 11:30:00'),
(14, 50.00, 40, '2026-04-17 14:20:00'),
(20, 40.00, 100, '2026-04-18 09:00:00'),
(21, 800.00, 4, '2026-04-19 16:45:00'),
(10, 5000.00, 2, '2026-04-20 12:15:00'),
(11, 3000.00, 3, '2026-04-21 13:00:00'),
(1, 15000.00, 1, '2026-05-01 10:00:00'), 
(3, 500.00, 25, '2026-05-01 11:00:00'),
(5, 20.00, 80, '2026-05-02 09:30:00'),
(16, 200.00, 15, '2026-05-02 15:20:00'),
(12, 1000.00, 10, '2026-05-02 17:00:00');
INSERT INTO feedback (product_id, costumer_id, costumer_name, rating, comment, feedback_date) VALUES
(10, 201, 'Junaid Reza', 5, 'Absolute beast of a laptop. Best purchase!', '2026-04-22 10:00:00'),
(14, 202, 'Fatima Sheikh', 4, 'Kids love these noodles.', '2026-04-23 11:00:00'),
(17, 203, 'Alishba Khan', 1, 'Took 2 weeks to deliver and box was crushed.', '2026-04-24 09:00:00'),
(21, 204, 'Hamza Dev', 5, 'The sensor on this mouse is incredible for gaming.', '2026-04-25 15:00:00'),
(12, 205, 'Omer Butt', 4, 'Original quality, fitting is perfect.', '2026-05-01 12:00:00');

