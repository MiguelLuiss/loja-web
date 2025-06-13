-- Criação do banco de dados
CREATE DATABASE db_Loja_M2A1;
USE db_Loja_M2A1;

-- Tabela de Categorias
CREATE TABLE tb_categorias (
  codCategoria INT PRIMARY KEY AUTO_INCREMENT,
  categorias VARCHAR(30) NOT NULL
);

CREATE TABLE tb_produtos (
  codProduto INT PRIMARY KEY AUTO_INCREMENT,
  nome_produto VARCHAR(50) NOT NULL,
  descricao VARCHAR(1000),
  preco VARCHAR(20),
  sexo VARCHAR(20),
  tipo VARCHAR(20),
  url varchar(250),
  codCategoria INT,
  FOREIGN KEY (codCategoria) REFERENCES tb_categorias(codCategoria)
);

CREATE TABLE tb_usuarios (
  codUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  endereco VARCHAR(50)
);

CREATE TABLE tb_carrinho (
  codCarrinho INT PRIMARY KEY AUTO_INCREMENT,
  codUsuario INT NOT NULL,
  codProduto INT NOT NULL,
  codCategoria INT,
  nome_produto VARCHAR(50),
  descricao VARCHAR(80),
  preco VARCHAR(20),
  sexo VARCHAR(20),
  url varchar(200),
  quantidade int,
  FOREIGN KEY (codUsuario) REFERENCES tb_usuarios(codUsuario),
  FOREIGN KEY (codProduto) REFERENCES tb_produtos(codProduto),
  FOREIGN KEY (codCategoria) REFERENCES tb_categorias(codCategoria)
);

CREATE TABLE tb_comentarios (
    codComentario INT AUTO_INCREMENT PRIMARY KEY,
    codProduto INT NOT NULL,
    codUsuario INT NOT NULL,
    comentario TEXT NOT NULL,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (codProduto) REFERENCES tb_produtos(codProduto),
    FOREIGN KEY (codUsuario) REFERENCES tb_usuarios(codUsuario)
);


insert into tb_categorias(
	categorias
    )VALUES(
    'Masculino');
    
select * from tb_usuarios;

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' Tênis Converse Classic High',
    'Tênis branco de cano alto da Converse com detalhes vermelhos e pretos. Um clássico atemporal para quem busca estilo, versatilidade e autenticidade.',
    'R$ 219,90',
    'Feminino',
    'sapato',
    'https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' moletom',
    'moletom teste',
    'R$ 219,90',
    'Feminino',
    'moletom',
    'https://images.pexels.com/photos/6502493/pexels-photo-6502493.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' camiseta',
    'camiseta teste',
    'R$ 219,90',
    'Feminino',
    'camiseta',
    'https://images.pexels.com/photos/2464090/pexels-photo-2464090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' calça',
    'calca teste',
    'R$ 219,90',
    'Feminino',
    'calca',
    'https://images.pexels.com/photos/3914693/pexels-photo-3914693.jpeg?auto=compress&cs=tinysrgb&w=600'
);




INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' Tênis Converse Classic High',
    'Tênis branco de cano alto da Converse com detalhes vermelhos e pretos. Um clássico atemporal para quem busca estilo, versatilidade e autenticidade.',
    'R$ 219,90',
    'Masculino',
    'sapato',
    'https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' moletom',
    'moletom teste',
    'R$ 219,90',
    'Masculino',
    'moletom',
    'https://images.pexels.com/photos/6502493/pexels-photo-6502493.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' camiseta',
    'camiseta teste',
    'R$ 219,90',
    'Masculino',
    'camiseta',
    'https://images.pexels.com/photos/2464090/pexels-photo-2464090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' calça',
    'calca teste',
    'R$ 219,90',
    'Masculino',
    'calca',
    'https://images.pexels.com/photos/3914693/pexels-photo-3914693.jpeg?auto=compress&cs=tinysrgb&w=600'
);


INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' Tênis Converse Classic High',
    'Tênis branco de cano alto da Converse com detalhes vermelhos e pretos. Um clássico atemporal para quem busca estilo, versatilidade e autenticidade.',
    'R$ 219,90',
    'Infantil',
    'sapato',
    'https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' moletom',
    'moletom teste',
    'R$ 219,90',
    'Infantil',
    'moletom',
    'https://images.pexels.com/photos/6502493/pexels-photo-6502493.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' camiseta',
    'camiseta teste',
    'R$ 219,90',
    'Infantil',
    'camiseta',
    'https://images.pexels.com/photos/2464090/pexels-photo-2464090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
);

INSERT INTO tb_produtos(
	nome_produto,
	descricao ,
	preco,
	sexo,
	tipo,
    url
)VALUES(
	' calça',
    'calca teste',
    'R$ 219,90',
    'Infantil',
    'calca',
    'https://images.pexels.com/photos/3914693/pexels-photo-3914693.jpeg?auto=compress&cs=tinysrgb&w=600'
);

ALTER TABLE tb_carrinho MODIFY descricao VARCHAR(1000);

select * from tb_produtos;

select * from tb_usuarios;

select * from tb_comentarios;

select * from tb_carrinho;

