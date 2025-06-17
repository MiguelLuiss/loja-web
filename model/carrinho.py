from flask import session
from data.conexao import Conexao

class Carrinho:
    def adicionar_item(cod_usuario, produto):
            conexao = Conexao.criarConexao()
            cursor = conexao.cursor()

            sql_verifica = """
                SELECT quantidade FROM tb_carrinho
                WHERE codUsuario = %s AND codProduto = %s
            """
            cursor.execute(sql_verifica, (cod_usuario, produto['codProduto']))
            resultado = cursor.fetchone()

            if resultado:
                nova_quantidade = resultado[0] + 1
                sql_update = """
                    UPDATE tb_carrinho
                    SET quantidade = %s
                    WHERE codUsuario = %s AND codProduto = %s
                """
                cursor.execute(sql_update, (nova_quantidade, cod_usuario, produto['codProduto']))
            else:
                sql_insert = """
                    INSERT INTO tb_carrinho (
                        codUsuario,
                        codProduto,
                        nome_produto,
                        descricao,
                        preco,
                        sexo,
                        url,
                        quantidade
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                """
                cursor.execute(sql_insert, (
                    cod_usuario,
                    produto['codProduto'],
                    produto['nome_produto'],
                    produto['descricao'],
                    produto['preco'],
                    produto['sexo'],
                    produto['url'],
                    1
                ))

            conexao.commit()
            cursor.close()
            conexao.close()


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