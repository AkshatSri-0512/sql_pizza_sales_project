#Advanced:
/*1. Calculate the percentage contribution of each pizza type to total revenue.
2. Analyze the cumulative revenue generated over time.
3. Determine the top 3 most ordered pizza types based on revenue for each pizza category.*/

# 1. Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pt.category,
    ROUND((SUM(od.quantity * p.price) / (SELECT    					#each /total sales *100
											ROUND(SUM(p.price * o.quantity), 2) AS Total_Sales_Pizzas
										FROM
											pizzas p
												JOIN
													orders_details o ON p.pizza_id = o.pizza_id)) * 100,2) AS revenue_as_percent
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    orders_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY revenue_as_percent DESC;


# 2. Analyze the cumulative revenue generated over time.
SELECT order_date, sum(revenue) over(order by order_date) as cum_revenue
FROM 
	(SELECT o.order_date,sum(od.quantity * p.price) as revenue
		FROM orders_details od
			JOIN pizzas p
				ON od.pizza_id=p.pizza_id
			JOIN orders o
				ON o.order_id = od.order_id
		GROUP BY o.order_date) as sales;
        

# 3. Determine the top 3 most ordered pizza types based on revenue for each pizza category
SELECT name,revenue,RN
FROM
	(SELECT category,name,revenue, rank() over(partition by category order by revenue desc) as RN
	From
		(SELECT pt.category, pt.name,sum(od.quantity * p.price) as revenue
			FROM pizza_types pt 
				JOIN pizzas p
					ON pt.pizza_type_id=p.pizza_type_id
				JOIN orders_details od
					ON od.pizza_id=p.pizza_id
			GROUP BY pt.category,pt.name) as A) as B
WHERE RN <=3
ORDER BY RN;