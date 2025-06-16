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
    usuario varchar(30),
    comentario TEXT NOT NULL,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (codProduto) REFERENCES tb_produtos(codProduto),
    FOREIGN KEY (codUsuario) REFERENCES tb_usuarios(codUsuario)
);



    
select * from tb_usuarios;

ALTER TABLE tb_carrinho MODIFY descricao VARCHAR(1000);

select * from tb_produtos;

select * from tb_usuarios;

select * from tb_comentarios;

select * from tb_carrinho;

INSERT INTO tb_produtos (
	nome_produto,
	descricao,
	preco,
	sexo,
	tipo,
	url
) VALUES 
-- MOLETONS
('Moletom Preto Oversized "NO FUTURE"', 'Estampa minimalista em tecido encorpado com capuz.', 'R$ 239,90', 'Masculino', 'Moletom', 'https://furiagg.fbitsstatic.net/img/p/moletom-oversized-furia-harder-to-kill-preto-150164/336806-2.jpg?w=1000&h=1000&v=202501231555'),
('Moletom Branco Bordado "Underground"', 'Moletom feminino com detalhes bordados e modelagem solta.', 'R$ 249,90', 'Feminino', 'Moletom', 'https://oqvestir.fbitsstatic.net/img/p/blusa-feminina-moletom-bordado-mistica-off-white-222022/641017-4.jpg?w=1600&h=2133&v=202505221227'),
('Moletom Infantil Azul Com Estampa', 'Moletom confortável com estampa divertida e capuz.', 'R$ 189,90', 'Infantil', 'Moletom', 'https://cdn.iset.io/assets/66687/produtos/19984/22f293655a4771e2356cc6cb43d9fda2674f70fcd6866.png'),

-- CAMISETAS
('Camiseta Preta Estampa Grunge "Anti-System"', 'Algodão premium com tipografia estilo punk.', 'R$ 129,90', 'Masculino', 'Camiseta', 'https://down-br.img.susercontent.com/file/br-11134207-7qukw-lk19e324zusjb5'),
('Camiseta Oversized Branca "AstroWorld"', 'Gola reforçada com corte reto e discreta estampa.', 'R$ 119,90', 'Feminino', 'Camiseta', 'https://down-br.img.susercontent.com/file/632a9f2585ea14aa3055efbc1527e15b'),
('Camiseta Infantil Estampa Dinossauro', 'Camiseta divertida de algodão leve com estampa de dinossauro.', 'R$ 79,90', 'Infantil', 'Camiseta', 'https://torratorra.vtexassets.com/arquivos/ids/2149071/35121002570172.jpg?v=638747396889300000'),

-- CALÇAS
('Calça Cargo Preta Bolsos Laterais', 'Estilo utilitário com elástico no tornozelo.', 'R$ 189,90', 'Masculino', 'Calça', 'https://static.dafiti.com.br/p/VIA-LANCE-Cal%C3%A7a-Cargo-Masculina-Premium-Bolso-Lateral-Skate-Militar-Preto-5887-32371811-1-zoom.jpg'),
('Calça Pantalona Street Feminina', 'Cintura alta, tecido leve e caimento solto.', 'R$ 179,90', 'Feminino', 'Calça', 'https://down-br.img.susercontent.com/file/br-11134207-7r98o-m1izxdo1p7ns1e'),
('Calça Infantil Moletom Cinza', 'Conforto e liberdade com cós ajustável.', 'R$ 99,90', 'Infantil', 'Calça', 'https://cdn.awsli.com.br/600x700/505/505939/produto/170848177/0-ss39wc2bco.jpg'),

