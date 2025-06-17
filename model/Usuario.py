from data.conexao import Conexao
from hashlib import sha256
from flask import session

class Usuario:
    def criarUsuario(nome, senha, email, telefone, endereco):
        senha = sha256(senha.encode()).hexdigest()

        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()

        sql = """INSERT INTO tb_usuarios (
            nome, email, senha, telefone, endereco
        ) VALUES (%s, %s, %s, %s, %s)"""
        
        valores = [nome, email, senha, telefone, endereco]
        cursor.execute(sql, valores)
        conexao.commit()
        cursor.close()
        conexao.close()

    @staticmethod
    def verificar_email_existente(email):
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor()
        query = "SELECT * FROM tb_usuarios WHERE email = %s"
        cursor.execute(query, (email,))
        resultado = cursor.fetchone()
        cursor.close()
        conexao.close()
        return resultado is not None


    def verificarLogin(email, senha):
        senha = sha256(senha.encode()).hexdigest()
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary=True)
        sql = "SELECT email,nome,codUsuario FROM tb_usuarios WHERE email = %s AND senha = %s"
        valores = [email, senha]
        cursor.execute(sql, valores)
        usuario = cursor.fetchone()
        cursor.close()
        conexao.close()

        if usuario:
            session['usuario'] = usuario['email']
            session['nome_usuario'] = usuario['nome']
            session['cod_usuario'] = usuario['codUsuario']
            session['foto'] = "navbar-toggler-icon"
            return True
        else:
            return False


    def logOff():
        session.clear()