DELIMITER $$

CREATE TRIGGER trg_auditoria_entrada_estoque
AFTER INSERT ON Itens_Pedido_Compra
FOR EACH ROW
BEGIN
    -- 1. Soma a quantidade comprada no estoque da loja
    UPDATE Produtos
    SET quantidade_estoque = quantidade_estoque + NEW.quantidade_comprada
    WHERE id_produto = NEW.id_produto;

    -- 2. Atualiza o valor total gasto com o fornecedor naquele pedido
    UPDATE Pedidos_Compra
    SET valor_total_custo = valor_total_custo + (NEW.quantidade_comprada * NEW.preco_custo_unitario)
    WHERE id_pedido_compra = NEW.id_pedido_compra;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_auditoria_saida_estoque
AFTER INSERT ON Itens_Venda
FOR EACH ROW
BEGIN
    -- 1. Subtrai a quantidade vendida do estoque da loja
    UPDATE Produtos
    SET quantidade_estoque = quantidade_estoque - NEW.quantidade
    WHERE id_produto = NEW.id_produto;

    -- 2. Atualiza o valor total que o cliente tem que pagar
    UPDATE Vendas
    SET valor_total = valor_total + (NEW.quantidade * NEW.preco_unitario)
    WHERE id_venda = NEW.id_venda;
END$$

DELIMITER ;

