--  cоздадим схему
create schema netology_sql_join;

-- 1) создания таблицы со следующими параметрами: название таблицы - CUSTOMERS содержит в себе 5 столбцов - id, name,
-- surname, age, phone_number первичным ключом будет поле id, который инкрементируется каждый раз, при создании пользователя
create table netology_sql_join.customers
(
    id           int primary key auto_increment,
    name         varchar(30) not null,
    surname      varchar(30) not null,
    age          int check (0 <= age <= 140),
    phone_number varchar(11) not null
);

-- 2) скрипт создания таблицы со следующими параметрами: название таблицы - ORDERS. Cодержит в себе 4 столбца - id, date,
-- customer_id,product_name, amount, первичным ключом будет поле id, который инкрементируется каждый раз, при создании заказа
-- внешним ключом на поле id таблицы пользователей будет customer_idcreate table 'orders'
create table netology_sql_join.orders
(
    id           int primary key auto_increment,
    date         date         not null,
    customer_id  int          not null,
    product_name varchar(100) not null,
    amount       decimal(10, 2),
    foreign key (customer_id) references customers (id)
);

-- наполнение таблицы CUSTOMERS
insert into netology_sql_join.customers (name, surname, age, phone_number)
values ('Алексей', 'Петров', 45, 79212348735);
insert into netology_sql_join.customers (name, surname, age, phone_number)
values ('Аня', 'Васильева', 33, 79114747745);
insert into netology_sql_join.customers (name, surname, age, phone_number)
values ('Федор', 'Иванов', 12, 79052394647);
insert into netology_sql_join.customers (name, surname, age, phone_number)
values ('АЛЕКСЕЙ', 'Сидоренко', 28, 79032345678);

-- наполнение таблицы ORDERS
insert into netology_sql_join.orders (date, customer_id, product_name, amount)
values ('2022-01-08', 1, 'ноутбук', 45000.05);
insert into netology_sql_join.orders (date, customer_id, product_name, amount)
values ('2022-03-06', 2, 'роутер', 5000.50);
insert into netology_sql_join.orders (date, customer_id, product_name, amount)
values ('2022-08-24', 3, 'УПАТС', 64000.00);
insert into netology_sql_join.orders (date, customer_id, product_name, amount)
values ('2022-11-28', 4, 'радиостанция', 10000.11);

-- 3) скрипт, который будет возвращать из таблиц поля product_name для пользователей с именем alexey независимо от
-- регистра ввода имени.
select product_name
from netology_sql_join.orders o
         join netology_sql_join.customers c on o.customer_id = c.id
where c.name like '%алексей%';


/*Задача Две таблицы
Описание
Для того, чтобы разобраться со сложными запросами, давайте создадим две связанные таблицы и напишем для них
  скрипты запросов.

1/Напишите скрипт создания таблицы со следующими параметрами:
название таблицы - CUSTOMERS
содержит в себе 5 столбцов - id, name, surname, age, phone_number
первичным ключом будет поле id, который инкрементируется каждый раз, при создании пользователя

2/Напишите скрипт создания таблицы со следующими параметрами:
название таблицы - ORDERS
содержит в себе 4 столбца - id, date, customer_id,product_name, amount
первичным ключом будет поле id, который инкрементируется каждый раз, при создании заказа
внешним ключом на поле id таблицы пользователей будет customer_id
3/
  Напишите скрипт, который будет возвращать из таблиц поля product_name для пользователей с именем alexey независимо от
  регистра ввода имени.
Итого у вас должно быть три файла-скрипта с расширением sql. Написанные скрипты выложите в отдельный репозиторий на
  гитхабе, и прикрепите ссылку на него в домашнем задании.
 */