drop table if exists restaurant,
employee,
inspector,
ingredients,
food_item,
current_cost,
change_restaurant,
order_ingredients,
inspecting_record cascade;

drop domain if exists e_type,
e_position,
f_label,
f_category,
ins_ind,
b_type;

create domain e_type char(6) check (value in ('office', 'branch'));

create domain e_position char(7) check (
    value in ('manager', 'chef', 'waiter', 'cashier')
);

create domain f_label char(10) check (value in ('dietary', 'spicy', 'vegetarian'));

create domain f_category char(10) check (
    value in ('pizza', 'burger', 'coldDrink', 'hotDrink')
);

create domain ins_ind char(10) check (value in ('qual', 'health'));

create domain b_type char(6) check (value in ('gas', 'water', 'repair', 'other'));

create table restaurant (
    rid int primary key,
    name varchar(32) not null,
    capacity int not null,
    address varchar(256) not null,
    geo_cordinate varchar(256)
);

create table employee (
    eid int primary key,
    name varchar(32),
    type e_type default 'branch',
    position e_position not null,
    working_restaurant int references restaurant(rid) on delete cascade not null
);

create table inspector (id int primary key, name varchar(32));

create table ingredients (name varchar(32) primary key);

create table food_item (
    name varchar(32) primary key,
    category f_category not null,
    label f_label not null, -- not correct
    price int not null,
    quantity int not null
);

create table current_cost (
    type b_type primary key,
    quantity int not null,
    paying_rid int references restaurant(rid) on delete cascade
);

create table change_restaurant (
    target_eid int references restaurant(rid) on delete cascade,
    eid int references employee(eid) on delete cascade,
    rid int references restaurant(rid) on delete cascade
);

create table order_ingredients (
    accepted boolean default FALSE,
    delivery_date date not null,
    ingredients_name varchar(32) references ingredients(name),
    rid int references restaurant(rid)
);

create table inspecting_record (
    date date not null,
    score int not null,
    indicators ins_ind not null,
    -- not correct
    inspector_name varchar(32) references inspector(name),
    rid int references restaurant(rid)
);