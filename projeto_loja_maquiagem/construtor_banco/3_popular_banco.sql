
USE loja_maquiagem;

INSERT INTO Categorias (nome, descricao) VALUES
('Rosto', 'Bases, corretivos, pós e blushes'),
('Olhos', 'Sombras, delineadores e máscaras de cílios'),
('Boca', 'Batons, glosses e lápis labiais'),
('Skincare', 'Cuidados com a pele, hidratantes e séruns'),
('Acessórios', 'Pincéis, esponjas e curvex');

INSERT INTO Clientes (nome, email, telefone) VALUES
('Ana Silva', 'ana@email.com', '11999999999'),
('Beatriz Costa', 'bia@email.com', '11888888888'),
('Carolina Mendes', 'carol@email.com', '11777777777'),
('Daniela Souza', 'dani@email.com', '11666666666'),
('Fernanda Lima', 'fer@email.com', '11555555555');

-- produtos zerados inicialmente - nao compramos ainda rs
INSERT INTO Produtos (id_categoria, nome, marca, preco, quantidade_estoque) VALUES
(1, 'Base Matte HD', 'Boca Rosa', 59.90, 0),         -- ID 1 -> categoria de Rosto
(1, 'Corretivo Líquido', 'Tracta', 29.90, 0),        -- ID 2 -> categoria de Rosto
(1, 'Blush Pêssego', 'Mari Maria', 45.00, 0),        -- ID 3 -> categoria de Rosto
(2, 'Máscara de Cílios', 'Maybelline', 49.90, 0),    -- ID 4 -> categoria de Olhos
(2, 'Delineador Caneta', 'Bruna Tavares', 42.50, 0), -- ID 5 -> categoria de Olhos
(3, 'Batom Líquido', 'Ruby Rose', 19.90, 0),         -- ID 6 -> categoria de Boca
(3, 'Gloss Labial', 'Vult', 22.00, 0),               -- ID 7 -> categoria de Boca
(4, 'Sérum Vitamina C', 'Principia', 59.00, 0),      -- ID 8 -> categoria de Skincare
(4, 'Hidratante Facial', 'Cerave', 89.90, 0),        -- ID 9 -> categoria de Skincare
(5, 'Esponja Gota', 'Mariana Saad', 35.00, 0);       -- ID 10 -> categoria de Acessórios

INSERT INTO Fornecedores (razao_social, cnpj, telefone) VALUES
('Beauty Atacado Distribuidora', '11.111.111/0001-11', '1144444444'),
('Glow MakeUp Fábrica', '22.222.222/0001-22', '1133333333'),
('Skincare & Cia Importadora', '33.333.333/0001-33', '1122222222');

INSERT INTO Pedidos_Compra (id_fornecedor) VALUES
(1), -- Pedido 1 (Beauty Atacado)
(2), -- Pedido 2 (Glow MakeUp)
(3), -- Pedido 3 (Skincare & Cia)
(1), -- Pedido 4 (Beauty Atacado)
(2); -- Pedido 5 (Glow MakeUp)

INSERT INTO Itens_Pedido_Compra (id_pedido_compra, id_produto, quantidade_comprada, preco_custo_unitario) VALUES
-- Pedido 1 (Comprando produtos de Rosto)
(1, 1, 50, 25.00),  -- Base Matte
(1, 2, 80, 12.00),  -- Corretivo Líquido
(1, 3, 40, 18.00),  -- Blush Pêssego
-- Pedido 2 (Comprando produtos de Olhos e Boca)
(2, 4, 60, 20.00),  -- Máscara de Cílios
(2, 5, 50, 15.00),  -- Delineador Caneta
(2, 6, 100, 8.00),  -- Batom Líquido
-- Pedido 3 (Comprando Skincare e Acessórios)
(3, 8, 30, 25.00),  -- Sérum Vit C
(3, 9, 25, 40.00),  -- Hidratante Facial
(3, 10, 150, 10.00),-- Esponja Gota
-- Pedido 4 (Reabastecendo os mais vendidos)
(4, 1, 30, 25.00),  -- Base Matte
(4, 7, 50, 9.00),   -- Gloss Labial
-- Pedido 5 (Mix final)
(5, 2, 40, 12.00),  -- Corretivo Líquido
(5, 4, 30, 20.00),  -- Máscara de Cílios
(5, 10, 100, 10.00);-- Esponja Gota

INSERT INTO Vendas (id_cliente) VALUES
(1), (2), (3), (4), (5), -- Vendas 1 a 5
(1), (2), (3), (4), (5), -- Vendas 6 a 10
(1), (2), (3), (4), (5), -- Vendas 11 a 15
(1), (2), (3), (4), (5); -- Vendas 16 a 20

