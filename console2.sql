-- 1) Вывести всех клиентов из страны Canada
select * from customer
where country = 'Canada';

-- 2) Вывести все страны клиентов
select distinct country from customer;

-- 3) Вывести количество всех заказов
select count(orders) from orders;

-- 4) Вывести максимальную стоимость заказа
select max(total_amount) from orders;

-- 5) Найти сумму всех заказов
select sum(total_amount) as "sum of orders" from orders;

-- 6) Найти сумму всех заказов за 2014 год
select sum(total_amount) from orders
where order_date between '2014-01-01' and '2014-12-31';

-- 7) Найти среднюю стоимость всех заказов
select avg(total_amount) from orders;

-- 8) Найти среднюю стоимость всех заказов по каждому клиенту
select avg(total_amount) from customer cust
join orders ord
on cust.id = ord.customer_id;

-- 9) Найти всех клиентов, которые живут в Бразилии или Испании
select * from customer
where country in ('Brazil', 'Spain');

-- 10 Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
select * from orders
where order_date between '2013-01-01' and '2014-12-30' and total_amount < 100;

-- 11) Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
select * from customer
where country in ('Spain', 'Italy', 'Germany', 'France') order by country;

-- 12) Найти все страны клиентов, страны которых содержаться в таблице поставщиков
select distinct customer.country from supplier, customer
where customer.country = supplier.country;

-- 13) Найти всех клиентов, имена которых начинаются на ‘Jo’
select * from customer
where first_name like ('Jo%');

-- 14) Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
select * from customer
where customer.first_name like '%a' and length(first_name) = 4;

-- 15) Найти количество клиентов по странам
select country,count(*) from customer
group by country ;

-- 16) Найти количество клиентов по странам. Вывести в порядке убывания
select country,count(*)  from customer
group by country order by count(*) desc ;

-- 17) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id). Отсортировать по сумме
select sum(total_amount) as "total amount",
       count(*) as "count(*)"
from customer cust
join orders ord
on cust.id = ord.customer_id;

-- 18) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id), у которых общее количество заказов больше 20ти
select sum(total_amount) as "total amount",
       count(*) as "count(*)"
from customer cust
join orders ord
on cust.id = ord.customer_id;
