from flask import session
from data.conexao import Conexao
import mysql

class Carrinho:

    @staticmethod
    def adicionar_item(cod_usuario, produto):
        conexao = mysql.connection
        cursor = conexao.cursor()

        sql = """
            INSERT INTO tb_carrinho (codUsuario, codProduto, codCategoria, nome_produto, descricao, preco, sexo)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(sql, (
            cod_usuario,
            produto['codProduto'],
            produto['codCategoria'],
            produto['nome_produto'],
            produto['descricao'],
            produto['preco'],
            produto['sexo']
        ))
        conexao.commit()
        cursor.close()

    @staticmethod
    def listar_itens(cod_usuario):
        cursor = mysql.connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM tb_carrinho WHERE codUsuario = %s", (cod_usuario,))
        itens = cursor.fetchall()
        cursor.close()
        return itens

    @staticmethod
    def remover_item(cod_usuario, cod_produto):
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM tb_carrinho WHERE codUsuario = %s AND codProduto = %s", (cod_usuario, cod_produto))
        mysql.connection.commit()
        cursor.close()