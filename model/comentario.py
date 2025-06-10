import datetime
from data.conexao import Conexao

class Comentario: 
    def cadastrarcomentario(nome, comentario):
        data_hora = datetime.datetime.today()

        # Conexão com o banco de dados
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()

        # Comando SQL corrigido (3 colunas, 3 valores)
        sql = """
            INSERT INTO tb_comentarios (
                Comentario,
                Usuario,
                Data_comentario
            ) VALUES (
                %s, %s, %s
            )
        """

        valores = [comentario,nome,data_hora]

        # Executar e confirmar
        cursor.execute(sql, valores)
        conexao.commit()

        # Fechar conexão
        cursor.close()
        conexao.close()
        
    def mostrarComentarios():
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary = True)
        sql = """SELECT Cod_comentario, Usuario, Data_comentario, Comentario FROM tb_comentarios"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