-- CALÇADOS
('Tênis Nike Air Max Street', 'Design robusto, ideal para o estilo urbano.', 'R$ 549,90', 'Masculino', 'Calçado', 'https://cdn.dooca.store/100/products/tenis-nike-air-max-excee-black-white-2_620x620+fill_ffffff.jpg?v=1687022167&webp=0'),
('Tênis Adidas Forum Low White', 'Estilo clássico e versátil com sola alta.', 'R$ 499,90', 'Feminino', 'Calçado', 'https://rumoshop.com/cdn/shop/files/CF539902-EF06-4504-A0A5-9FA4F939EDE2_1200x.jpg?v=1724514848'),
('Tênis Infantil Colorido Leve', 'Tênis leve e divertido, ideal para brincar.', 'R$ 149,90', 'Infantil', 'Calçado', 'https://down-br.img.susercontent.com/file/br-11134207-7r98o-lx042f07eb3z24'),

-- MAIS MASCULINOS
('Moletom Grafite Zíper "Concrete Jungle"', 'Moletom masculino com zíper frontal e gorro ajustável.', 'R$ 269,90', 'Masculino', 'Moletom', 'https://acdn-us.mitiendanube.com/stores/002/427/817/products/aea28725648b932df25315ecd60ec849awsaccesskeyidakiatclmsgfx4j7tu445expires1700736414signatureqwyakz2ypljbbg6gxyjwl7aeo3q3d-e4dd5e0ee73f75234116981445563968-480-0.jpg'),
('Camiseta Estampa Flame "Urban Heat"', 'Estampa flame vibrante com tecido respirável.', 'R$ 139,90', 'Masculino', 'Camiseta', 'https://acdn-us.mitiendanube.com/stores/001/115/376/products/flame1-8590f382531c21cb2c17465683120123-1024-1024.png'),
('Calça Jogger Moletom Cinza', 'Tecido encorpado, ideal para dias frios.', 'R$ 159,90', 'Masculino', 'Calça', 'https://images.tcdn.com.br/img/img_prod/757710/calca_moletom_jogger_masculina_4455_8501915_variacao_19779_1_dbf51eb146b4ac92e9e52f96532ec37f_20221117164633.jpg'),
('Tênis Vans Old Skool Black', 'Clássico com sola vulcanizada.', 'R$ 389,90', 'Masculino', 'Calçado', 'https://images.tcdn.com.br/img/img_prod/960046/90_tenis_vans_old_skool_black_white_3457_2_e603849c083e47f9e30d32141616d9a8.jpg'),

-- MAIS FEMININOS
('Moletom Tie Dye "StreetWave"', 'Cores suaves com toque macio.', 'R$ 259,90', 'Feminino', 'Moletom', 'https://static.dafiti.com.br/p/SOB-Moletom-Tie-Dye-Colorido-Feminino-Sob-Com-Capuz-6995-7958336-1-zoom.jpg'),
('Camiseta Tie Dye Rosa e Azul', 'Camiseta confortável com estampa única.', 'R$ 134,90', 'Feminino', 'Camiseta', 'https://s3.amazonaws.com/img.iluria.com/product/792BC8/12CEBDB/450xN.jpg'),
('Calça Jeans Destroyed Azul', 'Modelagem slim com detalhes rasgados.', 'R$ 199,90', 'Feminino', 'Calça', 'https://cea.vtexassets.com/arquivos/ids/53890682/calca-wide-leg-jeans-destroyed-azul-escuro-1022505-Azul_Escuro_1.jpg?v=637849572794200000'),
('Tênis Converse Chuck 70 Hi', 'Estilo retrô com acabamento refinado.', 'R$ 429,90', 'Feminino', 'Calçado', 'https://converse.com.br/media/catalog/product/1/6/162050c_h_08x1.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=&width='),

-- MAIS INFANTIS
('Moletom Infantil Tie Dye Colorido', 'Moletom macio com visual divertido.', 'R$ 159,90', 'Infantil', 'Moletom', 'https://m.media-amazon.com/images/I/71r5cdsVysL.jpg'),
('Camiseta Infantil Básica Azul', 'Camiseta leve com gola redonda.', 'R$ 69,90', 'Infantil', 'Camiseta', 'https://cdn.sistemawbuy.com.br/arquivos/13f3ddaf13eeadd5a98c385e0fafab38/produtos/LEI5LEI8/camiseta-basica-azul-menino-63a60bd1dc8e9.jpg'),
('Calça Infantil Jeans Com Elástico', 'Ideal para o dia a dia com conforto.', 'R$ 89,90', 'Infantil', 'Calça', 'https://ecameleca.vteximg.com.br/arquivos/ids/164837-480-480/2072-calca--1-.jpg?v=637969578755930000'),
('Tênis Infantil Rosa e Branco', 'Tênis confortável para passeios e escola.', 'R$ 129,90', 'Infantil', 'Calçado', 'https://laranjeiras.vteximg.com.br/arquivos/ids/252051-600-600/66e86c9a9550d_cd7429ad30b33d0441a77a57954f20c1.jpg?v=638810345774600000');




