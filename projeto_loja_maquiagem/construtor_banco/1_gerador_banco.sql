CREATE DATABASE IF NOT EXISTS loja_maquiagem;
use loja_maquiagem;

-- cria a tabela de Categorias (ind)
CREATE TABLE Categorias(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT
);
-- cria a tabela de Clientes (ind)
CREATE TABLE Clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	telefone VARCHAR(20)
);
-- cria a tabela de Fornecedores (ind)
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);
-- cria a tabela de Produtos (depende de Categorias)
CREATE TABLE Produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	id_categoria INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	marca VARCHAR(50),
	preco DECIMAL(10, 2) NOT NULL,
	quantidade_estoque INT DEFAULT 0,
	FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
-- cria a tabela de Vendas (depende de Clientes)
CREATE TABLE Vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
	valor_total DECIMAL(10, 2) DEFAULT 0.00,
	FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
-- cria a tabela de Pedidos de Compra (depende de Fornecedores)
CREATE TABLE Pedidos_Compra (
    id_pedido_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_total_custo DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);
-- cria a tabela de Itens_Venda (depende de Vendas e Produtos)
CREATE TABLE Itens_Venda(
	id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
	id_venda INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade INT NOT NULL,
	preco_unitario DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (id_venda) REFERENCES Vendas(id_venda),
	FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);
-- cria a tabela de Itens do Pedido (depende de Pedidos_Compra e Produtos)
CREATE TABLE Itens_Pedido_Compra (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_comprada INT NOT NULL,
    preco_custo_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido_compra) REFERENCES Pedidos_Compra(id_pedido_compra),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);