INSERT INTO Itens_Venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
-- Venda 1
(1, 1, 1, 59.90), (1, 2, 2, 29.90), (1, 3, 1, 45.00), (1, 4, 1, 49.90), (1, 5, 1, 42.50), (1, 6, 2, 19.90), (1, 7, 1, 22.00),
-- Venda 2
(2, 2, 1, 29.90), (2, 3, 1, 45.00), (2, 4, 2, 49.90), (2, 5, 1, 42.50), (2, 6, 1, 19.90), (2, 7, 3, 22.00), (2, 8, 1, 59.00),
-- Venda 3
(3, 3, 1, 45.00), (3, 4, 1, 49.90), (3, 5, 1, 42.50), (3, 6, 1, 19.90), (3, 7, 1, 22.00), (3, 8, 1, 59.00), (3, 9, 2, 89.90),
-- Venda 4
(4, 4, 2, 49.90), (4, 5, 1, 42.50), (4, 6, 1, 19.90), (4, 7, 1, 22.00), (4, 8, 2, 59.00), (4, 9, 1, 89.90), (4, 10, 1, 35.00),
-- Venda 5
(5, 5, 1, 42.50), (5, 6, 1, 19.90), (5, 7, 2, 22.00), (5, 8, 1, 59.00), (5, 9, 1, 89.90), (5, 10, 3, 35.00), (5, 1, 1, 59.90),
-- Venda 6
(6, 6, 1, 19.90), (6, 7, 1, 22.00), (6, 8, 1, 59.00), (6, 9, 1, 89.90), (6, 10, 1, 35.00), (6, 1, 1, 59.90), (6, 2, 2, 29.90),
-- Venda 7
(7, 7, 2, 22.00), (7, 8, 1, 59.00), (7, 9, 1, 89.90), (7, 10, 1, 35.00), (7, 1, 2, 59.90), (7, 2, 1, 29.90), (7, 3, 1, 45.00),
-- Venda 8
(8, 8, 1, 59.00), (8, 9, 1, 89.90), (8, 10, 2, 35.00), (8, 1, 1, 59.90), (8, 2, 1, 29.90), (8, 3, 1, 45.00), (8, 4, 1, 49.90),
-- Venda 9
(9, 9, 1, 89.90), (9, 10, 1, 35.00), (9, 1, 1, 59.90), (9, 2, 2, 29.90), (9, 3, 1, 45.00), (9, 4, 2, 49.90), (9, 5, 1, 42.50),
-- Venda 10
(10, 10, 1, 35.00), (10, 1, 1, 59.90), (10, 2, 1, 29.90), (10, 3, 1, 45.00), (10, 4, 1, 49.90), (10, 5, 1, 42.50), (10, 6, 3, 19.90),
-- Venda 11
(11, 1, 2, 59.90), (11, 3, 1, 45.00), (11, 5, 1, 42.50), (11, 7, 1, 22.00), (11, 9, 1, 89.90), (11, 2, 1, 29.90), (11, 4, 1, 49.90),
-- Venda 12
(12, 2, 1, 29.90), (12, 4, 2, 49.90), (12, 6, 1, 19.90), (12, 8, 1, 59.00), (12, 10, 1, 35.00), (12, 1, 1, 59.90), (12, 3, 1, 45.00),
-- Venda 13
(13, 3, 1, 45.00), (13, 5, 1, 42.50), (13, 7, 2, 22.00), (13, 9, 1, 89.90), (13, 2, 1, 29.90), (13, 4, 1, 49.90), (13, 6, 1, 19.90),
-- Venda 14
(14, 4, 1, 49.90), (14, 6, 2, 19.90), (14, 8, 1, 59.00), (14, 10, 1, 35.00), (14, 3, 1, 45.00), (14, 5, 1, 42.50), (14, 7, 1, 22.00),
-- Venda 15
(15, 5, 1, 42.50), (15, 7, 1, 22.00), (15, 9, 2, 89.90), (15, 1, 1, 59.90), (15, 4, 1, 49.90), (15, 6, 1, 19.90), (15, 8, 1, 59.00),
-- Venda 16
(16, 6, 1, 19.90), (16, 8, 1, 59.00), (16, 10, 1, 35.00), (16, 2, 2, 29.90), (16, 5, 1, 42.50), (16, 7, 1, 22.00), (16, 9, 1, 89.90),
-- Venda 17
(17, 7, 2, 22.00), (17, 9, 1, 89.90), (17, 1, 1, 59.90), (17, 3, 1, 45.00), (17, 6, 1, 19.90), (17, 8, 1, 59.00), (17, 10, 1, 35.00),
-- Venda 18
(18, 8, 1, 59.00), (18, 10, 2, 35.00), (18, 2, 1, 29.90), (18, 4, 1, 49.90), (18, 7, 1, 22.00), (18, 9, 1, 89.90), (18, 1, 1, 59.90),
-- Venda 19
(19, 9, 1, 89.90), (19, 1, 1, 59.90), (19, 3, 2, 45.00), (19, 5, 1, 42.50), (19, 8, 1, 59.00), (19, 10, 1, 35.00), (19, 2, 1, 29.90),
-- Venda 20
(20, 10, 1, 35.00), (20, 2, 1, 29.90), (20, 4, 1, 49.90), (20, 6, 2, 19.90), (20, 9, 1, 89.90), (20, 1, 1, 59.90), (20, 3, 1, 45.00);
