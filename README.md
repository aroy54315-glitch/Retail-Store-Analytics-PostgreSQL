
# Retail Sales SQL Project (PostgreSQL)

## Overview
This project contains a medium-sized retail sales dataset (India-focused) and a set of SQL queries for common business insights.  
It is designed for portfolio demonstration for Data Analyst roles (Power BI / SQL / Excel).

## Dataset
- Customers: 200
- Products: 50
- Orders: 300
- Order_Items: 527

## Schema
- customers(customer_id PK, customer_name, city)
- products(product_id PK, product_name, category, price)
- orders(order_id PK, customer_id FK, order_date, total_amount)
- order_items(order_id FK, product_id FK, quantity, price)

## How to Load (PostgreSQL)
1. Create database:
   CREATE DATABASE retail_sales;
   \c retail_sales;

2. Create tables (run the CREATE TABLE statements provided in the repository).

3. Use COPY or pgAdmin to load the CSVs from the `dataset/` folder:
   COPY customers(customer_id, customer_name, city) FROM '/path/to/dataset/customers.csv' CSV HEADER;
   COPY products(product_id, product_name, category, price) FROM '/path/to/dataset/products.csv' CSV HEADER;
   COPY orders(order_id, customer_id, order_date, total_amount) FROM '/path/to/dataset/orders.csv' CSV HEADER;
   COPY order_items(order_id, product_id, quantity, price) FROM '/path/to/dataset/order_items.csv' CSV HEADER;

## Queries
See `queries.sql` for 12 ready-to-run queries (top customers, monthly trends, revenue by category, etc.)

## Insights (example)
- Use the `Top 5 customers by total purchase value` query to identify high-value customers.
- The `Revenue by category` query helps prioritize inventory focus.
- Month-over-month growth shows seasonality and trend.

## How to use this repo for your resume
- Upload this folder to GitHub as `Retail-Store-Analytics-PostgreSQL`.
- Add a short resume bullet:
  - Retail Sales SQL Project (PostgreSQL) — Analyzed sales and customer behavior using SQL. GitHub: <link>