-- MASCULINO
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom "Skull Flame" Preto', 'Moletom com estampa de caveira e capuz reforçado.', 'R$ 229,90', 'Masculino', 'Moletom', 'https://img.ltwebstatic.com/images3_pi/2023/11/17/85/1700192322e78bf42bf517d245103f5ace41726e3e_thumbnail_720x.jpg'),
('Moletom Zíper "Urban Flow"', 'Estilo moderno com zíper frontal e bolsos.', 'R$ 249,90', 'Masculino', 'Moletom', 'https://static.riachuelo.com.br/RCHLO/15162621001/portrait/c007c32c95627f958e553d015c3096f657e1091d.jpg?imwidth=700'),

('Camiseta "Rebel Mind" Grafite', 'Estampa frontal em silk com acabamento premium.', 'R$ 119,90', 'Masculino', 'Camiseta', 'https://aramismenswear.vtexassets.com/arquivos/ids/1368073/CS120537_634_1-CAMISETA-BASICA--PA-.jpg?v=638670966362030000'),
('Camiseta Logo Streetwear', 'Minimalista com logo bordado no peito.', 'R$ 109,90', 'Masculino', 'Camiseta', 'https://images.tcdn.com.br/img/img_prod/475018/camiseta_branca_oversized_logo_fire_street_6390_1_83566b2a54ad4fd8244f359f54cc97c5.jpg'),

('Calça Cargo Bege "Urban Fit"', 'Tecido resistente e confortável, ideal para o dia a dia.', 'R$ 179,90', 'Masculino', 'Calça', 'https://images.tcdn.com.br/img/img_prod/873120/calca_jogger_cargo_sem_punho_masculina_bege_1343_1_b7db7a95414a98dcb56ff4cf79f7d76b.jpg'),
('Calça Street Jeans Rasgada', 'Modelo skinny com rasgos nos joelhos.', 'R$ 199,90', 'Masculino', 'Calça', 'https://www.asteric.com.br/cdn/shop/files/Calca_Reta_Jeans_Rasgada_Streetwear_1_375x469_crop_center.webp?v=1723329870'),

('Tênis Nike SB Preto', 'Estilo skatista clássico com solado de borracha.', 'R$ 469,90', 'Masculino', 'Calçado', 'https://static.netshoes.com.br/produtos/tenis-nike-sb-chron-2-canvas-masculino/06/2IC-3868-006/2IC-3868-006_zoom1.jpg?ts=1747398082'),
('Tênis Puma Suede', 'Design clássico retrô com conforto moderno.', 'R$ 399,90', 'Masculino', 'Calçado', 'https://cdn.awsli.com.br/2500x2500/644/644155/produto/291277038/img_9618-bf31nldbz7.jpeg');

-- FEMININO
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Rosa "Dream State"', 'Moletom peluciado com estampa delicada.', 'R$ 239,90', 'Feminino', 'Moletom', 'https://torratorra.vtexassets.com/arquivos/ids/2081027/33132000584520.jpg?v=638744577291330000'),
('Moletom Azul Oversized', 'Modelo oversized com capuz e bolso canguru.', 'R$ 259,90', 'Feminino', 'Moletom', 'https://static.ecosweb.com.br/public/produtos/moda-feminina/blusa-de-alca/blusao-oversized-em-moletom-azul-claro_761530_600_1.jpg'),

