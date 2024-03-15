Select
	o.order_id,
	i.item_price,
	o.quantity,
	i.item_cat,
	i.item_name,
	o.created_at,
	a.delivery_add1,
	a.delivery_add2,
	a.delivery_city,
	a.delivery_zip,
	o.delivery
From
	orders o
	Left Join
		items i on o.item_id = i.item_id
	Left Join
		customers c on o.customer_id = c.customer_id
    Left Join
		addresses a on c.address_id = a.address_id