CREATE TABLE customers (
	customers_id INT PRIMARY KEY ,
	customer_name VARCHAR(50) NOT NULL,
	city VARCHAR(25) NOT NULL,
	signup_date DATE NOT NULL
) ;

ALTER TABLE customers RENAME COLUMN customers_id TO customer_id;

CREATE TABLE restaurants (
	restaurant_id INT PRIMARY KEY,
	restaurant_name VARCHAR(50) NOT NULL,
	city VARCHAR(25) NOT NULL,
	cuisine VARCHAR(25) NOT NULL 
) ;

CREATE TABLE delivery_partners(
	partner_id INT PRIMARY KEY,
	partner_name VARCHAR(50) NOT NULL,
	vehicle_type VARCHAR(50) CHECK(vehicle_type in ('Bike','Scooter','Cycle'))
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY ,
	customer_id INT NOT NULL REFERENCES customers(customer_id),
	restaurant_id INT NOT NULL REFERENCES restaurants(restaurant_id),
	partner_id INT NOT NULL REFERENCES delivery_partners(partner_id),
	order_date DATE NOT NULL,
	delivery_time INT,
	order_status VARCHAR(20) CHECK (order_status IN('Delivered','Cancelled','Pending')),
	total_amount NUMERIC(10,2) NOT NULL 
	);


CREATE TABLE menu_items(
	menu_item_id INT PRIMARY KEY ,
	restaurant_id INT NOT NULL REFERENCES restaurants(restaurant_id),
	item_name VARCHAR(50),
	category VARCHAR(25),
	price NUMERIC(10,2) NOT NULL
);


CREATE TABLE order_items (
	order_item_id INT PRIMARY KEY,
	order_id INT NOT NULL REFERENCES orders(order_id),
	menu_item_id INT NOT NULL REFERENCES menu_items(menu_item_id),
	quantity INT NOT NULL  CHECK(quantity > 0)
);



INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1,'Mohammed Ali','Kochi','2025-01-05'),
(2,'Rahul Nair','Calicut','2025-01-08'),
(3,'Amina Fathima','Malappuram','2025-01-12'),
(4,'Arjun Menon','Thrissur','2025-01-15'),
(5,'Sneha Raj','Kannur','2025-01-18'),
(6,'Akash Kumar','Palakkad','2025-01-22'),
(7,'Nisha Das','Kochi','2025-01-25'),
(8,'Faiz Rahman','Kottayam','2025-01-28'),
(9,'Maya Joseph','Trivandrum','2025-02-01'),
(10,'John Mathew','Calicut','2025-02-05'),
(11,'Anjali Nair','Kochi','2025-02-08'),
(12,'Rohit Babu','Kannur','2025-02-12'),
(13,'Asif Khan','Malappuram','2025-02-15'),
(14,'Meera Suresh','Thrissur','2025-02-18'),
(15,'Vishnu Prasad','Kochi','2025-02-22'),
(16,'Deepa Thomas','Palakkad','2025-03-01'),
(17,'Akhil Raj','Calicut','2025-03-04'),
(18,'Sana Parveen','Malappuram','2025-03-07'),
(19,'Nikhil Varma','Kottayam','2025-03-10'),
(20,'Anand Krishna','Kannur','2025-03-14'),
(21,'Shyam Mohan','Kochi','2025-03-18'),
(22,'Riya George','Thrissur','2025-03-22'),
(23,'Abdul Salam','Malappuram','2025-03-25'),
(24,'Kiran Kumar','Calicut','2025-04-01'),
(25,'Neha Pillai','Trivandrum','2025-04-05'),
(26,'Jithin Paul','Kochi','2025-04-08'),
(27,'Ayesha Noor','Kannur','2025-04-12'),
(28,'Harsha Varma','Palakkad','2025-04-15'),
(29,'Farhan P','Malappuram','2025-04-20'),
(30,'Athira Nair','Thrissur','2025-04-25');

--Restaurant data

