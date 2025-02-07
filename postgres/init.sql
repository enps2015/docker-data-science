-- Criação da tabela "sales"
CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    quantity INT,
    price DECIMAL(10, 2),
    sale_date DATE
);

-- Inserção de dados iniciais
INSERT INTO sales (product_name, quantity, price, sale_date) VALUES
('Produto A', 10, 100.00, '2023-10-01'),
('Produto B', 5, 200.00, '2023-10-02'),
('Produto C', 8, 150.00, '2023-10-03'),
('Produto A', 12, 100.00, '2023-10-04'),
('Produto B', 7, 200.00, '2023-10-05');