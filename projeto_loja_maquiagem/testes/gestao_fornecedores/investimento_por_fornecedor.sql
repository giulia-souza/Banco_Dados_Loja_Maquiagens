-- em qual fornecedor foi mais investido
SELECT 
    f.razao_social AS fornecedor, 
    COUNT(pc.id_pedido_compra) AS total_de_pedidos,
    SUM(pc.valor_total_custo) AS investimento_total
FROM Fornecedores f
JOIN Pedidos_Compra pc ON f.id_fornecedor = pc.id_fornecedor
GROUP BY f.id_fornecedor
ORDER BY investimento_total DESC;