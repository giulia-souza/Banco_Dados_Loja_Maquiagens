-- quem mais gastou na loja
SELECT 
    c.nome AS cliente, 
    COUNT(v.id_venda) AS quantidade_de_compras,
    SUM(v.valor_total) AS total_gasto
FROM Clientes c
JOIN Vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
ORDER BY total_gasto DESC;