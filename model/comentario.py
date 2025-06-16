import datetime
from data.conexao import Conexao

class Comentario: 
    def adicionarComentario(codProduto, codUsuario,usuario, texto):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()
        sql = "INSERT INTO tb_comentarios (codProduto, codUsuario,usuario, comentario) VALUES (%s, %s,%s, %s)"
        cursor.execute(sql, (codProduto, codUsuario,usuario, texto))
        conexao.commit()
        cursor.close()
        conexao.close()
        
    def mostrarComentarios(codProduto):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """SELECT * FROM tb_comentarios where codProduto = %s"""

        valores = [codProduto]
        cursor.execute(sql,valores)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
