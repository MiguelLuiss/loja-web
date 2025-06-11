from flask import session
from data.conexao import Conexao

class Carrinho:
    def adicionar_item(cod_usuario, produto):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()

        sql = """
            INSERT INTO tb_carrinho (
                codUsuario,
                codProduto,
                codCategoria,
                nome_produto,
                descricao,
                preco,
                sexo,
                url,
                quantidade
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        quantidade = produto.get('quantidade', 1)  # se não tiver, usa 1 como padrão

        cursor.execute(sql, (
            cod_usuario,
            produto['codProduto'],
            produto.get('codCategoria'),
            produto['nome_produto'],
            produto['descricao'],
            produto['preco'],
            produto['sexo'],
            produto['url'],
            quantidade
        ))
        conexao.commit()
        cursor.close()

    def mostrarCarrinho(codigo):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary=True)

        sql = "SELECT * FROM tb_carrinho WHERE codUsuario = %s"
        cursor.execute(sql, (codigo,)) 
        produto = cursor.fetchall()

        cursor.close()
        conexao.close()
        return produto
    
    def excluirItemCarrinho(codCarrinho):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()
        
        sql = "DELETE FROM tb_carrinho WHERE codCarrinho = %s"
        cursor.execute(sql, (codCarrinho,))
        conexao.commit()

        cursor.close()
        conexao.close()