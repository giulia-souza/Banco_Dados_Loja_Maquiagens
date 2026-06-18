# Banco de Dados Relacional - Loja de Maquiagem

Bem-vindo(a) ao repositório do projeto de banco de dados para gestão operacional de uma loja de maquiagens. Este projeto foi desenvolvido como requisito acadêmico para a disciplina de Introdução a Banco de Dados e implementa um ecossistema completo de rastreabilidade, desde compras B2B (Fornecedores) até vendas B2C (Clientes).

O diferencial arquitetural deste projeto é o encapsulamento das regras de negócio e de auditoria de estoque diretamente no banco de dados, utilizando **Triggers** para cálculos de faturamento e baixa de inventário em tempo real.

---

## Estrutura do Repositório

O repositório está dividido em diretórios lógicos para facilitar a execução e a validação do banco de dados:

### 1. `/construtor_banco`
Contém os scripts necessários para construir a infraestrutura do projeto. 

**Atenção:** Para garantir a integridade referencial e o funcionamento das automações, os scripts devem ser executados **estritamente na ordem abaixo**:

1. `1_gerador_banco.sql`: Responsável pela criação do banco (`CREATE DATABASE`) e de todas as tabelas, respeitando a hierarquia das chaves estrangeiras (Entidades Independentes -> Entidades Dependentes -> Tabelas Associativas).
2. `2_trigger.sql`: Implementa as automações de auditoria de entrada (incremento de estoque e cálculos de custo em pedidos de compra) e auditoria de saída (baixa de estoque e cálculos de receita em vendas).
3. `3_popular_banco.sql`: Realiza a carga inicial (Inserts) populando categorias, clientes, fornecedores e produtos (com estoque inicial zero), além de simular as primeiras compras e vendas para acionar os gatilhos.

### 2. `/testes`
Contém os scripts DQL (Consultas Analíticas) para validação do sistema e extração de métricas de *Business Intelligence*.
* **Subpastas temáticas:** As consultas estão separadas em diretórios conforme os tópicos documentados no PDF do projeto.
* `testes.sql`: Um arquivo unificado contendo todas as consultas analíticas de validação consolidadas em um único lugar para facilitar testes rápidos.

---

## Como Executar o Projeto

Para testar o banco de dados localmente utilizando um SGBD (recomendamos o **DBeaver**, que foi a ferramenta padrão de desenvolvimento) ou via CLI:

1. **Clone o repositório:**
   ```bash
   gh repo clone giulia-souza/Banco_Dados_Loja_Maquiagens
   
2. **Prepare o Ambiente:** Abra o seu cliente SQL (DBeaver, MySQL Workbench, etc.) e conecte-se a uma instância MySQL local (`localhost`).

3. **Construa e Popule o Banco (Ordem Obrigatória):** Navegue até a pasta `construtor_banco/` e execute os scripts estritamente na seguinte sequência para garantir a integridade referencial:
   * `1_gerador_banco.sql`
   * `2_trigger.sql`
   * `3_popular_banco.sql`

4. **Explore as Consultas Específicas:** Caso deseje analisar as *queries* de forma isolada, acesse as subpastas dentro do diretório `testes/`:
   * **`B2C_Comercial`**: Relatórios de vendas e comportamento de clientes.
   * **`B2B_Fornecedores`**: Histórico de compras e investimentos na cadeia de suprimentos.
   * **`Auditoria_Financeira`**: Análise de lucros, divergências e rastreabilidade de inventário.

---

## Documentação e Modelagem

Junto ao repositório, encontra-se o documento em PDF contendo o relatório técnico completo do projeto. O relatório detalha a arquitetura do sistema e inclui as modelagens gráficas:
* **Modelo Conceitual (DER):** Focado nas regras de negócio e relacionamentos.
* **Modelo Lógico (IDEF1X):** Detalhamento das estruturas de tabelas, adotando o uso de chaves compostas para representar a pureza relacional exigida academicamente, em paralelo às chaves artificiais implementadas no modelo físico para compatibilidade com ORMs.

---

## Tecnologias e Padrões Utilizados
* **SGBD:** MySQL 8.0
* **Ferramenta de Banco de Dados:** DBeaver
* **Modelagem:** Padrão IDEF1X e DER desenhados via PlantUML
* **Arquitetura de Dados:** Padrão Mestre-Detalhe (*Header-Detail*) e Triggers (Gatilhos de Automação).

---

## Autora

**Giulia de Souza Leite**
*Estudante de Engenharia de Computação - UTFPR (Universidade Tecnológica Federal do Paraná)*