('Camiseta Estampa Floral Abstrata', 'Camiseta com estampa colorida e caimento leve.', 'R$ 119,90', 'Feminino', 'Camiseta', 'https://http2.mlstatic.com/D_NQ_NP_674311-MLB52911698128_122022-O-camiseta-estampa-abstrato-coraco-flores-multicor-59.webp'),
('Camiseta Branca "Bloom"', 'Design simples com toque suave.', 'R$ 109,90', 'Feminino', 'Camiseta', 'https://thumb.braavo.me/saint/400/2534938257.jpg'),

('Calça Mom Jeans Azul Claro', 'Tecido resistente com lavagem clara.', 'R$ 189,90', 'Feminino', 'Calça', 'https://torratorra.vtexassets.com/arquivos/ids/2374616/1312100187704446.jpg?v=638756450645270000'),
('Calça Jogger Feminina Preta', 'Cintura alta, perfeita para o estilo casual.', 'R$ 169,90', 'Feminino', 'Calça', 'https://ph-cdn3.ecosweb.com.br/imagens01/foto/mkp142/moda-feminina/calcas/calca-jogger-cordao-feminina-preto_2271867_600_1.jpg'),

('Tênis Branco Plataforma', 'Tênis cano baixo com solado alto e confortável.', 'R$ 389,90', 'Feminino', 'Calçado', 'https://images.pexels.com/photos/2529146/pexels-photo-2529146.jpeg?auto=compress&cs=tinysrgb&w=800'),
('Tênis Casual Feminino Rosa Claro', 'Ideal para o dia a dia com estilo leve.', 'R$ 359,90', 'Feminino', 'Calçado', 'https://images.pexels.com/photos/10019134/pexels-photo-10019134.jpeg?auto=compress&cs=tinysrgb&w=800');

-- INFANTIL
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Infantil Verde Com Capuz', 'Moletom leve com capuz e estampa frontal.', 'R$ 129,90', 'Infantil', 'Moletom', 'https://acdn-us.mitiendanube.com/stores/001/225/158/products/conjunto-infantil-masculino-moletom-com-capuz-verde-1-314fa32ff75c1822c017107839097920-1024-1024.jpg'),
('Moletom Infantil Roxo ', 'Moletom divertido para crianças estilosas.', 'R$ 139,90', 'Infantil', 'Moletom', 'https://assets.adidas.com/images/w_600,f_auto,q_auto/7c42dd27e27042919c59e3994649147b_9366/Moletom_Capuz_Infantil_adidas_Z.N.E._Roxo_IM8396_HM1_hover.jpg'),

('Camiseta Infantil Branca com Estampa', 'Camiseta básica com estampa infantil divertida.', 'R$ 59,90', 'Infantil', 'Camiseta', 'https://images.tcdn.com.br/img/img_prod/701909/camiseta_infantil_branca_estampa_monstrinhos_68694_1_b58c5f82b1ba88a70d93f669fda83877.jpg'),
('Camiseta Infantil Listrada Colorida', 'Malha confortável com listras vibrantes.', 'R$ 64,90', 'Infantil', 'Camiseta', 'https://ae01.alicdn.com/kf/S78c2f1aa546e423898372aa8764ca825j.jpg'),

('Calça Infantil Jogger Azul', 'Estilo jogger com elástico e bolsos laterais.', 'R$ 89,90', 'Infantil', 'Calça', 'https://lojajeitodecrianca.com.br/wp-content/uploads/2023/02/calca-jogger-com-elastico-infantil-menino-scaled.webp'),
('Calça Infantil Moletom Verde', 'Ideal para o dia a dia, com conforto e estilo.', 'R$ 84,90', 'Infantil', 'Calça', 'https://static.ecosweb.com.br/public/produtos/roupa-para-menino/calca/calca-em-moletom-infantil-menino-verde_731345_301_1.webp'),