INSERT INTO restaurants
(restaurant_id, restaurant_name, city, cuisine)
VALUES
(101,'Spice Hub','Kochi','Indian'),
(102,'Pizza Point','Calicut','Italian'),
(103,'Burger House','Malappuram','Fast Food'),
(104,'Arabian Nights','Thrissur','Arabic'),
(105,'Dosa Corner','Kochi','South Indian'),
(106,'Chinese Bowl','Kannur','Chinese'),
(107,'BBQ Nation','Kochi','BBQ'),
(108,'Cake World','Calicut','Bakery'),
(109,'Taco Fiesta','Thrissur','Mexican'),
(110,'Sushi Zen','Kochi','Japanese'),
(111,'Malabar Kitchen','Malappuram','Kerala'),
(112,'Urban Bites','Palakkad','Multi Cuisine'),
(113,'Coastal Catch','Kottayam','Seafood'),
(114,'Grill Master','Trivandrum','BBQ'),
(115,'Cafe Delight','Kannur','Cafe');


--Delivery partners

INSERT INTO delivery_partners
(partner_id, partner_name, vehicle_type)
VALUES
(201,'Arif','Bike'),
(202,'Vishnu','Scooter'),
(203,'Ramesh','Bike'),
(204,'Joseph','Cycle'),
(205,'Akhil','Bike'),
(206,'Anand','Scooter'),
(207,'Shyam','Bike'),
(208,'Asif','Bike'),
(209,'Rahim','Scooter'),
(210,'Nikhil','Bike');



INSERT INTO orders
(order_id, customer_id, restaurant_id, partner_id, order_date, delivery_time, order_status, total_amount)
VALUES
(5001,1,101,201,'2025-01-05',25,'Delivered',700),
(5002,2,102,202,'2025-01-06',32,'Delivered',1000),
(5003,3,103,203,'2025-01-07',20,'Delivered',620),
(5004,4,104,204,'2025-01-08',45,'Cancelled',650),
(5005,5,105,205,'2025-01-09',18,'Delivered',360),
(5006,6,106,206,'2025-01-10',28,'Delivered',560),
(5007,7,107,207,'2025-01-11',35,'Delivered',1400),
(5008,8,108,208,'2025-01-12',22,'Delivered',760),
(5009,9,109,209,'2025-01-13',40,'Pending',600),
(5010,10,110,210,'2025-01-14',30,'Delivered',1070),
(5011,1,102,201,'2025-01-16',24,'Delivered',550),
(5012,2,101,202,'2025-01-18',27,'Delivered',840),
(5013,3,105,203,'2025-01-19',19,'Delivered',270),
(5014,4,106,204,'2025-01-20',33,'Delivered',540),
(5015,5,103,205,'2025-01-22',21,'Delivered',500),
(5016,6,107,206,'2025-01-24',38,'Delivered',1550),
(5017,7,104,207,'2025-01-25',29,'Cancelled',480),
(5018,8,108,208,'2025-01-26',26,'Delivered',900),
(5019,9,101,209,'2025-01-27',31,'Delivered',770),
(5020,10,109,210,'2025-01-28',23,'Delivered',540),
(5021,11,110,201,'2025-01-29',36,'Delivered',850),
(5022,12,111,202,'2025-01-30',28,'Delivered',690),
(5023,13,112,203,'2025-01-30',30,'Delivered',740),
(5024,14,113,204,'2025-01-31',34,'Pending',920),
(5025,15,114,205,'2025-01-31',27,'Delivered',1350);

