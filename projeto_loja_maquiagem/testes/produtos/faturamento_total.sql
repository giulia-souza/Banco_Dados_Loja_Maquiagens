-- faturamento total
SELECT 
    COUNT(id_venda) AS total_de_pedidos,
    SUM(valor_total) AS faturamento_total_bruto
FROM Vendas;