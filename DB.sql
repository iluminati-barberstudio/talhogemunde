-- Criar a Base de Dados para o Talho de Gemunde, se não existir
CREATE DATABASE IF NOT EXISTS talho_gemunde;

-- Selecionar a Base de Dados
USE talho_gemunde;

-- Criar a tabela de Utilizadores, se não existir
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada utilizador
    name VARCHAR(255) NOT NULL, -- Nome do utilizador
    email VARCHAR(255) UNIQUE NOT NULL, -- E-mail único para autenticação
    password VARCHAR(255) NOT NULL, -- Senha do utilizador
    phone VARCHAR(20), -- Telefone do utilizador
    address TEXT, -- Endereço do utilizador
    role ENUM('admin', 'customer') DEFAULT 'customer', -- Define se é administrador ou cliente
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de criação do registo
);

-- Criar a tabela de Categorias, se não existir
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para a categoria
    name VARCHAR(255) NOT NULL, -- Nome da categoria
    description TEXT, -- Descrição da categoria
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de criação
);

-- Criar a tabela de Produtos, se não existir
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada produto
    name VARCHAR(255) NOT NULL, -- Nome do produto
    description TEXT, -- Descrição do produto
    price DECIMAL(10, 2) NOT NULL, -- Preço do produto
    stock INT DEFAULT 0, -- Quantidade em stock
    category_id INT, -- ID da categoria do produto
    image VARCHAR(255), -- Caminho ou URL da imagem do produto
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de criação
    FOREIGN KEY (category_id) REFERENCES categories(id) -- Relação com a tabela de categorias
);

-- Criar a tabela de Encomendas, se não existir
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada encomenda
    user_id INT NOT NULL, -- ID do cliente que realizou a encomenda
    total DECIMAL(10, 2) NOT NULL, -- Valor total da encomenda
    status ENUM('pending', 'completed', 'canceled') DEFAULT 'pending', -- Estado da encomenda
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de criação
    FOREIGN KEY (user_id) REFERENCES users(id) -- Relação com a tabela de utilizadores
);

-- Criar a tabela de Itens de Encomenda, se não existir
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada item
    order_id INT NOT NULL, -- ID da encomenda
    product_id INT NOT NULL, -- ID do produto
    quantity INT NOT NULL, -- Quantidade do produto
    price DECIMAL(10, 2) NOT NULL, -- Preço do produto
    FOREIGN KEY (order_id) REFERENCES orders(id), -- Relação com a tabela de encomendas
    FOREIGN KEY (product_id) REFERENCES products(id) -- Relação com a tabela de produtos
);

-- Criar a tabela de Entregas, se não existir
CREATE TABLE IF NOT EXISTS deliveries (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para a entrega
    order_id INT NOT NULL, -- ID da encomenda associada
    delivery_status ENUM('processing', 'out_for_delivery', 'delivered') DEFAULT 'processing', -- Estado da entrega
    delivery_date DATE, -- Data prevista ou realizada da entrega
    FOREIGN KEY (order_id) REFERENCES orders(id) -- Relação com a tabela de encomendas
);

-- Criar a tabela de Avaliações, se não existir
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para a avaliação
    product_id INT NOT NULL, -- Produto avaliado
    user_id INT NOT NULL, -- Cliente que realizou a avaliação
    rating INT CHECK(rating BETWEEN 1 AND 5), -- Nota da avaliação (1 a 5)
    comment TEXT, -- Comentário do cliente
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data da avaliação
    FOREIGN KEY (product_id) REFERENCES products(id), -- Relação com a tabela de produtos
    FOREIGN KEY (user_id) REFERENCES users(id) -- Relação com a tabela de utilizadores
);

-- Criar a tabela de Métodos de Pagamento, se não existir
CREATE TABLE IF NOT EXISTS payment_methods (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para o método de pagamento
    name VARCHAR(255) NOT NULL, -- Nome do método de pagamento
    details TEXT, -- Detalhes adicionais do método
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de criação
);
