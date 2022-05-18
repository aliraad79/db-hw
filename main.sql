-- 97105703
-- 98170924
-- 98171148
drop table if exists restaurant,
employee,
ingredients,
food,
current_cost,
transfer_to_restaurant,
order_ingredients,
inspecting_record,
food_labels,
customer_food,
customer_order cascade;

drop domain if exists e_type,
e_position,
f_category,
ins_indicators,
c_type,
transfer_state;

create domain e_type char(6) check (value in ('office', 'branch'));

create domain e_position char(7) check (
    value in (
        'manager',
        'chef',
        'waiter',
        'cashier',
        'inspector'
    )
);

create domain f_category char(10) check (
    value in ('pizza', 'burger', 'coldDrink', 'hotDrink')
);

create domain ins_indicators char(10) check (
    value in ('hygiene', 'pricing', 'behavioral', 'other')
);

create domain c_type char(6) check (value in ('gas', 'water', 'repair', 'other'));

create domain transfer_state char(8) check (value in ('pending', 'accepted', 'rejected'));

create table restaurant (
    rid int primary key,
    name varchar(32) not null,
    capacity int not null,
    address varchar(256) not null,
    geo_cordinate point not null
);

create table employee (
    eid int primary key,
    name varchar(32) not null,
    type e_type default 'branch',
    position e_position not null,
    working_restaurant int references restaurant(rid) not null
);

create table ingredients (name varchar(32) primary key);

create table food (
    name varchar(32) primary key,
    category f_category not null
);

create table food_labels (
    name varchar(32) primary key,
    food food not null
);

create table current_cost (
    type c_type not null,
    amount money not null,
    date date not null,
    accepted boolean default null,
    paying_rid int references restaurant(rid) on delete cascade,
    primary key (paying_rid, type, date)
);

create table transfer_to_restaurant (
    destination_restaurant int references restaurant(rid) on delete cascade,
    eid int references employee(eid) on delete cascade,
    origin_restaurant int references restaurant(rid) on delete cascade,
    create_at date not null,
    accepted_at date date date not null,
    state transfer_state default null,
    primary key (eid, origin_restaurant, destination_restaurant)
);

create table order_ingredients (
    delivery_date timestamp with time zone not null,
    ingredients_name varchar(32) references ingredients(name),
    rid int references restaurant(rid) on delete cascade,
    accepted boolean default null,
    primary key(rid, ingredients_name, delivery_date)
);

create table inspecting_record (
    date date not null,
    score int not null,
    indicators ins_indicators not null,
    inspector_id int references employee(eid),
    rid int references restaurant(rid) on delete cascade
);

create table customer_order (
    id int primary key,
    date timestamp with time zone not null,
    score int not null,
    comment varchar(512),
    rid int references restaurant(rid) on delete cascade
);

create table customer_food (
    order_id int references customer_order(id) on delete cascade,
    food_name varchar(32) references food(name) not null,
    price money not null,
    quantity int not null
);