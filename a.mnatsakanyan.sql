DROP DATABASE IF EXISTS "a.mnatsakanyan";

CREATE DATABASE "a.mnatsakanyan" WITH ENCODING = 'UTF8';

\c "a.mnatsakanyan"

SET client_encoding = 'UTF8';


CREATE TABLE sales
(
	id SERIAL NOT NULL,
	product_id INT NOT NULL,
	employee_id INT NULL,
	amount SMALLINT NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE products
(
	id SERIAL NOT NULL,
	type VARCHAR(50) NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	price SMALLINT NOT NULL,
	amount SMALLINT NOT NULL,
	shelf_life DATE NOT NULL
);

CREATE TABLE employees
(
	id SERIAL NOT NULL,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	patronymic VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	salary INT NOT NULL
);

CREATE TABLE supplies
(
	id SERIAL NOT NULL,
	product_id INT NOT NULL,
	supplier_id INT NOT NULL,
	amount SMALLINT NOT NULL,
	total INT NOT NULL,
	date DATE NOT NULL
);

CREATE TABLE suppliers
(
	id SERIAL NOT NULL,
	firm_name VARCHAR(50) NOT NULL,
	firm_email VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL
);

INSERT INTO products
	(type, product_name, price, amount, shelf_life)
VALUES
	('Hair', 'Shampoo', 150, 231, '2023-06-26'),
	('Hair', 'Hair mask', 220, 0, '2024-01-03'),
	('Hair', 'Hair butter', 760, 49, '2026-07-06'),
	('Hair', 'Hair scrub', 360, 16, '2022-11-17'),
	('Body', 'Moisturusing cream', 810, 0, '2023-06-26'),
	('Body', 'Body scrub', 130, 24, '2024-10-11'),
	('Body', 'Bath boll', 1240, 0, '2023-06-13'),
	('Body', 'Shower gel', 270, 264, '2021-12-14'),	
	('Body', 'Soap', 70, 179, '2022-09-23'),
	('Face', 'Face cream', 460, 74, '2024-08-07'),
	('Face', 'Face scrub', 280, 219, '2021-12-31'),
	('Face', 'Lipstick', 980, 69, '2024-10-25'),
	('Face', 'Mascara', 1030, 63, '2022-11-30'),
	('Face', 'Lip liner', 190, 47, '2023-03-05'),
	('Face', 'Face mask', 60, 99, '2023-02-14'),
	('Face', 'Powder', 740, 204, '2025-11-19'),
	('Nail', 'Nail polish', 510, 47, '2026-03-17'),
	('Nail', 'Nail enamel remover', 320, 87, '2022-11-12');

INSERT INTO sales
	(product_id, employee_id, amount, date)
VALUES
	(12, 1, 1, '2020-10-12'),
	(13, 2, 2, '2020-10-27'),
	(17, 3, 4, '2020-10-12'),
	(14, 4, 2, '2020-10-12'),
	(4, 5, 3, '2020-11-15'),
	(11, 6, 7, '2020-11-15'),
	(15, 7, 11, '2020-11-20'),
	(18, 8, 6, '2020-10-12'),
	(16, 9, 3, '2020-11-15');

INSERT INTO employees
	(surname, name, patronymic, email, salary)
VALUES
	('Mnatsakanyan', 'Anait', 'Araikovna', 'a.mnatsakanyan@gmail.com', 94800),
	('Zakharov', 'Daniel ', 'Alexandrovich', 'd.zakharov@gmail.com', 140900),
	('Sakhno ', 'Angelika', 'Vladimirovna', 'a.sakhno@gmail.com', 21400),
	('Makarov', 'Oleg', 'Pavlovich', 'o.makarov@gmail.com', 19600),
	('Maslakov', 'Pavel', 'Dmitrievich', 'p.maslakov@gmail.com', 34500),
	('Peredelkin', 'Maxim', 'Ivanovich', 'm.peredelkin@gmail.com', 37800),
	('Ivonina', 'Polina', 'Sergeevna', 'p.ivonina@gmail.com', 56000),
	('Naydenov', 'Igor', 'Alekseevich', 'i.naydenov@gmail.com', 71800),
	('Akaseeva', 'Adelaida', 'Markovna', 'a.akaseeva@gmail.com', 32000);

	INSERT INTO supplies
	(product_id, supplier_id, amount, total, date)
VALUES
	(1, 4, 89, 11000,'2020-10-02'),
	(7, 10, 14, 15000,'2020-12-27'),
	(4, 8, 206, 70000,'2020-11-19'),
	(5, 6, 58, 42000,'2021-02-02'),
	(9, 2, 39, 1980,'2021-03-18'),
	(2, 5, 107, 21700,'2020-12-02'),
	(3, 9, 132, 94200,'2020-12-13'),
	(10, 1, 87, 37000,'2020-12-14'),
	(6, 3, 166, 17900,'2021-01-09'),
	(8, 7, 44, 9420,'2021-01-11');


	INSERT INTO suppliers
	(firm_name, firm_email, city)
VALUES
	('Maybelline New York', 'maybelline@gmail.com', 'Moscow'),
	('Organic Shop', 'organic.shop@gmail.com', 'Moscow'),
	('Art visage', 'art.visage@gmail.com', 'Koledino'),
	('Frudia', 'frudia@gmail.com', 'Moscow'),
	('Belita', 'belita@gmail.com', 'Vyborg'),
	('Natura Siberica', 'natura.siberica@gmail.com', 'Perm'),
	('Relouis', 'relouis@gmail.com', 'Vyborg'),
	('Blistex', 'blistex@gmail.com', 'Koledino'),
	('Chapter', 'chapter@gmail.com', 'Vyborg'),
	('Eva Esthetic', 'Eva.Esthetic@gmail.com', 'Perm');
	


ALTER TABLE products
	ADD CONSTRAINT products_pkey PRIMARY KEY (id),
	ADD CONSTRAINT products_unique_name UNIQUE (product_name),
	ADD CONSTRAINT products_positive_amountr CHECK (amount >= 0),
	ADD CONSTRAINT products_positive_price CHECK (price >= 0);

ALTER TABLE suppliers
	ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id),
	ADD CONSTRAINT suppliers_unique_firm_name UNIQUE (firm_name),
	ADD CONSTRAINT suppliers_unique_firm_email UNIQUE (firm_email);

ALTER TABLE employees
	ADD CONSTRAINT employees_pkey PRIMARY KEY (id),
	ADD CONSTRAINT employees_positive_salary CHECK (salary >= 0),
	ADD CONSTRAINT employees_unique_email UNIQUE (email);

ALTER TABLE supplies
	ADD CONSTRAINT supplies_pkey PRIMARY KEY (id),
	ADD CONSTRAINT supplies_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	ADD CONSTRAINT supplies_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	ADD CONSTRAINT supplies_positive_amountt CHECK (amount >= 0),
	ADD CONSTRAINT supplies_positive_total CHECK (total >= 0);

ALTER TABLE sales
	ADD CONSTRAINT sales_pkey PRIMARY KEY (id),
	ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	ADD CONSTRAINT sales_employees_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(id) ON UPDATE RESTRICT ON DELETE RESTRICT,
	ADD CONSTRAINT sales_positive_amount CHECK (amount >= 0);