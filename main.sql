drop table if exists restaurant,
employee,
inspector,
ingredients,
food_item,
bill,
change_restaurant,
order_ingredients,
inspecting_record cascade;

drop domain if exists e_type,
e_position,
f_type,
ins_ind,
b_type;

create domain e_type char(6) check (value in ('office', 'branch'));

create domain e_position char(7) check (value in ('manager', 'cook', 'host', 'cashier'));

create domain f_type char(10) check (value in ('noshidani', 'asli', 'charb'));

create domain ins_ind char(10) check (value in ('qual', 'health'));

create domain b_type char(5) check (value in ('gas', 'water', 'plum'));

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

create table inspector (name varchar(32) primary key);

create table ingredients (name varchar(32) primary key);

create table food_item (
    name varchar(32),
    type f_type not null, -- not correct
    price int not null,
    quantity int not null,
    primary key (name, type)
);

create table bill (
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