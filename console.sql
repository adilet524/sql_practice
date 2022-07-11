CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          productName VARCHAR(30) NOT NULL,
                          company VARCHAR(20) NOT NULL,
                          productCount INT DEFAULT 0,
                          price NUMERIC NOT NULL,
                          isDiscounted BOOL
);

INSERT INTO products (productName, company, productCount, price, isDiscounted)
VALUES
    ('iPhone X', 'Apple', 3, 76000, false),
    ('iPhone 8', 'Apple', 2, 71000, true),
    ('iPhone 7', 'Apple', 5, 42000, true),
    ('Galaxy S9', 'Samsung', 2, 46000, false),
    ('Galaxy S8 Plus', 'Samsung', 1, 56000, true),
    ('Desire 12', 'HTC', 5, 28000, true),
    ('Nokia 9', 'HMD Global', 6, 38000, true);

-- 1. HTC компаниясынан башка компаниянын продуктуларын алыныз
select * from products
where products.company not like 'HTC';

-- 2. Apple компаниясынын 75000минден томонку баадагы продуктуларын алыныз.
select * from products
where company = 'Apple' and price <= 75000;

-- 3. Баасы 46000 жана андан ойдоку продуктулардын баарын алыныз
select * from products
where price >= 46000;

-- 4. Эн кымбат эки продукту алыныз
select * from products
order by price desc limit 2;

-- 5. Баасы минимальный болгон продуктун атын алыныз
select company,min(price) from products
group by company limit 1;

-- 6. Дискоунт болгон продуктуларды чыгарыныз.
select * from products
where isDiscounted = true;

-- 7. Дискоунт болбогон продуктуларды чыгарыныз.
select * from products
where isDiscounted = false;

-- 8. Баардык продуктулардын баасын кымбаттан арзанга карап чыгарыныз
select * from products
order by price desc;

-- 9. Баардык продуктулардын суммасын(баасын) чыгарыныз.
select sum(price) from products;

-- 10. Эки жана андан аз продуктусу бар компанияларды алыныз
select * from products
where productCount <= 2;