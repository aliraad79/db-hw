truncate table restaurant,
employee,
inspector,
ingredients,
food_item,
bill,
change_restaurant,
order_ingredients cascade;

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
        'cook',
        1
    );

insert into
    inspector
values
    ('detective gadget');

insert into
    ingredients
values
    ('kalam');

insert into
    food_item
values
    ('burger', 'asli', 75000, 1);

insert into
    bill
values
    ('gas', 5000, 1);

insert into
    change_restaurant
values
    (2, 1, 1);

select
    *
from
    restaurant;