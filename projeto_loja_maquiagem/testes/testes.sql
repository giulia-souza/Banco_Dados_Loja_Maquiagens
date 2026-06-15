-- recibo venda 1
SELECT 
    v.id_venda, 
    c.nome AS cliente, 
    p.nome AS produto, 
    iv.quantidade, 
    iv.preco_unitario, 
    (iv.quantidade * iv.preco_unitario) AS subtotal
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Itens_Venda iv ON v.id_venda = iv.id_venda
JOIN Produtos p ON iv.id_produto = p.id_produto
where iv.id_venda = 1;

-- quem mais gastou na loja
SELECT 
    c.nome AS cliente, 
    COUNT(v.id_venda) AS quantidade_de_compras,
    SUM(v.valor_total) AS total_gasto
FROM Clientes c
JOIN Vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_gasto DESC;

-- produtos mais vendidos
SELECT 
    p.nome AS produto, 
    cat.nome AS categoria, 
    SUM(iv.quantidade) AS total_unidades_vendidas
FROM Produtos p
JOIN Itens_Venda iv ON p.id_produto = iv.id_produto
JOIN Categorias cat ON p.id_categoria = cat.id_categoria
GROUP BY p.id_produto
ORDER BY total_unidades_vendidas DESC;

-- faturamento total
SELECT 
    COUNT(id_venda) AS total_de_pedidos,
    SUM(valor_total) AS faturamento_total_bruto
FROM Vendas;

-- recibo do fornecedor da compra 1
SELECT 
    pc.id_pedido_compra, 
    f.razao_social AS fornecedor, 
    p.nome AS produto, 
    ipc.quantidade_comprada AS qtd, 
    ipc.preco_custo_unitario AS custo_unitario, 
    (ipc.quantidade_comprada * ipc.preco_custo_unitario) AS subtotal_custo
FROM Pedidos_Compra pc
JOIN Fornecedores f ON pc.id_fornecedor = f.id_fornecedor
JOIN Itens_Pedido_Compra ipc ON pc.id_pedido_compra = ipc.id_pedido_compra
JOIN Produtos p ON ipc.id_produto = p.id_produto
WHERE pc.id_pedido_compra = 1;

-- em qual fornecedor foi mais investido
SELECT 
    f.razao_social AS fornecedor, 
    COUNT(pc.id_pedido_compra) AS total_de_pedidos,
    SUM(pc.valor_total_custo) AS investimento_total
FROM Fornecedores f
JOIN Pedidos_Compra pc ON f.id_fornecedor = pc.id_fornecedor
GROUP BY f.id_fornecedor
ORDER BY investimento_total DESC;

-- maior lucro..
SELECT 
    p.nome AS produto, 
    cat.nome AS categoria, 
    MAX(ipc.preco_custo_unitario) AS custo_no_fornecedor,
    p.preco AS preco_de_venda_na_loja,
    (p.preco - MAX(ipc.preco_custo_unitario)) AS lucro_bruto_por_unidade
FROM Produtos p
JOIN Categorias cat ON p.id_categoria = cat.id_categoria
JOIN Itens_Pedido_Compra ipc ON p.id_produto = ipc.id_produto
GROUP BY p.id_produto
ORDER BY lucro_bruto_por_unidade DESC;

-- auditoria
SELECT 
    p.nome AS produto,
    p.quantidade_estoque AS estoque_atual_na_loja,
    SUM(ipc.quantidade_comprada) AS total_comprado_do_fornecedor,
    CASE 
        WHEN p.quantidade_estoque < SUM(ipc.quantidade_comprada) THEN 'Menor (Vendas ocorreram)'
        WHEN p.quantidade_estoque > SUM(ipc.quantidade_comprada) THEN 'Maior (Erro/Anomalia)'
        ELSE 'Igual (Nenhuma unidade vendida)'
    END AS status_comparacao
FROM Produtos p
JOIN Itens_Pedido_Compra ipc ON p.id_produto = ipc.id_produto
GROUP BY p.id_produto
ORDER BY p.nome;
