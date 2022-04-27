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
    employee
values
    (
        1,
        'ali',
        'branch',
        'cook',
        1
    );

select
    *
from
    restaurant;