(5026,16,115,206,'2025-02-01',26,'Delivered',780.00),
(5027,17,101,207,'2025-02-02',24,'Delivered',840.00),
(5028,18,102,208,'2025-02-03',31,'Delivered',980.00),
(5029,19,103,209,'2025-02-04',22,'Delivered',500.00),
(5030,20,104,210,'2025-02-05',39,'Delivered',1150.00),
(5031,21,105,201,'2025-02-06',18,'Delivered',360.00),
(5032,22,106,202,'2025-02-07',29,'Delivered',620.00),
(5033,23,107,203,'2025-02-08',34,'Delivered',1450.00),
(5034,24,108,204,'2025-02-09',25,'Delivered',760.00),
(5035,25,109,205,'2025-02-10',36,'Pending',600.00),
(5036,26,110,206,'2025-02-11',28,'Delivered',870.00),
(5037,27,111,207,'2025-02-12',23,'Delivered',650.00),
(5038,28,112,208,'2025-02-13',27,'Delivered',720.00),
(5039,29,113,209,'2025-02-14',35,'Delivered',940.00),
(5040,30,114,210,'2025-02-15',30,'Cancelled',1200.00),
(5041,1,101,201,'2025-02-16',21,'Delivered',770.00),
(5042,2,107,202,'2025-02-17',33,'Delivered',1550.00),
(5043,3,105,203,'2025-02-18',17,'Delivered',240.00),
(5044,5,102,204,'2025-02-19',26,'Delivered',1100.00),
(5045,7,108,205,'2025-02-20',24,'Delivered',420.00),
(5046,10,110,206,'2025-02-21',31,'Delivered',1070.00),
(5047,12,106,207,'2025-02-22',28,'Delivered',540.00),
(5048,15,115,208,'2025-02-23',25,'Delivered',820.00),
(5049,18,104,209,'2025-02-24',38,'Cancelled',680.00),
(5050,21,103,210,'2025-02-25',20,'Delivered',500.00),
(5051,4,101,201,'2025-03-01',24,'Delivered',850.00),
(5052,6,102,202,'2025-03-02',30,'Delivered',1100.00),
(5053,8,103,203,'2025-03-03',21,'Delivered',520.00),
(5054,9,104,204,'2025-03-04',36,'Delivered',980.00),
(5055,11,105,205,'2025-03-05',19,'Delivered',300.00),

(5056,13,106,206,'2025-03-06',28,'Delivered',640.00),
(5057,14,107,207,'2025-03-07',32,'Delivered',1480.00),
(5058,16,108,208,'2025-03-08',22,'Delivered',760.00),
(5059,17,109,209,'2025-03-09',29,'Delivered',680.00),
(5060,19,110,210,'2025-03-10',34,'Delivered',920.00),

(5061,20,111,201,'2025-03-11',27,'Delivered',700.00),
(5062,22,112,202,'2025-03-12',25,'Delivered',780.00),
(5063,24,113,203,'2025-03-13',31,'Delivered',960.00),
(5064,25,114,204,'2025-03-14',40,'Cancelled',1300.00),
(5065,27,115,205,'2025-03-15',23,'Delivered',620.00),

(5066,1,101,206,'2025-03-16',20,'Delivered',770.00),
(5067,2,102,207,'2025-03-17',26,'Delivered',1050.00),
(5068,3,103,208,'2025-03-18',18,'Delivered',500.00),
(5069,5,104,209,'2025-03-19',37,'Pending',850.00),
(5070,7,105,210,'2025-03-20',16,'Delivered',360.00),

(5071,10,106,201,'2025-03-21',29,'Delivered',580.00),
(5072,12,107,202,'2025-03-22',35,'Delivered',1500.00),
(5073,15,108,203,'2025-03-23',24,'Delivered',840.00),
(5074,18,109,204,'2025-03-24',27,'Delivered',620.00),
(5075,21,110,205,'2025-03-25',30,'Delivered',990.00),
(5076,23,111,206,'2025-04-01',26,'Delivered',750.00),
(5077,26,112,207,'2025-04-02',24,'Delivered',810.00),
(5078,28,113,208,'2025-04-03',30,'Delivered',980.00),
(5079,29,114,209,'2025-04-04',34,'Delivered',1250.00),
(5080,30,115,210,'2025-04-05',22,'Delivered',650.00),

