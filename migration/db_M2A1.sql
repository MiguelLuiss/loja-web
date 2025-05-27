CREATE DATABASE db_Loja_M2A1;

CREATE TABLE tb_categorias (
 codCategoria INT NOT NULL,
 categorias VARCHAR(30)
);

ALTER TABLE tb_categorias ADD CONSTRAINT PK_tb_categorias PRIMARY KEY (codCategoria);


CREATE TABLE tb_produtos (
 codProduto INT NOT NULL,
 nome_produto VARCHAR(50),
 descricao VARCHAR(80),
 preco VARCHAR(20),
 sexo VARCHAR(20),
 tipo VARCHAR(20)
);

ALTER TABLE tb_produtos ADD CONSTRAINT PK_tb_produtos PRIMARY KEY (codProduto);


CREATE TABLE tb_usuarios (
 codUsuario INT NOT NULL,
 codCategoria INT NOT NULL,
 nome VARCHAR(50),
 email VARCHAR(50),
 senha VARCHAR(30),
 telefone VARCHAR(14),
 endereco VARCHAR(50)
);

ALTER TABLE tb_usuarios ADD CONSTRAINT PK_tb_usuarios PRIMARY KEY (codUsuario,codCategoria);


CREATE TABLE tb_carrinho (
 codCarrinho INT NOT NULL,
 codUsuario INT NOT NULL,
 codProduto INT NOT NULL,
 codCategoria INT NOT NULL,
 nome_produto VARCHAR(50),
 descricao VARCHAR(80),
 preco VARCHAR(20),
 sexo VARCHAR(20)
);

ALTER TABLE tb_carrinho ADD CONSTRAINT PK_tb_carrinho PRIMARY KEY (codCarrinho,codUsuario,codProduto,codCategoria);


CREATE TABLE tb_fotos (
 codFoto INT NOT NULL,
 codProduto INT NOT NULL,
 url CHAR(10)
);

ALTER TABLE tb_fotos ADD CONSTRAINT PK_tb_fotos PRIMARY KEY (codFoto,codProduto);


ALTER TABLE tb_usuarios ADD CONSTRAINT FK_tb_usuarios_0 FOREIGN KEY (codCategoria) REFERENCES tb_categorias (codCategoria);


ALTER TABLE tb_carrinho ADD CONSTRAINT FK_tb_carrinho_0 FOREIGN KEY (codUsuario,codCategoria) REFERENCES tb_usuarios (codUsuario,codCategoria);
ALTER TABLE tb_carrinho ADD CONSTRAINT FK_tb_carrinho_1 FOREIGN KEY (codProduto) REFERENCES tb_produtos (codProduto);
ALTER TABLE tb_carrinho ADD CONSTRAINT FK_tb_carrinho_2 FOREIGN KEY (codCategoria) REFERENCES tb_categorias (codCategoria);


ALTER TABLE tb_fotos ADD CONSTRAINT FK_tb_fotos_0 FOREIGN KEY (codProduto) REFERENCES tb_produtos (codProduto);