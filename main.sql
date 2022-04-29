drop table if exists restaurant,
employee,
inspector,
ingredients,
food_item,
current_cost,
change_restaurant,
order_ingredients,
inspecting_record, 
customer_order cascade;

drop domain if exists e_type,
e_position,
f_category,
ins_indicators,
c_type;

create domain e_type char(6) check (value in ('office', 'branch'));

create domain e_position char(7) check (
    value in ('manager', 'chef', 'waiter', 'cashier')
);

create domain f_category char(10) check (
    value in ('pizza', 'burger', 'coldDrink', 'hotDrink')
);

create domain ins_indicators char(10) check (
    value in ('hygiene', 'pricing', 'behavioral', 'other')
);

create domain c_type char(6) check (value in ('gas', 'water', 'repair', 'other'));

create table restaurant (
    rid int primary key,
    name varchar(32) not null,
    capacity int not null,
    address varchar(256) not null,
    geo_cordinate varchar(256) not null
);

create table employee (
    eid int primary key,
    name varchar(32) not null,
    type e_type default 'branch',
    position e_position not null,
    working_restaurant int references restaurant(rid) not null
);

create table inspector (id int primary key, name varchar(32) not null);

create table ingredients (name varchar(32) primary key);

create table food_item (
    name varchar(32) primary key,
    category f_category not null,
    label TEXT [], -- 'dietary', 'spicy', 'vegetarian'
    price int not null,
    quantity int not null
);

create table current_cost (
    type c_type primary key,
    amount int not null,
    paying_rid int references restaurant(rid) on delete cascade
);

create table change_restaurant (
    target_restaurant int references restaurant(rid) on delete cascade,
    eid int references employee(eid) on delete cascade,
    former_restaurant int references restaurant(rid) on delete cascade,
    accepted boolean default FALSE,
    primary key (eid, former_restaurant, target_restaurant)
);

create table order_ingredients (
    delivery_date timestamp with time zone not null,
    ingredients_name varchar(32) references ingredients(name),
    rid int references restaurant(rid) on delete cascade,
    accepted boolean default FALSE
);

create table inspecting_record (
    date date not null,
    score int not null,
    indicators ins_indicators not null,
    inspector_id int references inspector(id),
    rid int references restaurant(rid) on delete cascade
);

create table customer_order (
    id int primary key,
    date timestamp with time zone not null,
    score int not null,
    comment varchar(512),
    food_name varchar(32) references food_item(name) not null,
    rid int references restaurant(rid) on delete cascade
);