(5081,2,101,201,'2025-04-06',20,'Delivered',840.00),
(5082,4,102,202,'2025-04-07',28,'Delivered',1150.00),
(5083,6,103,203,'2025-04-08',19,'Delivered',480.00),
(5084,8,104,204,'2025-04-09',36,'Cancelled',920.00),
(5085,10,105,205,'2025-04-10',18,'Delivered',360.00),

(5086,12,106,206,'2025-04-11',25,'Delivered',620.00),
(5087,14,107,207,'2025-04-12',33,'Delivered',1520.00),
(5088,16,108,208,'2025-04-13',21,'Delivered',780.00),
(5089,18,109,209,'2025-04-14',27,'Pending',640.00),
(5090,20,110,210,'2025-04-15',31,'Delivered',1040.00),

(5091,22,111,201,'2025-04-16',29,'Delivered',700.00),
(5092,24,112,202,'2025-04-17',26,'Delivered',760.00),
(5093,25,113,203,'2025-04-18',35,'Delivered',930.00),
(5094,27,114,204,'2025-04-19',38,'Delivered',1320.00),
(5095,29,115,205,'2025-04-20',23,'Delivered',680.00),

(5096,1,101,206,'2025-05-01',19,'Delivered',770.00),
(5097,5,107,207,'2025-05-03',34,'Delivered',1480.00),
(5098,9,108,208,'2025-05-05',22,'Delivered',840.00),
(5099,15,110,209,'2025-05-08',30,'Delivered',980.00),
(5100,21,102,210,'2025-05-10',27,'Delivered',1100.00);

--MENU ITEMS

INSERT INTO menu_items
(menu_item_id, restaurant_id, item_name, category, price)
VALUES
-- Spice Hub (101)
(1001,101,'Chicken Biryani','Main Course',350),
(1002,101,'Butter Chicken','Main Course',420),
(1003,101,'Paneer Butter Masala','Main Course',300),
(1004,101,'Garlic Naan','Bread',60),
(1005,101,'Gulab Jamun','Dessert',120),

-- Pizza Point (102)
(1006,102,'Margherita Pizza','Pizza',450),
(1007,102,'Pepperoni Pizza','Pizza',550),
(1008,102,'Veg Supreme Pizza','Pizza',500),
(1009,102,'Garlic Bread','Sides',180),
(1010,102,'Chocolate Lava Cake','Dessert',220),

-- Burger House (103)
(1011,103,'Cheese Burger','Burger',250),
(1012,103,'Chicken Burger','Burger',280),
(1013,103,'French Fries','Sides',120),
(1014,103,'Chicken Nuggets','Sides',200),
(1015,103,'Cold Coffee','Beverage',150),

-- Arabian Nights (104)
(1016,104,'Chicken Shawarma','Wrap',220),
(1017,104,'Mixed Grill','Grill',650),
(1018,104,'Al Faham Chicken','Grill',480),
(1019,104,'Hummus','Starter',180),
(1020,104,'Kunafa','Dessert',250),

-- Dosa Corner (105)
(1021,105,'Masala Dosa','South Indian',120),
(1022,105,'Ghee Roast','South Indian',180),
(1023,105,'Idli Sambar','South Indian',90),
(1024,105,'Medu Vada','South Indian',80),
(1025,105,'Filter Coffee','Beverage',60),

-- Chinese Bowl (106)
(1026,106,'Chicken Fried Rice','Chinese',280),
(1027,106,'Hakka Noodles','Chinese',260),
(1028,106,'Manchurian','Chinese',240),
(1029,106,'Spring Rolls','Starter',180),
(1030,106,'Hot & Sour Soup','Soup',160),

-- BBQ Nation (107)
(1031,107,'BBQ Chicken','BBQ',700),
(1032,107,'Grilled Fish','BBQ',850),
(1033,107,'Chicken Wings','BBQ',420),
(1034,107,'Veg Skewers','BBQ',300),
(1035,107,'Brownie','Dessert',180),

