WITH order_detail AS
(
SELECT
    i.item_name AS item_name,
    r.ing_id AS ing_id,
    ing.ing_name AS ing_name,
    ing.ing_weight/1000 AS ing_weight,
    ing.ing_price AS ing_price,
    r.rec_quantity AS recep_quantity,
    sum(o.quantity) AS order_quantity
    
FROM orders o
LEFT JOIN items i
	ON o.item_id = i.item_id
LEFT JOIN recipes r
	ON i.sku = r.recipe_id
LEFT JOIN ingredients ing
	ON r.ing_id = ing.ing_id
GROUP BY 1, 2, 3, 4, 5, 6
)
Select *,
	(ordered_weight * unit_cost) AS ingredient_cost
From (
Select *,
	(ing_price/ing_weight) AS unit_cost,
    (order_quantity*recep_quantity*ing_weight/1000) AS ordered_weight
From order_detail) stock1
