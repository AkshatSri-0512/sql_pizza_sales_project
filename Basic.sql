#Basic:
/*1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top 5 most ordered pizza types along with their quantities.*/ 

# 1. Retrieve the total number of orders placed.
SELECT 
    COUNT(order_id) AS Total_Orders_Placed
FROM
    orders;
    
    
# 2. Calculate the total revenue generated from pizza sales.
SELECT 
    *
FROM
    pizzas;
SELECT 
    round(sum(p.price * o.quantity),2) as Total_Sales_Pizzas
FROM
    pizzas p
        JOIN
    orders_details o ON p.pizza_id = o.pizza_id;
    
    
# 3. Identify the highest-priced pizza.
SELECT 
    pt.name, p.price
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


# 4. Identify the most common pizza size ordered.

-- SELECT quantity, count(order_details_id)
-- from orders_details
-- group by quantity;

SELECT 
    p.size, COUNT(od.order_details_id) AS order_count
FROM
    pizzas p
        JOIN
    orders_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY order_count DESC;


# 5. List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(od.quantity) AS quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    orders_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY quantity DESC
LIMIT 5;

