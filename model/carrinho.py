import mysql.connector
from data.conexao import Conexao

class Carrinho:
    @staticmethod
    def obter_conexao():
        return Conexao.criarConexao()

    @staticmethod
    def adicionar_produto(usuario, produto_id, quantidade):
        conexao = Carrinho.obter_conexao()
        cursor = conexao.cursor()

        sql = """INSERT INTO tb_carrinho (Usuario, Produto_id, Quantidade)
                 VALUES (%s, %s, %s)"""
        valores = (usuario, produto_id, quantidade)

        cursor.execute(sql, valores)
        conexao.commit()

        cursor.close()
        conexao.close()

    @staticmethod
    def listar_carrinho(usuario):
        conexao = Carrinho.obter_conexao()
        cursor = conexao.cursor(dictionary=True)

        sql = """SELECT p.nome, p.preco, c.Quantidade
                 FROM tb_carrinho c
                 JOIN tb_produtos p ON c.Produto_id = p.id
                 WHERE c.Usuario = %s"""
       
        cursor.execute(sql, (usuario,))
        produtos = cursor.fetchall()

        cursor.close()
        conexao.close()
        return produtos

    @staticmethod
    def remover_produto(usuario, produto_id):
        conexao = Carrinho.obter_conexao()
        cursor = conexao.cursor()

        sql = "DELETE FROM tb_carrinho WHERE Usuario = %s AND Produto_id = %s"
        cursor.execute(sql, (usuario, produto_id))
        conexao.commit()

        cursor.close()
        conexao.close()