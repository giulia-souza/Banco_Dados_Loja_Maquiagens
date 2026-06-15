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
