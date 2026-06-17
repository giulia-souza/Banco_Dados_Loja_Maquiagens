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