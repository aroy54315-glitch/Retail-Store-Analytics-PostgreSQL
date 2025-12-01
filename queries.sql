
-- Retail Sales SQL Queries (PostgreSQL)

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 2. Customers with no orders
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 3. Total orders per month
SELECT DATE_TRUNC('month', order_date) AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- 4. Revenue in 2024
SELECT SUM(total_amount) AS revenue_2024
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024;

-- 5. Top 5 customers by total purchase value
SELECT c.customer_id, c.customer_name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. Top 3 best-selling products by quantity
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_qty_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_qty_sold DESC
LIMIT 3;

-- 7. Revenue by category
SELECT p.category, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 8. Product with highest revenue
SELECT p.product_id, p.product_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

-- 9. Customers with more than 3 orders
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

-- 10. Average order amount per customer
SELECT c.customer_id, c.customer_name, AVG(o.total_amount) AS avg_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name;

-- 11. Month-over-month revenue growth
WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', order_date) AS month,
           SUM(total_amount) AS revenue
    FROM orders
    GROUP BY month
)
SELECT month,
       revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
       (revenue - LAG(revenue) OVER (ORDER BY month)) AS growth
FROM monthly_revenue
ORDER BY month;

-- 12. Top revenue city
SELECT c.city, SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC
LIMIT 1;
