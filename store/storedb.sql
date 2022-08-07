DROP DATABASE IF exists storedb;
CREATE DATABASE storedb;
USE storedb;


CREATE TABLE images(
	id int PRIMARY KEY AUTO_INCREMENT,
	url varchar(255) NOT NULL,
	ALT nvarchar(255)
);

CREATE TABLE categories(
	id int PRIMARY KEY AUTO_INCREMENT,
	name nvarchar(100) NOT NULL UNIQUE,
	image_id int,
	parent_cat_id int,
	FOREIGN KEY (parent_cat_id) REFERENCES categories(id) ON DELETE RESTRICT,
	FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE RESTRICT
);


CREATE TABLE products(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(255) NOT NULL UNIQUE,
	category_id int,
	image_id int,
	price_wo_disc float,
	price float NOT NULL,
	price_promo float,
	amount int NOT NULL,
	description varchar(255),
	active BOOLEAN NOT NULL DEFAULT TRUE,
	FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT,
	FOREIGN KEY (image_id) REFERENCES images(id) ON DELETE RESTRICT,
	CHECK ((name != '') AND (price > 0) AND (amount > -1))
);	

CREATE TABLE cat_prod(
	product_id int,
	category_id int,
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE prod_img(
	product_id int,
	image_id int,
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (image_id) REFERENCES images(id)
);


INSERT images (url,ALT)
VALUES
('img/shrt_1.1.webp', 'рубашка O''stin'),
('img/shrt_1.2.webp', 'рубашка O''stin'),
('img/shrt_2.1.webp', 'рубашка Outventure'),
('img/shrt_2.2.webp', 'рубашка Outventure'),
('img/shrt_3.1.webp', 'рубашка Columbia'),
('img/shrt_3.2.webp', 'рубашка Columbia'),
('img/shrt_4.1.webp', 'рубашка Northland'),
('img/shrt_4.2.webp', 'рубашка Northland'),
('img/shrt_5.1.webp', 'рубашка Helly Hansen'),
('img/shrt_5.2.webp', 'рубашка Helly Hansen'),
('img/shrt_6.1.webp', 'рубашка Oakley'),
('img/shrt_6.2.webp', 'рубашка Oakley'),
('img/shrt_7.1.webp', 'рубашка DC Shoes'),
('img/shrt_7.2.webp', 'рубашка DC Shoes'),
('img/shrt_8.1.webp', 'рубашка Graghoppers'),
('img/shrt_8.2.webp', 'рубашка Graghoppers'),
('img/shrt_9.1.webp', 'рубашка Regatta'),
('img/shrt_9.2.webp', 'рубашка Regatta'),
('img/shrt_10.1.webp', 'рубашка Protest'),
('img/shrt_10.2.webp', 'рубашка Protest'),
('img/shrt_11.1.webp', 'рубашка The Nord Face'),
('img/shrt_11.2.webp', 'рубашка The Nord Face'),
('img/shrt_12.1.webp', 'рубашка Reebok Classic'),
('img/shrt_12.2.webp', 'рубашка Reebok Classic'),
('img/shrt_13.1.webp', 'рубашка Hurley'),
('img/shrt_13.2.webp', 'рубашка Hurley'),
('img/jns_1.1.webp', 'джинсы Dali'),
('img/jns_1.2.webp', 'джинсы Dali'),
('img/jns_3.1.webp', 'джинсы Quiksilver'),
('img/jns_3.2.webp', 'джинсы Quiksilver'),
('img/tshr_1.1.webp', 'майка DeFacto'),
('img/tshr_1.2.webp', 'майка DeFacto'),
('img/tshr_2.1.webp', 'майка Envylab'),
('img/tshr_2.2.webp', 'майка Envylab'),
('img/tshr_3.1.webp', 'майка Puma'),
('img/tshr_3.2.webp', 'майка Puma');


INSERT categories (name, image_id, parent_cat_id)
VALUES
('Одежда',1,NULL),
('Рубашки',3,1),
('Джинсы',27,1),
('Майки',31,1);


INSERT products (name, category_id, image_id, price_wo_disc, price, price_promo, amount, description)
VALUES
('Рубашка O''stin', 2, 1, 0, 2399, 1999, 2, 'Короткий рукав'),
('Рубашка Outventure', 2, 3, 0, 1699, 0, 4, 'Короткий рукав'),
('Рубашка Columbia', 2, 5, 0, 3899, 0, 1, 'Короткий рукав'),
('Рубашка Northland', 2, 7, 0, 3299, 1649, 5, 'Короткий рукав'),
('Рубашка Helly Hansen', 2, 9, 0, 7190, 0, 6, 'Длинный рукав'),
('Рубашка Oakley', 2, 11, 0, 7800, 7410, 7, 'Длинный рукав'),
('Рубашка DC Shoes', 2, 13, 0, 7190, 0, 5, 'Длинный рукав'),
('Рубашка Graghoppers', 2, 15, 0, 10999, 4399, 1, 'Длинный рукав'),
('Рубашка Regatta', 2, 17, 0, 2999, 1319, 5, 'Короткий рукав'),
('Рубашка Protest', 2, 19, 0, 2899, 1449, 6, 'Короткий рукав'),
('Рубашка The Nord Face', 2, 21, 0, 9590, 0, 4, 'Длинный рукав'),
('Рубашка Reebok Classic', 2, 23, 0, 7399, 4510, 8, 'Длинный рукав'),
('Рубашка Hurley', 2, 25, 0, 5899, 0, 1, 'Длинный рукав'),
('Джинсы Dali', 3, 27, 0, 4999, 3290, 2, 'Straight fit'),
('Джинсы Durley', 3, 29, 0, 8999, 5480, 4, 'Slim fit'),
('Джинсы Quiksilver', 3, 29, 6590, 4280, 3210, 8, 'Regular fit'),
('Майка DeFacto', 4, 31, 0, 1499, 599, 2, 'Sport'),
('Майка Envylab', 4, 33, 0, 1150, 782, 7, 'Sport'),
('Майка Puma', 4, 35, 0, 1990, 0, 4, 'Casual');

INSERT cat_prod (product_id, category_id)
VALUES
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(8,4),
(9,2),
(10,2),
(11,2),
(12,2),
(13,2),
(14,3),
(15,3),
(16,3),
(17,4),
(18,4),
(18,2),
(19,4);

INSERT prod_img (product_id, image_id)
VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(4,8),
(5,9),
(5,10),
(6,11),
(6,12),
(7,13),
(7,14),
(8,15),
(8,16),
(9,17),
(9,18),
(10,19),
(10,20),
(11,21),
(11,22),
(12,23),
(12,24),
(13,25),
(13,26),
(14,27),
(14,28),
(15,29),
(15,30),
(16,29),
(16,30),
(17,31),
(17,32),
(18,33),
(18,34),
(19,35),
(19,36);