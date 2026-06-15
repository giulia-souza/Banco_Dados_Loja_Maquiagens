-- maior lucro
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