-- Cake World (108)
(1036,108,'Chocolate Cake','Dessert',380),
(1037,108,'Black Forest Cake','Dessert',420),
(1038,108,'Red Velvet Cake','Dessert',450),
(1039,108,'Blueberry Cheesecake','Dessert',480),
(1040,108,'Cupcake','Dessert',120),

-- Taco Fiesta (109)
(1041,109,'Chicken Taco','Mexican',300),
(1042,109,'Veg Taco','Mexican',240),
(1043,109,'Nachos','Sides',220),
(1044,109,'Burrito','Mexican',350),
(1045,109,'Churros','Dessert',180),

-- Sushi Zen (110)
(1046,110,'Sushi Roll','Japanese',650),
(1047,110,'Ramen','Japanese',420),
(1048,110,'Tempura','Japanese',480),
(1049,110,'Miso Soup','Soup',200),
(1050,110,'Mochi Ice Cream','Dessert',250);

-- Restaurant 111 - Malabar Kitchen
(1051,111,'Kerala Meals','Main Course',220),
(1052,111,'Fish Curry','Main Course',320),
(1053,111,'Appam with Stew','Main Course',260),
(1054,111,'Prawn Roast','Seafood',480),
(1055,111,'Palada Payasam','Dessert',140),

-- Restaurant 112 - Urban Bites
(1056,112,'Veg Fried Rice','Main Course',250),
(1057,112,'Chicken Alfredo Pasta','Pasta',420),
(1058,112,'Club Sandwich','Snacks',280),
(1059,112,'Caesar Salad','Salad',240),
(1060,112,'Chocolate Brownie','Dessert',180),

-- Restaurant 113 - Coastal Catch
(1061,113,'Grilled Pomfret','Seafood',650),
(1062,113,'Fish Biryani','Seafood',420),
(1063,113,'Prawn Curry','Seafood',520),
(1064,113,'Squid Fry','Seafood',380),
(1065,113,'Lime Juice','Beverage',80),

-- Restaurant 114 - Grill Master
(1066,114,'Peri Peri Chicken','BBQ',720),
(1067,114,'Lamb Chops','BBQ',950),
(1068,114,'Grilled Paneer','BBQ',380),
(1069,114,'French Fries','Sides',150),
(1070,114,'Mojito','Beverage',180),

-- Restaurant 115 - Cafe Delight
(1071,115,'Cappuccino','Beverage',180),
(1072,115,'Cafe Latte','Beverage',190),
(1073,115,'Veg Sandwich','Snacks',220),
(1074,115,'Chicken Wrap','Snacks',280),
(1075,115,'Blueberry Muffin','Dessert',160);




INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity)
SELECT
    ROW_NUMBER() OVER () AS order_item_id,
    o.order_id,
    m.menu_item_id,
    (FLOOR(RANDOM() * 3) + 1)::INT AS quantity
FROM orders o
JOIN menu_items m
  ON o.restaurant_id = m.restaurant_id;

SELECT * FROM order_items;
SELECT * FROM customers;



--Business queries


1--What is the total revenue generated by the company?

			SELECT SUM(total_amount) AS total_revenue 
			FROM orders 
			WHERE order_Status = 'Delivered'

2--How many orders were placed each month?
	
	SELECT ordered_month,
		COUNT(ordered_month)
	FROM(SELECT 
		EXTRACT(MONTH FROM order_date) 
			AS ordered_month 
	FROM orders) 
	GROUP BY ordered_month 
	ORDER BY ordered_month;
		
--ALTERNATIVE

			WITH monthly_orders AS 
				(SELECT EXTRACT(MONTH 
						FROM order_date)
							AS ordered_month 
				FROM orders) 
				SELECT ordered_month,
				COUNT(ordered_month) 
			FROM monthly_orders
			GROUP BY ordered_month ORDER BY 
			ordered_month;