('Tênis Infantil Azul com Velcro', 'Fácil de calçar e com ótimo acabamento.', 'R$ 139,90', 'Infantil', 'Calçado', 'https://acdn-us.mitiendanube.com/stores/002/622/470/products/dsc_0187-photoroom-7f3cd123392f5ea59417189764105299-1024-1024.png'),
('Tênis Infantil Estampa Estrelinhas', 'Tênis leve com visual divertido.', 'R$ 149,90', 'Infantil', 'Calçado', 'https://img.lojasrenner.com.br/item/927762254/original/6.jpg');




-- MASCULINO
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom "Dark Urban"', 'Moletom preto com detalhes em couro sintético nos ombros.', 'R$ 259,90', 'Masculino', 'Moletom', 'https://images.tcdn.com.br/img/img_prod/719545/jaqueta_masculina_couro_anistia_com_capuz_de_moletom_preta_6209_2_63b0a842bb7a53b039d03fe71b2a7815.jpg'),
('Camiseta "Street Graffiti"', 'Camiseta branca com estampa inspirada no grafite urbano.', 'R$ 129,90', 'Masculino', 'Camiseta', 'https://http2.mlstatic.com/D_NQ_NP_653215-MLB75177193273_032024-O.webp'),
('Calça Jogger Verde Musgo', 'Confortável e estilosa, com elástico na cintura e tornozelos.', 'R$ 179,90', 'Masculino', 'Calça', 'https://images.tcdn.com.br/img/img_prod/970725/calca_jogger_moletom_eco_14421_2_d9d1adb0240c59ed7ed76c397e4be254.jpg'),
('Tênis Vans Old Skool Preto', 'Clássico modelo Vans com listras laterais brancas.', 'R$ 439,90', 'Masculino', 'Calçado', 'https://secure-static.vans.com.br/medias/sys_master/vans/vans/h86/hce/h00/h00/12093660463134/1002900210005U-01-BASEIMAGE-Midres.jpg');

-- FEMININO
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Tie Dye Lilás', 'Moletom estilo cropped com efeito tie dye em lilás.', 'R$ 239,90', 'Feminino', 'Moletom', 'https://tudocommoda.com/wp-content/uploads/2021/01/4-look-com-conjunto-de-moletom-tie-dye-lilas.jpg'),
('Camiseta "Art Mode"', 'Camiseta feminina com estampa artística e corte reto.', 'R$ 114,90', 'Feminino', 'Camiseta', 'https://blessedchoice.com.br/cdn/shop/files/10_2_11zon_800x.jpg?v=1695928007'),
('Calça Wide Leg Branca', 'Modelo solto e moderno, com cintura alta.', 'R$ 209,90', 'Feminino', 'Calça', 'https://www.modab.com.br/cdn/shop/files/wide-nude-001.jpg?v=1749642431'),
('Tênis Chunky Branco e Rosa', 'Tênis robusto com solado alto e design jovem.', 'R$ 399,90', 'Feminino', 'Calçado', 'https://www.gatapretasapatilhas.com.br/media/catalog/product/cache/d4420d93470be3a91af8190806c3e779/t/e/tenis-feminino-atacado-moda_8_.jpeg');

-- INFANTIL
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Infantil Laranja com Capuz', 'Moletom alegre com interior flanelado.', 'R$ 119,90', 'Infantil', 'Moletom', 'https://adaptive-images.uooucdn.com.br/ik-seo/tr:w-1100,h-1594,c-at_max,pr-true,q-90/a22404-ogxytnptrt0/pv/fb/f9/2e/dab7d2c0309ba883b0594a557b/casaco-infantil-moletom-felpado-ziper-e-capuz-terra-cota-3-large-7.jpg'),
('Camiseta Infantil Estampa Robô', 'Camiseta divertida com estampa de robô colorido.', 'R$ 54,90', 'Infantil', 'Camiseta', 'https://down-br.img.susercontent.com/file/sg-11134201-7rbls-lqjiq2u6y9hgdf'),
('Calça Infantil Jeans Escura', 'Resistente e estilosa para uso diário.', 'R$ 99,90', 'Infantil', 'Calça', 'https://images.tcdn.com.br/img/img_prod/1113572/calca_infantil_masculina_escura_rasgada_t_02_ao_16_2507_2_cb5f88029c12cf415a989b3ba072ff2d.jpg'),
('Tênis Infantil Colorido Laranja', 'Tênis leve com cadarço elástico e design esportivo.', 'R$ 129,90', 'Infantil', 'Calçado', 'https://a-static.mlcdn.com.br/800x560/tenis-futsal-infantil-dray-392-colorido-laranja-azul/kalceaki/16012608643/4325b0655036e106b4f3bda82064693a.jpeg');



