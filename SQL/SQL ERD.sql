USE da_portfolio;
CREATE TABLE `Orders` (
    -- Clustered
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `customer_id` int  NOT NULL ,
    `datetime` datetime  NOT NULL ,
    `item_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Items` (
    -- Clustered
    `item_id` int  NOT NULL ,
    `sku` varchar(100)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(30)  NOT NULL ,
    `item_size` varchar(20)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `Customers` (
    -- Clustered
    `customer_id` int  NOT NULL ,
    `address_id` int  NOT NULL ,
    `first_name` varchar(200)  NOT NULL ,
    `last_name` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `customer_id`
    )
);

CREATE TABLE `Addresses` (
    -- Clustered
    `address_id` int  NOT NULL ,
    `delivery_add1` varchar(200)  NOT NULL ,
    `delivery_add2` varchar(200)  NOT NULL ,
    `delivery_city` varchar(70)  NOT NULL ,
    `delivery_zip` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `address_id`
    )
);

CREATE TABLE `Ingredients` (
    -- Clustered
    `ing_id` varchar(10)  NOT NULL ,
    `ing_name` varchar(200)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_meas` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `recipes` (
    -- Clustered
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(10)  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `rec_quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `Inventory` (
    -- Clustered
    `inv_id` int  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `inv_quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `Staff` (
    -- Clustered
    `staff_id` varchar(10)  NOT NULL ,
    `first_name` varchar(50)  NOT NULL ,
    `last_name` varchar(50)  NOT NULL ,
    `position` varchar(30)  NOT NULL ,
    `hourly_pay` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `Shifts` (
    -- Clustered
    `shift_id` varchar(10)  NOT NULL ,
    `week_day` varchar(15)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

CREATE TABLE `Rotations` (
    -- Clustered
    `row_id` int  NOT NULL ,
    `rot_id` varchar(10)  NOT NULL ,
    `datetime` datetime  NOT NULL ,
    `shift_id` varchar(10)  NOT NULL ,
    `staff_id` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

-- USE da_portfolio;
-- ALter Table rotations
-- Add Foreign Key (shift_id)
-- REFERENCES shifts(shift_id)