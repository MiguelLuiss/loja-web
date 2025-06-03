from flask import Flask, render_template, request, redirect, session, jsonify, url_for
import datetime
import mysql.connector

from data.conexao import Conexao
from model.Usuario import Usuario
from model.produtos import Produto

app = Flask(__name__)
app.secret_key = '12345678'

###################### Render Templates ########################

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def pagina_login():
    return render_template("pag-login.html")

@app.route('/cadastro')
def pagina_cadastro():
    return render_template('pag-cadastro.html')

@app.route('/catalogo')  # Corrigido: estava /cataogo
def catalogo():
    return render_template('catalog.html')

@app.route('/pag-masculino')
def pgMasculino():
    return render_template('pag-masculino.html')

@app.route('/pag-feminino')
def pgFeminino():
    return render_template('pag-feminino.html')

@app.route('/pag-infantil')
def pgInfantil():
    return render_template('pag-infantil.html')

@app.route('/carrinho')
def carrinho():
    return render_template('carrinho.html')

####################### Funções ###############################

@app.route('/post/cadastrarUsuario', methods=['POST'])
def cadastrarUsuario():
    nome = request.form.get("nome")
    email = request.form.get("email")
    senha = request.form.get("senha")
    telefone = request.form.get("telefone")
    endereco = request.form.get("endereco")

    Usuario.criarUsuario(nome, senha, email, telefone, endereco)
    return redirect('/cadastro')

@app.route("/verificaLogin", methods=["POST"])
def verificaLogin():
    email = request.form.get("email")
    senha = request.form.get("senha")
    usuario = Usuario.verificarLogin(email, senha)

    if usuario:
        return redirect("/")
    else:
        return redirect("/login")

@app.route('/mostrarProdutos')
def mostrarProdutos():
    produtos = Produto.mostrarprodutos()
    return render_template("catalogo.html", produtos=produtos)

@app.route('/mostrarMoletons')
def mostrarMoletons():
    moletons = Produto.mostrarMoletons()
    return render_template("moletons.html", moletons=moletons)

@app.route('/mostrarCamisetas')
def mostrarCamisetas():
    camisetas = Produto.mostrarCamisetas()
    return render_template("camisetas.html", camisetas=camisetas)

@app.route('/mostrarCalcas')
def mostrarCalcas():
    calcas = Produto.mostrarCalcas()
    return render_template("calcas.html", calcas=calcas)

@app.route('/mostrarCalcados')
def mostrarCalcados():
    calcados = Produto.mostrarCalcados()  # Corrigido: estava chamando Calcas
    return render_template("calcados.html", calcados=calcados)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