-- Moletom
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Canguru Preto Minimal', 'Com bolso frontal e capuz ajustável.', 'R$ 219,90', 'Masculino', 'Moletom', 'https://www.overcome.com.br/cdn/shop/files/IMG_3049_600x.jpg?v=1687295924'),
('Moletom Grafite Zíper Lateral', 'Modelo estiloso com zíper lateral funcional.', 'R$ 239,90', 'Masculino', 'Moletom', 'https://jockos.com.br/cdn/shop/files/EMERSON07EDITADA-014.jpg?v=1688739543'),
('Moletom Vermelho Street X', 'Moletom vibrante com detalhe em silk frontal.', 'R$ 249,90', 'Masculino', 'Moletom', 'https://images.tcdn.com.br/img/img_prod/475018/moletom_vermelho_flanelado_grosso_careca_3_cabos_5005_1_1dce5bdcf52511cbd6c2d8bd53bc6a6b_20230601173630.jpg');

-- Camiseta
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Camiseta Preta Oversized', 'Caimento largo e gola canoa.', 'R$ 119,90', 'Masculino', 'Camiseta', 'https://acdn-us.mitiendanube.com/stores/001/965/629/products/camisa-oversized-lisa-1-f89f3360991f023c4a17235714028472-1024-1024.jpg'),
('Camiseta Branco com Tipografia', 'Tipografia frontal “Raw Life”.', 'R$ 109,90', 'Masculino', 'Camiseta', 'https://cdn-images.farfetch-contents.com/16/85/33/36/16853336_33618389_600.jpg'),
('Camiseta Azul Royal Pocket', 'Com bolso frontal e tecido leve.', 'R$ 99,90', 'Masculino', 'Camiseta', 'https://cdn.shoppub.io/cdn-cgi/image/w=1000,h=1000,q=80,f=auto/outlet360/media/load/BOSS00000010-1.jpg');

-- Calça
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Calça Jogger Preta Cargo', 'Vários bolsos e barra com elástico.', 'R$ 189,90', 'Masculino', 'Calça', 'https://a-static.mlcdn.com.br/1500x1500/calca-jogger-masculina-preta-cargo-track-short-art-stillo/artstillo/15948010219/184d5f255eac3975fdf064d2e6607b55.jpeg'),
('Calça Skinny Destroyed', 'Modelo skinny com detalhes desgastados.', 'R$ 209,90', 'Masculino', 'Calça', 'https://dzg5mdpaq0k37.cloudfront.net/Custom/Content/Products/51/50/5150_calca-jeans-masculina-slim-destroyed-79981_m2_638520263244556517.webp'),
('Calça Jeans Black Fit', 'Modelo ajustado em jeans escuro.', 'R$ 199,90', 'Masculino', 'Calça', 'https://vilaromana.vteximg.com.br/arquivos/ids/417761-1280-1950/4246BCA10387_987_2-CALCA-JEANS-PRETA-AMACIADA-BASIC-FIT.jpg?v=638609924508100000');

-- Calçado
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Tênis Street Rider Cinza', 'Design robusto, ideal para skate.', 'R$ 449,90', 'Masculino', 'Calçado', 'https://cdn.bnws3.com.br/b2online.com.br/image/cache/data/produtos/puma/masculino/tenis-puma-rider-fv-retro-rewind-masculino-cinza---amarelo-11985-24-08-02-01-1200x1200.jpg'),
('Tênis Casual Cano Alto Branco', 'Tênis de cano alto com visual clássico.', 'R$ 419,90', 'Masculino', 'Calçado', 'hhttps://static.ecosweb.com.br/public/produtos/calcados/skate/tenis-cano-alto-masculino-branco_224666_600_1.webp'),
('Tênis Preto Urban Vibe', 'Estilo urbano com sola antiderrapante.', 'R$ 389,90', 'Masculino', 'Calçado', 'https://images.tcdn.com.br/img/img_prod/799045/tenis_vibe_orbital_2_preto_e_vermelho_36929_2_17653b97f09158aac05f82d1f55c99ec.jpg');


