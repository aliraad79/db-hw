truncate table restaurant,
employee,
ingredients,
food,
current_cost,
transfer_to_restaurant,
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
        '(12.54657, 31.65656)'
    );

insert into
    restaurant
values
    (
        2,
        'yum yum',
        80,
        'karaj',
        '(12.54999, 99.65656)'
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
    ingredients
values
    ('meat');

insert into
    food
values
    ('double burger', 'burger');

insert into
    food
values
    ('big pizza', 'pizza');

insert into
    food
values
    ('big pizza 2', 'pizza');

insert into
    current_cost
values
    ('gas', 5000, '2021-10-10', TRUE, 1);

insert into
    transfer_to_restaurant
values
    (2, 1, 1, '2021-01-10', 'accepted');

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
        1
    );

select
    *
from
    restaurant;