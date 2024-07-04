SELECT COUNT(coalesce(year_added,2022))/10 AS missing_year
FROM products;


SELECT product_id,
       product_type,
	   CASE WHEN brand = '-' THEN 'Unknown' ELSE brand END AS brand,
	   trim(weight, ' grams') AS weight,
	    price::INTEGER AS price,
		average_units_sold,
		COALESCE(year_added, 2022) AS year_added,
		UPPER(stock_location) AS stock_location
FROM products;


SELECT product_type, MIN(price) AS min_price, MAX(price) AS max_price
FROM products
GROUP BY product_type;

SELECT product_id, price, average_units_sold
FROM products
WHERE product_type IN ('Meat', 'Dairy')
GROUP BY product_id, price, average_units_sold
HAVING average_units_sold > 10;