-- Moletom
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Cropped Branco', 'Estilo moderno e soltinho.', 'R$ 219,90', 'Feminino', 'Moletom', 'https://acdn-us.mitiendanube.com/stores/001/155/809/products/_mg_0297-edit-ee5b4c2dbb911005f817098147795755-1024-1024.jpg'),
('Moletom Com Bolso Lilás', 'Detalhes femininos e corte reto.', 'R$ 229,90', 'Feminino', 'Moletom', 'https://edexjeans.cdn.magazord.com.br/img/2023/04/produto/31325/2.jpg?ims=fit-in/475x650'),
('Moletom Cinza Fit Feminino', 'Com tecido felpudo interno.', 'R$ 249,90', 'Feminino', 'Moletom', 'https://torratorra.vtexassets.com/arquivos/ids/2145099/12121000065108.jpg?v=638747259774470000');

-- Camiseta
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Camiseta Baby Look Rosa', 'Modelo ajustado com gola canoa.', 'R$ 99,90', 'Feminino', 'Camiseta', 'https://down-br.img.susercontent.com/file/br-11134207-7r98o-lrrrktwuxhcd7b'),
('Camiseta Street Feminina Azul', 'Estampa abstrata e tecido suave.', 'R$ 109,90', 'Feminino', 'Camiseta', 'https://a-static.mlcdn.com.br/800x560/camiseta-oversized-feminina-estilo-streetwear-estampa-braba-engracado-meme-bliss/arpaiaclothes/camoverbraba-azuljeansgg/72a1ab4851589e3c3b850fb02ab05401.jpeg'),
('Camiseta Estilo Retrô Feminina', 'Inspirada na moda dos anos 90.', 'R$ 119,90', 'Feminino', 'Camiseta', 'https://images.tcdn.com.br/img/img_prod/657285/camisa_brasil_retro_treino_1970_feminina_1385_1_ae5808d20a72811b865f89154d096287.jpg');

-- Calça
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Calça Jogger Rosa Claro', 'Estilo casual com elástico e amarração.', 'R$ 169,90', 'Feminino', 'Calça', 'https://torratorra.vtexassets.com/arquivos/ids/2242102/1312100105814246.jpg?v=638751582273870000'),
('Calça Pantalona Preta Feminina', 'Elegante com corte solto e cintura alta.', 'R$ 229,90', 'Feminino', 'Calça', 'https://www.revanche.com.br/media/catalog/product/cache/8e5872966dd88cc0e998d2d2c4eec43a/c/a/cal_a-pantalona-com-cinto-e-bolso-cargo-atacado-feminina-revanche-indaialimg_3307_original_1.jpg'),
('Calça Legging Estampada', 'Confortável e estilosa para o dia a dia.', 'R$ 119,90', 'Feminino', 'Calça', 'https://cdn.awsli.com.br/600x450/1067/1067133/produto/180238210/93048d3aa7.jpg');

-- Calçado
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Tênis Plataforma Preto Feminino', 'Ideal para looks casuais.', 'R$ 379,90', 'Feminino', 'Calçado', 'https://imgmarketplace.lojasrenner.com.br/20001/3869/7010702308107/7510705231013/0.jpg'),
('Tênis Casual Feminino Nude', 'Confortável e discreto.', 'R$ 349,90', 'Feminino', 'Calçado', 'https://shoemix.fbitsstatic.net/img/p/tenis-casual-moleca-nude-5750-103-11058-75213/290309-1.jpg?w=670&h=670&v=no-change&qs=ignore'),
('Tênis Branco Urban Clean', 'Cano baixo e minimalista.', 'R$ 389,90', 'Feminino', 'Calçado', 'https://cdn.dooca.store/100/products/yqain87bd4pg8kiv0ixpunxxklsb3bixhnjf_1600x1600+fill_ffffff.jpg?v=1689795821&webp=0');


