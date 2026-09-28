CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(12,2) NOT NULL CHECK (price >= 0)
);

INSERT INTO products (name, price)
SELECT *
FROM (
    VALUES
        ('Smartphone Tokokita A1', 2499000::numeric),
        ('Laptop Tokokita Pro 14', 7499000::numeric),
        ('Headset Wireless T-Kita', 399000::numeric),
        ('Keyboard Mechanical RGB', 599000::numeric),
        ('Mouse Wireless', 199000::numeric),
        ('Power Bank 10000mAh', 179000::numeric)
) AS seed(name, price)
WHERE NOT EXISTS (
    SELECT 1 FROM products
);
