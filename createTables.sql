-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.

create table countries (
country_id int auto_increment primary key,
country_name varchar(100) not null
);

create table cities (
city_id int auto_increment primary key,
city_name varchar(50) not null,
country_id int not null,
foreign key (country_id) references countries(country_id)
);

create table districts (
district_id int auto_increment primary key,
district_name varchar(100) not null,
country_id int not null,
city_id int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities (city_id)
);

create table streets (
street_id int auto_increment primary key,
street_name varchar(100) not null,
country_id int not null,
city_id int not null,
district_id int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id),
foreign key (district_id) references districts(district_id)
);

create table users (
user_id int auto_increment primary key,
user_status varchar(50) not null default "active",
registry_date DATE DEFAULT (CURRENT_DATE),
user_name varchar(50) not null,
user_surname varchar(50) not null,
user_email varchar(100) not null unique,
user_mobile int not null unique,
country_id int not null,
city_id int not null,
district_id int not null,
street_id int not null,
building_no int not null,
flat_no int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id),
foreign key (district_id) references districts(district_id),
foreign key (street_id) references streets(street_id)
);

create table locations (
location_id int auto_increment primary key,
location_name varchar(100) not null,
country_id int not null,
city_id int not null,
district_id int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id),
foreign key (district_id) references districts(district_id)
);

create table titles (
title_id int auto_increment primary key,
title_name varchar(100) not null
);

create table employment_types (
employment_type_id int auto_increment primary key,
employment_type_name varchar(100) not null
);

create table positions (
position_id int auto_increment primary key,
position_name varchar(100) not null
);

create table departments (
department_id int auto_increment primary key,
department_name varchar(100) not null
);

create table currencies (
currency_id int auto_increment primary key,
curreny_name varchar(3) not null
);

create table employees (
employee_id int auto_increment primary key,
employee_status varchar(50) not null default "active",
registry_date DATE DEFAULT (CURRENT_DATE),
employee_name varchar(100) not null,
employee_surname varchar(100) not null,
employee_email varchar(200) not null,
employee_mobile int not null,
salary_month int not null,
currency_id int not null,
country_id int not null,
city_id int not null,
district_id int not null,
location_id int not null,
title_id int not null,
employment_type_id int not null,
position_id int not null,
department_id int not null,
foreign key (currency_id) references currencies(currency_id),
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id),
foreign key (district_id) references districts(district_id),
foreign key (location_id) references locations(location_id),
foreign key (title_id) references titles(title_id),
foreign key (employment_type_id) references employment_types(employment_type_id),
foreign key (position_id) references positions(position_id),
foreign key (department_id) references departments(department_id)
);

create table suppliers(
supplier_id int auto_increment primary key,
supplier_status varchar(50) not null default "active",
registry_date date default (current_date),
supplier_name varchar(100) not null,
supplier_contact varchar(100),
contact_email varchar(100),
contact_mobile int,
country_id int not null,
city_id int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id)
);

create table categories (
category_id int auto_increment primary key,
category_name varchar(100) not null
);

create table brands (
brand_id int auto_increment primary key,
brand_name varchar(100) not null,
supplier_id int not null,
foreign key (supplier_id) references suppliers(supplier_id)
);

create table products (
product_id int auto_increment primary key,
product_status varchar(50) not null default "active",
registry_date date default (current_date),
product_name varchar(100) not null,
weight_gr int not null,
height_cm int not null,
width_cm int not null,
length_cm int not null,
buy_price int not null,
sell_price int not null,
shelf_days int,
supplier_id int not null,
category_id int not null,
brand_id int not null,
currency_id int not null,
foreign key (supplier_id) references suppliers(supplier_id),
foreign key (category_id) references categories(category_id),
foreign key (brand_id) references brands(brand_id),
foreign key (currency_id) references currencies(currency_id)
);

create table orders (
order_id int auto_increment primary key,
order_status varchar(50) default "active",
order_date date default (current_date)
);

create table vehicle_types (
vehicle_type_id int auto_increment primary key,
vehicle_type varchar(100)
)

create table vehicles (
vehicle_id int auto_increment primary key,
vin_id int not null unique,
vehicle_type_id int not null,
plate_no varchar(20) not null,
foreign key (vehicle_type_id) references vehicle_types(vehicle_type_id)
)
create table deliveries (
delivery_id int auto_increment primary key,
country_id int not null,
city_id int not null,
district_id int not null,
street_id int not null,
vehicle_id int not null,
building_no int not null,
flat_no int not null,
foreign key (country_id) references countries(country_id),
foreign key (city_id) references cities(city_id),
foreign key (district_id) references districts(district_id),
foreign key (street_id) references streets(street_id)
foreign key (vehicle_id) references vehicles(vehicle_id)
);

create table order_details(
order_detail_id int auto_increment primary key,
product_quantity int not null,
sell_price int not null,
payment_type varchar(50),
order_id int not null,
user_id int not null,
employee_id int not null,
product_id int not null,
delivery_id int not null,
currency_id int not null,
foreign key (order_id) references orders(order_id),
foreign key (user_id) references users(user_id),
foreign key (employee_id) references employees(employee_id),
foreign key (product_id) references products(product_id),
foreign key (delivery_id) references deliveries(delivery_id),
foreign key (currency_id) references currencies(currency_id)
);