3--Which 5 restaurants generated the highest revenue?


				
				SELECT 
					r.restaurant_name,
					SUM(total_amount)AS restaurant_sum 
				FROM orders o JOIN restaurants r
				ON r.restaurant_id = o.restaurant_id 
				WHERE o.order_status = 'Delivered'
				GROUP BY r.restaurant_name 
				ORDER BY restaurant_Sum DESC LIMIT 5;




4--Which customers spent the most money?

				SELECT c.customer_name,
					SUM(total_amount) AS person_total
				FROM orders o JOIN customers c 
				ON c.customer_id = o.customer_id
				GROUP BY c.customer_name
				ORDER BY person_total DESC LIMIT 3;


5--Which city generated the highest revenue?

SELECT c.city,
	SUM(total_amount) AS city_total
FROM orders o JOIN customers c
ON c.customer_id = o.customer_id
WHERE order_status = 'Delivered'
GROUP BY c.city
ORDER BY city_total DESC LIMIT 1;


6--Which menu item was ordered the most?

SELECT mi.item_name,
	SUM(quantity) as most_ordered 
from order_items o JOIN menu_items mi
ON o.menu_item_id = mi.menu_item_id 
GROUP BY mi.item_name ORDER BY most_ordered DESC LIMIT 1;


7--Which food category generated the highest revenue?

select * from menu_items;
select * from ORDER_ITEMS;
SELECT * FROM orders
			
			
			WITH highest_category AS (
			SELECT mi.item_name,
				mi.category AS category, 
				SUM(mi.price*oi.quantity) AS total_amount
			FROM order_items oi JOIN menu_items mi
			ON oi.menu_item_id = mi.menu_item_id
			GROUP BY mi.item_name,mi.category
			)
			SELECT category ,
				SUM(total_amount)AS total 
			FROM highest_categorY 
			GROUP BY category  
			order by total DESC LIMIT 1;



8--Find all repeat customers (customers who placed more than one order).


SELECT c.customer_name,
	COUNT(c.customer_id) AS number_of_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name 
HAVING COUNT(c.customer_id)>1
ORDER BY number_of_orders DESC;

9--What is the average delivery time for each restaurant?

SELECT r.restaurant_name ,
	ROUND(AVG(delivery_time),2) 
FROM orders o JOIN restaurants r
ON r.restaurant_id = o.restaurant_id
WHERE order_status ='Delivered'
GROUP BY restaurant_name ;


10--Which delivery partner completed the most deliveries?


SELECT dp.partner_name,
	COUNT(*) as delivered_count 
FROM orders o JOIN delivery_partners dp
ON o.partner_id = dp.partner_id
WHERE order_status = 'Delivered'
GROUP BY dp.partner_name
ORDER BY delivered_count DESC;


11--Find the top 3 restaurants by revenue.

WITH restaurant_sales AS(
SELECT r.restaurant_name AS restaurant_name,
	SUM(total_amount)AS total_revenue 
FROM orders o 
JOIN restaurants r 
ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_name 
)
	SELECT restaurant_name,
		total_revenue,
	RANK() OVER(ORDER BY total_revenue DESC) AS revenue_rank
	from restaurant_sales ORDER BY total_revenue DESC LIMIT 3 ;

--OR SIMPLE JOIN (BUT NO RANK FUNCTION)
SELECT r.restaurant_name AS restaurant_name,
	SUM(total_amount)AS total_revenue 
FROM orders o 
JOIN restaurants r 
ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_name 
ORDER BY SUM(total_amount) DESC LIMIT 3;

12--Find the top customer in each city.

WITH top_city AS(
SELECT c.customer_name AS customer_name,
	c.city AS city,
	SUM(o.total_amount) AS total_Spend,
	ROW_NUMBER() OVER(PARTITION BY city ORDER BY SUM(o.total_amount) DESC ) AS rnk
FROM orders o 	
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.customer_name,c.city
)

SELECT * 
FROM top_city
WHERE rnk=1;


13--Calculate monthly revenue and the month-over-month growth percentage.

