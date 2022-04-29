truncate table restaurant,
employee,
inspector,
ingredients,
food_item,
current_cost,
change_restaurant,
order_ingredients,
inspecting_record,
customer_order cascade;

insert into
    restaurant
values
    (
        1,
        'khomaze',
        50,
        'tehran - shomal',
        '12.5465 31.65656'
    );

insert into
    restaurant
values
    (
        2,
        'yum yum',
        80,
        'karaj',
        '12.549999 99.65656'
    );

insert into
    employee
values
    (
        1,
        'ali',
        'branch',
        'chef',
        1
    );

insert into
    inspector
values
    (1, 'detective gadget');

insert into
    ingredients
values
    ('meat');

insert into
    food_item
values
    ('double burger', 'burger', ARRAY ['dietary'], 75000, 1);

insert into
    food_item
values
    ('big pizza', 'pizza', ARRAY ['spicy', 'vegetarian'], 7000, 2);

insert into
    food_item
values
    ('big pizza 2', 'pizza', NULL, 9000, 2);

insert into
    current_cost
values
    ('gas', 5000, 1);

insert into
    change_restaurant
values
    (2, 1, 1, FALSE);

insert into
    order_ingredients
values
    ('2021-10-10 10:20:30 +03:30', 'meat', 1, TRUE);

insert into
    inspecting_record
values
    ('2021-10-10 10:20:30', 15, 'hygiene', 1, 2);

insert into
    customer_order
values
    (
        1,
        '2021-10-10 10:20:30',
        16,
        'yes it is good',
        'big pizza',
        1
    );

select
    *
from
    restaurant;