
--1.Total Sales by Segment
SELECT c.segment, round(sum(o.sales),2) AS Total_sales
FROM customer_dim as c
JOIN orders_fact as o
ON c.customer_id = o.customer_id
GROUP BY c.segment;

--2.Region-Wise Sales Distribution.
SELECT l.region, round(sum(o.sales),2) AS Total_sales
FROM location_dim as l
JOIN orders_fact as o
ON l.location_id = o.location_id
GROUP BY l.region
ORDER BY Total_sales DESC
LIMIT 5;

--3.Top 5 Cities by Total Sales
SELECT l.city, round(sum(o.sales),2) AS Total_sales
FROM location_dim as l
JOIN orders_fact as o
ON l.location_id = o.location_id
GROUP BY l.city
ORDER BY Total_sales DESC
LIMIT 5;


--4.Top 5 cities with the highest number of orders.
SELECT l.city, count(o.order_id) as Num_of_Orderes
FROM location_dim as l
JOIN orders_fact as o
ON l.location_id = o.location_id
GROUP BY l.city
ORDER BY Num_of_Orderes DESC
LIMIT 5;

--5.Top 5 Customers With highst Sales along with their segment
SELECT c.customer_name, c.segment, round(sum(o.sales),2) AS Total_sales
FROM customer_dim as c
JOIN orders_fact as o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name,c.segment
ORDER BY Total_Sales DESC
LIMIT 5;

--6.customer with the highst sales in each segment
SELECT customer_name, segment, Total_sales
FROM (
    SELECT c.customer_name, c.segment, round(sum(o.sales), 2) AS Total_sales,
           row_number() OVER (PARTITION BY c.segment ORDER BY sum(o.sales) DESC) as rn
    FROM customer_dim AS c
    JOIN orders_fact AS o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_name, c.segment
) AS ranked_customers
WHERE rn = 1;

--7.top-selling category for each customer segment based on total sales
SELECT segment, category, Total_Product_Sales
FROM (
    SELECT p.category, c.segment, round(sum(o.sales), 2) AS Total_Product_Sales,
           row_number() OVER (PARTITION BY c.segment ORDER BY sum(o.sales) DESC) as rn
    FROM customer_dim AS c
    JOIN orders_fact AS o ON c.customer_id = o.customer_id
    JOIN product_dim AS p ON o.product_id = p.product_id
    GROUP BY p.category, c.segment
) AS ranked_products
WHERE rn = 1;


--8.Top 10 Customers by Purchase Frequency
SELECT c.customer_name, COUNT(DISTINCT o.order_id) AS num_orders
FROM customer_dim AS c
JOIN orders_fact AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY num_orders DESC
LIMIT 10;


--9.Orderes By Ship Mode
SELECT sh.ship_mode, count(o.order_id) as Num_of_Orderes
FROM ship_dim as sh
JOIN orders_fact as o
ON sh.ship_key = o.ship_key
GROUP BY sh.ship_mode
ORDER BY Num_of_Orderes DESC
;


--10.Shipping Performance Analysis
SELECT sh.ship_mode, 
round(AVG(DATEDIFF(sd.ship_date, od.order_date))) AS avg_shipping_time_By_Days
FROM orders_fact AS o
JOIN ship_dim AS sh on o.ship_key = sh.ship_key
JOIN date_dim AS od on o.order_datekey = od.order_datekey
JOIN date_dim AS sd on o.ship_datekey = sd.ship_datekey
GROUP BY sh.ship_mode
ORDER BY avg_shipping_time_By_Days;


