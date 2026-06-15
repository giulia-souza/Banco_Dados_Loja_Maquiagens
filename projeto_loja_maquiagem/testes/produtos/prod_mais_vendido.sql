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