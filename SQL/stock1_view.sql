Select
	ing_name,
    ordered_weight,
	(inv.inv_quantity * ing_weight) as inventory_weight,
    ((inv.inv_quantity * ing_weight) - ordered_weight) as remaining_weight
From
(
	Select
		ing_name,
        ing_id,
        sum(ing_weight) as ing_weight,
		sum(ordered_weight) as ordered_weight
	From stock1
	Group By 1,2
) ingred
Left Join inventory inv
	On ingred.ing_id = inv.ing_id