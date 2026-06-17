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