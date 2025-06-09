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


    def verificarLogin(email, senha):
        senha = sha256(senha.encode()).hexdigest()
        conexao = Conexao.criarConexao()
        cursor = conexao.cursor(dictionary=True)
        sql = "SELECT email,nome FROM tb_usuarios WHERE email = %s AND senha = %s"
        valores = [email, senha]
        cursor.execute(sql, valores)
        usuario = cursor.fetchone()
        cursor.close()
        conexao.close()

        if usuario:
            session['usuario'] = usuario['email']
            session['nome_usuario'] = usuario['nome']
            return True
        else:
            return False