-- Moletom
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Moletom Azul Estampa Dinossauro', 'Moletom divertido com dino frontal.', 'R$ 109,90', 'Infantil', 'Moletom', 'https://down-br.img.susercontent.com/file/br-11134207-7qukw-lf5razgs69lr69'),
('Moletom Infantil Preto Com Zíper', 'Com capuz e bolsos laterais.', 'R$ 119,90', 'Infantil', 'Moletom', 'https://torratorra.vtexassets.com/arquivos/ids/2079520/351320003651368.jpg?v=638811028277770000'),
('Moletom Infantil Estampa Urso', 'Modelo leve com estampa de bichinho.', 'R$ 99,90', 'Infantil', 'Moletom', 'https://images.tcdn.com.br/img/img_prod/848518/casaco_de_moletom_infantil_patch_ursinho_momi_835_1_4e888306fcf36f0bf04c0f763b3f82c4.jpg');

-- Camiseta
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Camiseta Infantil Estampa Gamer', 'Para os pequenos apaixonados por games.', 'R$ 54,90', 'Infantil', 'Camiseta', 'https://torratorra.vtexassets.com/arquivos/ids/2188464/35121002384021.jpg?v=638749222040070000'),
('Camiseta Infantil Estrela Azul', 'Tecido leve com estampa divertida.', 'R$ 49,90', 'Infantil', 'Camiseta', 'https://static.dafiti.com.br/p/Malwee-Kids-Blusa-Malwee-Kids-Infantil-Estrela-Azul-Marinho-4228-1341137-1-zoom.jpg'),
('Camiseta Infantil Super Hero', 'Com super-heróis favoritos estampados.', 'R$ 59,90', 'Infantil', 'Camiseta', 'https://dw0jruhdg6fis.cloudfront.net/producao/31050365/G/lisa_cinza.jpg');

-- Calça
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Calça Infantil Sarja Colorida', 'Disponível em várias cores vibrantes.', 'R$ 89,90', 'Infantil', 'Calça', 'https://www.albarellainfantil.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/a/calca_feminina_sarja_colorida_1.jpg'),
('Calça Moletom Cinza Infantil', 'Conforto total para brincar.', 'R$ 84,90', 'Infantil', 'Calça', 'https://bituah.cdn.magazord.com.br/img/2023/04/produto/2085/9108-cinza-2-calca-moletom-feminina-infantil.jpg'),
('Calça Jeans Skinny Infantil', 'Estilo moderno para crianças.', 'R$ 99,90', 'Infantil', 'Calça', 'https://images.tcdn.com.br/img/img_prod/633191/calca_jeans_skinny_escuro_mania_kids_21869_1_789411796641171d8d60b41476fd8f8f.jpg');

-- Calçado
INSERT INTO tb_produtos (nome_produto, descricao, preco, sexo, tipo, url) VALUES
('Tênis Infantil Color Run', 'Tênis leve e colorido para o dia a dia.', 'R$ 139,90', 'Infantil', 'Calçado', 'https://static.netshoes.com.br/produtos/tenis-infantil-no-stress-run-color-feminino/34/Q55-0504-234/Q55-0504-234_zoom1.jpg?ts=1695007970&ims=544x'),
('Tênis Azul Infantil Velcro', 'Com fecho em velcro para praticidade.', 'R$ 129,90', 'Infantil', 'Calçado', 'https://secure-static.vans.com.br/medias/sys_master/vans/vans/hee/hae/h00/h00/12094080090142/1001200210002U-02-BASEIMAGE-Midres.jpg'),
('Tênis Branco Infantil Clássico', 'Básico, confortável e durável.', 'R$ 149,90', 'Infantil', 'Calçado', 'https://www.amilcalcados.com.br/lojas/00046219/prod/068373-1.jpg');
