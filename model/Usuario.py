from data.conexao import Conexao
from hashlib import sha256
from flask import session

class Usuario:
    def criarUsuario(nome,senha,email,telefone,endereco):
        senha = sha256(senha.encode()).hexdigest()

        #conexao banco de dados
        conexao = Conexao.criarConexao()
        #criando o cursor (é o responsavel por executar comandos no banco de dados)
        cursor = conexao.cursor()
        #criando o comando SQL 
        sql = """ INSERT INTO tb_usuarios (
            nome,
            email,
            senha,
            telefone,
            endereco
        )
        VALUES(
            %s,
            %s,
            %s,
            %s,
            %s
        ) """
        valores = [nome,email,senha,telefone,endereco]
        #Executando ocomando SQL
        cursor.execute(sql,valores)
        #confirmo a alteração
        conexao.commit()
        #fechando a conexão
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