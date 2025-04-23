#Intermediate:
/*1. Join the necessary tables to find the total quantity of each pizza category ordered.
2. Determine the distribution of orders by hour of the day.
3. Join relevant tables to find the category-wise distribution of pizzas.
4. Group the orders by date and calculate the average number of pizzas ordered per day.
5. Determine the top 3 most ordered pizza types based on revenue. */


# 1. Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(od.quantity) AS Total_Quant
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    orders_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category;


# 2. Determine the distribution of orders by hour of the day.
SELECT * FROM orders;

SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);


# 3. Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(DISTINCT name)
FROM
    pizza_types
GROUP BY category;


# 4. Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
	ROUND(AVG(quant),0) as avg_pizzas_per_day
FROM		#taking per date as subquery we take avg for per day
	(SELECT 					#this is quantity per date 
		o.order_date, SUM(od.quantity) as quant
	FROM
		orders o
			JOIN
		orders_details od ON o.order_id = od.order_id
	GROUP BY o.order_date) as order_quant;
    

# 5. Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name, SUM(p.price * od.quantity) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON p.pizza_type_id = pt.pizza_type_id
        JOIN
    orders_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