WITH monthly_sales AS (
SELECT DATE_TRUNC('month',order_date) AS month,
	SUM(total_amount) as revenue
from orders
GROUP BY DATE_TRUNC('month',order_date)
	)
SELECT month,
	revenue,
	LAG(revenue) OVER(order by month) AS prev_month,
	revenue - LAG(revenue) OVER(order by month) AS rev_change,
	ROUND((revenue - LAG(revenue) OVER(order by month))/LAG(revenue) OVER(order by month)
					*100,2) AS growth
FROM monthly_Sales;


--Segment customers based on spending:

SELECT c.customer_name,
	SUM(o.total_amount) as total_Spend,
	CASE WHEN 
		SUM(o.total_amount) > 10000 THEN 'Platinum'
	WHEN 
		SUM(o.total_amount) BETWEEN 5000 AND 9999 THEN 'Gold'
	WHEN 
		SUM(o.total_amount) BETWEEN 2000 AND 4999 THEN 'Silver'
	WHEN 
		SUM(total_amount) < 2000 THEN 'Bronze' 
	ELSE 'NONE'
	END as customer_level

FROM orders o 
JOIN customers c 
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY c.customer_name;

15--For each restaurant, calculate its percentage contribution to the total company revenue.

WITH company_growth AS (

SELECT r.restaurant_name,
	SUM(o.total_amount) AS revenue
	
FROM orders o 
JOIN restaurants r
ON r.restaurant_id = o.restaurant_id
WHERE order_status = 'Delivered'
GROUP BY r.restaurant_name
)

SELECT * ,
	ROUND(revenue * 100/SUM(revenue) OVER(),2) AS contribution
	from company_growth ORDER BY revenue DESC;


--Calculate the running average of monthly revenue 
--to understand how the restaurants's average revenue changes over time.


WITH monthly_revenue AS
(
SELECT 
	DATE_TRUNC('month',order_date) AS months ,
	SUM(o.total_amount)  AS total_revenue
FROM orders o 
WHERE order_Status ='Delivered'
GROUP BY DATE_TRUNC('month',order_date)
)
SELECT 
	months ,
	ROUND(AVG(total_revenue) OVER(ORDER BY months),2)
	FROM monthly_revenue 
	




--Monthly sales view

CREATE VIEW monthly_sales_view AS 
SELECT 
	DATE_TRUNC('month',order_date) AS month,
	COUNT(*) AS total_orders,
	SUM(total_amount) AS total_revenue,
	ROUND(AVG(total_amount),2) AS average_order_value
FROM orders 
WHERE order_status = 'Delivered'
GROUP BY DATE_TRUNC('month',order_date);

SELECT * FROM monthly_sales_view

--Restaurant Performance View

CREATE VIEW restaurant_performance AS
SELECT r.restaurant_name,
	COUNT(o.order_id)  AS total_orders,
	SUM(o.total_amount) AS total_revenue,
	ROUND(AVG(o.delivery_time),2) AS avg_delivery_time
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_name;

SELECT * FROM restaurant_performance
ORDER BY total_revenue DESC;


--customer Spending materialized  View

CREATE MATERIALIZED VIEW customer_spending_mv AS 
SELECT 
	c.customer_id,
	c.customer_name,
	c.city,
	COUNT(o.order_id) AS total_orders,
	SUM(o.total_amount) AS total_spend,
	ROUND(AVG(o.total_amount),2) AS average_order_value,
	CASE 
		WHEN SUM(o.total_amount) >= 10000 THEN 'Platinum'
		WHEN SUM(o.total_amount) BETWEEN 5000 AND 9999 THEN 'Gold'
		WHEN SUM(o.total_amount) BETWEEN 2000 AND 4999 THEN 'Silver'
		WHEN SUM(total_amount) < 2000 THEN 'Bronze' 
		ELSE 'NONE'
	END AS customer_segment
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id,
		c.customer_name,
		c.city;

SELECT * FROM customer_spending_mv;

REFRESH MATERIALIZED VIEW customer_Spending_mv;