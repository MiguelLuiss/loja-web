import datetime
from data.conexao import Conexao

class Comentario: 
    # apenas usuarios logados podem adicionar comentarios!
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
        sql = """SELECT tb_comentarios.Cod_comentario, tb_comentarios.Comentario, tb_comentarios.Usuario, tb_comentarios.Data_comentario FROM tb_comentarios INNER JOIN tb_produtos ON tb_comentarios.codProduto = tb_produtos.codProduto;"""
        
        cursor.execute(sql)
        resultados = cursor.fetchall()
        
        cursor.close()
        conexao.close()
        
        return resultados
