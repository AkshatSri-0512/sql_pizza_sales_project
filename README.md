Project Title: 
Pizza Sales Analysis with SQL Workbench

Project Overview:  
This project demonstrates how to model, query, and analyze a simple pizza‐shop sales database using SQL Workbench. By defining a clear relational schema and writing targeted SQL statements, it uncovers key sales insights—like top‐selling pizzas, peak ordering times, and revenue breakdowns by pizza type.

Database Schema: 
1. `pizza_types`  
   - Defines each pizza variety (e.g., Margherita, Pepperoni) and its base price.  
2. `pizza`  
   - Extends `pizza_types` with any customization or sizing details (small/medium/large).  
3. `orders`  
   - Captures each customer order with order date/time.  
4. `order_details`  
   - Links `orders` to `pizza` items, including quantity, per‐unit price (in case of discounts), and line‐item totals.

Key Analyses & Queries:  
• Top‑Selling Pizzas: Identify which pizza types drive the most revenue and volume.  
• Sales Trends Over Time: Track daily/weekly revenue to spot peak sales periods.  
• Average Order Value: Compute per–order averages to assess customer spend behavior.  
• Type‑Based Performance: Compare how different pizza types perform in terms of units sold and profitability.  
• Order Composition: Analyze how many items customers typically order per visit.

Why It Matters:  
- Business Insights: Empowers pizza shop managers to optimize menus, pricing, and promotions.  
- SQL Proficiency: Showcases ability to design normalized schemas, write JOINs, aggregate functions, window functions, and subqueries.  
- Data‐Driven Decisions: Illustrates how even small datasets can yield actionable operational insights.

Next Steps / Extensions: 
- Integrate customer segmentation (loyalty tiers, geographic regions).  
- Add ingredient‐level tables to analyze topping popularity.  
- Build a dashboard layer (e.g., via Tableau or Power BI) for real‐time monitoring.  
- Introduce predictive models to forecast demand and optimize inventory.

