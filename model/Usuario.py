from data.conexao import Conexao
from hashlib import sha256
from flask import session

class Usuario:
    def criarUsuario(nome, senha, email, telefone, endereco):
        senha = sha256(senha.encode()).hexdigest()
        codCategoria = 1
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()
        sql = """INSERT INTO tb_usuarios (
            nome, email, senha, telefone, endereco, codCategoria
        ) VALUES (%s, %s, %s, %s, %s, %s)"""
        valores = [nome, email, senha, telefone, endereco, codCategoria]
        cursor.execute(sql, valores)
        conexao.commit()
        cursor.close()
        conexao.close()


    def verificarLogin(email,senha):
        senha = sha256(senha.encode()).hexdigest()
        #conexao banco de dados
        conexao = Conexao.criarConexao()
        #criando o cursor (é o responsavel por executar comandos no banco de dados)
        cursor = conexao.cursor(dictionary = True)
        #criando o comando SQL 
        sql = "SELECT login,nome FROM tb_usuarios WHERE email = %s AND senha = %s"
        valores = [email, senha]
        #Executando ocomando SQL
        cursor.execute(sql, valores)
        usuario = cursor.fetchone() # Busca apenas um usuário
        #fechando a conexão
        cursor.close() 
        conexao.close()

        if usuario:
            session['usuario'] = usuario['email']
            session ['nome_usuario'] = usuario['nome']
            return True
        else:
            return False
        
    def logOff():
        session.clear()